extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".add_item("only payoff")
	$".".add_item("payoff and health")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
