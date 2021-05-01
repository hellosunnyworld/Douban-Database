import requests
from bs4 import BeautifulSoup
import urllib.parse
import sys

import xlwt
import xlrd
import time
import random
import re
import csv



# 账号密码
def login(username, password):
    url = 'https://accounts.douban.com/j/mobile/login/basic'
    header = {
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36',
        'Referer': 'https://accounts.douban.com/passport/login_popup?login_source=anony',
        'Origin': 'https://accounts.douban.com',
        'content-Type': 'application/x-www-form-urlencoded',
        'x-requested-with': 'XMLHttpRequest',
        'accept': 'application/json',
        'accept-encoding': 'gzip, deflate, br',
        'accept-language': 'zh-CN,zh;q=0.9',
        'connection': 'keep-alive'
        , 'Host': 'accounts.douban.com'
    }
    # 登陆需要携带的参数
    data = {
        'ck' : '',
        'name': '',
        'password': '',
        'remember': 'false',
        'ticket': ''
    }
    data['name'] = username
    data['password'] = password
    data = urllib.parse.urlencode(data)
    print(data)
    req = requests.post(url, headers=header, data=data, verify=False)
    cookies = requests.utils.dict_from_cookiejar(req.cookies)
    print(cookies)
    return cookies

def getcomment(cookies, id, proxies):  # 参数为登录成功的cookies(后台可通过cookies识别用户，电影的id)

    
    headers = ["Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; AcooBrowser; .NET CLR 1.1.4322; .NET CLR 2.0.50727)",
    "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506)",
    "Mozilla/4.0 (compatible; MSIE 7.0; AOL 9.5; AOLBuild 4337.35; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)",
    "Mozilla/5.0 (Windows; U; MSIE 9.0; Windows NT 9.0; en-US)",
    "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 2.0.50727; Media Center PC 6.0)",
    "Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 1.0.3705; .NET CLR 1.1.4322)",
    "Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30)",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN) AppleWebKit/523.15 (KHTML, like Gecko, Safari/419.3) Arora/0.3 (Change: 287 c9dfb30)",
    "Mozilla/5.0 (X11; U; Linux; en-US) AppleWebKit/527+ (KHTML, like Gecko, Safari/419.3) Arora/0.6",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.2pre) Gecko/20070215 K-Ninja/2.1.1",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9) Gecko/20080705 Firefox/3.0 Kapiko/3.0",
    "Mozilla/5.0 (X11; Linux i686; U;) Gecko/20070322 Kazehakase/0.4.5",
    "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.8) Gecko Fedora/1.9.0.8-1.fc10 Kazehakase/0.5.6",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.20 (KHTML, like Gecko) Chrome/19.0.1036.7 Safari/535.20",
    "Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; fr) Presto/2.9.168 Version/11.52",
    ]
    # proxy_ip_port = [
    #     "http://123.169.123.95:9999",
    #     "http://113.128.8.121:9999",
    #     "http://114.239.149.135:9999",
    #     "http://163.204.241.5:9999",
    #     "http://116.112.249.225:9999",
    #     "http://183.166.16.103:9999",
    #     "http://114.239.42.78:9999",
    #     "http://121.233.207.192:9999",
    #     "http://175.42.158.41:9999",
    #     "http://223.215.10.168:9999",
    #     "http://36.250.156.222:9999",
    #     "http://49.86.180.144:9999",
    #     "http://114.239.110.57:9999",
    #     "http://121.232.148.89:9000",
    #     "http://113.120.32.93:9999",
    #     "http://117.91.165.119:9999",
    #     "http://175.42.128.168:9999",
    #     "http://175.44.108.54:9999",
    #     "http://113.120.61.38:9999",
    #     "http://175.42.129.60:9999",
    #     "http://171.12.40.12:9999",
    #     "http://113.121.92.132:9999",
    #     "http://183.166.163.183:9999",
    #     "http://113.121.66.192:9999",
    #     "http://112.111.77.206:9999",
    #     "http://113.194.135.169:9999",
    #     "http://114.239.2.196:9999",
    #     "http://117.94.140.138:9999",
    #     "http://36.249.48.2:9999",
    #     "http://122.138.142.121:9999"
    # ]
    # i = random.randint(0, 14)
    # proxy = {'http' : proxy_ip_port[i],}
    i = random.randint(0, 9)
    header = {
    'user-agent': headers[i],
    }
    try:
        #
        url = 'https://www.douban.com/people/' + str(id) + '/'
        # print(id)
        # print(url)
        # sys.exit()
        # req = requests.get(url, cookies=cookies, headers=header, proxies=proxy)
        
        req = requests.get(url, headers=header, proxies=proxies, timeout = 5)
        # print(req)
        if (req.status_code != 200):
            # print(req.content)
            # time.sleep(3 * random.random() + 2)
            return 0
        soup = BeautifulSoup(req.content, "html.parser", from_encoding = 'UTF-8')
        # print(soup)
        # print(soup.find_all('div', class_ = 'user-info'))
        if (soup.find_all('div', class_ = 'user-info') != []):
            try:
                # print(soup.find_all('div', class_ = 'user-info')[0].a.string)
                address = soup.find_all('div', class_ = 'user-info')[0].a.string.strip('"').replace(',', '')
            except:
                address = 'None'
            div_str = soup.find_all('div', class_ = 'user-info')[0].select('div')[0].text
            user_age = 2021 - int(re.search(r'\d{4}-\d{2}-\d{2}',div_str).group(0)[0:4]) + random.randint(10, 30)

            with open('user.csv', mode = 'a+') as f:
                writer = csv.writer(f, quotechar = None)
                writer.writerow([id,user_age,address])
            print(id, user_age, address)
            # time.sleep(3 * random.random())
            return 1
        else:
            # time.sleep(3 * random.random() + 2)
            return 0
    except Exception as e:  # 有异常退出
        print(e)
        return 2


