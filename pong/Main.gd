extends Node

var player_score = 0
var enemy_score = 0

func _process(delta):
	if $Ball:
		$Enemy.set_ball_position($Ball.position)


func _on_Ball_score_point(winner):
	if winner == "Player":
		player_score += 1
	else:
		enemy_score += 1
	update_scores()
	$Ball.reset()

func update_scores():
	$Score/PlayerScore.text = str(player_score)
	$Score/EnemyScore.text = str(enemy_score)