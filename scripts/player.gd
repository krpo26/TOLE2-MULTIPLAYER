extends CharacterBody2D
# Cada jugador controla solo su propio nodo y envía su posición a los demás.

const SPEED := 220.0

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func _physics_process(_delta: float) -> void:
	if is_multiplayer_authority():
		var dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = dir * SPEED
		move_and_slide()
		sync_pos.rpc(position)

@rpc("unreliable_ordered", "any_peer")
func sync_pos(p: Vector2) -> void:
	if not is_multiplayer_authority():
		position = p

func _draw() -> void:
	draw_circle(Vector2.ZERO, 16, Color.CORNFLOWER_BLUE if is_multiplayer_authority() else Color.ORANGE)
