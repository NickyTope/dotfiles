#!/bin/python
import urllib.request, json, random, pyautogui, os, string

quotes = "/home/nt/.config/bspwm/quotes/"
f = open(quotes + random.choice(os.listdir(quotes)), "r")
tmp = open("/tmp/quote", "w")
tmp.write(f.read())
tmp.close()
#  pyautogui.typewrite(f.read())
f.close()

def getjson(url):
    response = urllib.request.urlopen(url)
    return json.loads(response.read())

def getraw(url):
    response = urllib.request.urlopen(url)
    return response.read()

def opinionated():
    url = "https://opinionated-quotes-api.gigalixirapp.com/v1/quotes"
    return getjson(url)['quotes'][0]['quote']

def quotable():
    url = "https://api.quotable.io/random"
    return getjson(url)['content']

def forismatic():
    url = "http://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en"
    return getjson(url)['quoteText']

def storm():
    url = "http://quotes.stormconsultancy.co.uk/random.json"
    return getjson(url)['quote']

def cats():
    url = "https://catfact.ninja/fact"
    return getjson(url)['fact']

def number():
    url = "http://numbersapi.com/random"
    return getraw(url)

active = ["quotable", "storm", "cats", "number"]

def getRandomQuote():
    api = random.choice(active)
    return globals()[api]()

letters = string.ascii_lowercase
new = ''.join(random.choice(letters) for i in range(8))
f = open(quotes + new, "w");
f.write(getRandomQuote())
f.close()
