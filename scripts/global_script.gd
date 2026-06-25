extends Node
#Script used to hold global signals, state or anything else where need to exist between loosely coupled nodes
signal close_popups
signal unlock_module(slot_num:int, is_project_module:bool)
signal win_game
signal add_wheel
signal add_hamster_slot
signal update_battery_capacity

var roster_limit: int = 4
var num_of_wheels: int = 2
var roster: Array[HamsterStats]

var power_stored : int
var hamster_watts_produced : int = 0
var hamster_watts_min : int = 10
var battery_capacity: int = 1000
var current_battery_value : int = 0:
	set(value): #keeps the value within range
		current_battery_value = clamp(value, 0, battery_capacity)

var all_modules: Array[MachineModule] = []
