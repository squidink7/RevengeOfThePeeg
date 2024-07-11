extends Node

const ignored_levels = ['level_template.tscn']

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var levels = Levels.load_levels()
	
	show_levels(levels)

func show_levels(levels: Array[String]):
	for level in levels:
		var level_name = level.trim_suffix('.tscn').replace('_', ' ')

		var level_button = Button.new()

		level_button.text = level_name
		level_button.pressed.connect(func(): play_level(level))
	
		%LevelsDisplay.add_child(level_button)

func play_level(level):
	Levels.current_level = level
	get_tree().change_scene_to_file(Levels.levels_path + level)
