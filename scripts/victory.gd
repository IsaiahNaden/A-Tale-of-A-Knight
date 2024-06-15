extends Node2D

var background = [
	"In the end , the Crescent Kingdom was restored. The realm, once shrouded in darkness, flourished anew. Villages were rebuilt, 
fields were , and the laughter of children filled the air.
The Hero, celebrated throughout the land, and Princess Eliza, with her inspiring resilience, worked together to ensure lasting 
peace. Their story became a legend, a beacon of hope for generations to come.
As the sun rose over the kingdom, it symbolized the dawn of a new era, united in courage and hope.
"
]

var typing_background = .01
var read_background = 2


var current_background = 0
var display_background = ""
var current_background1 = 0

func _ready():
	start_dialogue()
	$Victory.hide()
	$Dialog.hide()
	$Victory.hide()
	$Princess.hide()
	$King.hide()
	$dialog_box.hide()
	$Label.hide()
	$background2.hide()
	$">>>".show()
	$"next >".hide()
	$Quit.hide()
	
	
	
	

func start_dialogue():

	current_background = 0
	display_background = ""
	current_background1 = 0
	
	$message.set_wait_time(typing_background)
	$message.start()

	
func stop_background ():
	$background.hide()
	$Dialog.show()
	$Victory.show()
	$Princess.show()
	$King.show()
	$dialog_box.show()
	$Label.show()
	$Quit.show()

func _on_message_timeout():
	if (current_background1 < len(background[current_background])) :
		var next_line = background[current_background][current_background1]
		display_background += next_line 

		$background/background.text = display_background
		current_background1 +=1 
		
	else :

		$message.stop()
		$message2.one_shot = true
		$message2.set_wait_time(read_background)
		$message2.start()


func _on_message_2_timeout():
	if(current_background== len(background)-1):
		stop_background()


	else :
		current_background += 1
		display_background = ""
		current_background1 = 0    
		$message.start()


func _on__pressed():
	$"next >".show()
	$background2.show()
	$">>>".hide()

func _on_next__pressed():
	$">>>".hide()
	$"next >".hide()
	$Dialog.show()
	$Victory.show()
	$Princess.show()
	$King.show()
	$dialog_box.show()
	$Label.show()
	$Quit.show()


func _on_quit_pressed():
	get_tree().quit()
