extends Area2D

const TYPE = "PANEL"
var screensize


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

	
	
