extends CanvasLayer

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("player_fail", Callable(self, "_on_player_fail"))
	Events.connect("player_cheat", Callable(self, "_on_player_cheat"))
	Events.connect("jumpscare", Callable(self, "_on_jumpscare"))
	animation_player.play("Clear")

# Emits a signal when you hit enter or space
signal continued
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		continued.emit()

func _on_jumpscare():
	animation_player.play("Clear")
	if GlobalVars.game_mode == "scare":
		animation_player.play("Scary")
		SoundPlayer.play_sound(SoundPlayer.JumpScare)
	elif GlobalVars.game_mode == "no-scare":
		animation_player.play("Not-Scary")
	await continued # Waits for signal when you die
	restart()
	
func _on_player_cheat():
	animation_player.play("Clear")
	animation_player.play("Cheat")
	await continued # Waits for signal when you die
	restart()
	
func _on_player_fail():
	animation_player.play("Clear")
	animation_player.play("Fail")
	await continued # Waits for signal when you die
	restart()

func restart():
	animation_player.play("Clear")
	get_tree().change_scene_to_file("res://scenes/lvl_1.tscn") # Changes to next level
