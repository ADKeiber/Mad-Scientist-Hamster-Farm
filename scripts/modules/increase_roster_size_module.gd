class_name IncreaseRosterSizeModule
extends MachineModule

func start_module() -> void:
	GScript.roster_limit = GScript.roster_limit + 1
	GScript.hamster_watts_min = GScript.hamster_watts_min + min_power_increase
	GScript.add_hamster_slot.emit()
