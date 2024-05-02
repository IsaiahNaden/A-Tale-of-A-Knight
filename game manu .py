import tkinter as tk
import subprocess
from PIL import Image, ImageTk

def start_game():
    subprocess.Popen(["python", "user interface.py"])
    root.destroy()

def exit_game():
    root.destroy()

root = tk.Tk()
root.attributes('-fullscreen', True)

image_path = "background2.jpg"
image = Image.open(image_path)

screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()

image = image.resize((screen_width, screen_height))
image_width, image_height = image.size
aspect_ratio = image_width / image_height

if screen_width / screen_height > aspect_ratio:
    new_width = int(screen_height * aspect_ratio)
    new_height = screen_height
else:
    new_width = screen_width
    new_height = int(screen_width / aspect_ratio)

image = image.resize((new_width, new_height))
photo = ImageTk.PhotoImage(image)

canvas = tk.Canvas(root, width=screen_width, height=screen_height, highlightthickness=0)
canvas.pack()

canvas.create_image(screen_width // 2, screen_height // 2, image=photo, anchor=tk.CENTER)

menu = tk.Frame(root, bg="sky blue")
menu.place(relx=0.5, rely=0.5, anchor=tk.CENTER)

start_button = tk.Button(menu, text="Start Game", command=start_game, bg="white", fg="black")
start_button.config(font=("Times New Roman", 18)) 
start_button.pack(pady=10)

exit_button = tk.Button(menu, text="Exit", command=exit_game, bg="white", fg="black")
exit_button.config(font=("Times New Roman ", 18)) 
exit_button.pack(pady=10)

root.mainloop()
