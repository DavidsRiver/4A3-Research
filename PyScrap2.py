from bs4 import BeautifulSoup
import urllib.request

page = urllib.request.urlopen('http://www.baseball-reference.com/players/g/goldspa01.shtml')
soup = BeautifulSoup(page.read(), "lxml")
table = soup.find("table",{"id":"batting_value"})

rows = table.find_all('tr')

data = []
for tr in rows:
    cols = tr.findAll('td')
    for td in cols:
        text = td.find(text=True) 
        data.append(text)

i = 15
print (data[i])
for i in range(0,len(data)):
    if (i - 15)%24 == 0:
        print (data[i])
        i = i + 1 
    else:
        i = i + 1 



print (data[15])
print (data[39])
print (data[63])
print (data[87])
print (data[111])
