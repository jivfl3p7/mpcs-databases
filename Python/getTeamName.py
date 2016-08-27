# -*- coding: utf-8 -*-
"""
Created on Sat May  7 13:23:37 2016

@author: pikashoes
"""

import random

def get_team():
    line = random.choice(open('teamnames').readlines()).capitalize()
    line = line.replace("\n", "")
    return line

def main():
    final_file = ""
    
    with open('/Users/pikashoes/Documents/UChicago/Databases/Sooji1_Assignment_6/data/Player.txt', 'r') as file:
        for line in file:
            new_line = line.split('|')
            final_file += new_line[0] + "|" + get_team()
   
    a = open('PlayerBITeam.txt', 'w')
    a.write(final_file)
    a.close()

