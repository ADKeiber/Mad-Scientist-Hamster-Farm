class_name IncreaseWheelCountModule
extends MachineModule

func start_module() -> void:
	GScript.num_of_wheels = GScript.num_of_wheels + 1
	GScript.hamster_watts_min = GScript.hamster_watts_min + min_power_increase
	GScript.add_wheel.emit()
