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

	

func _physics_process(delta):
	set_linear_velocity(velocity)
	
	
	
	

