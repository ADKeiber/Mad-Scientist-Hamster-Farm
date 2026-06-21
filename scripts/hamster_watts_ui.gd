extends Control

@onready var current : Label = $VBoxContainer/Current
@onready var minimum : Label = $VBoxContainer/Minimum
# Gets current Hamster Watts and updates ui
func _process(delta: float) -> void:
	current.text = "Current: " + str(GScript.hamster_watts_produced) + " HWh"
	minimum.text = "Minimum: " + str(GScript.hamster_watts_min) + " HWh"
