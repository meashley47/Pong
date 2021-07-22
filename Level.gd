extends Node

#Resets the ball after waiting a fraction of a second upon losing

onready var ball = $Ball

func wait(s):
	var timer = Timer.new()
	timer.set_wait_time(s)
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.set_one_shot(true)
	add_child(timer)
	timer.start()

func _on_Left_Wall_body_entered(body):
	wait(0.7)

func _on_Right_Wall_body_entered(body):
	wait(0.7)

func _on_timer_timeout():
	ball.position = Vector2(512, 300)
	ball.velocity.x = [-1, 1][randi() % 2]
	ball.velocity.y = [-0.8, 0.8][randi() % 2]
