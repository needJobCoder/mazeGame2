extends CharacterBody2D

const GRAVITY = 600

const SPEED = 300.0
var JUMP_VELOCITY = -800
@onready var player : CharacterBody2D = $"."
@onready var playerAnimatedSprite : AnimatedSprite2D = $Sprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 600
func _ready():
	Global.gravity = gravity
	print("fromPlayerScript")
	print(player)
	Global.globalPlayer = player
	Global.globalPlayerCollisionShape = get_node('CollisionShape2D')
	Global.globalArea2D = get_node("Area2D")
	
func _physics_process(delta):
	allowGravity()
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	#print(Global.globalPlayerCollisionShape.disabled)
	# Add the gravity.
	if Global.allowControls == true:
		controls(delta)
	

func controls(delta):
	

	# Handle jump.
	if Input.is_action_just_pressed("Space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == 1:
		playerAnimatedSprite.scale.x = -1
		playerAnimatedSprite.play("run_right")
	elif direction == -1:
		playerAnimatedSprite.scale.x = 1
		playerAnimatedSprite.play("run_right")
	elif playerAnimatedSprite.is_playing() and direction == 0:
		playerAnimatedSprite.stop()
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_sprite_2d_animation_finished():
	pass



func _on_area_2d_body_entered(body):
	if body is TileMap:
		print("colliding with tilemap")
		call_deferred("reparent", body)
		var area2d : Area2D
		for child in body.get_children():
			if child is Area2D:
				area2d = child
		
		area2d.monitoring = true
		body.tile_set.set_physics_layer_collision_layer(0, 2)
		
func allowGravity():
	if Global.globalAllowGravity == false:
		gravity = 0
	elif Global.globalAllowGravity == true:
		gravity = GRAVITY
