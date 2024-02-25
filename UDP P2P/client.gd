class_name udpclient
extends Node

var client:PacketPeerUDP = null
var server_address = "127.0.0.1"
var port = 8080

func _ready():
	client = PacketPeerUDP.new()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		client.set_dest_address(server_address, port)
		client.put_packet("Hello from client!".to_utf8_buffer())
		print("Sent message to server")
