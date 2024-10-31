extends Node

# Constants for sound paths
const JumpScare = preload("res://media/jumpscare-sound.mp3")


@onready var sounds = $Players

func play_sound(sound):
	for x in sounds.get_children(): 
		# Gets sound players that are not busy and plays the selected sound
		# on them
		if not x.playing:
			x.stream = sound
			x.play()
			break
