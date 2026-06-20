class_name HamsterWheelSlot
extends Control
const HAMSTER = preload("res://scenes/hamster.tscn")

# Manually placed slots in
func reparent_hamster(hamster: HamsterUI) -> void:
	print("Reparent")
	hamster.reparent(self)
	hamster.position = self.size / 2.0
	hamster.modulate.a = 0 # Hides the hamster by changing the opacity to 0
	$"Panel/Hamster Wheel".power_wheel() ##start wheel animation
	#connect and disconnect hamster from this specific wheel
	if hamster.picked_up.is_connected(self.hamster_picked_up):
		hamster.picked_up.disconnect(self.hamster_picked_up)
	hamster.picked_up.connect(self.hamster_picked_up)
	
# Stops the wheel animation
func hamster_picked_up() -> void:
	$"Panel/Hamster Wheel".power_off()
