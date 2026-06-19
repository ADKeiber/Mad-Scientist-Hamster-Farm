class_name HamsterUI
extends Node2D

var stats: HamsterStats
var dragging: bool
var amount: int = 0
var drag_offset := Vector2.ZERO
var slot_position := Vector2.ZERO

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				slot_position = global_position
			else:
				dragging = false
				global_position = slot_position # detect if its over a wheel/ other hamster spot/ module

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() + drag_offset
		z_index = 100
