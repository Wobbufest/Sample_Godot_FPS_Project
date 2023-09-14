extends CharacterBody3D

@export var Speed : float = 4.0
@export var Acceleration : float = 5.0
@export var ShotsPerSecond : int = 4

var MouseSensibility : float = 0.025
var CanShoot : bool = true

func _ready():
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	pass
	
func _physics_process(delta):
	
	MovementHandler()
	ShotHandler()
	CrosshairHandler()
	
	pass
	
func _input(event):
	
	CameraHandler(event)
	
	pass
	
func CrosshairHandler():
	
	var RaycastCollider = $"Camera Pivot/RayCast3D".get_collider()
	
	if(RaycastCollider != null && RaycastCollider.is_in_group("Enemy")):
		
		$Crosshair.scale = Vector2(1.2, 1.2)
		$Crosshair.rotation = deg_to_rad(45)
		
	else:
		
		$Crosshair.scale = Vector2(1, 1)
		$Crosshair.rotation = 0
		
	pass
	
func ShotHandler():
	
	if(Input.is_action_just_pressed("Shoot") && CanShoot):
		
		CanShoot = false
		
		$AnimationPlayer.play("Shoot")
		
		$"Camera Pivot/RayCast3D".force_raycast_update()
		
		var Target = $"Camera Pivot/RayCast3D".get_collider()
		
		if(Target != null):
			
			if(Target.is_in_group("Enemy")):
				
				Target.Health -= 1
				Target.velocity += self.transform.basis.z * -16
				
			AddBulletParticle($"Camera Pivot/RayCast3D".get_collision_point())
			
		await get_tree().create_timer(1.0 / ShotsPerSecond).timeout
		
		CanShoot = true
		
	pass
	
func AddBulletParticle(Position : Vector3):
	
	var NewBullet = preload("res://Scenes/Shot Particle.tscn").instantiate()
	
	NewBullet.transform.origin = Position
	
	self.get_parent().add_child(NewBullet)
	
	pass
	
func MovementHandler():
	
	var MovementDirection = Vector3(0, 0, 0)
	
	MovementDirection += self.transform.basis.x * Input.get_action_strength("Move Right")
	MovementDirection += self.transform.basis.x * -Input.get_action_strength("Move Left")
	MovementDirection += self.transform.basis.z * Input.get_action_strength("Move Backward")
	MovementDirection += self.transform.basis.z * -Input.get_action_strength("Move Forward")
	
	MovementDirection = MovementDirection.normalized()
	
	self.velocity = self.velocity.lerp(MovementDirection * Speed, get_physics_process_delta_time() * Acceleration)
	
	self.move_and_slide()
	
	pass
	
func Die():
	
	get_tree().change_scene_to_file("res://Scenes/Playtest Area.tscn")
	
	pass
	
func CameraHandler(Event):
	
	if(Event is InputEventMouseMotion):
		
		var MouseVelocity = Event.relative
		
		self.rotate(Vector3(0, 1, 0), deg_to_rad((MouseVelocity.x * MouseSensibility) * -5))
		$"Camera Pivot".rotate(Vector3(1, 0, 0), deg_to_rad((MouseVelocity.y * MouseSensibility) * -5))
		
	pass
