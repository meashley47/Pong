extends KinematicBody2D

export var speed = 500
onready var ball

func _ready():
	ball = get_parent().get_node("Ball")

func _physics_process(delta):
	move_and_slide(Vector2(0, get_opponent_direction()) * speed)


func get_opponent_direction():
	#Ball is below, so move paddle down
	if ball.position.y > position.y:
		return 1

	#Ball is above, so move paddle up
	else:
		return -1
