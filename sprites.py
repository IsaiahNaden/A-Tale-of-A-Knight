import pygame
from config import *
 

class Player(pygame.sprite.Sprite):    
    def __init__(self, game, x, y):

        self.game = game
        self._layer = player_layer
        self.groups = self.game.all_sprites
        pygame.sprite.Sprite.__init__(self, self.groups)

        self.x = x * tilesize
        self.y = y * tilesize
        self.width = tilesize
        self.height = tilesize

        self.x_change = 0
        self.y_change = 0
        
        self.facing = 'down'

        self.image = pygame.Surface([self.width, self.height])
        self.image.fill(RED)

        self.rect = self.image.get_rect()
        self.rect.x = self.x
        self.rect.y = self.y

    def update (self):

        self.movement()

        self.rect.x += self.x_change
        self.rect.y += self.y_change

        self.x_change = 0
        self.y_change = 0

    

    def movement(self):
        keys = pygame.key.get_pressed()
        if keys[pygame.K_LEFT]:
            self.x_change -= 4
            self.facing = 'left'
        if keys[pygame.K_RIGHT]:
            self.x_change += 4
            self.facing = 'right'
        if keys[pygame.K_UP]:
            self.y_change -= 4
            self.facing = 'up'
        if keys[pygame.K_DOWN]:
            self.y_change += 4
            self.facing = 'down'