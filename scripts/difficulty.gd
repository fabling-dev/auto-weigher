extends OptionButton

func _ready() -> void:
	if GM.diff_value == "easy":
		self.selected = 0
	if GM.diff_value == "normal":
		self.selected = 1
	if GM.diff_value == "hard":
		self.selected = 2
	if GM.diff_value == "nightmare":
		self.selected = 3
