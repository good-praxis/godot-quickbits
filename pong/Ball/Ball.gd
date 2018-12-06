extends Area2D 

var velocity
var direction = Vector2()
var is_colliding = false
var spawn_position

signal score_point(winner)

func _ready():
	spawn_position = position
	velocity = 400
	randomize()
	direction = get_rand_direction()

func reset():
	position = spawn_position
	velocity = 400
	randomize()
	direction = get_rand_direction()
	

func get_rand_direction():
	var direction = Vector2()
	if randf() > 0.5:
		direction.x = -1
	else:
		direction.x = 1
		
	return direction
	
func set_direction(direction):
	direction = direction.normalized()
	
	
func _process(delta):
	position += direction * velocity * delta

func _on_Ball_area_entered(area):
	if is_colliding:
		pass
	is_colliding = true
	$SFX.play()
	
	if area.TYPE == "PANEL":
		var collision_vector = position - area.position
		velocity += 10
		direction = collision_vector.normalized()
	elif area.TYPE == "GOAL":
		if area.position.x < position.x:
			emit_signal("score_point", "Enemy")
		else:
			emit_signal("score_point", "Player")
	else:
		direction.y = -direction.y

func _on_Ball_area_exited(area):
	is_colliding = false
