#!python3
# coding: utf-8

import requests, random, os,sys
import time

def addComment(capnum,comment,timestamp):
	print(capnum+comment+timestamp)

capnum = sys.argv[1]
comment = sys.argv[2]
timestamp = sys.argv[3]
addComment(capnum, comment, timestamp)
	# capnum = "a723"
	# comment = "测试评论"
	# timestamp = "0.3147280830624921"
	# addComment(capnum, comment, timestamp)