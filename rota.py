#!/usr/bin/python

import random

c = ["0", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX", "XXI",
     "AW", "2W", "3W", "4W", "5W", "6W", "7W", "8W", "9W", "10W", "PW", "KnW", "QW", "KW",
     "AC", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "PC", "KnC", "QC", "KC",
     "AS", "2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "PS", "KnS", "QS", "KS",
     "AP", "2P", "3P", "4P", "5P", "6P", "7P", "8P", "9P", "10P", "PP", "KnP", "QP", "KP",
]

i = random.randint(0,77)
print(c[i])
