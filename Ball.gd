extends KinematicBody2D

var speed = 600
var velocity = Vector2.ZERO

func _ready():
	#Choose a random starting direction
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	#Bounce the ball if it collided
	if collision:
		velocity = velocity.bounce(collision.normal)
	
