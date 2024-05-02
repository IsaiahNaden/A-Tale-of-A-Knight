
from tkinter import messagebox

def prompt_user_to_continue():
    response = messagebox.askyesno("Do you want to continue the game?")
    if response:
        print("The user wants to continue playing the game.")
    else:
        exit()

prompt_user_to_continue ()



