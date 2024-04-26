import pygame 
from sprites import *
from config import *
import sys

pygame.init()

screen = pygame.display.set_mode((screen_width, screen_height))


run = True 
while run:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            run = False

pygame.quit()