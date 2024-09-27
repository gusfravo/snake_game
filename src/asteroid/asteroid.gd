class_name Asteroid

extends RigidBody2D

signal new_asteroid()


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_body_entered(body: Node) -> void:
	if body is Snake:
		print("[Asteroid] - - Impactado")
		generateNewAsteroid()
		queue_free()
		
func generateNewAsteroid() -> void:
	print("[Asteroid] - - New Asteroid");	
	new_asteroid.emit()
	pass
