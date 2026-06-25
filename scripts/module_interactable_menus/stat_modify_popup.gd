class_name StatModifyPopup
extends PopupPanel

signal stat_selected(stat_type:int) #update to be enum
var hamster_ui: HamsterUI

func set_hamster(hamster: HamsterUI) -> void:
	hamster_ui = hamster

func _on_speed_pressed() -> void:
	hamster_ui.increase_stat(1,1)
	self.visible = false
	stat_selected.emit(1)

func _on_stamina_pressed() -> void:
	hamster_ui.increase_stat(0,1)
	self.visible = false
	stat_selected.emit(0)

func _on_health_pressed() -> void:
	hamster_ui.increase_stat(2, 1)
	self.visible = false
	stat_selected.emit(2)
