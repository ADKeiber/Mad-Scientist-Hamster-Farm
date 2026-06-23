class_name MainScene
extends Control

@export var starting_hamsters: Array[HamsterStats]
@export var all_modules: Array[MachineModule]
@onready var hamster_cage_scene: HamsterCageScene = %HamsterCageScene
@onready var hamster_wheels_scene: HamsterWheelsScene = %HamsterWheelsScene

func _ready() -> void:
	GScript.roster = starting_hamsters
	hamster_cage_scene.generate_slots_and_hamsters()
	#hamster_wheels_scene.generate_wheels()
	GScript.all_modules = all_modules
	GScript.win_game.connect(win_game)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			return
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			return
		print("Closing popups")
		GScript.close_popups.emit()

func win_game() -> void:
	print("YOU WON!!")
