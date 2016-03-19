#pip install beautifulsoup4
# FINALLY GOT WAR, turn it into a function and do pitchers. 

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
#this doesnt work makes them lsits 
soups = []
def getsoups(x):
    for y in x:
        page = urllib.request.urlopen('x')
        soups.append(page)


WinsAbove = []
urls= []
def WARhitters(name):
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
    for x in urls: 
        page = urllib.request.urlopen(url)
        soup = BeautifulSoup(page.read())
        print (soup.pretify())
        table = soup.find_all("table",{"id":"batting_value"})
        soup2 = BeautifulSoup(str(table))
        tfooter = soup2.find("tfoot")
        soup3 = BeautifulSoup(str(tfooter))
        tr = soup3.find_all("td",{"align":"right"})
        lastsoup = BeautifulSoup(str(tr))
        war = lastsoup.find_all(text=True)
        WinsAbove.append(war[23])
    

page = urllib.request.urlopen('http://www.baseball-reference.com/players/b/bautijo02.shtml')
soup = BeautifulSoup(page.read())
print (soup.prettify())

page = urllib.request.urlopen('http://www.baseball-reference.com/players/d/donaljo02.shtml')
soup = BeautifulSoup(page.read(), "lxml")
#print (soup.prettify())

WinsAbove = []
#x is soups 
def wargenerator(x):
    table = x.find_all("table",{"id":"batting_value"})
    soup2 = BeautifulSoup(str(table))
    tfooter = soup2.find("tfoot")
    soup3 = BeautifulSoup(str(tfooter))
    tr = soup3.find_all("td",{"align":"right"})
    lastsoup = BeautifulSoup(str(tr))
    war = lastsoup.find_all(text=True)
    WinsAbove.append(war[23])

