extends SubViewportContainer

@onready var subview: SubViewport = $SubViewport
@onready var carrunning: AudioStreamPlayer2D = %carrunning

var car
var weightaccpeted : bool = false
var dir : int = -1
var SPEED : float = 450.0 
var music_temp : float 
var startgamelook : bool = true

const stoplocation : float = 420
const spawnlocation : Vector2 = Vector2(1300, 300)
const despawnlocation : float = -500

func _ready() -> void:
	position = spawnlocation
	GM.guesssubmitted.connect(submission)

func _physics_process(delta: float) -> void:
	if startgamelook == true:
		await GM.startgame
		startgamelook = false
	else:
		if position.x > stoplocation or weightaccpeted:
			position.x += delta * SPEED * dir

		if position.x < despawnlocation:
			despawn()
			SPEED = 450.0 + (75 * GM.difficulty[GM.diff_value])

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
	SPEED = 700  + (150 * GM.difficulty[GM.diff_value])



		
