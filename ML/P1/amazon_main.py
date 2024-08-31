# Importing all the required libraries
import csv
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

def extract_reviews(product_url, num_reviews_to_scrape=10):
    # Calling the driver
    driver = webdriver.Chrome()  
    
    
    # Requesting the Amazon product's url
    driver.get(product_url)

    time.sleep(8)

    # Extracting our review data
    reviews = []
    review_elements = driver.find_elements(By.CSS_SELECTOR, '.a-section.review')
    temp_Date = ""
    for review_element in review_elements[:num_reviews_to_scrape]:
        time.sleep(1)
        review = {}
        review['author'] = review_element.find_element(By.CSS_SELECTOR, '.a-profile-name').text.strip()
        temp_Date = review_element.find_element(By.CSS_SELECTOR, '.review-date').text.strip()
        review['date'] = temp_Date[temp_Date.find('on')+3:]
        review['location'] = temp_Date[12:temp_Date.find('on')-1]
        review['text'] = review_element.find_element(By.CSS_SELECTOR, '.review-text-content').text.strip()
        review['rating'] = review_element.find_element_by_xpath('//i[@data-hook="review-star-rating"]').text.strip()
        review['title'] = review_element.find_element(By.CSS_SELECTOR, '.review-title').text.strip()
        reviews.append(review)
        print(review)
    
    # Terminating the WebDriver
    driver.quit()
    # Returning the reviews
    return reviews




# Product url
product_url = 'https://www.amazon.in/ZAPCASE-Compatible-Xiaomi-Covers-Carbon/product-reviews/B07GQY2RN2/ref=cm_cr_arp_d_paging_btm_next_2?ie=UTF8&reviewerType=all_reviews'

# Calling the extract_reviews() function
reviews_data = []
for i in range(1,4):
    reviews_data += extract_reviews(product_url+'&pageNumber='+str(i), num_reviews_to_scrape=10)



# Creating a function to export the data to csv
def export_csv(reviews, csv_filename='reviews_data.csv'):
    with open(csv_filename, 'w', newline='', encoding='utf-8') as csv_file:
        fieldnames = ['date','names','location','reviewtitles','ratings','reviews']  
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        
        writer.writeheader()
        for review in reviews:
            writer.writerow({'date': review['date'], 'names': review['author'],  'location': review['location'], 'reviewtitles': review['title'], 'ratings': review['rating'], 'reviews': review['text']})


# Export data to a csv file
export_csv(reviews_data)