extends HBoxContainer
signal death
signal damage

@onready var health_pip_scene = preload("res://scenes/hamster/health_pip.tscn")
@onready var hamster : HamsterUI = $".."

# Creates health pips as children
func  setup_health() -> void:
	for i in hamster.stats.max_health:
		var heath_pip = health_pip_scene.instantiate()
		add_child(heath_pip)

# Clears a health pip when damaged
func take_damage() -> void:
	hamster.stats.current_health -= 1
	get_child(0).queue_free()
	damage.emit()
	if hamster.stats.current_health == 0:
		death.emit()

func add_one_health() -> void:
	hamster.stats.max_health += 1
	hamster.stats.current_health += 1
	var heath_pip = health_pip_scene.instantiate()
	add_child(heath_pip)

func heal() -> void:
	hamster.stats.current_health += 1
	var heath_pip = health_pip_scene.instantiate()
	add_child(heath_pip)
