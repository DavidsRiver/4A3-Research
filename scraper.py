#pip install beautifulsoup4

import urllib
import bs4

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


//http://www.baseball-reference.com/players/b/bautijo02.shtml


page = urllib.request.urlopen("http://www.baseball-reference.com/players/b/bautijo02.shtml")
#http://www.baseball-reference.com/players/b/bautijo02.shtml
url = page.read()
soup = BeautifulSoup(url)

print (soup.prettify())

// Trying to Create function to iterate through sets 
cat = [1,2,3]
cat2 = []

def add1(y):
    for x in y:
        x += 1
    cat2.append(y)  


