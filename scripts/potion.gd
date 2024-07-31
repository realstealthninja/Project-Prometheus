extends RigidBody2D
class_name Potion


@onready var tilemap: TileMap = $"../TileMap"

var is_thrown: bool = false
const stopping_range: float = 50.0

func initalize(impulse: Vector2):
	apply_central_impulse(impulse)
	is_thrown = true


func _physics_process(_delta):

	apply_torque(randf_range(-1000, 1000))
	if not is_thrown: 
		return
	if linear_velocity.x < stopping_range && linear_velocity.y  < stopping_range && linear_velocity.x > -stopping_range  &&  linear_velocity.y  > -stopping_range:
		var map_pos: Vector2 = tilemap.local_to_map(position  -  Vector2(64, 64))
		
		
		var pattern: TileMapPattern = tilemap.tile_set.get_pattern(0)
		tilemap.set_pattern(0, map_pos, pattern)
		queue_free()
