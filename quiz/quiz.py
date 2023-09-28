import random
answer = None
valid_answer = None
questions = [ "Qual destes países não faz fronteira com o Brasil?\n(A) França\n(B) Bolívia\n(C) Peru\n(D) Chile",
             "Em que ano começou a segunda grande guerra mundial\n(A) 1914\n(B) 1939\n(C) 1922\n(D) 1936",
             "Quem foi o último rei de Portugal?\n(A) D.João I\n(B) D.Carlos I\n(C) D.Manuel II\n(D) D.João V",
             
]
answers = ["D","B","C"]
points = 0
highscore = 0
lowscore = 0
def main():
    global points
    global highscore
    global lowscore
    run_quiz() 


    points = str(points)



    print("You have scored" + " " + points + " " + "points" + "!")

def run_quiz():
    num = 0
    while num !=3:
        global answer 
        print(questions[num])
        while answer not in ["A", "B", "C", "D"]:
                answer = input("Resposta\n")
        check_answer(num)
        answer = None
        num += 1


def check_answer(num):
    global points 
    if num  == 0:
        valid_answer = "D"
        if answer == "D":
            correct = True
            points += 1
        else:
            correct = False
            points -= 1
    elif num == 1:
        valid_answer = "B"
        if answer == "B":
            correct = True
            points += 1
        else: 
            correct = False
            points -= 1
    else:
        valid_answer = "C"
        if answer == "C":
            correct = True
            points += 1
        else:
            correct = False
            points -= 1
    if correct:
        print("Correct!")
    else:
        print("Incorrect!")
if __name__ == "__main__":
    main()