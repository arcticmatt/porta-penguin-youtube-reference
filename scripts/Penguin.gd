extends RigidBody2D

const UP_IMPULSE = -55

func _ready():
	collision_layer = CollisionLayers.Layers.PENGUIN
	collision_mask = 0
	set_collision_mask_bit(CollisionLayers.Layers.WALL, true)

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_select"):
			_penguin_jump()
			
func _penguin_jump():
	set_linear_velocity(Vector2(0, 0))
	apply_central_impulse(Vector2(0, UP_IMPULSE))
	$FlapAnimationPlayer.stop()
	$FlapAnimationPlayer.play("Flap", -1, 1)
