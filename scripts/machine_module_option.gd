class_name MachineModuleOption
extends Control

@onready var option_texture_rect: TextureRect = $HBoxContainer/Texture
@onready var option_name: Label = $HBoxContainer/VBoxContainer/Name
@onready var option_description: RichTextLabel = $HBoxContainer/VBoxContainer/Description
var module: MachineModule
func set_option(module: MachineModule) -> void:
	self.module = module
	option_texture_rect.texture = module.texture
	option_name.text = module.module_name
	option_description.text = module.module_description

func get_machine_module_slot() -> MachineModuleSlot:
	var current = self
	while current:
		if current is MachineModuleSlot:
			return current
		current = current.get_parent()
	return null


func _on_button_pressed() -> void:
	print("Selected: ", option_name.text)
	var machine_slot_ancestor: MachineModuleSlot = get_machine_module_slot()
	machine_slot_ancestor.set_module(self.module)
	GScript.close_popups.emit()
