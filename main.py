import pygame 
from sprites import *
from config import *
import sys


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


    def NewGame(self):
        self.playing = True

Game()

        
