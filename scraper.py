import urllib
import bs4
page = urllib.request.urlopen("http://www.baseball-reference.com/players/b/bautijo02.shtml")
#http://www.icc-ccs.org/prc/piracyreport.php
#http://www.baseball-reference.com/players/b/bautijo02.shtml
url = page.read()
soup = BeautifulSoup(url)
print (soup.prettify())
