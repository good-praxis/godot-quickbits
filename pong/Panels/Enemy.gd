extends Area2D

const TYPE = "PANEL"
const ALLOWED_MOVEMENT = 350 #  slight nerfed compared to player
const SPRITE_OFFSET = 64 # Offset from origin to end of sprite
var screensize
var ball_position = Vector2()
var ball_moving_towards_enemy = false

func _ready():
	screensize = get_viewport_rect().size


func _process(delta):
	if not ball_moving_towards_enemy:
		return
	
	
	var abs_ball_y = abs(ball_position.y)
	var abs_pos_y = abs(position.y)
	var diff = abs_ball_y - abs_pos_y
	
	if diff <= 10 and diff >= -10:
		return
	elif ball_position.y > position.y:
		position += Vector2(0, ALLOWED_MOVEMENT * delta)
	else:
		position -= Vector2(0, ALLOWED_MOVEMENT * delta)
		
	position.y = clamp(position.y, SPRITE_OFFSET, screensize.y - SPRITE_OFFSET) 
	

func set_ball_position(new_ball_position):
	if new_ball_position.x < ball_position.x:
		ball_moving_towards_enemy = false
	else:
		ball_moving_towards_enemy = true
	ball_position = new_ball_position