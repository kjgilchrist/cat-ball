extends RigidBody2D

func _ready():
	pass


func _on_LifeTimer_timeout():
	if get_tree().get_nodes_in_group("Balls").size() == 5:
		queue_free()
