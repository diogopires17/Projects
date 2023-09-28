"""Example client."""
import asyncio
import getpass
import json
import os

from common import Map,Coordinates,MapException
from search import * 
#from __future__ import annotations

from dataclasses import dataclass


import websockets

 # function that returns the direction of the car either horizontal or vertical and the size of a car

def move_cursor(cor_car, cursor):  # Move o cursor ate ao carro
    if cursor[0] < cor_car[0].x:
        return "d"
    if cursor[0] > cor_car[0].x:
        return "a"
    if cursor[1] < cor_car[0].y:
        return "s"
    if cursor[1] > cor_car[0].y:
        return "w"


def move_car(car_move): # Move o carro
    if car_move.x == 1:
        return "d"
    elif car_move.x == -1:
        return "a"
    elif car_move.y == 1:
        return "s"
    else:
        return "w"


async def agent_loop(server_address="localhost:8000", agent_name="student"):
    """Example client loop."""
    async with websockets.connect(f"ws://{server_address}/player") as websocket:

        # Receive information about static game properties
        await websocket.send(json.dumps({"cmd": "join", "name": agent_name}))

        past_state = None
        path =set()
        actions =set()
        k = 1
        send_flag = False
        flag = False
        crazy = False
        copypath = path
        copyactions = actions
        copyk = k
        past_level = 0
        crazystate = ""
        done = True
        while True:
            try:
                state = json.loads(
                    await websocket.recv()
                )  # receive game update, this must be called timely or your game will get out of sync with the server
                cur = state.get("cursor")
                mapa = Map(state.get("grid"))
                copymap = Map(state.get("grid"))
                level = state.get("level")

                if str(mapa) == str(crazystate) and crazy:
                    path = copypath
                    actions = copyactions
                    k = copyk
                    past_state = crazystate
                    crazy = False
                    done = True

                if past_level != level or count > 6:
                    path =set()
                    actions =set()
                    crazystate = ""
                    past_level = level
                    count = 0
                    if mapa.grid_size > 6:
                        t = SearchTree(mapa, 'a*')
                        path,actions = t.search()
                        k = 1
                    else:
                        t = SearchTree(mapa, "breadth")
                        path,actions = t.search()
                        k = 1

                if str(past_state) != str(mapa):    #Para ir buscar os carros so uma vez
                    count = 0
                    if str(mapa) in str(path):   
                        for i in range(1, len(path)):
                            if str(mapa) == str(path[i]):
                                k = i            #posição onde esta a action
                        
                    else:
                        if done:
                            copypath = path
                            copyactions = actions
                            copyk = k
                            crazystate = past_state
                            t = SearchTree(mapa, "breadth",past_state)
                            path,actions = t.search()
                            k = 1
                            crazy = True
                            done = False
                        else:
                            if mapa.grid_size > 6:
                                t = SearchTree(mapa, 'a*')
                                path,actions = t.search()
                                k = 1
                            else:
                                t = SearchTree(mapa, "breadth")
                                path,actions = t.search()
                                k = 1
                            done = True
                    
                try:
                    copymap.move(actions[k][0],actions[k][1])
                except MapException:
                    count +=1
                
                
                past_state = mapa
                key = ""

                # if que ve se o cursor não esta nas cordenadas do carro da action presente
                if Coordinates(cur[0],cur[1]) != mapa.piece_coordinates(actions[k][0])[0] and state.get("selected") == "":
                    key = move_cursor(mapa.piece_coordinates(actions[k][0]), cur)
                    flag = False
                    send_flag = False

                # if que ve se o cursor esta nas cordenadas do carro da action presente
                if Coordinates(cur[0],cur[1]) == mapa.piece_coordinates(actions[k][0])[0] and flag and state.get("selected") != "" and send_flag:
                    if(k >= len(actions) -1):
                        k =k
                    else:
                        k+=1
                    
                    #if que ve se os carros de duas actions consecutivas são iguais e se não forem da deselect
                    if k>1 and actions[k-1][0] != actions[k][0] and state.get("selected") != "":
                        key = " " #despegar
                        flag = True
                        send_flag = False
                    else:
                        flag = False
                
                # if que move o carro depois de estar selecionado
                if Coordinates(cur[0],cur[1]) == mapa.piece_coordinates(actions[k][0])[0] and state.get("selected") != "" and send_flag and not flag:
                    key = move_car(actions[k][1])
                    flag = True
                    send_flag = False
                
                # seleciona o carro
                if Coordinates(cur[0],cur[1]) == mapa.piece_coordinates(actions[k][0])[0] and state.get("selected") == "" and send_flag :
                    key = " "
                    send_flag = False
                    flag = False

                # se o cursor estiver com um carro selecionado e não corresponder ao carro da action presente da deselect
                if Coordinates(cur[0],cur[1]) != mapa.piece_coordinates(actions[k][0])[0] and state.get("selected") != "" and send_flag :
                    key = " "
                    flag = True
                    send_flag = False
                    
                send_flag = True
                await websocket.send(
                    json.dumps({"cmd": "key", "key": key})
                )  # send key command to server - you must implement this send in the AI agent
                
            except websockets.exceptions.ConnectionClosedOK:
                print("Server has cleanly disconnected us")
                return


# DO NOT CHANGE THE LINES BELLOW
# You can change the default values using the command line, example:
# $ NAME='arrumador' python3 client.py
loop = asyncio.get_event_loop()
SERVER = os.environ.get("SERVER", "localhost")
PORT = os.environ.get("PORT", "8000")
NAME = os.environ.get("NAME", getpass.getuser())
loop.run_until_complete(agent_loop(f"{SERVER}:{PORT}", NAME))
