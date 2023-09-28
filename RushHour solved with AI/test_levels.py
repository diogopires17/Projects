from common import *
from search import * 
import time
#m = Map("01 ooooooooooooAAoooooooooooooooooooooo 5") # resolvido com 4 movimentos
#m = Map("02 ooooooooBoooAABooooooooooooooooooooo 21") # resolvido com 6 movimentos
#m = Map("03 ooBoooooBooCAABooCoooooooooooooooooo 62") # resolvido com 9 movimentos
#m = Map("04 oooooHoxCCoHAAoGoooFoGoooFDDxooooooo 302")
#m = Map("08 ooxCCCoHxooLoHJAALoIJEEEoIFFKooGGoKo 84")
#m = Map("21 BBCCMxEEELMNAAKLoNooKFFoJGGoooJHHIIo 27406")
"""
oooGoo
oooGHI
oAAGHI
ooFBBB
ooFCCo
ooxEEo
"""
#m = Map("14 ICCooMIDDooMxoKAAMooKLooJEELFFJGGGHH 381")
#p = SearchProblem(m)
#tree = SearchTree(p, 'breadth')
#print(tree.search())
"""
oooooo
oooooo
ooooAA
ooBooo
ooBooo
oooooo
"""
levels = {}
with open("levels.txt", "r") as f:
    for lvl, map_str in enumerate(f.readlines(), start=1):
        map = Map(map_str.strip())
        levels[map.pieces] = map
       



i = 24
while i < 56:
    print("\n-- ## Level ",i," --------------------------------")
    t0 = time.process_time()
    teste = levels[i]
    print(teste)
    tree = SearchTree(teste, 'breadth')
    print(tree.search())
    print("Time:",time.process_time()-t0)
    i += 1
