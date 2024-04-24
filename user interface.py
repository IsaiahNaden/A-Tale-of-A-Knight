import openpyxl

userprofile = openpyxl.load_workbook("userprofile.xlsx")
profilesheet = userprofile.active


def get_user_name():
    while True:
        user_name = input("What is your character's name? ")
        if len(user_name) < 10:
            continue
        else:
            print("Please enter a name with less than 10 characters.")
            return user_name
    
    
while True:
    try:
        user_age = int(input("What is your age? "))
        break
    except ValueError:
        print("Please enter a valid age.")

while True:
    try:
        user_gender = int(input("What is your gender? (1 for male, 2 for female) "))
        if user_gender == 1:
            user_gender = "male"
        elif user_gender == 2:
            user_gender = "female"
        else:
            print("Please enter a valid gender.")
            continue
        break
    except ValueError:
        print("Please enter a valid gender.")
    i= profilesheet
    if i.max_row > 0:
        i.insert_rows(2)

    
profilesheet.append([user_name, user_age, user_gender])
userprofile.save("userprofile.xlsx")

print("Data saved ")

