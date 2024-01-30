extends RayCast3D

var obj = null
var key = KEY_E
var last = Vector3.ZERO
@onready var point = $"../Hold"

func _process(delta):
	if Input.is_key_pressed(key):
		if obj == null:
			var collider = get_collider()
			if collider != null:
				if collider.is_in_group("grab"):
					obj = collider
		
		if obj != null:
			last = obj.global_position
			obj.position = point.global_position
			if obj.is_class("RigidBody3D"):
				obj.linear_velocity = Vector3.ZERO
	else:
		if obj != null:
			if obj.is_class("RigidBody3D"):
				print("rigid")
				var velocity = obj.position - last
				obj.linear_velocity = velocity * 15
		obj = null
		










