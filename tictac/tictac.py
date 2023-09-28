
board = ["-", "-", "-",
             "-", "-", "-",
             "-", "-", "-"]
game_going = True

win = None
current_player = "O"

def main():
    play_game()
    pass


# display the board
def display_board():
    print(board[0] + "|" + board[1] + "|" + board[2]) 
    print(board[3] + "|" + board[4] + "|" + board[5]) 
    print(board[6] + "|" + board[7] + "|" + board[8]) 


# play the game
def play_game():
    display_board()
   
    while game_going:
       
        turn(current_player)
        check_over()
        flip_player()
    if win == "X" or win == "O":
         print(win + " " +  "Won!")
    else:
         print("tie!")
    


def turn(player):
        print(player + " " + "turn \n")
        pos  = input("Choose a position 1 - 9\n")
        print("\n")
        valid  = False
        while not valid:
            while pos not in ["1", "2", "3", "4", "5", "6", "7", "8", "9"]:
                pos = input("Invalid input. Try again please.\n")
 
            pos = int(pos) - 1 

            if board[pos] == "-":
                valid = True
            else:
                print("Position already taken! Try again")        
        board[pos] = player
        display_board()
        
        
def flip_player():
    global current_player
    if current_player == "X":
        current_player = "O"
    elif current_player == "O": 
        current_player = "X"
    return

def check_over():
     check_win()
     check_tie()

def check_tie():
    global board
    global game_going 
    if not check_win and  "-" not in board:
        game_going  = False
        return True
        
    return

def check_win():
    global win
    global current_player

    row_win = check_rows()
    col_win = check_colls()
    diag_win = check_diag()

    if row_win:
        if current_player == "X":
            win = "X" 
        else:
             win = "O"
    elif col_win:
        if current_player == "X":
            win = "X" 
        else:
             win = "O"
        
    elif diag_win:
        if current_player == "X":
            win = "X" 
        else:
             win = "O"
    else:
        win = None
    pass

def check_rows():
    global game_going
    row_1 = board[0] == board[1] == board[2] != "-"
    row_2 = board[3] == board[4] == board[5] != "-"
    row_3 = board[6] == board[7] == board[8] != "-"
    if row_1 or row_2 or row_3:
        game_going = False
    if row_1:
         return board[0]
    elif row_2:
         return board[3]
    elif row_1:
         return board[6]
    return
         

def check_colls():
    global game_going
    col_1 = board[0] == board[3] == board[6] != "-"
    col_2 = board[1] == board[4] == board[7] != "-"
    col_3 = board[2] == board[5] == board[8] != "-"
    if col_1 or col_2 or col_3:
        game_going = False
    if col_1:
         return board[0]
    elif col_2:
         return board[1]
    elif col_1:
         return board[2]
    return

def check_diag():
    global game_going
    diag_1 = board[0] == board[4] == board[8] != "-"
    diag_2 = board[2] == board[4] == board[6] != "-"
  
    if diag_1 or diag_2:
        game_going = False
    if diag_1:
         return board[0]
    elif diag_2:
         return board[2]
    return

if __name__ == "__main__":
    main()