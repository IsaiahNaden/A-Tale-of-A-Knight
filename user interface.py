import tkinter as tk
import requests
import openpyxl
from tkinter import ttk
from io import BytesIO

def get_user_name():
    user_name = entry_name.get()
    if len(user_name) > 10:
        label_error_name.config(text="*Please enter a name less than 10 characters.", fg="red",font=("Times New Roman", 15))
        return get_user_name()
    elif user_name == "":
        label_error_name.config(text="*Please enter a name.", fg="red",font=("Times New Roman", 15))
        return get_user_name()

    else:
        label_error_name.config(text="")
        return user_name

def get_user_age():
    if entry_age.get().isdigit() == False:
        label_error_age.config(text="*Please enter a number.", fg="red",font=("Times New Roman", 15))
        return get_user_age()
    elif entry_age.get() == "":
        label_error_age.config(text="*Please enter your age.", fg="red",font=("Times New Roman", 15))
        return get_user_name()
    elif int(entry_age.get()) < 1:
        label_error_age.config(text="*Please enter a valid number", fg="red",font=("Times New Roman", 15))
        return get_user_age()
    elif int(entry_age.get()) > 100:
        label_error_age.config(text = "*Please enter a valid number", fg="red",font=("Times New Roman", 15))
        return get_user_age()
    else:
        label_error_age.config(text="")
        return int(entry_age.get())

def get_user_gender():
    if combo_gender.get() == "":
        label_error_gender.config(text="*Please select a gender.", fg="red",font=("Times New Roman", 15))
        return get_user_gender()
    elif combo_gender.get() == "":
        label_error_gender.config(text="*Please enter your gender.", fg="red",font=("Times New Roman", 15))
        return get_user_name()
    else:
        return combo_gender.get()

def get_image_from_url(url1):
    response = requests.get(url1)
    return tk.PhotoImage(image=BytesIO(response.content))

def save_user_profile():
    user_name = get_user_name()
    user_age = get_user_age()
    user_gender = get_user_gender()

    userprofile = openpyxl.load_workbook("userprofile.xlsx")
    profilesheet = userprofile.active

    profilesheet[f'A{profilesheet.max_row + 1}'] = user_name
    profilesheet[f'B{profilesheet.max_row}'] = user_age
    profilesheet[f'C{profilesheet.max_row}'] = user_gender

    userprofile.save("userprofile.xlsx")
    root.destroy()

root = tk.Tk()
root.geometry("500x300")
root.title("new user register")
root.configure(bg="black")

#url1 = "https://source.unsplash.com/1600x900/?nature,water"
#background_image = get_image_from_url(url1)

#root.config(bg=background_image)


canvas = tk.Canvas(root, bg="black", height=root.winfo_height(), width=root.winfo_width())
canvas.pack(side="top", fill=tk.BOTH, expand=True)

frame_canvas = tk.Frame(canvas, bg="black")
frame_canvas.place(relx=0.5, rely=0.5, anchor=tk.CENTER)

label_name = tk.Label(frame_canvas, text="What is your character's name?", fg="white", bg="black", font=("Times New Roman", 18))
label_name.grid(row=0, column=0, padx=10, pady=10)
entry_name = tk.Entry(frame_canvas)
entry_name.grid(row=0, column=1, padx=10, pady=10)

label_error_name = tk.Label(frame_canvas, text="", fg="red", bg="black")
label_error_name.grid(row=0, column=2, padx=10, pady=10)

label_age = tk.Label(frame_canvas, text="What is your age?", fg="white", bg="black", font=("Times New Roman", 18))
label_age.grid(row=1, column=0, padx=10, pady=10)
entry_age = tk.Entry(frame_canvas)
entry_age.grid(row=1, column=1, padx=10, pady=10)

label_error_age = tk.Label(frame_canvas, text="", fg="red", bg="black")
label_error_age.grid(row=1, column=2, padx=10, pady=10)

label_gender = tk.Label(frame_canvas, text="What is your gender?", fg="white", bg="black", font=("Times New Roman", 18))
label_gender.grid(row=2, column=0, padx=10, pady=10)
combo_gender = ttk.Combobox(frame_canvas, values=["Male", "Female"], state="readonly")
combo_gender.grid(row=2, column=1, padx=7, pady=10)

label_error_gender = tk.Label(frame_canvas, text="", fg="red", bg="black")
label_error_gender.grid(row=2, column=2, padx=10, pady=10)

button_submit = tk.Button(frame_canvas, text="Done", command=save_user_profile, fg="white", bg="black", font=("Times New Roman", 18))
button_submit.grid(row=3, column=0, columnspan=2, padx=10, pady=10)

root.mainloop()
