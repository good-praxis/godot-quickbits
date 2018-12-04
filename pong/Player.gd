extends Node2D

var start_x
var screensize
var collisionArray = [] # in case we want to implement more than one ball later on

func _ready():
	start_x = position.x
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
	position.x = start_x
	
	


func _on_Area2D_body_entered(body):
	if body.name == "Ball": 
		pass
	print(body.name)