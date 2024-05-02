import pygame

pygame.init()

SCREEN_WIDTH = 1000
SCREEN_HEIGHT = 700

screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption('Spritesheets')

sprite_sheet_image = pygame.image.load(r'C:\Users\xuany\A-Tale-of-A-Knight\walking.jpg').convert_alpha()

BG = (0,0,0)
BLACK = (0, 0, 0)

def get_image(sheet, frame, width, height, scale, colour):
    image = pygame.Surface((width, height)).convert_alpha()
    image.blit(sheet, (0, 0), ((frame * width), 180, width, height))
    image = pygame.transform.scale(image, (int(width * scale), int(height * scale)))
    image.set_colorkey(colour)

    return image 

#create animation list
animation_list = [] 
animation_steps = 18
last_update = pygame.time.get_ticks()
animation_cooldown = 250
frame = 0
animate = False  # New variable to control animation

for x in range(animation_steps):
    animation_list.append(get_image(sprite_sheet_image, x, 500, 357, 0.5, BLACK))

# Static image
static_image = get_image(sprite_sheet_image, 0, 500, 357, 0.5, BLACK)

run = True
while run:

    #update background
    screen.fill(BG)

    # Check if animation should play
    if animate:
        #update animation
        current_time = pygame.time.get_ticks()
        if current_time - last_update >= animation_cooldown:
            frame += 1
            last_update = current_time
            if frame >= len(animation_list):
                frame = 0

        #show frame image
        screen.blit(animation_list[frame], (100, 200))
    else:
        # Show static image
        screen.blit(static_image, (100, 200))

    #event handler
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            run = False
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_SPACE:  # Change the key to any key you want
                animate = True
        elif event.type == pygame.KEYUP:
            if event.key == pygame.K_SPACE:
                animate = False
                frame = 0  # Reset frame to start from the beginning

    pygame.display.update()

pygame.quit()
