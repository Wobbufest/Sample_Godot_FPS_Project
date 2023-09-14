extends Node

func _ready():
	
	randomize()
	
	$"Enemy Spawn Timer".connect("timeout", Callable(self, "SpawnEnemy"))
	
	pass
	
func SpawnEnemy():
	
	var SpawnPoints = get_tree().current_scene.find_child("Enemy Spawn Points").get_children()
	var Player = get_tree().get_nodes_in_group("Player")[0]
	
	var NewEnemy = preload("res://Scenes/Enemy.tscn").instantiate()
	
	var PossibleSpawns = []
	
	for SpawnPoint in SpawnPoints:
		
		if(SpawnPoint.transform.origin.distance_to(Player.transform.origin) > 10):
			
			PossibleSpawns.push_back(SpawnPoint.transform.origin)
			
	NewEnemy.transform.origin = PossibleSpawns[randi_range(0, PossibleSpawns.size() - 1)]
	
	get_tree().current_scene.find_child("Entities").add_child(NewEnemy)
	
	pass
