#pip install beautifulsoup4

from bs4 import BeautifulSoup
import urllib.request
#urllib2 is urllibrequest

names = [['Jose','Bautista'],['Josh','Donaldson'],['David','Price']] 
urls = []

def urlgenerator2(name):
    for (x,y) in name:    
        a = 'http://www.baseball-reference.com/players/'
        b = y[0]
        c = y[0:5]
        d = x[0:2]
        e = '02'
        f = '01'
        g = '.shtml'
        z = '/'
        url = a+b+z+c+d+e+g
        urls.append(url.lower())  
        
def urlgenerator1(name):
    for (x,y) in name:    
        a = 'http://www.baseball-reference.com/players/'
        b = y[0]
        c = y[0:5]
        d = x[0:2]
        e = '02'
        f = '01'
        g = '.shtml'
        z = '/'
        url = a+b+z+c+d+f+g
        urls.append(url.lower())  

urlgenerator2(names)
print (urls)

page = urllib.request.urlopen('http://www.baseball-reference.com/players/b/bautijo02.shtml')
soup = BeautifulSoup(page.read())
print (soup.prettify())

name = soup.find("span", {"id": "player_name"}).contents
print (name)

war= soup.find("tr", {'class': "stata_total}).contents 
print (war)

// http://stackoverflow.com/questions/23377533/python-beautifulsoup-parsing-table

