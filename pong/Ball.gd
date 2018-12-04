extends RigidBody2D 

var velocity = Vector2()


func get_rand_velocity():
	var velocity = Vector2()
	if randf() > 0.5:
		velocity.x = -400
	else:
		velocity.x = 400
		
	velocity.y = rand_range(-150, 150)
	
	return velocity
	
func _ready():
	randomize()
	velocity = get_rand_velocity()
	apply_impulse(Vector2(), velocity)	


func _on_Ball_body_entered(body):
	print("EYOOO")
