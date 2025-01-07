extends CharacterBody3D

@export var speed = 4.0
@export var fall_acceleration = 7.0
@export var jump_impulse = 150.0
var jumping: int

func _physics_process(delta):
	var target_velocity = Vector3.ZERO
	var animation = "idle"
	
	if Input.is_action_pressed("ui_right"):
		rotate_y(-0.05)
		animation = "walk"
	
	if Input.is_action_pressed("ui_left"):
		rotate_y(0.05)
		animation = "walk"
		
	if Input.is_action_pressed("ui_up"):
		target_velocity -= transform.basis.z.normalized() * speed
		animation = "walk"
	
	if Input.is_action_pressed("ui_down"):
		target_velocity += transform.basis.z.normalized() * speed
		animation = "walk"
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			target_velocity.y = jump_impulse
			animation = "jump"
			jumping = target_velocity.y
		
		elif Input.is_action_pressed("atack"):
			animation = "atack"
			target_velocity = Vector3.ZERO
	else:
		target_velocity.y -= fall_acceleration
		animation = "fall"
	
	$Pivot/PlayerEtVarginha/AnimationPlayer.play(animation)
	velocity = lerp(velocity, target_velocity, 10 * delta)
	move_and_slide()
#func _physics_process(delta):
	#var direction = Vector3.ZERO
	#if Input.is_action_pressed("ui_right"):
		#direction.x += 1
	#if Input.is_action_pressed("ui_left"):
		#direction.x -= 1
	#if Input.is_action_pressed("ui_down"):
		#direction.z += 1
	#if Input.is_action_pressed("ui_up"):
		#direction.z -= 1
	#
	#if direction != Vector3.ZERO:
		#direction = direction.normalized()
		#$Pivot.basis = Basis.looking_at(direction)
		#$Pivot/PlayerEtVarginha/AnimationPlayer.speed_scale = 1.2
		#$Pivot/PlayerEtVarginha/AnimationPlayer.play("walk")
	#else:
		#$Pivot/PlayerEtVarginha/AnimationPlayer.speed_scale = 1
		#$Pivot/PlayerEtVarginha/AnimationPlayer.play("idle")
	#
	#if is_on_floor():
		#target_velocity.x = direction.x * speed
		#target_velocity.z = direction.z * speed
		#
		#if Input.is_action_just_pressed("ui_accept"):
			#target_velocity.y = jump_impulse
			#$Pivot/PlayerEtVarginha/AnimationPlayer.play("jump")
		#elif Input.is_action_pressed("atack"):
			#$Pivot/PlayerEtVarginha/AnimationPlayer.play("atack")
			#target_velocity = Vector3.ZERO
	#else:
		#target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		#$Pivot/PlayerEtVarginha/AnimationPlayer.play("fall")
#
	## Moving the Character
	#velocity = target_velocity
#
	#move_and_slide()
	## $Pivot.rotation.x = PI / 6 * velocity.y / jump_impulse
