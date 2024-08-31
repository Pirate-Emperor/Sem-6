#!/usr/bin/env python

import re
import os
import pandas as pd
import csv
import argparse
from nerodia.browser import Browser # Needs selenium == 4.9.1
from amazoncaptcha import AmazonCaptcha


class AmazonReviews():
    def __init__(self, asin, page_start = None, page_end = None) -> None:
        self.asin = asin
        self.page_start = page_start
        self.file_name = f'amz-reviews-{self.asin}.csv'
        self.page_end = page_end
        self.countries = ['co.uk','ca','com']
        self.review_filter = ['positive','critical', 'five_star', 'one_star', 'two_star', 'three_star', 'four_star']

    def pages_numbers(self) -> list[int]:
        return list(range(0,11))

    def scrape(self, review, country):
        date_and_country = review.span(class_name = 'review-date')
        date_clean = date_and_country.text.split('on ')[1]
        country_re = 'in (.*) on'
        country_match = re.search(country_re, date_and_country.text)
        country_clean = country_match.group(1) if country_match != None else country
        stars_clean = review.span(class_name = 'a-icon-alt').innertext.split(' out')[0]
        title = review.link(class_name = 'review-title-content').text if review.link(class_name = 'review-title-content').exist else "no title found"

        return {
            'date': date_clean,
            'names': review.span(class_name = 'a-profile-name').text,
            'location': country_clean,
            'reviewtitles': title,
            'ratings': stars_clean,
            'reviews': review.span(class_name = 'review-text-content').text.replace('\n',' ')
        }
    
    def save(self, review):
        if os.path.isfile(f'{self.file_name}'):
            with open(self.file_name, 'a', newline='', encoding='utf-8') as csv_file:
                headers = ['date','names','location','reviewtitles','ratings','reviews']  
                writer = csv.DictWriter(csv_file, fieldnames=headers)
                writer.writerows(review)
        else:
            with open(self.file_name, 'w+', newline='', encoding='utf-8') as csv_file:
                headers = ['date','names','location','reviewtitles','ratings','reviews']  
                writer = csv.DictWriter(csv_file, fieldnames=headers)
                writer.writeheader()
                writer.writerows(review)

    def check_product_exist(self, browser, country):
        browser.goto(f'https://www.amazon.{country}/-/dp/{self.asin}/?_encoding=UTF8')
        
        if browser.title == "Page Not Found":
            print(f"This product doesnt exist with this ASIN in this country, skipping country {country}")
            return False
        else:
            return True

    def fetch(self):
        browser = Browser(browser='chrome', options={'headless': True}) # Set this to False to see what the browser is doing
        
        reviews_list = []
        for country in self.countries:            
            if not self.check_product_exist(browser, country):
                continue

            # SOLVE CAPTCHA
            if browser.text_field(id='captchacharacters').exist:
                imgs = browser.images()
                text_field = browser.text_field(id='captchacharacters')
                for img in imgs:
                    if 'captcha' in img.src:
                        captcha = AmazonCaptcha.fromlink(img.src)
                        solution = captcha.solve()
                        text_field.value = solution
                        browser.button(class_name='a-button-text').click()

            for filt in self.review_filter: 
                for page in self.pages_numbers():
                    browser.goto(f'https://www.amazon.{country}/product-reviews/{self.asin}/?reviewerType=all_reviews&sortBy=recent&pageNumber=' + str(page) + '&filterByStar=' + filt)
                    print(f'fetching page {page} for product {self.asin} in {country} (using filter: {filt})')
                                
                    reviews_in_page = browser.divs(class_name='review')
                    if len(reviews_in_page) != 0:
                        for review in reviews_in_page:
                            review_data = self.scrape(review, country)
                            reviews_list.append(review_data)
                            
                            if len(reviews_list) == 10:
                                self.save(reviews_list)
                                reviews_list.clear()
                    else:
                        print(f"error, found no reviews in page {page}")
                        continue
        return 0

    def deduplicate(self):
        if os.path.isfile(f'{self.file_name}'):
            data = pd.read_csv(self.file_name)
            data = data.drop_duplicates()
            data.to_csv(self.file_name, index=False)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--asin", type=str, help="ASIN (unique Amazon product ID), such as: B08SJXX6YY", required = True)
    args = parser.parse_args()
    
    amz = AmazonReviews(args.asin)
    amz.fetch()
    amz.deduplicate()
