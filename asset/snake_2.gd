extends CharacterBody2D

@export var speed = 20
@export var limit = 1.5
@onready var animations = $AnimatedSprite2D
var startPosition
var endPosition

func _ready():
	startPosition = position
	endPosition = startPosition + Vector2(5*16, 0)  # Bergerak ke kanan
	
func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd	

func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		changeDirection()
	velocity = moveDirection.normalized() * speed

func updateAnimation():
	var animationString = "walkRight"  # Menggunakan animasi "walkRight" untuk bergerak ke kanan
	if velocity.x < 0:
		animationString = "walkLeft"
		
	animations.play(animationString)	
	
func _physics_process(delta):
	updateVelocity()
	move_and_slide()
	updateAnimation()
