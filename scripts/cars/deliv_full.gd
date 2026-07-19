extends Node3D

const ID : String = "deliv_full"

@onready var carrunning: AudioStreamPlayer2D = $carrunning

func _onready():
    carrunning.play()