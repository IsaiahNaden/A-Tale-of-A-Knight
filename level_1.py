import pygame
from sprites import *
from config import *
import sys

class Level_1():

    def __init__(self):
        pygame.init()
        self.screen = pygame.display.set_mode((screen_width, screen_height))
        self.clock =pygame.time.Clock()
        self.width = tilesize
        self.height = tilesize
        self.running = True
        pygame.display.set_caption('Level 1')


    def newGame(self):

        self.playing = True


    def world_environment(self):
        image = pygame.image.load('level1map.jpg')
        size = pygame.transform.scale(image, (800, 600))
        self.screen.blit(size, (0, 0))

    def eventsLevel(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                self.running = False
                self.playing = False


    def drawLevel(self):
        image = pygame.image.load('level1map.jpg')
        size = pygame.transform.scale(image, (800,600))
        self.screen.blit(size, (0, 0))
        self.clock.tick(FPS)
        pygame.display.update()


    def mainLevel1(self):
        while self.playing:
            self.eventsLevel()
            self.drawLevel()
        self.running = False


    def mainlevel(self):
        while self.playing:
            self.eventsLevel()
            self.drawLevel()
        self.running = False

        

    def update(self):
        pass



class InteractButton():

    def __init__(self, x, y, image, scale):
        width = image.get_width()
        height = image.get_height()
        self.image = pygame.transform.scale(image, (int(width * scale), int(height * scale)))
        self.rect =  self.image.get_rect()
        self.rect.topleft = (x, y)
        self.clicked = False
        pygame.display.update()


    def draw (self):
        action = False
        pos = pygame.mouse.get_pos()
        if self.rect.collidepoint(pos):
            if pygame.mouse.get_pressed()[0] == 1 and self.clicked == False:
                self.clicked = True


        if pygame.mouse.get_pressed()[0] == 0 :
            self.clicked = False

    


level = Level_1()
level.world_environment()
level.newGame()
while level.running:
    level.mainlevel()
pygame.quit()
sys.exit()




