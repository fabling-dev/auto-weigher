extends HFlowContainer

var t1_wrench_scene = preload("res://scenes/t1_wrench.tscn")
var t2_wrench_scene = preload("res://scenes/t2_wrench.tscn")
var t3_wrench_scene = preload("res://scenes/t3_wrench.tscn")

var t1_wrench : Node
var t2_wrench : Node
var t3_wrench : Node

func _ready() -> void:
	GM.addt1.connect(add_t1)

func _process(_delta: float) -> void:

	if GM.t1_count >= GM.upgrade_count:
		delete_t1()
		add_t2()
		GM.t2_count += 1

	if GM.t2_count >= GM.upgrade_count:
		delete_t2()
		add_t3()
		GM.t3_count += 1

func delete_t1() -> void:
	GM.t1_count -= GM.upgrade_count
	var children_array : Array = self.get_children()
	var k : int = 0
	for i in children_array:
		if i.wrenchID == 01 and k < GM.upgrade_count:
			remove_child(i)
			i.queue_free()
			k += 1

func delete_t2() -> void:
	GM.t2_count -= GM.upgrade_count
	var children_array : Array = self.get_children()
	var k : int = 0
	for i in children_array:
		if i.wrenchID == 10 and k < GM.upgrade_count:
			remove_child(i)
			k += 1

func add_t1() -> void:
	t1_wrench = t1_wrench_scene.instantiate()
	add_child(t1_wrench)
	print(self.get_children())
	GM.t1_count += 1
	move_child(t1_wrench, 0)

func add_t2() -> void:
	t2_wrench = t2_wrench_scene.instantiate()
	add_child(t2_wrench)
	move_child(t2_wrench, GM.t1_count )	

func add_t3() -> void:
	t3_wrench = t3_wrench_scene.instantiate()
	add_child(t3_wrench)
	move_child(t3_wrench, GM.t1_count + GM.t2_count )
