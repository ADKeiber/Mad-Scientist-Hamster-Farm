class_name SpaModule
extends MachineModule

@export var ticks_to_heal: int 
var remaining_ticks_before_heal: int
var module_timer: Timer
var bar: ProgressBar
var hamster_ui: HamsterUI
var interactable_menu: StatModifyPopup
const STAT_MODIFY_POPUP = preload("res://scenes/machine/module_interactable_menus/stat_modify_popup.tscn")

func start_module() -> void:
	GScript.hamster_watts_min = GScript.hamster_watts_min + min_power_increase

func interact_with_hamster(hamster:HamsterUI, timer: Timer, progress_bar: ProgressBar) -> void:
	if hamster.stats.max_health == hamster.stats.current_health:
		GScript.complete_module_interaction.emit(hamster)
		return
	hamster.visible = false
	remaining_ticks_before_heal = ticks_to_heal
	hamster_ui = hamster
	bar = progress_bar
	module_timer = timer
	bar.visible = true
	hamster_ui.hamster_state = HamsterUI.State.RESTING
	hamster_ui.change_states()
	_set_progress_bar(hamster_ui.stats)
	module_timer.timeout.connect(_on_timeout)
	module_timer.start(GScript.global_tick_time)

func _on_timeout() -> void:
	print("Timeout!")
	if hamster_ui.stats.current_health == hamster_ui.stats.max_health:
		module_timer.stop()
		GScript.complete_module_interaction.emit(hamster_ui)
		hamster_ui.visible = true
		bar.visible = false
		_reset_module()
	if remaining_ticks_before_heal > 0:
		remaining_ticks_before_heal -= 1
		return
	else:
		remaining_ticks_before_heal = ticks_to_heal
	if hamster_ui.stats.current_health < hamster_ui.stats.max_health:
		hamster_ui.heal()
		bar.value += 1
	else:
		module_timer.stop()
		GScript.complete_module_interaction.emit(hamster_ui)
		hamster_ui.visible = true
		bar.visible = false
		_reset_module()

func _set_progress_bar(stats: HamsterStats) -> void:
	ticks_to_complete_interaction = stats.max_health
	bar.fill_mode = ProgressBar.FILL_BEGIN_TO_END
	bar.min_value = 1
	bar.max_value = ticks_to_complete_interaction
	bar.step = 1
	bar.value = stats.current_health
	bar.show_percentage = false
	bar.indeterminate = false

func _reset_module() -> void:
	#remaining_ticks = self.ticks_to_complete_interaction
	module_timer = null
	bar = null
	hamster_ui = null
