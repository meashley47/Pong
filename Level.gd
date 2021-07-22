extends Node

onready var ball = $Ball
var playerScore = 0
var opponentScore = 0
onready var timer = $Timer
onready var pointSound = $"Point Sound"

#Update player scores
func _process(_delta):
	$"Player Score".text = str(playerScore)
	$"Opponent Score".text = str(opponentScore)

func _on_Left_Wall_body_entered(_body):
	timer.start()
	opponentScore += 1
	pointSound.play()
	$Player.position.x = 18
	$Opponent.position.x = 1004

func _on_Right_Wall_body_entered(_body):
	timer.start()
	playerScore += 1
	pointSound.play()
	$Player.position.x = 18
	$Opponent.position.x = 1004

#Resets the ball after waiting a fraction of a second upon someone losing
func _on_Timer_timeout():
	ball.position = Vector2(512, 300)
	ball.velocity.x = [-1, 1][randi() % 2]
	ball.velocity.y = [-0.8, 0.8][randi() % 2]
