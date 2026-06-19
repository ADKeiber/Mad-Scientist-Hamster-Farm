class_name MainScene
extends Control

@export var starting_hamsters: Array[HamsterStats]
@onready var hamster_cage_scene: HamsterCageScene = %HamsterCageScene

func _ready() -> void:
	GScript.roster = starting_hamsters
	hamster_cage_scene.generate_slots_and_hamsters()
