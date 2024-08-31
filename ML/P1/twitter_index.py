# ---------------------------------------------------------------------------------
from selenium import webdriver
from selenium.webdriver.common.by import By
from fake_useragent import UserAgent
from webdriver_manager.firefox import GeckoDriverManager
import time
import json
import os
from selenium.webdriver.common.keys import Keys



MY_USERNAME_VAR = os.getenv('USERNAME')
MY_PASS_VAR = os.getenv('PASS')

# ------------------------------------------------------------------------------------
def wait_for_window(self, timeout = 2):
    time.sleep(round(timeout / 1000))
    wh_now = self.driver.window_handles
    wh_then = self.vars["window_handles"]
    if len(wh_now) > len(wh_then):
        return set(wh_now).difference(set(wh_then)).pop()
    


keywords = ["WWE","Rock","RomanReigns"]

ulrs = []
# -------------------------------------------------------------------------------------
options = webdriver.FirefoxOptions()
options.headless = False
ua = UserAgent()
userAgent = ua.random
options.add_argument(f'user-agent={userAgent}')
# -------------------------------------------------------------------------------------

driver = webdriver.Firefox(executable_path=GeckoDriverManager().install(),options=options)
driver.get("https://twitter.com/i/flow/login")
driver.maximize_window() 
time.sleep(10)
try:
    input_element = driver.find_element(By.CSS_SELECTOR, '.r-30o5oe.r-1niwhzg.r-17gur6a.r-1yadl64.r-deolkf.r-homxoj.r-poiln3')
    input_element.click()
    time.sleep(5)
    input_element.send_keys(MY_USERNAME_VAR)
    time.sleep(5)
    next_btn = driver.find_element(By.CSS_SELECTOR,".css-901oao.r-1awozwy.r-6koalj.r-18u37iz.r-16y2uox.r-37j5jr.r-a023e6.r-b88u0q.r-1777fci.r-rjixqe.r-bcqeeo.r-q4m81j.r-qvutc0")
    next_btn.click()
    print("click send")
    time.sleep(5)
    login_btn = driver.find_element(By.CSS_SELECTOR,".css-901oao.r-1awozwy.r-1cvl2hr.r-6koalj.r-18u37iz.r-16y2uox.r-37j5jr.r-a023e6.r-b88u0q.r-1777fci.r-rjixqe.r-bcqeeo.r-q4m81j.r-qvutc0")
    login_btn.click()
    print("click send")
    time.sleep(10)
    email_x = driver.find_element(By.CSS_SELECTOR, '.r-30o5oe.r-1niwhzg.r-17gur6a.r-1yadl64.r-deolkf.r-homxoj.r-poiln3.r-7cikom.r-1ny4l3l.r-t60dpp.r-1dz5y72.r-fdjqy7.r-13qz1uu')
    email_x.click()
    email_x.send_keys(MY_USERNAME_VAR)
    send_x = driver.find_element(By.CSS_SELECTOR, '.css-901oao.r-1awozwy.r-jwli3a.r-6koalj.r-18u37iz.r-16y2uox.r-37j5jr.r-a023e6.r-b88u0q.r-1777fci.r-rjixqe.r-bcqeeo.r-q4m81j.r-qvutc0')
    send_x.click()
    time.sleep(5)
    password_x = driver.find_element(By.CSS_SELECTOR, '.r-30o5oe.r-1niwhzg.r-17gur6a.r-1yadl64.r-deolkf.r-homxoj.r-poiln3.r-7cikom.r-1ny4l3l.r-t60dpp.r-1dz5y72.r-fdjqy7.r-13qz1uu')
    password_x.click()
    password_x.send_keys(MY_PASS_VAR)
    time.sleep(5)
    login2_btn = driver.find_element(By.CSS_SELECTOR, '.css-18t94o4.css-1dbjc4n.r-1m3jxhj.r-sdzlij.r-1phboty.r-rs99b7.r-19yznuf.r-64el8z.r-1ny4l3l.r-1dye5f7.r-o7ynqc.r-6416eg.r-lrvibr')
    login2_btn.click()
    time.sleep(10)
    session_cookies = driver.get_cookies()
    try:
        closr_btn = driver.find_element(By.CSS_SELECTOR, '.r-30o5oe.r-1niwhzg.r-17gur6a.r-1yadl64.r-deolkf.r-homxoj.r-poiln3.r-7cikom.r-1ny4l3l.r-xyw6el.r-y0fyvk.r-1dz5y72.r-fdjqy7.r-13qz1uu')
        closr_btn.click()
    except:
        print("no close btn")
    with open('session_cookies.txt', 'w') as file:
        file.write(str(session_cookies))
    unique_numbers = set()
    keyword_numbers = {}
    for keyword in keywords:
        paths = []
        driver.find_element(By.TAG_NAME, 'body').send_keys(Keys.CONTROL + 't')
        driver.switch_to.window(driver.window_handles[-1])
        driver.get("https://twitter.com/search?q={}&src=typed_query".format(keyword))
        time.sleep(10)
        # elements = driver.find_elements_by_css_selector('[data-testid="tweet"]')
        tags = driver.find_elements(By.CSS_SELECTOR,"a.css-4rbku5.css-18t94o4.css-1dbjc4n.r-1loqt21.r-1777fci.r-bt1l66.r-1ny4l3l.r-bztko3.r-lrvibr")
        
        for tag in tags:
            href = tag.get_attribute("href")
            start_index = href.find("/status/") + len("/status/")
            number = href[start_index:].split('/')[0]
            unique_numbers.add(number) 

        unique_numbers_list = list(unique_numbers)
        keyword_numbers[keyword] = unique_numbers_list
        for number in unique_numbers_list:
            print(number)    
                  
    with open('keyword_numbers.json', 'w') as file:
        json.dump(keyword_numbers, file)

except Exception as e:
    print(ulrs)
    print("An error occurred:", str(e))


# driver.quit()