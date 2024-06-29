extends Node

func play():
	get_tree().change_scene_to_file('res://scenes/level_select.tscn')

func quit():
	get_tree().quit()