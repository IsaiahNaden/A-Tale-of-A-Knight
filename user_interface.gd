extends Control
# Function to save user data to JSON file

	
func _ready():
	var login_screen = get_node("LoginScreen")
	var create_account_screen = get_node("CreateAccount")
	var mainmanu_screen = get_node("Mainmanu")
	
	var username_input = get_node("LoginScreen/username")
	var userpassword_input = get_node("LoginScreen/password")
	var login_button = get_node("LoginScreen/login")
	var create_account_button = get_node("LoginScreen/create account")
	
	var create_username_input = get_node("CreateAccount/username")
	var craete_userpass_input = get_node("CreateAccount/userpassowrd")
	var create_userpassword_repeat_input = get_node("CreateAccount/c_userpassword")
	
	var comfirm_button = get_node("CreateAccount/HBoxContainer/comfirm")
	var back_button = get_node("CreateAccount/HBoxContainer/Back")
	

	
func _on_login_pressed() :
	var username_input = get_node("LoginScreen/username")
	var userpassword_input = get_node("LoginScreen/password")
	var login_button = get_node("LoginScreen/login")
	var create_account_button = get_node("LoginScreen/create account")
	if username_input.text == "" or userpassword_input.text == "" :
		print("Please provide valid username and password")
	else :
		login_button.disabled = true
		create_account_button.diasbled = true
		var username = username_input.get_text()
		var password = userpassword_input.get_text()

		

func _on_create_account_pressed():
	var login_screen = get_node("LoginScreen")
	var create_account_screen = get_node("CreateAccount")
	var mainmanu_screen = get_node("Mainmanu")
	login_screen.hide()
	mainmanu_screen.hide()
	create_account_screen.show()
	
	
func _on_back_pressed():
	var login_screen = get_node("LoginScreen")
	var create_account_screen = get_node("CreateAccount")
	var mainmanu_screen = get_node("Mainmanu")
	create_account_screen.hide()
	mainmanu_screen.hide()
	login_screen.show() 
	
func _on_play_button_pressed():
	var login_screen = get_node("LoginScreen")
	var create_account_screen = get_node("CreateAccount")
	var mainmanu_screen = get_node("Mainmanu")
	create_account_screen.hide()
	mainmanu_screen.hide()
	login_screen.show()
	
func _on_exit_pressed():
	get_tree().quit() # Replace with function body.
	
	
func _on_comfirm_pressed():
	var create_username_input = get_node("CreateAccount/username")
	var craete_userpass_input = get_node("CreateAccount/userpassowrd")
	var create_userpassword_repeat_input = get_node("CreateAccount/c_userpassword")
	if create_username_input.get_text()=="":
		print("Please provide a valid username")# 
	elif craete_userpass_input.get_text()=="":
		print("Please provide a valid password")
	elif create_userpassword_repeat_input.get_text()=="":
		print("Please repeat your password ")
	elif create_userpassword_repeat_input.get_text() != craete_userpass_input.get_text():
		print("Password don't match")
	elif craete_userpass_input.get_text().length() <=5:
		print("Password must contain at lease 5 characters")
	else :
		var comfirm_button = get_node("CreateAccount/HBoxContainer/comfirm")
		var back_button = get_node("CreateAccount/HBoxContainer/Back")
		comfirm_button.disabled = true
		back_button.disabled = true 
		var username = create_username_input.get_text()
		var  password = create_username_input.get_text()
		_save_user_data(username,password)
		


func _save_user_data(username, password):
	var File = preload("res://manu/user_interface.gd")
	var path = "userprofile.json"  # Path to your JSON file
	var userdata = {
		"username": username,
		"password": password
	}
	var json_text = "{}"
	if userdata.size() > 0:
		json_text = "{"
		for key in userdata.keys():
			json_text += "\"" + key + "\": \"" + str(userdata[key]) + "\","
		json_text = json_text.left(json_text.length() - 1)  # Remove the trailing comma
		json_text += "}"

	var file = File.new()
	var error = file.open(path, File.WRITE_READ)
	if error != OK:
		print("Failed to open file for writing:", path)
		return

	file.store_line(json_text)
	file.close()
