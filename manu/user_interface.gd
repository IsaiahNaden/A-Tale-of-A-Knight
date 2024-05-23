extends Control
# Function to save user data to JSON file
var save_path = "res://manu/userprofile.json"

func _ready():
	var login_screen = get_node("LoginScreen")
	var create_account_screen = get_node("CreateAccount")
	var mainmanu_screen = get_node("Mainmanu")
	
	var username_input = get_node("LoginScreen/username")
	var id_input = get_node("CreateAccount/id")
	var login_button = get_node("LoginScreen/login")
	var create_account_button = get_node("LoginScreen/create account")
	
	var create_username_input = get_node("CreateAccount/username")
	var craete_id_input = get_node("CreateAccount/c_id")
	
	
	var comfirm_button = get_node("CreateAccount/HBoxContainer/comfirm")
	var back_button = get_node("CreateAccount/HBoxContainer/Back")
	

	
func _on_login_pressed() :
	var username_input = get_node("LoginScreen/username")
	var id_input = get_node("LoginScreen/id")
	var login_button = get_node("LoginScreen/login")
	var create_account_button = get_node("LoginScreen/create account")
	if username_input.text == "" or id_input.text == "" :
		print("Please provide valid username and id")
	else :
		login_button.disabled = true
		create_account_button.diasbled = true
		var username = username_input.get_text()
		var id= id_input.get_text()

		

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
	var craete_id_input = get_node("CreateAccount/id")
	if create_username_input == null or create_username_input == "":
		print("Please provide a valid username")
	elif craete_id_input ==str(""):
		print("Please provide a valid number")
	elif craete_id_input.length() >=5:
		print("Password must contain at less than 5 characters")
	else :
		var comfirm_button = get_node("CreateAccount/HBoxContainer/comfirm")
		var back_button = get_node("CreateAccount/HBoxContainer/Back")
		comfirm_button.disabled = true
		back_button.disabled = true 
		var username = create_username_input.get_text()
		var id = craete_id_input.get_text()
		

