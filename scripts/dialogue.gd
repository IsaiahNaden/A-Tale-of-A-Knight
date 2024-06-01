extends Node2D


var message =[
	"                                                                                                                                                                                                                                                                                                                                                                                                                     	 
	", 
	"                                                                                                                                              
	",
	"Ah, brave warrior, you have answered the call in our kingdom's darkest hour. 
	Your courage is a beacon of hope amidst the shadows that now encroach upon us.",
	"Brave warrior, before you embark on this perilous quest, may I have the honor
	of knowing your name and hearing of your lineage? "
]


var background = [
"In a medieval realm, nestled amidst towering forests and rugged mountains, stood an ancient castle, the bastion of the Crescent 
Kingdom.Princess Eliza, cherished daughter of the monarchs, was renowned for her grace and kindness.
Yet, the tranquility of the kingdom was shattered when the malevolent sorcerer Malock unleashed his dark forces. Under the cover 
of night, Malock's minions stormed the castle, seizing Princess Eliza and plunging the realm into chaos.
Desperate to rescue their beloved daughter, the king and queen issued a heartfelt plea throughout the land, seeking a valiant 
champion to undertake the perilous quest.
You, a noble warrior, answered the call, venturing forth into the untamed wilderness. Through dense forests and treacherous 
mountains,you journeyed to the heart of darkness where Malock's stronghold, the Shadow Citadel,loomed.
Within the shadowy depths of the fortress, you faced fierce adversaries, navigated cunning traps, and braved arcane sorcery. 
Yet, your resolve remained unshaken as you pressed onward, driven by the hope of freeing Princess Eliza from Malock's clutches.
But beware, for Malock's malevolence knows no bounds, and his sinister schemes lurk at every turn. Only through courage, 
cunning, and unwavering determination can you hope to overcome the darkness and rescue the princess from her dire fate.
In this age of knights and sorcery, you are the kingdom's last hope. Will you rise to the challenge and become the hero the
realm so desperately needs? The fate of Princess Eliza and the Crescent Kingdom rests in your hands."]

var typing_speed = .05
var read_time =.7

var typing_name = .05
var read_name = .7

var typing_background = .01
var read_background = 2


var current_message = 0
var display = ""
var current_char = 0

var current_npcname =0
var display1 = ""
var current_npcname1= 0

var current_background = 0
var display_background = ""
var current_background1 = 0

func _ready():
	$background.show()
	$dialogue.hide()
	$profile.hide()
	$next.hide()
	$">>>".show()
	$background2.hide()

	start_dialogue()

func start_dialogue():
	current_message = 0
	display = ""
	current_char = 0
	
	current_npcname = 0
	display1 = ""
	current_npcname1= 0
	
	current_background = 0
	display_background = ""
	current_background1 = 0
	
	$start_background.set_wait_time(typing_background)
	$start_background.start()
	
	$first.set_wait_time(typing_speed)
	$first.start()
	
func stop_background ():

	$background.hide()
	$dialogue.show()
	$first.start()
	$second.start()
	$profile.hide()
	$next.hide()
	$">>>".hide()
	
func stop_message():
	$background.hide()
	$dialogue.hide()
	$profile.show()
	$next.hide()
	$">>>".hide()
	
	
	
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
		

func _on_second_timeout():
	if (current_message == len(message) -1):
		stop_message()

	else :
		current_message +=1 
		display = ""
		current_char = 0           
		$first.start()



func _on_start_background_timeout():
	if (current_background1 < len(background[current_background])) :
		var next_line = background[current_background][current_background1]
		display_background += next_line 

		$background/background.text = display_background
		current_background1 +=1 

	else :
		$start_background.stop()
		$end_background.one_shot = true
		$end_background.set_wait_time(read_background)
		$end_background.start()


func _on_end_background_timeout():
	if(current_background== len(background)-1):
		stop_background()

		
	else :
		current_background += 1
		display_background = ""
		current_background1 = 0    
		$start_background.start()

func _on_next_pressed():
	get_tree().change_scene_to_file("res://scenes/dialogue1.tscn")


func _on__pressed():
	$">>>".hide()
	$next.show()
	$background.hide()
	$background2.show()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/dialogue1.tscn")


	
	
