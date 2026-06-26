extends Resource
class_name HamsterTraits

func random_trait(stats: HamsterStats) -> Dictionary:
	var num = randi_range(0, 2)
	var dict ={}
	match num:
		0:
			dict = {"Name": "Healthy", "Description": "+1 Health"}
			stats.max_health += 1
			stats.current_health += 1
		1:
			dict = {"Name": "Fast", "Description": "+1 Speed"}
			stats.speed += 1
		2:
			dict = {"Name": "Endurer", "Description": "+1 Stamina"}
			stats.stamina += 1
	return dict
