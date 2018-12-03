extends KinematicBody2D

func move_towards_ball(ball_y):
	var diff = abs(position.y) - abs(ball_y)
	var goal

	
	if ball_y > position.x:
		goal = diff
	else:
		goal = -diff
	print(diff, " ", goal)
	
	move_and_slide(Vector2(0, goal))