extends CanvasLayer

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("player_fail", Callable(self, "_on_player_fail"))
	Events.connect("player_cheat", Callable(self, "_on_player_cheat"))
	Events.connect("jumpscare", Callable(self, "_on_jumpscare"))
	animation_player.play("Clear")


func _on_jumpscare():
	animation_player.play("Clear")
	# Add a global var for which jumpcare to play
	animation_player.play("Not-Scary")
	
func _on_player_cheat():
	animation_player.play("Clear")
	animation_player.play("Cheat")
	
func _on_player_fail():
	animation_player.play("Clear")
	animation_player.play("Fail")
