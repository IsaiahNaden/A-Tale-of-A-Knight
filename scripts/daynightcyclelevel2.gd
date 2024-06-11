extends CanvasModulate

const Night_Colour = Color('#123ebd')
const Day_Colour = Color('#ffffff')

var time = 0

func _process(delta:float) -> void:
	self.time += delta * 0.1
	self.color = Day_Colour.lerp(Night_Colour, abs(sin(time)))
