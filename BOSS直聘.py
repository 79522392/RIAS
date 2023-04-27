import random
from time import sleep

import pymysql
from lxml import etree
from selenium import webdriver
from selenium.webdriver.common.by import By

# 隐藏selenium的基本信息
option = webdriver.ChromeOptions()
# 禁用自动化栏
option.add_experimental_option('excludeSwitches', ['enable-automation'])
# 屏蔽保存密码提示框
prefs = {'credentials_enable_service': False, 'profile.password_manager_enabled': False}
option.add_experimental_option('prefs', prefs)
# 反爬虫特征处理
option.add_argument('--disable-blink-features=AutomationControlled')
preferences = {
    "webrtc.ip_handling_policy": "disable_non_proxied_udp",
    "webrtc.multiple_routes_enabled": False,
    "webrtc.nonproxied_udp_enabled": False
}

driver = webdriver.Chrome(options=option)
js = open('stealth.min.js').read()
driver.execute_cdp_cmd('Page.addScriptToEvaluateOnNewDocument', {'source': js})

url = 'https://www.zhipin.com/web/geek/job?query=java&city=100010000'
driver.get(url)
driver.implicitly_wait(5)

# res = driver.page_source
# root = etree.HTML(res)
# divs = root.xpath('//div[@class="search-job-result"]')
# for div in divs:
#     href = div.xpath('//a[@class="job-card-left"]/@href')
#     print(href)


lis = driver.find_elements(By.XPATH, "//ul[@class='job-list-box']/li")
for li in lis:
    job_name = li.find_element(By.XPATH, './/span[@class="job-name"]').text
    job_area = li.find_element(By.XPATH, './/span[@class="job-area"]').text
    salary = li.find_element(By.XPATH, './/span[@class="salary"]').text
    info_list = li.find_elements(By.XPATH, './/div[@class="job-info clearfix"]/ul[@class="tag-list"]/li')
    degree = info_list[0].text
    exp = info_list[-1].text
    company_name = li.find_element(By.XPATH, './/h3[@class="company-name"]/a').text
    company_tag_list = li.find_element(By.XPATH, './/ul[@class="company-tag-list"]/li').text
    job_href = li.find_element(By.XPATH, './/a[@class="job-card-left"]').get_attribute("href")
    company_href = li.find_element(By.XPATH, './/h3[@class="company-name"]/a').get_attribute("href")
    print(job_name, job_area, salary, degree, exp, company_name, company_tag_list, job_href, company_href)
