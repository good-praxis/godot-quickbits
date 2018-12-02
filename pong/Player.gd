extends Area2D

export (int) var speed
export (int) var clampOffset
export (Vector2) var startPos
var screensize

func _ready():
	screensize = get_viewport_rect().size
	position = startPos
	
func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity * speed
	
	position += velocity * delta
	position.y = clamp(position.y, clampOffset, screensize.y - clampOffset)
	
	