extends Node

export var avatar: NodePath

var _server := TCP_Server.new()
var _stream: StreamPeerTCP
var _avatar: Avatar

func _ready():
	_avatar = get_node(avatar)
	assert(_avatar != null, "Avatar NodePath does not point to a valid Avatar")
	open_connection()

func _exit_tree():
	_server.stop()
	if _stream != null:
		_stream.disconnect_from_host()

func _process(delta):
	if _stream != null:
		_update_values()
	elif _server.is_connection_available():
		_stream = _server.take_connection()
		print("Connected")

func open_connection() -> void:
	print("Waiting for connection...")
	_server.listen(Settings.port, Settings.ip_address)

func _update_values() -> void:
	if _stream.get_status() == StreamPeerTCP.STATUS_CONNECTED && _stream.get_available_bytes() > 0:
		var values := _stream.get_utf8_string(_stream.get_available_bytes()).split(" ", false)
		_avatar.set_values(float(values[0]), float(values[1]), float(values[2]), float(values[3]), \
				float(values[4]), float(values[5]), float(values[6]), float(values[7]))
