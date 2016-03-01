#pip install beautifulsoup4

import urllib
import bs4

FirstName = 'Jose"
LastName = "Bautista"




// trying to create a function that prints the url like it is in baseball reference. Doesn't work so far

>>> print
<built-in function print>
>>> firstnam= Jose
Traceback (most recent call last):
  File "<pyshell#1>", line 1, in <module>
    firstnam= Jose
NameError: name 'Jose' is not defined
>>> firstname= 'jose'
>>> print firstname
SyntaxError: invalid syntax
>>> print %firstname
Traceback (most recent call last):
  File "<pyshell#4>", line 1, in <module>
    print %firstname
TypeError: unsupported operand type(s) for %: 'builtin_function_or_method' and 'str'
>>> print 'firstname
SyntaxError: EOL while scanning string literal
>>> x = "jose"
>>> print x
SyntaxError: invalid syntax
>>> print (x)
jose
>>> pip install beautifulsoup4
SyntaxError: invalid syntax
>>> firstletter = x[0]
>>> y=
SyntaxError: invalid syntax
>>> y="bautista"
>>> print x + y
SyntaxError: invalid syntax
>>> print (x+y)
josebautista
>>> print (firstletter)
j
>>> firstletter = y[0]
>>> lastname4 =y[0:3]
>>> firstname2= x[0:1]
>>> 
>>> print("http://www.baseball-reference.com/players/%/%%02.shtml" (firstletter,lastname4,firstname2))
Traceback (most recent call last):
  File "<pyshell#22>", line 1, in <module>
    print("http://www.baseball-reference.com/players/%/%%02.shtml" (firstletter,lastname4,firstname2))
TypeError: 'str' object is not callable
>>> 




page = urllib.request.urlopen("http://www.baseball-reference.com/players/b/bautijo02.shtml")
#http://www.baseball-reference.com/players/b/bautijo02.shtml
url = page.read()
soup = BeautifulSoup(url)

print (soup.prettify())

