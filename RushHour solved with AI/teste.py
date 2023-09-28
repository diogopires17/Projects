
from queue import Queue
import time
from common import * 



def bfs(start_node: Map):
    # Set of visited nodes to prevent loops
    level = 0
    visited = set()
    queue = Queue()

    # Add the start_node to the queue and visited list
    queue.put(start_node)
    visited.add(start_node)
    
    # start_node has not parents
    parent = dict()
    parent[start_node] = None

    # Perform step 3
    path_found = False
    while not queue.empty():
        current_node = queue.get()
        if current_node.test_win():
            path_found = True
            target_node = current_node
            break

        if current_node.pieces != level:
            d_cars = Direction_cars(current_node)
            level =  current_node.pieces

        for car, move in moves(d_cars,current_node):
            copy = Map(str(current_node))
            copy.move(car,move)
            strcopy = str(copy)
            if strcopy not in visited:
                queue.put(copy)
                parent[copy] = current_node
                visited.add(strcopy)
                
    # Path reconstruction
    path = []
    if path_found:
        path.append(target_node)
        while parent[target_node] is not None:
            path.append(parent[target_node]) 
            target_node = parent[target_node]
        path.reverse()
    return path 

def moves(cars, map: Map): # function return possivel moves 
    all_moves =[]
    linha_Pcar,coluna_Pcar = map.piece_coordinates(Map.player_car)
    if map.grid[linha_Pcar.y][coluna_Pcar.x:].count('o') == map.grid_size - coluna_Pcar.x -1:
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



def Direction_cars(mapa: Map):
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

print("\n-- ## Level  --------------------------------")
t0 = time.process_time()
teste = Map("25 oIBBxLoIDDDLAAJoooHoJoEEHFFFKoGGooKo 27382")
print(teste)
tree = print(bfs(teste))
print("Time:",time.process_time()-t0)

