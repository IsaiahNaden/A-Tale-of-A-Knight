import tkinter as tk
from tkinter import ttk
from PIL import Image, ImageTk
import requests
from io import BytesIO
import openpyxl

def get_user_name():
    user_name = entry_name.get()
    if len(user_name) > 10:
        label_error_name.config(text="*Please enter a name less than 10 characters.", fg="red", font=("Times New Roman", 15))
        return get_user_name()
    elif user_name == "":
        label_error_name.config(text="*Please enter a name.", fg="red", font=("Times New Roman", 15))
        return get_user_name()
    else:
        label_error_name.config(text="")
        return user_name

def get_user_age():
    if entry_age.get().isdigit() == False:
        label_error_age.config(text="*Please enter a number.", fg="red", font=("Times New Roman", 15))
        return get_user_age()
    elif entry_age.get() == "":
        label_error_age.config(text="*Please enter your age.", fg="red", font=("Times New Roman", 15))
        return get_user_name()
    elif int(entry_age.get()) < 1 or int(entry_age.get()) > 100:
        label_error_age.config(text="*Please enter a valid number between 1 and 100.", fg="red", font=("Times New Roman", 15))
        return get_user_age()
    else:
        label_error_age.config(text="")
        return int(entry_age.get())

def get_user_gender():
    if combo_gender.get() == "":
        label_error_gender.config(text="*Please select a gender.", fg="red", font=("Times New Roman", 15))
        return get_user_gender()
    else:
        return combo_gender.get()

def get_image_from_url(url):
    response = requests.get(url)
    return ImageTk.PhotoImage(Image.open(BytesIO(response.content)))

def save_user_profile():
    user_name = get_user_name()
    user_age = get_user_age()
    user_gender = get_user_gender()

    user_profile = openpyxl.load_workbook("userprofile.xlsx")
    profile_sheet = user_profile.active

    profile_sheet[f'A{profile_sheet.max_row + 1}'] = user_name
    profile_sheet[f'B{profile_sheet.max_row}'] = user_age
    profile_sheet[f'C{profile_sheet.max_row}'] = user_gender

    user_profile.save("userprofile.xlsx")
    root.destroy()

root = tk.Tk()
root.attributes('-fullscreen', True)

# Background Image
image_path = "background2.jpg"
image = Image.open(image_path)
# Get the screen dimensions
screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()

# Resize the image to fit the screen without preserving the aspect ratio
image = image.resize((screen_width, screen_height))

# Alternatively, if you want to resize while preserving the aspect ratio:
# Calculate the aspect ratio of the image
image_width, image_height = image.size
aspect_ratio = image_width / image_height

# Calculate new dimensions to fit the screen while maintaining the aspect ratio
if screen_width / screen_height > aspect_ratio:
    new_width = int(screen_height * aspect_ratio)
    new_height = screen_height
else:
    new_width = screen_width
    new_height = int(screen_width / aspect_ratio)

# Resize the image
image = image.resize((new_width, new_height))

photo = ImageTk.PhotoImage(image)

label = tk.Label(root, image=photo)
label.image = photo  # keep a reference to prevent garbage collection
label.place(x=0, y=0)

# Input Frame
frame_canvas = tk.Frame(root, bg="sky blue")
frame_canvas.place(relx=0.5, rely=0.5, anchor=tk.CENTER)

label_name = tk.Label(frame_canvas, text="What is your character's name?", fg="black", bg="sky blue", font=("Times New Roman", 18))
label_name.grid(row=0, column=0, padx=10, pady=10)
entry_name = tk.Entry(frame_canvas)
entry_name.grid(row=0, column=1, padx=10, pady=10)

label_error_name = tk.Label(frame_canvas, text="", fg="red", bg="sky blue")
label_error_name.grid(row=0, column=2, padx=10, pady=10)

label_age = tk.Label(frame_canvas, text="What is your age?", fg="black", bg="sky blue", font=("Times New Roman", 18))
label_age.grid(row=1, column=0, padx=10, pady=10)
entry_age = tk.Entry(frame_canvas)
entry_age.grid(row=1, column=1, padx=10, pady=10)

label_error_age = tk.Label(frame_canvas, text="", fg="red", bg="sky blue")
label_error_age.grid(row=1, column=2, padx=10, pady=10)

label_gender = tk.Label(frame_canvas, text="What is your gender?", fg="black", bg="sky blue", font=("Times New Roman", 18))
label_gender.grid(row=2, column=0, padx=10, pady=10)
combo_gender = ttk.Combobox(frame_canvas, values=["Male", "Female"], state="readonly")
combo_gender.grid(row=2, column=1, padx=7, pady=10)

label_error_gender = tk.Label(frame_canvas, text="", fg="red", bg="sky blue")
label_error_gender.grid(row=2, column=2, padx=10, pady=10)

button_submit = tk.Button(frame_canvas, text="Done", command=save_user_profile, fg="black", bg="white", font=("Times New Roman", 18))
button_submit.grid(row=3, column=0, columnspan=2, padx=10, pady=10)

root.mainloop()
