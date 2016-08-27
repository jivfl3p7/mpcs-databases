# -*- coding: utf-8 -*-
"""
Created on Sat May  7 14:15:21 2016

@author: pikashoes
"""
import random

countries = ['China', 'South Korea', 'United States', 'Brazil', 'Argentina', 'Russia',
 'France', 'Denmark', 'Philippines', 'Taiwan', 'Norway', 'Australia',
 'Mexico', 'Canada', 'Germany', 'Vietnam', 'Poland', 'Hong Kong', 'Spain', 'Sweden',
 'Netherlands', 'United Kingdom', 'Singapore', 'Turkey', 'Finland', 'Lithuania', 'Estonia',
 'Belgium', 'Thailand', 'Armenia', 'Ukraine', 'Greece', 'Chile', 'Czech Republic', 'Japan',
 'Hungary', 'Uruguay', 'Peru', 'Israel', 'Colombia', 'Portugal', 'Kazakhstan', 'Indoensia',
 'Afghanistan', 'Croatia', 'South Africa', 'Costa Rica', 'Iraq', 'Slovenia', 'Serbia',
 'Panama', 'Macao', 'Italy', 'Ecuador', 'Malta', 'Iceland', 'Luxembourg']


def main():
    final_file = ""
    teamlist = []
    with open('PlayerBITeam.txt', 'r') as file:
        for line in file:
            random_country = random.randint(0, 56)
            line = line.replace("\n", "")
            new_line = line.split('|')
            if new_line[1] not in teamlist:
                final_file += new_line[1] + "|" + countries[random_country] + "\n"
                teamlist.append(new_line[1])
   
    a = open('CurrentTeam.txt', 'w')
    a.write(final_file)
    a.close()

main()