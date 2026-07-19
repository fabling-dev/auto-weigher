extends HBoxContainer

@onready var timedownbar: ProgressBar = %timedownbar
@onready var fillbox = preload("res://shaders/timer.tres")
@onready var timerlaber: Label = $timer
@onready var bass: AudioStreamPlayer2D = $bass
@onready var drums: AudioStreamPlayer2D = $drums
@onready var instrumental: AudioStreamPlayer2D = $instrumental

@export var duration : float = GM.get_time_value(20)

var starttimer : bool = false

func _ready() -> void:
	timedownbar.max_value = max(5, GM.get_time_value(6))
	GM.timer = duration
	fillbox.bg_color = convertcolor(122,209,105,255)
	bass.play()
	bass.volume_db = 10
	drums.play() 
	drums.volume_db = 10
	instrumental.play()
	instrumental.volume_db = 10


func _process(delta: float) -> void:

	if !starttimer:
		await GM.startgame
		starttimer = true
	else:
		if GM.timer > 0:
			GM.timer -= delta
			timedownbar.value = GM.timer
			timerlaber.text = str(snapped(GM.timer, 0.1))
			bass.pitch_scale = scalebytime()
			drums.pitch_scale = scalebytime()
			instrumental.pitch_scale = scalebytime()

		if GM.timer <= 0:
			get_tree().change_scene_to_file("res://scenes/end_screen.tscn")

		if timedownbar.max_value <= GM.timer and GM.timer < max(8, GM.get_time_value(15)):
			fillbox.bg_color = convertcolor(219, 207, 72,255)
			bass.volume_db = pitchscalebytime(2) 
			drums.volume_db = pitchscalebytime(8)
			instrumental.volume_db = pitchscalebytime(10)

		elif GM.timer < timedownbar.max_value:
			fillbox.bg_color = convertcolor(207, 50, 50,255)
			bass.volume_db = pitchscalebytime(12)
			drums.volume_db = pitchscalebytime(15)
			instrumental.volume_db = pitchscalebytime(-2)
	
		else:
			fillbox.bg_color = convertcolor(122,209,105,255)
			bass.volume_db = pitchscalebytime(-2)
			drums.volume_db = pitchscalebytime(-2)
			instrumental.volume_db = pitchscalebytime(10)

func convertcolor(red : int, green: int, blue: int, alpha: int) ->  Color:
	var new_red = red/255.0
	var new_green = green/255.0
	var new_blue = blue/255.0
	var new_alpha = alpha/255.0

	return Color(new_red, new_green, new_blue, new_alpha)

func pitchscalebytime(input : float) -> float:
	var newval : float = input + min(1.8, max(1, 0.9 + GM.enginescaleval/10))
	return newval

func scalebytime() -> float:
	var newval : float = min(2.5, max(1, 0.9 + GM.enginescaleval/10))
	return newval
