extends Area2D


func _on_body_entered(body):
	%UI.add_score()
	queue_free()
