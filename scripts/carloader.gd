extends SubViewport

const CARS = {
	"ambulance" : preload("res://scenes/ambulance.tscn"),
	"spacekart" : preload("res://scenes/spacekart.tscn")
}

func _process(_delta: float) -> void:
	if !GM.carexist:
		carspawn()

func carspawn() -> void:
	var carnames: Array = CARS.keys()
	var car: String = carnames.pick_random()
	var spawned_car : Node = CARS[car].instantiate()
	add_child(spawned_car)
	GM.carname = spawned_car.name
	GM.setcarweight()
	GM.carexist = true

