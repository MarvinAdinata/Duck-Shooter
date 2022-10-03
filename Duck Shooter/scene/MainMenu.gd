extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var winsizex = OS.window_size.x - 300
var winsizey = OS.window_size.y - 300


# Called when the node enters the scene tree for the first time.
func _ready():
	moveVideo()
	pass # Replace with function body.

func _process(delta):
	if !$MainMenuVideo.is_playing():
		$MainMenuVideo.play()
	
	
	pass
	
func moveVideo():
	$MainMenuVideo.set_position(Vector2(rng.randi_range(0, winsizex), rng.randi_range(0, winsizey)))

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartText_mouse_entered():
	$MenuContainer/StartText.modulate = Color(1, 1, 1, 0.498039)
	$MouseHoverSfx.play()
	pass # Replace with function body.


func _on_OptionText_mouse_entered():
	$MenuContainer/OptionText.modulate = Color(1, 1, 1, 0.498039)
	$MouseHoverSfx.play()	
	pass # Replace with function body.


func _on_QuitText_mouse_entered():
	$MenuContainer/QuitText.modulate = Color(1, 1, 1, 0.498039)
	$MouseHoverSfx.play()	
	pass # Replace with function body.


func _on_StartText_mouse_exited():
	$MenuContainer/StartText.modulate = Color(1, 1, 1, 1)
	pass # Replace with function body.


func _on_OptionText_mouse_exited():
	$MenuContainer/OptionText.modulate = Color(1, 1, 1, 1)
	pass # Replace with function body.


func _on_QuitText_mouse_exited():
	$MenuContainer/QuitText.modulate = Color(1, 1, 1, 1)
	pass # Replace with function body.


func _on_StartText_gui_input(event):
	if event is InputEventMouseButton:
		get_tree().change_scene("res://scene/Main.tscn")
		print("ASD")
	pass # Replace with function body.


func _on_OptionText_gui_input(event):
	if event is InputEventMouseButton:
		print("ASD")
	pass # Replace with function body.


func _on_QuitText_gui_input(event):
	if event is InputEventMouseButton:
		get_tree().quit()
	pass # Replace with function body.


func _on_VideoPosTimer_timeout():
	moveVideo()
	pass # Replace with function body.
