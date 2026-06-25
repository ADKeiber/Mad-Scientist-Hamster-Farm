class_name SpaModule
extends MachineModule


func start_module() -> void:
	GScript.hamster_watts_min = GScript.hamster_watts_min + min_power_increase

func interact_with_hamster(hamster:HamsterUI) -> void:
	pass
