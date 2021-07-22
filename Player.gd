extends KinematicBody2D

export var speed = 500

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
	move_and_slide(velocity * speed)
