extends Node

@onready var globalPlayer : CharacterBody2D 
@onready var globalPlayerCollisionShape : CollisionShape2D
@onready var gravity 
@onready var globalArea2D : Area2D
@onready var globalTween : Tween
# Called when the node enters the scene tree for the first time.
func _ready():
	print("globalPlayer")
	print(globalPlayer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
