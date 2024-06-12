extends Control

func _ready():
	$stop.hide()
	$stop_button.show()
	$setting.hide()
	$Button.hide()
	$setting/HSlider.value = db_to_linear(music)
	add_window_mode_item()
	add_resolution_item()
	screen_mode.item_selected.connect(on_window_mode_seleced)
	resolutionmode.item_selected.connect(on_resolution_selected)

	


func _on_resume_pressed():
	$stop.hide()
	$stop_button.show()
	$setting.hide()
	$Button.hide()
	get_tree().paused = false



func _on_setting_pressed():
	$stop.hide()
	$stop_button.hide()
	$setting.show()
	$Button.show()

func _on_quit_pressed():
	get_tree().quit()
	
func _process(delta):
	if Input.is_action_just_pressed("esc") :
		get_tree().paused = !get_tree().paused
		$stop.visible = !$stop.visible

	
func _on_stop_pressed():
	get_tree().paused = !get_tree().paused
	$stop.visible = !$stop.visible
	$stop.show()
	$stop_button.hide()
	$setting.hide()
	$Button.hide()

	
	
@onready var screen_mode = $setting/Fullscreen/screenmode as OptionButton
@onready var resolutionmode = $setting/resolution/resolutionmode as OptionButton
var music = AudioServer.get_bus_index("music")

const WiNDOW_MODE_ARRAY : Array[String]= [
	"Full-screen",
	"Window Mode",
	"Borderless Window",
	"Borderless Full-Screen"
]
const RESOLUTION_DICTIONARY :Dictionary = {
	"1152 × 648" : Vector2i(1152,648),
	"1280 × 720" : Vector2i(1280,720),
	"1920 × 1080" : Vector2i(1920 ,1080)
}

func add_window_mode_item() -> void :
	for window_mode in WiNDOW_MODE_ARRAY:
		screen_mode.add_item(window_mode)
		
func  on_window_mode_seleced(index: int) -> void :
	match index :
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
		3:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
func add_resolution_item() -> void :
	for resolution_size_text in RESOLUTION_DICTIONARY :
		resolutionmode.add_item(resolution_size_text)
func on_resolution_selected(index : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(music , linear_to_db(value))


func _on_button_pressed():
	$setting.hide()
	$stop.show()
	$Button.hide()
	$stop_button.hide()
	
	
