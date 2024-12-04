#    /\
#   /  \
#   /  \
#  /  o \
#  /    \
# / u    \
# --------
#    ||
#    ||

from random import random, choice

def drawOrnaments(len: int):
    ornaments="🎈🎊🎀🎁🔔🎶"
    line=""
    i=0
    while i < len:
        if random() < 0.2 and i < len - 1:
            line += choice(ornaments)
            i += 2
        else:
            line += " "
            i += 1
    return line

def drawGroup(n: int, len: int):
    print(f"{" " * (len - n)}/{drawOrnaments(n*2)}\\")
    print(f"{" " * (len - n - 1)}/{drawOrnaments((n+1)*2)}\\")

def drawTrunk(spacing: int):
    print(f"{" " * spacing}||")
    print(f"{" " * spacing}||")

def drawTree(groups: int):
    for n in range(groups):
        drawGroup(n, groups)
    print(f"{"-" * (groups * 2 + 2)}")
    drawTrunk(groups)

drawTree(groups=8)
