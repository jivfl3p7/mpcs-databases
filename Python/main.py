# -*- coding: utf-8 -*-
"""
Created on Sat May  7 12:04:57 2016

@author: pikashoes
"""

#Create data for Player relation

from os.path import abspath, join, dirname
from names import get_full_name
import random

full_path = lambda filename: abspath(join(dirname(__file__), filename))


FILES = {
    'username': full_path('usernames')
}

countries = ['China', 'South Korea', 'United States', 'Brazil', 'Argentina', 'Russia',
 'France', 'Denmark', 'Philippines', 'Taiwan', 'Norway', 'Australia',
 'Mexico', 'Canada', 'Germany', 'Vietnam', 'Poland', 'Hong Kong', 'Spain', 'Sweden',
 'Netherlands', 'United Kingdom', 'Singapore', 'Turkey', 'Finland', 'Lithuania', 'Estonia',
 'Belgium', 'Thailand', 'Armenia', 'Ukraine', 'Greece', 'Chile', 'Czech Republic', 'Japan',
 'Hungary', 'Uruguay', 'Peru', 'Israel', 'Colombia', 'Portugal', 'Kazakhstan', 'Indoensia',
 'Afghanistan', 'Croatia', 'South Africa', 'Costa Rica', 'Iraq', 'Slovenia', 'Serbia',
 'Panama', 'Macao', 'Italy', 'Ecuador', 'Malta', 'Iceland', 'Luxembourg']
 
username_list = []
 
positions = ['Top', 'Mid', 'AD', 'Jungler', 'Support', 'Sub']

def get_username():
    return get_name2(FILES['username']).capitalize()

def get_name2(filename):
    file = open('usernames', 'r')
    lines = file.readlines()
    for index, line in enumerate(lines):    
        line = line.replace('\n', "")
        if line not in username_list:
            username_list.append(line)    
            return line
        
#line = random.choice(open('usernames').readlines())

def main():
    final_file = ""
    for i in range(2000):
        random_country = random.randint(0, 56)
        random_position = random.randint(0, 5)
        final_file += get_username() + "|" + get_full_name() + "|" + countries[random_country] + "|" + positions[random_position] + "\n"
    #Write to a new file.    
    a = open('Player.txt', 'w')
    a.write(final_file)
    a.close()

if __name__ == "__main__":
    main()



