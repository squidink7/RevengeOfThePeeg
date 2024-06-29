extends Node

const levels_path = 'res://levels/'
const ignored_levels = ['level_template.tscn']

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var levels = load_levels()
	
	show_levels(levels)

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

func show_levels(levels: Array[String]):
	for level in levels:
		var level_name = level.trim_suffix('.tscn').replace('_', ' ')

		var level_button = Button.new()

		level_button.text = level_name
		level_button.pressed.connect(func(): play_level(level))
	
		%LevelsDisplay.add_child(level_button)

func play_level(level):
	get_tree().change_scene_to_file(levels_path + level)
