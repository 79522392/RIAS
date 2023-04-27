# 导入数据请求模块
import requests
# 导入格式化输出模块
from pprint import pprint
# 导入csv模块
import csv
import pymysql

# 创建文件
# f = open('data1.csv', mode='a', encoding='utf-8', newline='')
'''
批量替换
1.选中替换内容 ctrl + r
2.勾选上 .*
3.输入正则命令进行替换
    :.*
    ,
'''
# csv_writer = csv.DictWriter(f, fieldnames=[
#     '职位',
#     '薪资',
#     '学历',
#     '经验',
#     '城市',
#     '公司',
#     '公司规模',
#     '公司领域',
#     '职位详情页',
#     '公司详情页',
# ])
# csv_writer.writeheader()


# 数据库创建链接
conn = pymysql.connect(
    host='103.228.170.64',
    port=3306,
    user='rjgc',
    password='123456',
    database='rjgc',
    charset='utf8mb4'
)
# 生成一个游标对象
cursor = conn.cursor()

url = "https://cupidjob.51job.com/open/noauth/search-pc"
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.48'
}
for num in range(1, 51, 1):
    data = {
        'api_key': '51job',
        'timestamp': '1682152251',
        'keyword': 'java',
        'searchType': '2',
        'function': '',
        'industry': '',
        'jobArea': '000000',
        'jobArea2': '',
        'landmark': '',
        'metro': '',
        'salary': '',
        'workYear': '',
        'degree': '',
        'companyType': '',
        'companySize': '',
        'jobType': '',
        'issueDate': '',
        'sortType': '0',
        'pageNum': str(num),
        'requestId': '',
        'pageSize': '20',
        'source': '1',
        'accountId': '',
        'pageCode': 'sou|sou|soulb',
    }
    # 发送请求
    response = requests.get(url=url, params=data, headers=headers)
    print(response)
    for index in response.json()['resultbody']['job']['items']:
        # pprint(index)
        # 保存字典
        dit = {
            '职位': index['jobName'],
            '薪资': index['provideSalaryString'],
            '学历': index['degreeString'],
            '经验': index['workYearString'],
            '城市': index['jobAreaString'],
            '公司': index['companyName'],
            '公司规模': index['companySizeString'],
            '公司领域': index['industryType1Str'],
            '职位详情页': index['jobHref'],
            '公司详情页': index['companyHref']
        }
        # 写入数据
        # csv_writer.writerow(dit)
        # sql = f"insert into position(job_name,salary,degree,work_year,company_name,industry_type,job_href,company_href) values('{index['jobName']}','{index['provideSalaryString']}','{index['degreeString']}','{index['workYearString']}','{index['jobAreaString']}','{index['companyName']}','{index['companySizeString']}','{index['industryType1Str']}','{index['jobHref']}','{index['companyHref']}')"
        print(index['industryType1Str'])
        sql = f"insert into information(job_name,salary,degree,work_year,job_area,company_name,company_size,industry_type,job_href,company_href) values('{index['jobName']}','{index['provideSalaryString']}','{index['degreeString']}','{index['workYearString']}','{index['jobAreaString']}','{index['companyName']}','{index['companySizeString']}','{index['industryType1Str']}','{index['jobHref']}','{index['companyHref']}')"
        cursor.execute(sql)

    break

# f.close()
conn.commit()
