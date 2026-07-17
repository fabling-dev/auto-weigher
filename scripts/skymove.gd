extends SubViewport

@onready var camera_3d: Camera3D = %Camera3D

const CAMSPEED : float = 3000.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera_3d.position.x += delta * CAMSPEED
	
