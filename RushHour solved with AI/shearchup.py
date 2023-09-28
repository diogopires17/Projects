# Module: tree_search
# 
# This module provides a set o classes for automated
# problem solving through tree search:
#    SearchDomain  - problem domains
#    SearchProblem - concrete problems to be solved
#    SearchNode    - search tree nodes
#    SearchTree    - search tree with the necessary methods for searhing
#
#  (c) Luis Seabra Lopes
#  Introducao a Inteligencia Artificial, 2012-2019,
#  InteligÃªncia Artificial, 2014-2019


from common import Map,Coordinates



# Nos de uma arvore de pesquisa
class SearchNode:
    # 2.2 - added depth on def _init_ and property init

    def __init__(self,state: Map,parent: Map, change , heuristic = None): 
        self.state = state
        self.parent = parent
        self.change = change
        self.heuristic = heuristic

    def __str__(self):
        return "no(" + str(self.state) + "," + str(self.parent) +  ")"
    def __repr__(self):
        return str(self)
    

# Arvores de pesquisa
class SearchTree:
    def heuristic(self, map:Map, d_cars):
        if map.piece_coordinates(Map.player_car)[0].x == map.grid_size -2:
            return 0
        blockcars = 0
        blockingcars = []
        player_car_size = len(map.piece_coordinates(Map.player_car))

        for car in d_cars:
            if car[2] == "V" and map.piece_coordinates(car[0])[0].x >= (map.piece_coordinates(Map.player_car)[0].x + player_car_size) and (map.piece_coordinates(car[0])[0].y <= map.piece_coordinates(Map.player_car)[0].y and map.piece_coordinates(car[0])[0].y + car[1] > map.piece_coordinates(Map.player_car)[0].y ):
                blockcars += 1
                blockingcars.append(car)
        blocking2 = {}

        
        for v in blockingcars:
            d = self.getBestDirection(map,v,d_cars)
            if d == "Up":
                for vv in d_cars:
                    if vv != v and map.piece_coordinates(vv[0])[0].y < 2 and map.piece_coordinates(vv[0])[0].y <= map.piece_coordinates(v[0])[0].x - v[1] and map.piece_coordinates(vv[0])[0].x <= map.piece_coordinates(v[0])[0].x and map.piece_coordinates(vv[0])[0].x + vv[1] > map.piece_coordinates(v[0])[0].x and vv[2] == "H":
                        blocking2[vv] = 1
            else:
                for vv in d_cars:
                    if vv != v and map.piece_coordinates(vv[0])[0].y > 2 and map.piece_coordinates(vv[0])[0].y >= map.piece_coordinates(v[0])[0].y + v[1] and ((map.piece_coordinates(vv[0])[0].x <= map.piece_coordinates(v[0])[0].x and map.piece_coordinates(vv[0])[0].x + vv[1] > map.piece_coordinates(v[0])[0].x and vv[2] == "H") or (vv[2] == "V" and map.piece_coordinates(vv[0])[0].x) == map.piece_coordinates(v[0])[0].x):
                        blocking2[vv] = 1
        #print(map.grid)
        blockcars += len(blocking2)
        #print("blockcars: ", blockcars)
        return blockcars

    def getBestDirection(self, map,vehicle,cars):
        if vehicle[1] == 3:
            return "Down"
        carUp = 0
        carDown = 0
        
        for car in cars:
            if car != vehicle:
                if map.piece_coordinates(car[0])[0].y > 2 and map.piece_coordinates(car[0])[0].y >= 2 + vehicle[1] and ((map.piece_coordinates(car[0])[0].x < map.piece_coordinates(vehicle[0])[0].x 
                and map.piece_coordinates(car[0])[0].x + car[1] > map.piece_coordinates(vehicle[0])[0].x and car[2] == "H") or (car[2] == "V" and map.piece_coordinates(car[0])[0].x == map.piece_coordinates(vehicle[0])[0].x)):
                    carDown += 1
                if map.piece_coordinates(car[0])[0].y < 2 and map.piece_coordinates(car[0])[0].y <= 2 - vehicle[1] and map.piece_coordinates(car[0])[0].x <= map.piece_coordinates(vehicle[0])[0].x and map.piece_coordinates(car[0])[0].x + car[1] > map.piece_coordinates(vehicle[0])[0].x and car[2] == "H":
                    carUp += 1
        
        if carUp >= carDown:
            return "Down"
        return "Up"

    # construtor
    def __init__(self,problem: Map, strategy, goal = None): 
        self.strategy = strategy
        root = SearchNode(problem,None,(),0)
        self.open_nodes = [root]
        self.solution = None
        self.goal = goal
    
    def get_path(self,node):
        if node.parent == None:
            return [node.state]
        path = self.get_path(node.parent)
        path += [node.state]
        return(path)
        

    def get_actions(self,node):
        if node.parent == None:
            return [node.change]
        path = self.get_actions(node.parent)
        path += [node.change]
        return(path)

    # procurar a solucao
    def search(self):
        states_visited = set()
        level = 0
        while self.open_nodes != []: 
            node = self.open_nodes.pop(0)
            if self.goal == None:
                if node.state.test_win():
                    
                    print("\n\n\n\n\n\nWiiiin\n\n\n\n\n\n")
                    self.solution = node
                    return (self.get_path(node),self.get_actions(node))
            else:
                if str(node.state) == str(self.goal):
                    self.solution = node
                    print("tree if")
                    print(node.state)
                    print(self.goal)
                    return (self.get_path(node),self.get_actions(node))
         
            lnewnodes = set()
            if node.state.pieces != level:
                d_cars = self.Direction_cars(node.state)
                level =  node.state.pieces
            for car,move in self.moves(d_cars, node.state):    
                copy = Map(str(node.state))
                copy.move(car,move)
                strcopy = str(copy)
                if  strcopy not in states_visited:
                    if self.strategy == 'a*':
                        newnode = SearchNode(copy,node,(car,move),self.heuristic(copy,d_cars))
                    
                    else:
                        newnode = SearchNode(copy,node,(car,move))
                    states_visited.add(strcopy)
                    lnewnodes.add(newnode)

            self.add_to_open(lnewnodes)

        return None

    def moves(self, cars, map): # function return possivel moves 
        all_moves =[]
        linha_Pcar,coluna_Pcar = map.piece_coordinates(Map.player_car)
        if map.grid[linha_Pcar.y][coluna_Pcar.x:].count('o') == map.grid_size - coluna_Pcar.x -1 and self.goal == None:
            return [(Map.player_car,Coordinates(1,0))]
        else:
            for car in cars:
                carx = map.piece_coordinates(car[0])[0].x
                cary = map.piece_coordinates(car[0])[0].y
                if car[2] == "H":
                    if carx - 1 >= 0 and map.grid[cary][carx -1] == 'o':
                        all_moves.append((car[0],Coordinates(-1,0)))
                    if carx + car[1] <= ((map.grid_size) -1) and map.grid[cary][carx + car[1]] == 'o':
                        all_moves.append((car[0],Coordinates(1,0)))
                else:
                    if cary - 1 >= 0 and map.grid[cary -1][carx] == 'o':
                        all_moves.append((car[0],Coordinates(0,-1)))
                    if cary + car[1] <= ((map.grid_size) -1) and map.grid[cary + car[1]][carx] == 'o':
                        all_moves.append((car[0],Coordinates(0,1)))

        return all_moves



    def Direction_cars(self, mapa: Map):
        cars = set() #lista de tuplos que contem os carros horizontais e o seu tamanho
        line = str(mapa).split()[1]
        for i in line:
            if i.isupper():
                car = i
                cor = mapa.piece_coordinates(car)
                if cor[0].y == cor[(len(cor)) -1].y:
                    cars.add((car,len(cor),"H"))
                else:
                    cars.add((car,len(cor),"V"))
                        
        return list(cars)

    # juntar novos nos a lista de nos abertos de acordo com a estrategia
    def add_to_open(self,lnewnodes):

        if self.strategy == 'breadth':
            self.open_nodes.extend(lnewnodes)
        elif self.strategy == 'a*':
            self.open_nodes.extend(lnewnodes)
            self.open_nodes.sort(key = lambda node: node.heuristic)   