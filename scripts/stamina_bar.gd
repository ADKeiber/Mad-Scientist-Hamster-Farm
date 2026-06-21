extends ProgressBar


@onready var hamster : HamsterUI = $".."

func _ready() -> void:
	max_value -= hamster.stats.stamina * 100

#func running() -> void:
	
