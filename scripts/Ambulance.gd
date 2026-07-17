extends Node3D

var weight : float

func _ready() -> void:
	weight = randf_range(100, 120)
	GM.carweight = weight

