extends Node2D

const SCENE_ASTEROID = preload("res://src/asteroid/asteroid.tscn")
const WIDTH = 1200
const HITH = 620

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#funcionalidad para genera un nuevo asteroid
func addNewAsteroid() -> void:
	print("[SPACE] - Creando asteroide")
	var instance_asteroid = SCENE_ASTEROID.instantiate();
	#generate position ramdom
	var rngx = RandomNumberGenerator.new()
	var rngy = RandomNumberGenerator.new()
	var position_x = rngx.randi_range(10, WIDTH)
	var position_y = rngy.randi_range(10, HITH)
	instance_asteroid.position.x = position_x
	instance_asteroid.position.y = position_y
	#Instanciamos la señal del asteroide
	instance_asteroid.new_asteroid.connect(_on_asteroid_new_asteroid)
	add_child(instance_asteroid)
	pass


func _on_asteroid_new_asteroid() -> void:
	addNewAsteroid()
