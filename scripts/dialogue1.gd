extends Node2D

var message =[
	"Ah, brave warrior, you have answered the call in our kingdom's darkest hour. 
	Your courage is a beacon of hope amidst the shadows that now encroach upon us.",
	"Brave warrior, before you embark on this perilous quest, may I have the honor
	of knowing your name and hearing of your lineage? "
]


var typing_speed = .05
var read_time =.7

var current_message = 0
var display = ""
var current_char = 0



func _ready():
	start_dialogue()
	$text_full.hide()
	$text_full2.hide()
	$">>>two".hide()
	$"next >".hide()



func start_dialogue():
	current_message = 0
	display = ""
	current_char = 0
	
	$first.set_wait_time(typing_speed)
	$first.start()


func _on_first_timeout():
	if (current_char < len(message[current_message])) :
		var next_char = message[current_message][current_char]
		display+=next_char

		$dialogue/text.text = display
		current_char +=1 

	else :
		$first.stop()
		$second.one_shot = true
		$second.set_wait_time(read_time)
		$second.start()

func stop_message():
	$dialogue.hide()
	$">>>".hide()
	$text_full.hide()
	$text_full2.hide()
	get_tree().change_scene_to_file("res://scenes/dialogue2.tscn")


func _on_second_timeout():
	if (current_message == len(message) -1):
		stop_message()

	else :
		current_message +=1 
		display = ""
		current_char = 0           
		$first.start()
		


func _on_two_pressed():
	$">>>two".hide()
	$"next >".show()
	$text_full.hide()
	$text_full2.show()


func _on_next__pressed():
	$"next >".hide()
	$text_full2.hide()
	get_tree().change_scene_to_file("res://scenes/dialogue2.tscn")


func _on__pressed():
	$text_full.show()
	$">>>".hide()
	$">>>two".show()
	$dialogue/text.hide()
	
