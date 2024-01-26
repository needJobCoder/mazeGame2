extends Node2D

@onready var grid : Node2D = $"."
@onready var timer : Timer = $"../Timer"
@onready var assembleGridRun = 0
var cellsMatrix  = []
var horizontalDistance = 128
var verticalDistance = 128

	#_assembleCells()
	#assembleGridPosition()
	#var row: Array = verticalGetRow(1, cellsMatrix)
	#var newArr = rightClickRow(row)
	#cellsMatrix[1] = newArr
	#print(cellsMatrix)

func _ready():
	_assembleCells()
	assembleGridPosition()
	

	
func _assembleCells():
	var cells = grid.get_children()
	var cellsArr = []
	var i = 1
	for cell in cells:
		if i % 3 == 0:
			cellsArr.push_back(cell)
			cellsMatrix.push_back(cellsArr)
			cellsArr = []
		else:
			cellsArr.push_back(cell)
			
		i += 1
		

func assembleGridPosition():
	if assembleGridRun > 2:
		pass
		#Global.gravity = 0
	var verticalDistance = 0
	var horizontalDistance = 0
	var verticalGap = 50
	var horizontalGap = 50
	
	var player = Global.globalPlayer
	var playerCollisionShape2D : CollisionShape2D = Global.globalPlayerCollisionShape
	
	#if playerCollisionShape2D == null:
		#pass
	#else:
		#playerCollisionShape2D.disabled = true

	
	for row in cellsMatrix:
		var i = 0
		for element in row:
			
			#tween(Vector2(horizontalDistance + horizontalGap, verticalDistance + verticalGap), element)
			element.global_position = Vector2(horizontalDistance + horizontalGap, verticalDistance + verticalGap)
			#print(element.global_position)
			horizontalGap += 140
			i += 1
			if i % 3 == 0:
				verticalGap += 10
				horizontalGap = 50

		#verticalGap = 50  # Reset vertical gap for the next row
		verticalDistance += 128
	timer.start()
	
			
func performOperations():
	for row in range(cellsMatrix.size()):
		for col in range(cellsMatrix.size()):
			print(col)

# return row
func verticalGetRow(row_index: int, matrix : Array):
	var index = 0
	for row in matrix:
		var getRowToPerformOperations :Array
		
		if index == row_index:
			getRowToPerformOperations = row
			return getRowToPerformOperations
		else:
			pass
		index += 1
			

func getTranspose(matrixToBeTransposed: Array) -> Array:
	var matrix = []
	var cellsArr = []
	for col_index in range(matrixToBeTransposed.size()):
		var i = 1
		for row_index in range(matrixToBeTransposed.size()):
			var element = matrixToBeTransposed[row_index][col_index]
			#print(element)
			if i % 3 == 0:
				cellsArr.push_back(element)
				matrix.push_back(cellsArr)
				cellsArr = []
			else:
				cellsArr.push_back(element)
			i += 1
	return matrix

func leftClickRow(cellArr : Array):
	var top : Node2D = cellArr[0]
	cellArr.pop_front()
	cellArr.push_back(top)
	return 	cellArr
	
func rightClickRow(cellArr : Array):
	var top : Node2D = cellArr[2]
	cellArr.pop_back()
	cellArr.push_front(top)
	return 	cellArr


func _on_left_0_pressed():
	var row: Array = verticalGetRow(0, cellsMatrix)
	var newArr = leftClickRow(row)
	cellsMatrix[0] = newArr
	assembleGridPosition()


func _on_left_1_pressed():
	var row: Array = verticalGetRow(1, cellsMatrix)
	var newArr = leftClickRow(row)
	cellsMatrix[1] = newArr
	assembleGridPosition()
	
func _on_left_2_pressed():
	var row: Array = verticalGetRow(2, cellsMatrix)
	var newArr = leftClickRow(row)
	cellsMatrix[2] = newArr
	assembleGridPosition()

func _on_right_0_pressed():
	var row: Array = verticalGetRow(0, cellsMatrix)
	var newArr = rightClickRow(row)
	cellsMatrix[0] = newArr
	assembleGridPosition()
	
func _on_right_1_pressed():
	var row: Array = verticalGetRow(1, cellsMatrix)
	var newArr = rightClickRow(row)
	cellsMatrix[1] = newArr
	assembleGridPosition()

func _on_right_2_pressed():
	var row: Array = verticalGetRow(2, cellsMatrix)
	var newArr = rightClickRow(row)
	cellsMatrix[2] = newArr
	assembleGridPosition()
	
func _on_up_0_pressed():
	var row: Array = verticalGetRow(0, getTranspose(cellsMatrix))
	var tMatrix = getTranspose(cellsMatrix)
	var newArr = leftClickRow(row)
	tMatrix[0] = newArr
	cellsMatrix = getTranspose(tMatrix)
	assembleGridPosition()
	
func _on_up_1_pressed():
	var row: Array = verticalGetRow(1, getTranspose(cellsMatrix))
	var tMatrix = getTranspose(cellsMatrix)
	var newArr = leftClickRow(row)
	tMatrix[1] = newArr
	cellsMatrix = getTranspose(tMatrix)
	assembleGridPosition()


func _on_up_2_pressed():
	var row: Array = verticalGetRow(2, getTranspose(cellsMatrix))
	var tMatrix = getTranspose(cellsMatrix)
	var newArr = leftClickRow(row)
	tMatrix[2] = newArr
	cellsMatrix = getTranspose(tMatrix)
	assembleGridPosition()


func _on_down_0_pressed():
	var row: Array = verticalGetRow(0, getTranspose(cellsMatrix))
	var tMatrix = getTranspose(cellsMatrix)
	var newArr = rightClickRow(row)
	tMatrix[0] = newArr
	cellsMatrix = getTranspose(tMatrix)
	assembleGridPosition()


func _on_down_1_pressed():
	var row: Array = verticalGetRow(1, getTranspose(cellsMatrix))
	var tMatrix = getTranspose(cellsMatrix)
	var newArr = rightClickRow(row)
	tMatrix[1] = newArr
	cellsMatrix = getTranspose(tMatrix)
	assembleGridPosition()


func _on_down_2_pressed():
	var row: Array = verticalGetRow(2, getTranspose(cellsMatrix))
	var tMatrix = getTranspose(cellsMatrix)
	var newArr = rightClickRow(row)
	tMatrix[2] = newArr
	cellsMatrix = getTranspose(tMatrix)
	assembleGridPosition()
	
func tween(finalPosition : Vector2, cell: Node2D):
	var tween = create_tween()
	Global.globalTween = tween
	tween.tween_property(cell, "global_position", finalPosition, 0.4)
	

func _on_timer_timeout():
	pass
	
