extends Node2D


var message =[
" your reputation precedes you. We have heard tales of your valor and skill. 
  You are indeed the champion we prayed for.",
" May the gods be with you. Your bravery is the beacon of hope we 
  desperately need. 
  Go forth with our blessings and the support of the entire kingdom."
]

var typing_speed = .05
var read_time =.7


var current_message = 0
var display = ""
var current_char = 0



func _ready():
	start_dialogue()

func start_dialogue():
	current_message = 0
	display = ""
	current_char = 0
	
	$dialogue2_start.set_wait_time(typing_speed)
	$dialogue2_start.start()
	
func stop_dialogue():
	queue_free()


func _on_dialogue_2_start_timeout():
	if (current_char < len(message[current_message])) :
		var next_char = message[current_message][current_char]
		display+=next_char

		$dialogue/text.text = display
		current_char +=1 

	else :
		$dialogue2_start.stop()
		$dialogue2_end.one_shot = true
		$dialogue2_end.set_wait_time(read_time)
		$dialogue2_end.start()


func _on_dialogue_2_end_timeout():
	if (current_message == len(message) -1):
		stop_dialogue()

	else :
		current_message +=1 
		display = ""
		current_char = 0           
		$dialogue2_start.start()


