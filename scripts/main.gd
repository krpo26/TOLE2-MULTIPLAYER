extends Node2D

var ip_field: LineEdit

func _ready() -> void:
	var args := OS.get_cmdline_user_args()
	Network.player_joined.connect(_spawn)
	Network.player_left.connect(_despawn)
	if "--server" in args:
		Network.host()
		print("Servidor escuchando en puerto ", Network.PORT)
		return
	_build_menu()

func _build_menu() -> void:
	var ui := CanvasLayer.new()
	add_child(ui)
	var box := VBoxContainer.new()
	box.position = Vector2(40, 40)
	ui.add_child(box)
	ip_field = LineEdit.new()
	ip_field.text = "127.0.0.1"
	box.add_child(ip_field)
	var b1 := Button.new(); b1.text = "Crear partida"
	b1.pressed.connect(func(): Network.host(); _spawn(1); box.hide())
	box.add_child(b1)
	var b2 := Button.new(); b2.text = "Unirse"
	b2.pressed.connect(func():
		Network.join(ip_field.text)
		multiplayer.connected_to_server.connect(func(): _spawn(multiplayer.get_unique_id()))
		box.hide())
	box.add_child(b2)

func _spawn(id: int) -> void:
	if has_node(str(id)): return
	var p := CharacterBody2D.new()
	p.set_script(load("res://scripts/player.gd"))
	p.name = str(id)
	p.position = Vector2(200 + randi() % 400, 300)
	add_child(p)

func _despawn(id: int) -> void:
	if has_node(str(id)): get_node(str(id)).queue_free()
