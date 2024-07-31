extends CharacterBody2D

@export_category("Player movement properties")
@export var SPEED: float = 300.0
@export var potion: PackedScene


func _physics_process(delta):
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	move_and_collide(direction * SPEED * delta)
	
	if Input.is_action_just_pressed("left_click"):
		var pot: Potion = potion.instantiate() as Potion
		add_sibling(pot)
		
		pot.global_position =  global_position
		var  throw_direction: Vector2 = pot.global_position.direction_to(get_global_mouse_position())
		
		pot.initalize(throw_direction * 3 * SPEED)
		
