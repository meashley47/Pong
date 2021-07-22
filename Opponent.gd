extends KinematicBody2D

const PADDLE_SPEED = 420
var speed = PADDLE_SPEED
onready var ball

func _ready():
	ball = get_parent().get_node("Ball")

func _physics_process(_delta):
	move_and_slide(Vector2(0, get_opponent_direction()) * speed)

func get_opponent_direction():
	#Ball is below, so move paddle down
	if ball.position.y > position.y:
		return 1

	#Ball is above, so move paddle up
	else:
		return -1

func _on_Left_Wall_body_entered(_body):
	position.y = 300
	speed = 0

func _on_Right_Wall_body_entered(_body):
	position.y = 300
	speed = 0

func _on_Timer_timeout():
	speed = PADDLE_SPEED
