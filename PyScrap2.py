from bs4 import BeautifulSoup
import urllib.request


def playerwar(url,name,age,position,contractyr,contractvalue,contractlength,years):
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
    print ((name)+','+(age)+','+(position)+','+(contractyr)+','+(contractvalue)+','+(contractlength)+',', end =" ")
    for i in reversed(range(0,x)):
        if (i - 15)%24 == 0:
            print((data[i])+(','), end=" ") 
            i = i + 1 
        else:
            i = i + 1 
    
# url,name,age,position,contractyear,contractvalue,contractlength.years

playerwar('http://www.baseball-reference.com/players/w/wrighda03.shtml',
          'David Wright','33.097','2013','138','8','3B'
          ,10)
