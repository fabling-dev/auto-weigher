extends Node3D

var weight : float

func _ready() -> void:
	weight = randf_range(30, 50)
	GM.carweight = weight
