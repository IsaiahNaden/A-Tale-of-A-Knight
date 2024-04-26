import tkinter as tk
import openpyxl

def get_user_name():
    user_name = entry_name.get()
    if len(user_name) > 10:
        print("Please enter a name with less than 10 characters.")
        return get_user_name()
    else:
        return user_name

def get_user_age():
    try:
        user_age = int(entry_age.get())
        return user_age
    except ValueError:
        print("Please enter a valid age.")
        return get_user_age()

def get_user_gender():
    try:
        user_gender = int(entry_gender.get())
        if user_gender == 1:
            user_gender = "male"
        elif user_gender == 2:
            user_gender = "female"
        else:
            print("Please enter a valid gender.")
            return get_user_gender()
        return user_gender
    except ValueError:
        print("Please enter a valid gender.")
        return get_user_gender()

def save_user_profile(user_name, user_age, user_gender):
    userprofile = openpyxl.load_workbook("userprofile.xlsx")
    profilesheet = userprofile.active

    profilesheet[f'A{profilesheet.max_row + 1}'] = user_name
    profilesheet[f'B{profilesheet.max_row}'] = user_age
    profilesheet[f'C{profilesheet.max_row}']  = user_gender
    
    userprofile.save("userprofile.xlsx")
root = tk.Tk()
root.title("User Profile")
root.geometry("{0}x{1}+0+0".format(root.winfo_screenwidth(), root.winfo_screenheight()))
root.config(bg="black")

label_name = tk.Label(root, text="What is your character's name?", fg="black")
label_name.config(font=("Times New Roman", 18, "bold"))
label_name.place(relx=0.5, rely=0.3, anchor="center")

entry_name = tk.Entry(root)
entry_name.config(font=("Times New Roman", 13, "bold"))
entry_name.place(relx=0.5, rely=0.35, anchor="center")

label_age = tk.Label(root, text="What is your age?", fg="black")
label_age.config(font=("Times New Roman", 18, "bold"))
label_age.place(relx=0.5, rely=0.45, anchor="center")

entry_age = tk.Entry(root)
entry_age.config(font=("Times New Roman", 13, "bold"))
entry_age.place(relx=0.5, rely=0.5, anchor="center")

label_gender = tk.Label(root, text="What is your gender? (1 for male, 2 for female)", fg="black")
label_gender.config(font=("Times New Roman", 18, "bold"))
label_gender.place(relx=0.5, rely=0.6, anchor="center")

entry_gender = tk.Entry(root)
entry_age.config(font=("Times New Roman", 13, "bold"))
entry_gender.place(relx=0.5, rely=0.65, anchor="center")

#root.withdraw()
button_done = tk.Button(root, text="Done", command=lambda: save_user_profile(get_user_name(), get_user_age(), get_user_gender()))
button_done.place(relx=0.5, rely=0.8, anchor="center")

root.mainloop()


    

    #print("Data saved")

