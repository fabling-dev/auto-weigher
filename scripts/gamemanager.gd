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
var diff_value : String = "normal"
var enginescaleval : float 

const upgrade_count : int = 10
const score_up_check : int = 50

signal guesssubmitted
signal carwentboom
signal addt1
signal startgame

const difficulty = {
	"easy" = 1.0,
	"normal" = 1.5,
	"hard" = 2.0,
	"nightmare" = 3.0
}

const carweights = {
	"ambulance" : 180.0,
	"spacekart" : 40.0,
	"deliv_flat" : 120.0,
	"hatchback" : 100.0 ,
	"police" : 100.0 ,
	"sedan" : 80.0 ,
	"sportssedan" : 70.0 ,
	"suv" : 150.0 ,
	"taxi" : 110.0 ,
	"tractor" : 230.0 ,
	"truck" : 160.0 ,
	"van" : 130.0 ,
	"deliv_full" : 140.0 ,
	"firetruck" : 250.0 ,
	"formulaone" : 60.0 ,
	"grbtruck" : 240.0 
}

func _ready() -> void:
	Engine.max_fps = 60

func _physics_process(_delta: float) -> void:
	
	Engine.time_scale = 1.0 + speedupvalue
	enginescaleval = Engine.time_scale

func setcarweight() -> void:
	carweight = int(carweights[carname] + randf_range(-5,10))

func update_score(points: int) -> void:
	var new_score: int = int(score + points)
	timerupdate(points)

	if int(score)%score_up_check > new_score%score_up_check and t1_count <= upgrade_count:
		addt1.emit()

	score = new_score

	t1_sum = t1_count + (t2_count*10) + (t3_count*100)

	if t1_sum > GM.get_time_value(20):
		speedupunlock = true
	elif t1_sum > GM.get_time_value(15):
		level = 4
	elif t1_sum > GM.get_time_value(10):
		level = 3
	elif t1_sum > GM.get_time_value(5):
		level = 2
	else:
		level = 1

	if speedupunlock:
		speedupvalue = speedup(t1_sum)


func timerupdate(scored : int) -> void:
	timer += scored/(4.0 *difficulty[diff_value])

func speedup(scoresum : int) -> float:
	if scoresum%2 == 0 and scoresum > 0:
		speedupvalue += 0.1

	return speedupvalue

func set_diff(index : int = 0) -> void:
	if index == 0:
		diff_value = "easy"
	if index == 1:
		diff_value = "normal"
	if index == 2:
		diff_value = "hard"
	if index == 3:
		diff_value = "nightmare"

func get_time_value(time : float) -> float:
	var timeval = time / difficulty[diff_value]
	return timeval
		
func gamereset() -> void:
	carexist = false
	score = 0.0
	t1_count  = 0
	t2_count  = 0
	t3_count  = 0
	timer = 0.0
	level  = 1
	speedupunlock  = false
	speedupvalue  = 0.0
	t1_sum  = 0
