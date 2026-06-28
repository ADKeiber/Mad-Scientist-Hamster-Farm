extends Control

@export var bar : ProgressBar
@export var scroll : HScrollBar



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bar.value = scroll.value
	AudioServer.set_bus_volume_db(0, linear_to_db(scroll.value))
	
	
