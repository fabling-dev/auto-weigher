extends Node

var carexist : bool = false
var carweight : int 
var carname : String
var score : float = 0.0

signal guesssubmitted
signal carwentboom

const carweights = {
    "ambulance" : 100.0,
    "spacekart" : 40.0
}

func setcarweight() -> void:
    carweight = int(carweights[carname] + randf_range(-10,20))
