extends Node3D

const ID : String = "ambulance"

@onready var carrunning: AudioStreamPlayer2D = $carrunning

func playaudio() -> void:
    carrunning.play()

