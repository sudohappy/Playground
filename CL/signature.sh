#!/bin/bash

signature="
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢠⣤⣤⣤⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣤⣔⣭⠗⠚⢢⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠈⡇⡖⣲⣯⣩⡙⠻⠿⣷⠾⠫⠋⣻⣻⡉⠁⠈⣠⣴⣲⡿⣿⣿⣿⣧⠀⢃⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢳⣳⠹⣿⡿⠿⣷⣶⣧⠶⢲⣾⠿⣽⢷⡷⠋⠿⣧⣿⣠⣾⣿⣿⣿⠇⣧⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠈⠫⣳⣌⢿⣮⢟⡥⠉⠀⢰⠋⠀⣳⠟⠀⠀⠀⠈⠙⠻⣿⣿⠿⢋⣼⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠓⣎⣿⢋⢬⡙⡄⠀⠞⢀⣴⣯⣀⣤⣄⡀⠀⠀⠀⠀⠛⣷⣿⠈⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⢏⢇⡬⠳⢏⠉⢻⠀⡟⢁⣵⣇⣠⣈⠈⠉⠓⢦⣄⡸⢄⡈⠻⢄⢹⣶⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⠮⢛⣁⣬⣷⣾⣧⣏⣲⣿⠾⠛⠛⣛⠛⠻⣶⣤⣀⣁⡉⠿⢷⣤⣄⡀⠙⢶⡶⠀⠀⠀⠀⠀
⠀⠀⠀⣧⣺⠁⠀⠀⠀⠀⢹⣿⡷⣇⠀⠀⠀⠈⠉⠓⢹⣾⣷⣶⣾⣐⡤⣉⠙⠯⣀⠀⠘⢻⣅⡀⠀⠀
⢀⣠⡲⣫⣿⣄⠀⠀⠀⠀⣼⠟⠈⠻⣿⡀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣶⣱⢦⡿⣖⢄⠐⣽⡟⠀⠀
⣰⠟⠴⣿⣿⣿⣷⣄⣠⣴⢯⣖⠉⡶⠛⢿⣶⣦⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉⣹⠧⠼⡿⠃⠀⠀⠀
⠙⠷⣌⡻⣿⣿⣿⣿⣿⢱⣿⣿⣿⡆⠀⠀⢉⡻⢿⣿⣿⣿⣿⣿⠿⣟⣿⣶⡾⢯⣑⠻⣹⠃⠀⠀⠀⠀
⠀⠀⠀⠛⠚⠭⣟⣿⡟⣢⣝⣻⣍⣠⠤⢴⣛⣉⣀⣠⣍⣿⣿⣾⣿⣿⣟⢥⡞⢠⣫⡾⢧⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠐⠛⢙⣿⣿⣭⣥⣶⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⡷⠚⠉⠀⢀⠉⡳⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⣏⣯⠜⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢯⣿⠿⢊⡥⠖⠚⢹⣭⡁⣼⠇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⣼⣿⠁⠀⣾⣿⣿⣿⣿⣿⣿⣿⠻⣷⡼⢋⡠⠖⠉⣀⣴⣾⣿⢋⣛⣿⡆⠀⠀⠀
⠀⠀⠀⠀⠀⡠⣞⣵⣷⢹⠀⢠⣿⣿⡿⣿⣿⣿⠟⡞⣳⢋⠞⣋⣤⣶⣿⣿⣿⣿⣿⡿⡿⢿⣿⣷⡄⠀
⠀⠀⠀⠀⣼⣰⢻⣿⣿⡏⣧⢸⣿⡷⡿⠋⣿⡯⠋⡴⣳⣷⣿⣿⣿⡻⢷⣿⣿⢟⡟⢆⠈⢫⡻⣿⣷⠀
⠀⠀⢀⣜⠟⡇⣿⣿⣿⣿⡿⣾⣿⠟⣱⣿⡏⣠⡎⣏⣿⢯⣿⣿⣿⣿⣿⣿⡏⠈⠀⠨⣷⠭⣟⡼⣿⡀
⠀⣠⣺⣋⣀⣷⣿⣿⣿⣿⣇⣿⣿⣧⣟⣿⣿⣿⢨⣿⢁⣾⣿⣿⣿⣿⣿⣳⠃⢀⡴⠊⠁⠀⠀⡇⣾⣧
"
