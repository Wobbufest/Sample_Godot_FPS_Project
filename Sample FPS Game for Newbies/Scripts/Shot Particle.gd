extends CPUParticles3D

func _ready():
	
	self.emitting = true
	
	await get_tree().create_timer(0.3).timeout
	
	self.queue_free()
	
	pass
