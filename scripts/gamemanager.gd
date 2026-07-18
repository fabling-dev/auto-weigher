extends Node

var carexist : bool = false
var carweight : int 
var carname : String
var score : float = 0.0
var t1_count : int = 0
var t2_count : int = 0
var t3_count : int = 0

const upgrade_count : int = 10
const score_up_check : int = 50

signal guesssubmitted
signal carwentboom
signal addt1

const carweights = {
    "ambulance" : 100.0,
    "spacekart" : 40.0
}

func setcarweight() -> void:
    carweight = int(carweights[carname] + randf_range(-5,10))

func update_score(points: int) -> void:
    var new_score: int = int(score + points)

    if int(score)%score_up_check > new_score%score_up_check and t1_count <= upgrade_count:
        addt1.emit()

    score = new_score

        