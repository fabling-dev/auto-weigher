extends Node

var carexist : bool = false
var carweight : int 
var carname : String
var score : float = 0.0
var t1_count : int = 0
var t2_count : int = 0
var t3_count : int = 0
var timer : float = 0.0
var level : int = 1
var speedupunlock : bool = false
var speedupvalue : float = 0.0
var t1_sum : int = 0

const upgrade_count : int = 10
const score_up_check : int = 50

signal guesssubmitted
signal carwentboom
signal addt1

const carweights = {
	"ambulance" : 100.0,
	"spacekart" : 40.0,
	"deliv_flat" : 0.0,
	"hatchback" : 0.0 ,
	"police" : 0.0 ,
	"sedan" : 0.0 ,
	"sportssedan" : 0.0 ,
	"suv" : 0.0 ,
	"taxi" : 0.0 ,
	"tractor" : 0.0 ,
	"truck" : 0.0 ,
	"van" : 0.0 ,
	"deliv_full" : 0.0 ,
	"firetruck" : 0.0 ,
	"formulaone" : 0.0 ,
	"grbtruck" : 0.0 
}

func _ready() -> void:
	Engine.max_fps = 60

func _physics_process(_delta: float) -> void:
	Engine.time_scale = 1.0 + speedupvalue
	print(Engine.time_scale)

func setcarweight() -> void:
	carweight = int(carweights[carname] + randf_range(-5,10))

func update_score(points: int) -> void:
	var new_score: int = int(score + points)
	timerupdate(points)

	if int(score)%score_up_check > new_score%score_up_check and t1_count <= upgrade_count:
		addt1.emit()

	score = new_score

	t1_sum = t1_count + (t2_count*10) + (t3_count*100)

	if t1_sum > 35:
		speedupunlock = true
	elif t1_sum > 25:
		level = 4
	elif t1_sum > 15:
		level = 3
	elif t1_sum > 5:
		level = 2
	else:
		level = 1

	if speedupunlock:
		speedupvalue = speedup(t1_sum)


func timerupdate(scored : int) -> void:
	timer += scored/4.0

func speedup(scoresum : int) -> float:
	if scoresum%2 == 0 and scoresum > 0:
		speedupvalue += 0.1

	return speedupvalue


		
