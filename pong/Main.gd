extends Node

func _process(delta):
	$Enemy.set_ball_position($Ball.position)
