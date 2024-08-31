import requests
import pandas as pd
from bs4 import BeautifulSoup
import random


reviewlist = []

def getRandomProxy():
    # Using Proxy 
    proxy = {
        "http": f"http://Kh072ICB0vRFuRg9:wifi;;@proxy.soax.com:{9000 + random.randint(0, 9)}",
        "https": f"http://Kh072ICB0vRFuRg9:wifi;;@proxy.soax.com:{9000 + random.randint(0, 9)}"
    }
    return proxy
 
def extractReviews(reviewUrl, pageNumber):
    resp = requests.get(reviewUrl)
    soup = BeautifulSoup(resp.text, 'html.parser')
    reviews = soup.findAll('div', {'data-hook':"review"})
    # print(reviews)
    for item in reviews:
        with open('outputs/file.html', 'w', encoding='utf-8') as f:
            f.write(str(item))
        
        review = {
            'productTitle': soup.title.text.replace("Amazon.in:Customer reviews: ", "").strip(),
            'Review Title': item.find('a', {'data-hook':"review-title"}).text.strip(),
            'Rating': item.find('i', {'data-hook': 'review-star-rating'}).text.strip(),
            'Review Body': item.find('span', {'data-hook': 'review-body'}).text.strip() ,
        }
        reviewlist.append(review)  

def totalPages(productUrl):
    resp = requests.get(productUrl)
    soup = BeautifulSoup(resp.text, 'html.parser')
    reviews = soup.find('div', {'data-hook':"cr-filter-info-review-rating-count"})
    return int(reviews.text.strip().split(', ')[1].split(" ")[0])

def main():
    productUrl = "https://www.amazon.in/ASUS-15-6-inch-RTX-3050-Graphics-FA506IC-HN005T/dp/B09CCW5XVM/ref=sr_1_4"
    reviewUrl = productUrl.replace("dp", "product-reviews") + "?pageNumber=" + str(1)
    totalPg = totalPages(reviewUrl)
    print(totalPg)

    for i in range(totalPg//10):
        print(f"Running for page {i}")
        try: 
            reviewUrl = productUrl.replace("dp", "product-reviews") + "?pageNumber=" + str(i)
            extractReviews(reviewUrl, i)
        except Exception as e:
            print(e)
        
   
    df = pd.DataFrame(reviewlist)
    df.to_excel('output.xlsx', index=False)

main()