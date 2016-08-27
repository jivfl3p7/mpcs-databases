# -*- coding: utf-8 -*-
"""
Created on Sat May  7 15:38:06 2016

@author: pikashoes
"""

import random
from getTeamName import get_team

gamenames = ['TSM vs CLG', 'CLG vs FW', 'paiN vs KOO', 'FW vs KOO', 'CLG vs paiN',
             'KOO vs CLG', 'paiN vs FW', 'CLG vs KOO', 'FW vs paiN',
             'KOO vs paiN', 'FW vs CLG', 'KOO vs FW', 'paiN vs CLG']

tournaments = ['2014 Season World Championship', 'Season 3 World Championship',
               'Season 1 World Championship', 'Season 2 World Championship', 'IEM Season X - World Championship',
               'IEM Season X - Cologne', 'IEM Season X - San Jose',
               '2015 IWCT - Chile', '2015 IWCT - Turkey']

def get_champ():
    line = random.choice(open('champions.txt').readlines()).title()
    line = line.replace("\n", "")
    return line

def ban(x):
    result = ""
    if x == 1:
        result = get_champ()
    else:
        result = "Null"
    return result

def main():
    final_game = ""
    final_playsgame = ""
    personlist = []
    unique = []
    
    with open('/Users/pikashoes/Documents/UChicago/Databases/Sooji1_Assignment_6/data/PlayerBITeam.txt', 'r') as file:
        for line in file:
            random_game = random.randint(0, 12)
            kills = random.randint(0, 10)
            deaths = random.randint(0, 10)
            assists = random.randint(0, 20)
            win = random.randint(0, 1)
            banNum = random.randint(0, 1)
            tourn = random.randint(0, 8)         
            game_number = random.randint(1, 10)
            game_week = random.randint(1, 10)
            stage = random.randint(1, 10)
            
            line = line.replace("\n", "")
            new_line = line.split('|')
            if new_line[0] not in personlist:
#                final_game += 
#                string_week = str(game_week)
#                string_number = str(game_number)
            
                name_game = gamenames[random_game]
                week_game = game_week
                number_game = game_number
                tournament = tournaments[tourn]
                death_game = deaths
                kill_game = kills
                assist_game = assists
                wins_game = win
                ban_game = ban(banNum)

                unique_game = ("|" + name_game + "|{0}".format(week_game)
                    + "|{0}".format(number_game) + "|" + tournament)                
                
                if unique_game not in unique:
                    new_game = (new_line[0] + "|{0}".format(kill_game) + "|{0}".format(death_game)
                        + "|{0}".format(assist_game) + "|{0}".format(wins_game) + "|" + 
                        get_champ() + "|" + ban_game + unique_game + "\n")
                    final_playsgame += new_game
            
                    #Generate game
                    new_game = new_game.replace("\n", "")
                    new_game = new_game.split("|")
                    final_game += ("{0}".format(name_game) + "|{0}".format(week_game)
                        + "|{0}".format(number_game) + "|{0}".format(stage) + "|" + new_line[1] + "|" + get_team() + "|{0}".format(tournament) + "\n")
                    
                    unique.append("|" + gamenames[random_game] + "|{0}".format(game_week)
                    + "|{0}".format(game_number) + "|" + tournaments[tourn])
                    
                personlist.append(new_line[0])
                game_number += 1
                game_week += 1
   
    a = open('Game.txt', 'w')
    a.write(final_game)
    a.close()
    
    b = open('PlayerPlaysGame.txt', 'w')
    b.write(final_playsgame)
    b.close()

main()