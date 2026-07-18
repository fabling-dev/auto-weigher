extends SubViewport

const CARS = {
	"ambulance" : preload("res://scenes/cars/ambulance.tscn"),
	"spacekart" : preload("res://scenes/cars/spacekart.tscn"),
	"deliv_flat" : preload("res://scenes/cars/deliv_flat.tscn"),
	"hatchback" : preload("res://scenes/cars/hatchback.tscn") ,
	"police" : preload("res://scenes/cars/police.tscn") ,
	"sedan" : preload("res://scenes/cars/sedan.tscn") ,
	"sportssedan" : preload("res://scenes/cars/sportssedan.tscn") ,
	"suv" : preload("res://scenes/cars/suv.tscn") ,
	"taxi" : preload("res://scenes/cars/taxi.tscn") ,
	"tractor" : preload("res://scenes/cars/tractor.tscn") ,
	"truck" : preload("res://scenes/cars/truck.tscn") ,
	"van" : preload("res://scenes/cars/van.tscn") ,
	"deliv_full" : preload("res://scenes/cars/deliv_full.tscn") ,
	"firetruck" : preload("res://scenes/cars/firetruck.tscn") ,
	"formulaone" : preload("res://scenes/cars/formulaone.tscn") ,
	"grbtruck" : preload("res://scenes/cars/grbtruck.tscn")
}

func _process(_delta: float) -> void:
	if !GM.carexist:
		carspawn()

func carspawn() -> void:
	var carnames: Array = CARS.keys()
	var car: String = carnames.slice(0,4*GM.level).pick_random()
	var spawned_car : Node = CARS[car].instantiate()
	add_child(spawned_car)
	GM.carname = spawned_car.ID
	GM.setcarweight()
	GM.carexist = true
