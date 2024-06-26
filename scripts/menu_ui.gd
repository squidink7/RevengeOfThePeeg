extends CanvasLayer
var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_score():
	score+=1
	$Control/Label.text= "score: " + str(score)

func win_state():
	$Control/youwin.visible = true 
