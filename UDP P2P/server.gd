class_name udpserver
extends Node

var server:UDPServer = null
var port = 8080
var peers:Array[PacketPeerUDP]= []

func _ready():
	server = UDPServer.new()
	print_debug(server.listen(port))

func _process(delta):
	server.poll() # Important!
	if server.is_connection_available():
		var peer: PacketPeerUDP = server.take_connection()
		
		print("Accepted peer: %s:%s" % [peer.get_packet_ip(), peer.get_packet_port()])
		# Keep a reference so we can keep contacting the remote peer.
		peers.append(peer)

	for i in range(0, peers.size()):
		var packet = peers[i].get_packet()
		if (packet.size()):
			print("Received data: %s" % [packet.get_string_from_utf8()])
		
		pass # Do something with the connected peers.
