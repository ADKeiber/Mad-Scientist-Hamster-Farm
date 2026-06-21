class_name HamsterWheelSlot
extends Control
const HAMSTER = preload("res://scenes/hamster.tscn")
var _hamster : HamsterUI

# Manually placed slots in
func reparent_hamster(hamster: HamsterUI) -> void:
	print("Reparent")
	hamster.reparent(self)
	hamster.position = self.size / 2.0
	hamster.change_states(1)
	$"Panel/Hamster Wheel".power_wheel() ##start wheel animation
	_hamster = hamster
	hamster.picked_up.connect(self.hamster_picked_up)

	
	
# Stops the wheel animation
func hamster_picked_up() -> void:
	$"Panel/Hamster Wheel".power_off()
	_hamster.change_states(0)
	GScript.power_generated -= _hamster.stats.speed * 0.01
	GScript.hamster_watts_produced -= _hamster.stats.speed * 10
	# disconnect hamster from this specific wheel
	if _hamster.picked_up.is_connected(self.hamster_picked_up): 
		_hamster.picked_up.disconnect(self.hamster_picked_up)
	_hamster = null
	
