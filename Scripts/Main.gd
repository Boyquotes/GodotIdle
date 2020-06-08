extends Node

export var count = 0

func _ready():
	$Necromancer.play()

func _process(_delta):
	$Spellpower.text = str(count)
