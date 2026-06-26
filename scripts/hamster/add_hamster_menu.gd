extends Control


#closes menu on clicking anywhere else
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if not get_global_rect().has_point(event.global_position):
			visible = false
