extends Control

@onready var weight_guess: VSlider = $VSlider
@onready var submit_guess: Button = $Button
@onready var answer: VSlider = $VSlider2
@onready var reset: Button = $Reset
@onready var buttonpress: AudioStreamPlayer2D = $buttonpress
@onready var selectionmade: AudioStreamPlayer2D = $selectionmade
@onready var perfect: TextureRect = $perfect
@onready var great: TextureRect = $great
@onready var ok: TextureRect = $ok
@onready var bad: TextureRect = $bad
@onready var zero: TextureRect = $zero

var buttoncheck : bool = false

const max_score : int = 50

func _ready() -> void:
	GM.carwentboom.connect(restartbutton)
	GM.startgame.connect(activatebutton)
	submit_guess.disabled = true

func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	selectionmade.play()
	var difference = int(abs(weight_guess.value - GM.carweight))
	GM.update_score(max(0, max_score - difference))
	print(max(0, max_score - difference))
	showscorepop(max(0, max_score - difference))
	GM.guesssubmitted.emit()
	submit_guess.disabled = true
	answer.value = GM.carweight
	answer.visible = true

func restartbutton():
	submit_guess.disabled = false
	answer.visible = false

func _on_reset_pressed() -> void:
	buttonpress.play()
	GM.gamereset()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func activatebutton():
	submit_guess.disabled = false
	selectionmade.play()

func showscorepop (score : float) -> void:
	if score > 47:
		playanim(perfect)
	elif score > 40:
		playanim(great)
	elif score > 30:
		playanim(ok)
	elif score > 0:
		playanim(bad)
	else:
		playanim(zero)

func playanim(scorenode : TextureRect) -> void:
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(scorenode, "scale", Vector2(1.3,1.3), 3/24.0)
	tween.tween_property(scorenode, "scale", Vector2(1.0,1.0), 2/24.0)
	tween.tween_interval(1)
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(scorenode, "scale", Vector2(1.2,1.2), 2/24.0)
	tween.tween_property(scorenode, "scale", Vector2(0.0,0.0), 3/24.0)
	tween.tween_interval(0)