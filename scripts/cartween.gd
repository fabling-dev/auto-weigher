extends SubViewportContainer

@onready var subview: SubViewport = $SubViewport

var car
var weightaccpeted : bool = false
var dir : int = -1

const stoplocation : float = 420
const spawnlocation : Vector2 = Vector2(1300, 300)
var SPEED : float = 450.0

func _ready() -> void:
	position = spawnlocation
	GM.guesssubmitted.connect(submission)

func _physics_process(delta: float) -> void:
	if position.x > stoplocation or weightaccpeted:
		position.x += delta * SPEED * dir

	if position.x < -300:
		despawn()
		SPEED = 450.0

func despawn() -> void:
	car = subview.get_child(-1)
	if car is Node3D:
		car.queue_free()
		position = spawnlocation
		GM.carexist = false
		weightaccpeted = false
		GM.carwentboom.emit()

func submission() -> void:
	weightaccpeted = true
	SPEED = 700.0


		
