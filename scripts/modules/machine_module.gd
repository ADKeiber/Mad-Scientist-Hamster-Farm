class_name MachineModule
extends Resource

@export var module_name: String
@export var module_description: String
@export var power_cost: int
@export var texture: Texture2D
@export var min_power_increase: int
@export var project_module: bool # maybe should be an enum... BUT there are only 2 options right now... Project and Hamster Modules
@export var installed: bool
@export var interactable: bool
#@export var upgrades_other_module: bool
#@export var module_it_upgrades: MachineModule

func start_module() -> void:
	pass

#method either will or won't be implemented depending on
#interactable variable
func interact_with_hamster(hamster:HamsterUI) -> void:
	pass
