extends Node3D

@onready var player: CharacterBody3D = $Characters/PlayerETVarginha
@onready var camera = $Environment/Camera3D


func _process(delta):
	var pos = player.position.lerp(player.transform.basis.z.normalized() * 300, 0.01)
	pos.y = 2.0
	var direction = Vector3.ZERO
	direction -= player.transform.basis.z.normalized()
	if direction != Vector3.ZERO:
		camera.position = camera.position.lerp(pos, 0.1)
		camera.basis = lerp(camera.basis, Basis.looking_at(direction), 0.1)
