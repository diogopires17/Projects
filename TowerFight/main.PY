import pygame
import os
pygame.font.init()

from pygame import event
from pygame.constants import K_LCTRL

WIDTH, HEIGHT = 900, 500
WIN = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("First Game!")

BLACK = (0,0,0)
WHITE = (255, 255, 255)
RED = (255, 0, 0 )
YELLOW = (255, 255, 0 )
FPS  = 60
VEL = 5
BULLET_VEL = 8
 
MAX_BULLETS = 5

HEALTH_FONT = pygame.font.SysFont('comicsans', 40)
WINNERS_TEXT_FONT  = pygame.font.SysFont('comicsans', 100)



SPACESHIP_WIDTH , SPACESHIP_HEIGTH = 40, 40
BORDER = pygame.Rect(WIDTH/2 - 5, 0, 10, HEIGHT)

YELLOW_HIT = pygame.USEREVENT + 1
RED_HIT   = pygame.USEREVENT + 2

YELLOW_SPACESHIP_IMAGE = pygame.image.load(os.path.join('Assets', 'spaceship_yellow.png'))
YELLOW_SPACESHIP       =  pygame.transform.rotate(pygame.transform.scale(YELLOW_SPACESHIP_IMAGE, (SPACESHIP_WIDTH, SPACESHIP_HEIGTH )), 90)
RED_SPACESHIP_IMAGE    = pygame.image.load(os.path.join('Assets','spaceship_red.png' ))
RED_SPACESHIP          = pygame.transform.rotate(pygame.transform.scale(RED_SPACESHIP_IMAGE, (SPACESHIP_WIDTH, SPACESHIP_HEIGTH )), 270)
SPACE_IMAGE            = pygame.image.load(os.path.join('Assets', 'Space.png'))
SPACE                  = pygame.transform.scale(pygame.image.load(os.path.join('Assets', 'Space.png')), (WIDTH, HEIGHT))
               
def draw(red, yellow, yellow_bullets, red_bullets, YELLOW_HEALTH, RED_HEALTH):
    WIN.blit(SPACE, (0, 0)) 
    RED_HEALTH_TEXT = HEALTH_FONT.render("Health: " + str(RED_HEALTH), 1, WHITE)
    YELLOW_HEALTH_TEXT = HEALTH_FONT.render("Health: " + str(YELLOW_HEALTH), 1, WHITE) 
    
    WIN.blit(RED_HEALTH_TEXT,  (WIDTH - RED_HEALTH_TEXT.get_width()-10, 10 ))   
    WIN.blit(YELLOW_HEALTH_TEXT, (10, 10 ))
    pygame.draw.rect(WIN, WHITE, BORDER)
    WIN.blit(YELLOW_SPACESHIP, (yellow.x, yellow.y))
    WIN.blit(RED_SPACESHIP, (red.x, red.y))
    
    for bullet in yellow_bullets:
        pygame.draw.rect(WIN, YELLOW, bullet )
    for bullet in red_bullets:
        pygame.draw.rect(WIN, RED, bullet ) 



    pygame.display.update()


def yellow_movement(keys_pressed, yellow):
# YELLOW
        if keys_pressed[pygame.K_a] and yellow.x - VEL > 0 :    #left
            yellow.x-=VEL
        if keys_pressed[pygame.K_d]  and yellow.x + VEL +  yellow.width < BORDER.x:    #right
            yellow.x +=VEL
        if keys_pressed[pygame.K_w] and yellow.y + VEL - yellow.height  > 0 :    #up
            yellow.y -=VEL
        if keys_pressed[pygame.K_s]  and yellow.y + VEL + yellow.height < HEIGHT - 15:    #down
            yellow.y +=VEL

# RED
def red_movement(keys_pressed, red):
# YELLOW
        if keys_pressed[pygame.K_LEFT] and red.x - VEL > BORDER.x + 20 :    #left
            red.x-=VEL
        if keys_pressed[pygame.K_RIGHT]  and red.x + VEL +  red.width < WIDTH:    #right
            red.x +=VEL
        if keys_pressed[pygame.K_UP] and red.y + VEL - red.height  > 0 :    #up
            red.y -=VEL
        if keys_pressed[pygame.K_DOWN]  and red.y + VEL + red.height < HEIGHT - 15:    #down
            red.y +=VEL

def handle_bullets(yellow_bullets, red_bullets, yellow, red):
    for bullet in yellow_bullets:
        bullet.x += BULLET_VEL
        if red.colliderect(bullet):
            pygame.event.post(pygame.event.Event(RED_HIT))
            yellow_bullets.remove(bullet)
        elif bullet.x > WIDTH:
            yellow_bullets.remove(bullet)
    for bullet in red_bullets:
        bullet.x -= BULLET_VEL
        if yellow.colliderect(bullet):
            pygame.event.post(pygame.event.Event(YELLOW_HIT))
            red_bullets.remove(bullet)   
        elif bullet.x < 0 :
           red_bullets.remove(bullet)
def draw_winner(text):
    draw_text=  WINNERS_TEXT_FONT.render(text, 1, WHITE)
    WIN.blit(draw_text, (WIDTH/2 - draw_text.get_width() /
                         2, HEIGHT/2 - draw_text.get_height()/2))
    pygame.display.update()
    pygame.time.delay(2000)

def main():
    
    red = pygame.Rect(700, 300, SPACESHIP_WIDTH, SPACESHIP_HEIGTH)
    yellow = pygame.Rect(100, 300, SPACESHIP_WIDTH, SPACESHIP_HEIGTH)
   
    red_Bullets = []
    yellow_Bullets = []
    RED_HEALTH = 10
    YELLOW_HEALTH = 10
    clock = pygame.time.Clock()
    run = True
    while run:
        clock.tick(FPS)
        for event in pygame.event.get():
            
            if event.type == pygame.QUIT:
                run = False
                pygame.quit()

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LCTRL and len(yellow_Bullets) < MAX_BULLETS:
                    bullet = pygame.Rect(yellow.x + yellow.width, yellow.y + yellow.height//2 -2,10,5)  
                    yellow_Bullets.append(bullet)

                if event.key == pygame.K_RCTRL and len(red_Bullets) < MAX_BULLETS:
                    bullet = pygame.Rect(red.x, red.y + red.height//2 -2,10,5 )
                    red_Bullets.append(bullet)
            if event.type == RED_HIT:
                RED_HEALTH -= 1 
            if event.type == YELLOW_HIT:
                YELLOW_HEALTH -=1
        winner_text = ""
        if RED_HEALTH  <=0:
            winner_text = "Yellow Wins"
          
        if  YELLOW_HEALTH <=0:
            winner_text = "Red Wins"

        if  winner_text != "":
            draw_winner(winner_text)
            break;

        keys_pressed = pygame.key.get_pressed()
        yellow_movement(keys_pressed, yellow)
        red_movement(keys_pressed, red)
        
    
        handle_bullets(yellow_Bullets, red_Bullets, yellow, red)

        draw(red, yellow, yellow_Bullets, red_Bullets, YELLOW_HEALTH, RED_HEALTH)
    main()


if __name__ == '__main__':
    main()
    pygame.quit()

