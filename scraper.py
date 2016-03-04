#pip install beautifulsoup4

import urllib
import bs4

urls =[]

def urlgenerator2(firstname,lastname):
  a = 'http://www.baseball-reference.com/players/'
  b = lastname[0]
  c = lastname[0:5]
  d = firstname[0:2]
  e = '02'
  f = '01'
  g = '.shtml'
  z = '/'
  url = a+b+z+c+d+e+g
  urls.append(url.lower())  

//http://www.baseball-reference.com/players/b/bautijo02.shtml

def urlgenerator1(firstname,lastname)
  a = 'http://www.baseball-reference.com/players/'
  b = lastname[0]
  c = lastname[0:5]
  d = firstname[0:2]
  e = '02'
  f = '01'
  g = '.shtml'
  z = '/'
  url = a+b+z+c+d+f+g
  print (url.lower())

page = urllib.request.urlopen("http://www.baseball-reference.com/players/b/bautijo02.shtml")
#http://www.baseball-reference.com/players/b/bautijo02.shtml
url = page.read()
soup = BeautifulSoup(url)

print (soup.prettify())

