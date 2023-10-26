extends CharacterBody2D

@export var speed: int = 35
@onready var animation = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed

func updateAnimation():
	if velocity.length() == 0:
		if animation.is_playing():
			animation.stop()
	else: 
		var direction = 'Down'
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
	
		animation.play("walk" + direction)
		
func handleCollision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		print_debug(collider.name)
		
func _physics_process(delta):
	handleInput()
	move_and_slide()
	handleCollision()	
	updateAnimation()
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Player/world.tscn")# Replace with function body.
