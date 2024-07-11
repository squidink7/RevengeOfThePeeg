extends Node

const levels_path = 'res://levels/'
const ignored_levels = ['level_template.tscn']

var current_level: String = ''

func load_levels() -> Array[String]:
	var levels: Array[String] = []
	
	var dir = DirAccess.open(levels_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir() and not file_name in ignored_levels and file_name.ends_with('.tscn'):
				# print("Found level: " + file_name)
				levels.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	
	return levels

func next_level() -> String:
	var levels = load_levels()

	var next_level = ''

	for i in range(len(levels)):
		if levels[i] == current_level:
			if len(levels) > i+1:
				next_level = levels[i+1]
	
	current_level = next_level
	
	return next_level