extends Node2D

var distance : int = 130
@onready var partOne : Node2D = $"1"
@onready var partTwo: Node2D = $"2"
@onready var partThree : Node2D = $"3"
@onready var verticalBarArray : Array = [partOne, partTwo, partThree]
@onready var partsPositionArray : Array = [142, 270, 398]

func printAllPositions():
	for part in verticalBarArray:
		print(part.global_position)

func _ready():
	var distanceBetweenParts = 128
	for part in verticalBarArray:
		part.global_position.y = distanceBetweenParts + distance
		part.global_position.x = 550
		distanceBetweenParts += distance
		
		
	
func toggleUp():
	#(550, 258)
	#(550, 518)
	#(550, 258)
	var top = verticalBarArray[0]
	verticalBarArray.pop_at(0)
	verticalBarArray.append(top)
	printAllPositions()
	
	
		
	var distanceBetweenParts = 128
	var index : int = 0
	for part in verticalBarArray:
		part.global_position.y = distanceBetweenParts + distance
		part.global_position.x = 550
		distanceBetweenParts += distance
		
		


func _on_up_pressed():
	toggleUp()
	print(verticalBarArray)


func _on_down_pressed():
	pass
