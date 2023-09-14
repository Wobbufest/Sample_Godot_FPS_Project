extends CharacterBody3D

@export var Damage : float = 30

var Health : float = 3
var Speed : float = 3

var LastFrameCollisions = 0
var CurrentFrameCollisions = 0
var CollisionExceptions = []

func _ready():
	
	$AnimationPlayer.play("Bounce")
	
	pass
	
func _physics_process(delta):
	
	MovementHandler()
	AttackHandler()
	LifeHandler()
	GUIHandler()
	
	pass
	
func GUIHandler():
	
	$"Health Bar View/Enemy Health Bar/ProgressBar".value = Health
	
	pass
	
func MovementHandler():
	
	var PlayerPosition = get_tree().get_nodes_in_group("Player")[0].transform.origin
	var CurrentPosition = self.transform.origin
	
	var DirectionToPlayer = (PlayerPosition - CurrentPosition).normalized()
	
	self.velocity = self.velocity.lerp(DirectionToPlayer * Speed, get_physics_process_delta_time() * 10)
	
	FacePlayer(DirectionToPlayer)
	
	self.move_and_slide()
	
	pass
	
func AttackHandler():
	
	for Collision in get_slide_collision_count():
		
		var CollidingObject = get_slide_collision(Collision).get_collider()
		
		if(CollidingObject.is_in_group("Player")):
			
			CollidingObject.Die()
			
	pass
	
func LifeHandler():
	
	if(Health <= 0):
		
		self.queue_free()
		
	pass
	
func FacePlayer(PlayerDirection):
	
	self.look_at(self.transform.origin - PlayerDirection.normalized(), Vector3(0, 1, 0))
	
	pass
