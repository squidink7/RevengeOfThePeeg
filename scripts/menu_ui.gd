extends CanvasLayer
var score = 0

func add_score():
	score+=1
	$Control/Label.text= "score: " + str(score)

func win_state():
	$Control/youwin.visible = true 


func next_level():
	var next_level = Levels.next_level()

	if next_level != '':
		get_tree().change_scene_to_file(Levels.levels_path + next_level)
	else:
		print('no more levels, quitting...')
		get_tree().change_scene_to_file('res://scenes/main_menu.tscn')
