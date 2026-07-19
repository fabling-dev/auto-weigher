extends Node2D

@onready var difficulty: VBoxContainer = $button_manager/difficulty
@onready var options: VBoxContainer = $button_manager/options
@onready var buttonpress: AudioStreamPlayer2D = $buttonpress

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	buttonpress.play()
	await buttonpress.finished
	get_tree().change_scene_to_file("res://scenes/gameplay.tscn")


func _on_options_pressed() -> void:
	buttonpress.play()
	open_options()

func _on_quit_pressed() -> void:
	buttonpress.play()
	await buttonpress.finished
	get_tree().quit()

func open_options() -> void:
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(options, "scale", Vector2(), 3/24.0)
	tween.tween_property(difficulty, "scale", Vector2(1.0,1.0), 3/24.0)


func _on_option_button_item_selected(index: int) -> void:
	buttonpress.play()
	GM.set_diff(index)
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(difficulty, "scale", Vector2(), 3/24.0)
	tween.tween_property(options, "scale", Vector2(1.0,1.0), 3/24.0)


