extends Node
# Autoload "Network": servidor/cliente ENet con hasta 8 jugadores.

const PORT := 7777
const MAX_PLAYERS := 8

signal player_joined(id: int)
signal player_left(id: int)

func host() -> Error:
	var peer := ENetMultiplayerPeer.new()
	var err := peer.create_server(PORT, MAX_PLAYERS)
	if err == OK:
		multiplayer.multiplayer_peer = peer
		multiplayer.peer_connected.connect(func(id): player_joined.emit(id))
		multiplayer.peer_disconnected.connect(func(id): player_left.emit(id))
	return err

func join(ip: String) -> Error:
	var peer := ENetMultiplayerPeer.new()
	var err := peer.create_client(ip, PORT)
	if err == OK:
		multiplayer.multiplayer_peer = peer
		multiplayer.peer_connected.connect(func(id): player_joined.emit(id))
		multiplayer.peer_disconnected.connect(func(id): player_left.emit(id))
	return err
