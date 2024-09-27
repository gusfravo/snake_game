class_name Snake
extends CharacterBody2D


@export var SPEED = 300.0
@export var TURBO = 600.0
@export var NORMAL_SPEED = 300.0

@onready var animation_player = $AnimationPlayer


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var onPressTurbo = Input.is_action_pressed("ui_accept")

	# Handle turbo.
	if onPressTurbo:
		SPEED = TURBO
	else:
		SPEED = NORMAL_SPEED
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("ui_left", "ui_right")
	if direction_x:
		velocity.x = direction_x * SPEED
		if direction_x == 1 :
			animation_player.play("turn_right",-1,1.0,true)
		else:
			animation_player.play("turn_left",-1,1.0,true)
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * SPEED
		if direction_y == 1 :
			animation_player.play("turn_down",-1,1.0,true)
		else:
			animation_player.play("turn_up",-1,1.0,true)
			
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	

	move_and_slide()

func checkIsOnTurbo() -> void:
	
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	print("AREA steroide grande")
	pass # Replace with function body.
