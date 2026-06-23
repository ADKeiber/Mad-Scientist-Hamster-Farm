class_name HamsterWheelsScene
extends Control
#@onready var hamster_wheel_slot: HamsterWheelSlot = $Panel/VBoxContainer/HamsterWheelSlots/MarginContainer6/HamsterWheelSlot
@onready var wheel_slot_upgrade: MarginContainer = %WheelSlotUpgrade
const HAMSTER_WHEEL_SLOT = preload("res://scenes/wheel/hamster_wheel_slot.tscn")
@onready var hamster_wheel_slots: HBoxContainer = %HamsterWheelSlots

func _ready() -> void:
	GScript.add_wheel.connect(reveal_wheel)

func reveal_wheel() -> void:
	var margin_container := MarginContainer.new()

	var slot = HAMSTER_WHEEL_SLOT.instantiate()
	margin_container.add_theme_constant_override("margin_right", 10)
	margin_container.add_child(slot)
	hamster_wheel_slots.add_child(margin_container)
