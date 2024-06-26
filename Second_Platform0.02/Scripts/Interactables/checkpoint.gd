extends Node2D
class_name Checkpoint

# A save point for the player

@export var spawnpoint : bool = false
@export var win_condition = false


var activated : bool = false

func _ready():
	if spawnpoint:
		activate()
	#If you wanna set a specific checkpoint at the start of the game
	#%Checkpoint.spawnpoint = true
	#activate()



func activate():
	if win_condition:
		GameManager.win()
	GameManager.current_checkpoint = self
	activated = true
	$AnimationPlayer.play("Activated")

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player && !activated :
		activate()
