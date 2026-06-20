class_name HamsterCageSlot
extends Control
const HAMSTER = preload("res://scenes/hamster.tscn")

func add_hamster(stats:HamsterStats) -> void:
	var hamster: HamsterUI = HAMSTER.instantiate()
	add_child(hamster)
	hamster.position = self.size/2
