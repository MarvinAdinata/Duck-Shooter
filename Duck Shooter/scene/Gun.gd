extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$GunLingerTime.start()
	$ShotSound.play()
	pass


func _on_GunLingerTime_timeout():
	remove_child($GunArea)
	remove_child($GunAnim)
	$GunLingerTime.stop()
	pass # Replace with function body.


func _on_ShotSound_finished():
	queue_free()
	pass # Replace with function body.
