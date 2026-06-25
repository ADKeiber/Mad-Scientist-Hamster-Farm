class_name ExperimentalTankModule
extends MachineModule

#this can be triggered when a hamster is dropped into the area 2D...
# make sure to set the hamster variable first.. might need to be a
#hamster_ui instead of stats.. more testing needed
func start_module() -> void:
	GScript.hamster_watts_min = GScript.hamster_watts_min + min_power_increase

func interact_with_hamster(hamster:HamsterUI) -> void:
	hamster.stats.increase_random_stat(1)
	#interact with a timer probably or emit an event instead of doing it directly
