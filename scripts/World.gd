extends Node

export(PackedScene) var ball_scene = load("res://scenes/Ball.tscn")

func _on_SpawnTimer_timeout():
	$SpawnTimer.wait_time = rand_range(2,5)
	if get_tree().get_nodes_in_group("Balls").size() < 5:
		# Create a new instance of the Mob scene.
		var ball = ball_scene.instance()
		print("Mob Instance Created")

		# Choose a random location on the SpawnPath.
		var ball_spawn_location = $SpawnPath/SpawnLocation
		#print(mob_spawn_location.translation)
		ball_spawn_location.unit_offset = randf()
		var direction = ball_spawn_location.rotation + PI / 2
		
		ball.position = ball_spawn_location.position
		direction += rand_range(-PI / 4, PI / 4)
		ball.rotation = direction
		var random_speed = rand_range(350, 400)
	# We calculate a forward velocity first, which represents the speed.
		ball.linear_velocity = (Vector2(random_speed,0.0)).rotated(direction)
		# Spawn the mob by adding it to the Main scene.
		add_child(ball)
		print("New ball spawned")