if __name__ == '__main__':
    # username = input('输入账号：')
    # password = input('输入密码：')
    # cookies = login(username, password)

    number = ['17835344407', '17154866377', '15534883459', '15536623025']
    cookies = login(number[random.randint(0, 3)], 'kyh200011..')
    # # cookies = login(15534883459, 'kyh200011')
    # print(cookies)
    # sys.exit()
    # cookies_bid = ['lNEIG4nz3Eo', 'pBxmZ0rR_Tw', 'JodUWE9VKM4', '5mEcQfQaEqA']
    
    # # mvid = input('电影的id为：')
    # with open('user.csv', mode = 'w') as f:
    #         field_name = ['user_id', 'age', 'address']
    #         writer = csv.DictWriter(f, fieldnames = field_name)
    #         writer.writeheader()
    

    # 提取代理API接口，获取1个代理IP
    api_url = "https://dps.kdlapi.com/api/getdps/?orderid=901837876118464&num=1&pt=1&sep=1"

    # 获取API接口返回的代理IP
    proxy_ip = requests.get(api_url).text

    # 用户名密码认证(私密代理/独享代理)
    username = "17835344407"
    password = "3uj0nywd"
    proxies = {
        "http": "http://%(user)s:%(pwd)s@%(proxy)s/" % {"user": username, "pwd": password, "proxy": proxy_ip},
        "https": "http://%(user)s:%(pwd)s@%(proxy)s/" % {"user": username, "pwd": password, "proxy": proxy_ip}
    }


    id = 1049811
    index = 50000
    while id < 1050000:
        # if (id % 100 == 0):
        #     number = ['17835344407', '17154866377', '15534883459', '15536623025']
        #     cookies = login(number[random.randint(0, 3)], 'kyh200011..')
            # proxy_ip = requests.get(api_url).text
            # proxies = {
            #     "http": "http://%(user)s:%(pwd)s@%(proxy)s/" % {"user": username, "pwd": password, "proxy": proxy_ip},
            #     "https": "http://%(user)s:%(pwd)s@%(proxy)s/" % {"user": username, "pwd": password, "proxy": proxy_ip}
            # }
        # cookies = {
        # 'bid': cookies_bid[random.randint(0, 3)],
        # }
            # id = random.randint(1000001, 236156501)
        # print(index)
        ret = getcomment(cookies, id, proxies)
        if ret == 1:
            index -= 1
        elif ret == 2:
            proxy_ip = requests.get(api_url).text
            proxies = {
                "http": "http://%(user)s:%(pwd)s@%(proxy)s/" % {"user": username, "pwd": password, "proxy": proxy_ip},
                "https": "http://%(user)s:%(pwd)s@%(proxy)s/" % {"user": username, "pwd": password, "proxy": proxy_ip}
            }
            id -= 1
        id += 1