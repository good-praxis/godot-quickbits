extends Area2D 

var velocity = 400
var direction = Vector2()
var is_colliding = false


func get_rand_direction():
	var direction = Vector2()
	if randf() > 0.5:
		direction.x = -1
	else:
		direction.x = 1
		
	return direction
	
func set_direction(direction):
	direction = direction.normalized()
	
func _ready():
	randomize()
	direction = get_rand_direction()
	
func _process(delta):
	position += direction * velocity * delta

func _on_Ball_area_entered(area):
	if is_colliding:
		pass
	is_colliding = true
	$SFX.play()
	
	if area.TYPE == "PANEL":
		var collision_vector = position - area.position
		direction = collision_vector.normalized()
	else:
		direction.y = -direction.y

func _on_Ball_area_exited(area):
	is_colliding = false
