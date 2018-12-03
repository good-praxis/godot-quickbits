extends KinematicBody2D

	
func _physics_process(delta):
	var velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -350
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 350
		
	
	move_and_slide(velocity)
	