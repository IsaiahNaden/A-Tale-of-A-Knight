import pygame 
import tkinter
from sprites import *  
from config import *
import sys





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



    def Background_sky(self):
        image = pygame.image.load('background2.jpg')
        size = pygame.transform.scale(image, (800,600))
        self.screen.blit(size, (0, 0))


       


    def new(self):

        self.playing = True

        self.all_sprites = pygame.sprite.LayeredUpdates()
        self.blocks = pygame.sprite.LayeredUpdates()
        self.enemies = pygame.sprite.LayeredUpdates()
        self.attacks = pygame.sprite.LayeredUpdates()


        self.player = Player(self, 1, 2)

    def events(self):
        
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                self.playing = False
                self.running = False



    def update(self):
        
        self.all_sprites.update()

    def draw(self):
        
        image = pygame.image.load('background2.jpg')
        size = pygame.transform.scale(image, (800,600))
        self.screen.blit(size, (0, 0))
        self.screen.blit(size, (0, 0))
        self.all_sprites.draw(self.screen)
        self.clock.tick(FPS)
        pygame.display.update()

    def main(self):
        
        while self.playing :
            self.events()
            self.update()
            self.draw()
        self.running = False

    def game_over(self):
        pass

    
    def intro_screen(self):
        pass








g = Game()
g.intro_screen()
g.Background_sky()
g.new()
while g.running :
    g.main()
    g.game_over()

pygame.quit()
sys.exit()

