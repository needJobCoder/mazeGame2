extends TileMap


@export var isPlayerThere : bool = false
@onready var area2D : Area2D = $Area2D
@onready var tilemap : TileMap = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.globalTilemapArray.push_back(tilemap)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _physics_process(delta):
	addTileMapToTheArray()
func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		isPlayerThere = true
		
		
func gotPlayerChild() -> bool:
	for child in get_children():
		if child is CharacterBody2D:
			return true
	return false		


func _on_area_2d_body_exited(body):
		if body is CharacterBody2D:
			isPlayerThere = false

func assignCollisionLayer():
	pass

func addTileMapToTheArray():
	if Global.globalAddNewTilemapsIntoArray == true:
		Global.globalTilemapArray.push_back(tilemap)
		if Global.globalTilemapArray.size() == 9:
			Global.globalAddNewTilemapsIntoArray = false
