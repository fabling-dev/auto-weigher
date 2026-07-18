extends Control

@onready var weight_guess: VSlider = $VSlider
@onready var submit_guess: Button = $Button
@onready var answer: VSlider = $VSlider2

const max_score : int = 50

func _ready() -> void:
	GM.carwentboom.connect(restartbutton)

func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	var difference = int(abs(weight_guess.value - GM.carweight))
	GM.update_score(max(0, max_score - difference))
	GM.guesssubmitted.emit()
	submit_guess.disabled = true
	answer.value = GM.carweight
	answer.visible = true

func restartbutton():
	submit_guess.disabled = false
	answer.visible = false
