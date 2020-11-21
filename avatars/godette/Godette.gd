extends Avatar

const NECK_BONE_ID = 6
const HEAD_BONE_ID = 7

func set_values(roll: float, pitch: float, yaw: float, min_ear: float, mar: float, mdist: float, \
			eye_yaw: float, eye_pitch: float) -> void:
	_pose_body(roll, pitch, yaw)
	_pose_face(min_ear, mar, mdist, eye_yaw, eye_pitch)


func _pose_body(roll: float, pitch: float, yaw: float) -> void:
	var head_basis := Basis.IDENTITY
	head_basis = head_basis.rotated(Vector3(0, 1, 0), -deg2rad(roll/2))
	head_basis = head_basis.rotated(Vector3(1, 0, 0), -deg2rad(pitch/2))
	head_basis = head_basis.rotated(Vector3(0, 0, 1), -deg2rad(yaw/2))
	head_basis = head_basis.orthonormalized()
	$Skeleton.set_bone_custom_pose(NECK_BONE_ID, Transform(head_basis, Vector3.ZERO))
	$Skeleton.set_bone_custom_pose(HEAD_BONE_ID, Transform(head_basis, Vector3.ZERO))


func _pose_face(min_ear: float, mar: float, mdist: float, eye_pitch: float, eye_yaw: float) -> void:
	# We don't do anything here because the Godette model didn't come with any way to animate
	# her face, and I didn't bother to add any. I might do so later. You will want to do something
	# here on your own avatar.
	pass
