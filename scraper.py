
from bs4 import BeautifulSoup
import urllib.request

#Currently this only works for URLS. 

names = [['Jose','Bautista'],['Josh','Donaldson']] 
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

WinsAbove = []      
urlgenerator2(names)
def WAR(x):
    for y in x:
        page = urllib.request.urlopen(str(y))
        soup = BeautifulSoup(page.read())
        table = soup.find_all("table",{"id":"batting_value"})
        soup2 = BeautifulSoup(str(table))
        tfooter = soup2.find("tfoot")
        soup3 = BeautifulSoup(str(tfooter))
        tr = soup3.find_all("td",{"align":"right"})
        lastsoup = BeautifulSoup(str(tr))
        war = lastsoup.find_all(text=True)
        WinsAbove.append(war)
        
WAR(urls)
print (WinsAbove)

test1 = []

def get23(x):
    for y in x:
        test1.append(y[23])
        
get23(WinsAbove)
print(test1)
print(urls)
