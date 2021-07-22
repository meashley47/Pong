extends Node

onready var ball = $Ball
var playerScore = 0
var opponentScore = 0
onready var timer = $Timer

#Update player scores
func _process(_delta):
	$"Player Score".text = str(playerScore)
	$"Opponent Score".text = str(opponentScore)

func _on_Left_Wall_body_entered(_body):
	timer.start()
	opponentScore += 1

func _on_Right_Wall_body_entered(_body):
	timer.start()
	playerScore += 1

#Resets the ball after waiting a fraction of a second upon someone losing
func _on_Timer_timeout():
	ball.position = Vector2(512, 300)
	ball.velocity.x = [-1, 1][randi() % 2]
	ball.velocity.y = [-0.8, 0.8][randi() % 2]
