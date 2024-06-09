extends Button

@onready var level: Level = $".."
@onready var audio: Node = $"../Audio"

func _on_pressed():
	if level.isPlayable:
		audio.get_node("Click").play()
		GlobalData.current_level = level.number
		SceneTransition.load_scene(level.battleScene)
		print("Level pressed: " + str(GlobalData.current_level))
	
func _on_mouse_entered():
	audio.get_node("Hover").play()
	labelVisibility(true)
		
func _on_mouse_exited():
	labelVisibility(false)
		
func labelVisibility(visibility: bool) -> void:
	level.label.visible = visibility
	if level.isBossBattle:
		level.boss.visible = visibility
	else:
		level.normal.visible = visibility
