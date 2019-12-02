#!/usr/bin/python

'''
AUTHOR :- MAYUR VIJAY RAICHURA (mraichux)
WWID :- 11797661
DATE :- 02/12/2019
PURPOSE :- Simple script to read a file in python in different ways 
'''

import sys
import os
import re

############################ TO READ FROM STD INPUT ######################
'''
str = raw_input("Enter your input: ")
print "Received input is : ", str
'''

############################ UNIX COMMANDS IN PYTHON ######################
### NOTE :- Below is the way of using unix commands in python
'''
os.system('ls')
os.system('pwd')
os.system('sed -i "/DFD/d" ww_48.1.1_copy.rpt')
os.system('sed -i "/^\$/d" ww_48.1.1_copy.rpt')
'''


############################FIND AND REPLACE IN PYTHON ######################
#'''
phone = "2004-959-559 # This is Phone Number"

# Delete Python-style comments
num = re.sub(r'#.*$', "", phone)
# num = re.sub(r'\d', "d", phone)
print "Phone Num : ", num

# Remove anything other than digits
num = re.sub(r'\D', "", phone)    
print "Phone Num : ", num
#'''



############################ MATCH AND SEARCH IN PYTHON ######################

line = "Cats are smarter than dogs";

matchObj = re.match( r'dogs', line, re.M|re.I)
if matchObj:
   print "match --> matchObj.group() : ", matchObj.group()
else:
   print "No match!!"

#searchObj = re.search( r'dogs', line, re.M|re.I)
searchObj = re.search( r'(.*) are (.*) than', line, re.M|re.I)
if searchObj:
  # print "search --> searchObj.group() : ", searchObj.group()
   print "search --> searchObj.group() : ", searchObj.group()
   print "searchObj.group(1) : ", searchObj.group(1)
   print "searchObj.group(2) : ", searchObj.group(2)
else:
   print "Nothing found!!"


# Open a file
'''
fo = open("ww_48.1.1.rpt", "r+")    ### This is the hardcoded file open operation 
out = open("out.txt", "w")    ### This is the hardcoded file open operation 
'''

##print ("the script has the name %s" % (sys.argv[1])) ;
###MAYUR	arguments = len(sys.argv) - 1
###MAYUR	print ("The script is called with %i arguments" % (arguments))

#'''
fo = open((sys.argv[1]), "r+")	### In the method arg 1 is provoded as file name .
out = open((sys.argv[2]), "w")	### In the method arg 1 is provoded as file name .
#'''
### Below prints are to see the general attributes of a file .
'''
print "Name of the file: ", fo.name
print "Closed or not : ", fo.closed
print "Opening mode : ", fo.mode
print "Softspace flag : ", fo.softspace
'''

### NOTE :- ''' is used for multiline comment in python. 
### NOTE :- Below are the different methods of reading the file through python . If you want to use a method . Please comment out the others

############################METHOD 1######################
'''
str = fo.read();
print(str)
'''
############################METHOD 2######################
###MAYUR	print(fo.read())    ## If you want to use this syntax to read the file comment method 1

############################METHOD 3######################
### NOTE :- This is use to print one line at a time 
'''
print(fo.readline())
print(fo.readline())
'''

############################METHOD 4######################
### NOTE :- This is looping method to process each read line 
#'''
for x in fo :
  out.write(x)	     ### To write content of file one in output file.  
  x = x.strip()      ### This function is equivalent to chomp function in perl.
  print(x)
#'''



fo.close()
out.close()
