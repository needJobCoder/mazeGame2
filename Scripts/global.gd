extends Node

@onready var globalPlayer : CharacterBody2D 
@onready var globalPlayerCollisionShape : CollisionShape2D
@onready var gravity 
@onready var globalArea2D : Area2D
@onready var globalTween : Tween
@onready var globalAllowGravity : bool = true
@onready var allowControls : bool = true
var globalAddNewTilemapsIntoArray = false
var globalTilemapArray : Array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	print("globalPlayer")
	print(globalPlayer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	assignCollisionForTween()

func assignCollision():
	for tilemap : TileMap in globalTilemapArray:
		if tilemap.isPlayerThere == false and globalTween.is_running() == true:
			tilemap.tile_set.set_physics_layer_collision_layer(0, 9)
		elif tilemap.isPlayerThere == true and globalTween.is_running() == true:
			tilemap.tile_set.set_physics_layer_collision_layer(0, 2)
		elif tilemap.isPlayerThere == true and globalTween.is_running() == false:
			tilemap.tile_set.set_physics_layer_collision_layer(0, 2)

func assignCollisionForTween():
	if globalTween.is_running() == true:
		globalAllowGravity = false
		allowControls = false
		for tilemap : TileMap in globalTilemapArray:
			tilemap.tile_set.set_physics_layer_collision_layer(0, 9)
		globalTilemapArray = []
		globalAddNewTilemapsIntoArray = true
	elif globalTween.is_running() == false:
		globalAllowGravity = true
		allowControls = true
		for tilemap : TileMap in globalTilemapArray:
			tilemap.tile_set.set_physics_layer_collision_layer(0, 2)
		globalTilemapArray = []
		globalAddNewTilemapsIntoArray = true

