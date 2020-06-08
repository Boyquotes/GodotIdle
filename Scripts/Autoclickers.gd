extends Node

export var amount = 0
export var cost = 0
export var spellpower_per_second = 0

func _ready():
	$ClickerAmount.text = str(amount)

func _process(_delta):
	$Price.text = "Price: " + str(cost)
	$ClickerAmount.text = str(amount)
	$SPPSValue.text = str(amount * spellpower_per_second)
	if (get_parent().count >= cost):
		$AutoClickerButton.set_disabled(false)
	else:
		$AutoClickerButton.set_disabled(true)

func _on_AutoClickerButton_pressed():
	if (get_parent().count >= cost):
		amount += 1
		$ClickerAmount.text = str(amount)
		get_parent().count -= cost
		cost += 1 + int(cost * 0.05)

func _on_Timer_timeout():
	get_parent().count += amount * spellpower_per_second
