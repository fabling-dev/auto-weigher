extends Node2D

@onready var carstart: AudioStreamPlayer2D = $carstart
@onready var carstarttransition: AudioStreamPlayer2D = $carstarttransition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	carstart.play()
	await carstart.finished
	carstarttransition.play()
	await carstarttransition.finished
	GM.startgame.emit()
