extends Node2D


var screensize
var collision_array = [] # in case we want to implement more than one ball later on

func _ready():
	screensize = get_viewport_rect().size

func _process(delta):
	var offset = 64 # offset of panel collision with walls (because of texture)
	var velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -350
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 350
		
	
	position.y += (velocity.y * delta)
	position.y = clamp(position.y, offset, screensize.y - offset)

	
	


func _on_Area2D_body_entered(body):
	print(body.position)
	if not body in collision_array:
		collision_array.append(body)
		var force
		var ball_velocity = body.get_linear_velocity()
		if abs(body.position.x - position.x) < 14:
			print("Indirect Impact")
			force = 350 if (position.x < body.position.x) else -350
			body.set_linear_velocity(Vector2(body.get_linear_velocity().x, force))
		else:
			print("Direct Impact")
			print("body velocity before impact: ", body.get_linear_velocity())
			force = body.get_linear_velocity().x * -1
			print("calculated force: ", force)
			#body.set_linear_velocity(Vector2(body.get_linear_velocity().x * -1, body.get_linear_velocity().y))
			body.apply_impulse(Vector2(-100, 0), Vector2(500, 0))
			print("body after impact: ", body.get_linear_velocity())
	

func _on_Area2D_body_exited(body):
	collision_array.erase(body)
