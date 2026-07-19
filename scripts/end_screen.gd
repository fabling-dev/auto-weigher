extends Node2D

func _ready() -> void:
	GM.gamereset()


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/gameplay.tscn")

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
