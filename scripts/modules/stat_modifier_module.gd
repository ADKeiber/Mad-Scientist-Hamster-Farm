class_name StatModifierModule
extends MachineModule


func start_module() -> void:
	GScript.hamster_watts_min = GScript.hamster_watts_min + min_power_increase

func interact_with_hamster(hamster:HamsterUI, timer: Timer, progress_bar: ProgressBar) -> void:
	pass
