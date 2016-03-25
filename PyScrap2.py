from bs4 import BeautifulSoup
import urllib.request

#Player URL, WAR Years. 

def playerwar(url,years):
    page = urllib.request.urlopen(str(url))
    soup = BeautifulSoup(page.read(), "lxml")
    table = soup.find("table",{"id":"batting_value"})
    rows = table.find_all('tr')
    data = []
    for tr in rows:
        cols = tr.findAll('td')
        for td in cols:
            text = td.find(text=True) 
            data.append(text)
    x =(years*24)+15
    i = 15
    for i in range(0,x):
        if (i - 15)%24 == 0:
            print((data[i])+(','), end=" ") 
            i = i + 1 
        else:
            i = i + 1 
            
playerwar('http://www.baseball-reference.com/players/b/bautijo02.shtml',5)

