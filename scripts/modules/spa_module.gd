class_name SpaModule
extends MachineModule

var module_timer: Timer
var bar: ProgressBar
var hamster_ui: HamsterUI

var interactable_menu: StatModifyPopup
const STAT_MODIFY_POPUP = preload("res://scenes/machine/module_interactable_menus/stat_modify_popup.tscn")

func start_module() -> void:
	GScript.hamster_watts_min = GScript.hamster_watts_min + min_power_increase
	module_to_upgrade.callables.append(interact_with_hamster)

func interact_with_hamster(hamster:HamsterUI, timer: Timer, progress_bar: ProgressBar) -> void:
	print("UPGRADED expermintal tank!")
	hamster_ui = hamster
	bar = progress_bar
	module_timer = timer
	bar.visible = true
	
	_set_progress_bar()
	module_timer.timeout.connect(_on_timeout)
	module_timer.start(GScript.global_tick_time)

func _on_timeout() -> void:
	print("Timeout!")
	#if hamster_ui.stats:
		#bar.value = remaining_ticks
		#remaining_ticks -= 1
	#else:
		#module_timer.stop()
		#bar.visible = false
		#hamster_ui.increase_random_stat(1)
		#GScript.complete_module_interaction.emit(hamster_ui)
		#hamster_ui.visible = true
		#_reset_module()

func _set_progress_bar() -> void:
	bar.min_value = 1
	bar.max_value = ticks_to_complete_interaction
	bar.step = 1
	bar.value = bar.max_value
	bar.show_percentage = false
	bar.indeterminate = false

func _reset_module() -> void:
	#remaining_ticks = self.ticks_to_complete_interaction
	module_timer = null
	bar = null
	hamster_ui = null
