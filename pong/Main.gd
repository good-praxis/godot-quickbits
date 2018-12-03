extends Node

func _physics_process(delta):
	$Enemy.move_towards_ball($Ball.position.y)