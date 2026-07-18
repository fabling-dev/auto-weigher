extends HBoxContainer

@onready var timedownbar: ProgressBar = %timedownbar
@onready var fillbox = preload("res://shaders/timer.tres")
@onready var timerlaber: Label = $timer

@export var duration : float = 30

func _ready() -> void:
	timedownbar.max_value = 10
	GM.timer = duration
	fillbox.bg_color = convertcolor(122,209,105,255)

func _process(delta: float) -> void:
	if GM.timer > 0:
		GM.timer -= delta
		timedownbar.value = GM.timer
		timerlaber.text = str(snapped(GM.timer, 0.1))

	if 10 <= GM.timer and GM.timer < 25:
		fillbox.bg_color = convertcolor(219, 207, 72,255)
	elif GM.timer < 10:
		fillbox.bg_color = convertcolor(207, 50, 50,255)
	else:
		fillbox.bg_color = convertcolor(122,209,105,255)

func convertcolor(red : int, green: int, blue: int, alpha: int) ->  Color:
	var new_red = red/255.0
	var new_green = green/255.0
	var new_blue = blue/255.0
	var new_alpha = alpha/255.0

	return Color(new_red, new_green, new_blue, new_alpha)
