extends Area2D

func _ready():
	$Sprite.play("default")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$Sprite.play("open")
		%UI.win_state()
		await get_tree().create_timer(0.5).timeout
		$Particles.emitting = true