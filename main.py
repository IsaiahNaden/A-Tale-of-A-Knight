import pygame 
from sprites import *
from config import *
import sys


<<<<<<< HEAD
screen_width = 800
screen_height = 600
tilesize = 32
RED = (255, 0, 0)

class Game():
    def __init__(self):
        pygame.init()
        self.screen = pygame.display.set_mode((screen_width, screen_height))
        self.clock = pygame.time.Clock()
        self.running = True
        self.width = tilesize
        self.height = tilesize
        self.image = pygame.Surface([self.width, self.height])
        self.image.fill(RED)
        self.rect = self.image.get_rect()
        while self.running :
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.running = False
=======
screen = pygame.display.set_mode((screen_width, screen_height))


run = True 
while run:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            run = False
>>>>>>> 4817b71d576bf6a2883a06882297e551e349e07b

    def NewGame(self):
        self.playing = True

Game()

        
