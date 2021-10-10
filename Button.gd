extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var benefStr
var benefiArr = []
var costStr
var costArr = []
var probStr
var probArr = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var num = 0
	global.gType = 1 + $"../OptionButton".selected
	global.nTry = $"../SpinBox".value
	benefStr = $"../LineEdit".text
	benefiArr = benefStr.split_floats(",")
	for i in benefiArr:
		if i < 0.0 or i > 15.0:
			num = 1
			$"../RichTextLabel4".text = "Benefit Value(s) breach limits"
	global.benefits = benefiArr
	costStr = $"../LineEdit2".text
	costArr = costStr.split_floats(",")
	for j in costArr:
		if j < 0.0 or j > 15.0:
			num = 1
			$"../RichTextLabel4".text = "Cost Value(s) breach limits"
	global.costs = costArr
	probStr = $"../LineEdit3".text
	probArr = probStr.split_floats(",")
	for k in probArr.size():
		probArr[k] = floor(probArr[k])
		if probArr[k] < 0.0 or probArr[k] > 100.0:
			num = 1
			$"../RichTextLabel4".text = "Probability Value(s) breach limits"
	global.probs = probArr
	if global.benefits.size() != global.nTry or global.costs.size() != global.nTry or global.probs.size() != global.nTry:
		num = 1
		$"../RichTextLabel4".text = "Mismatch between the number of trials and the number of parameter values"
	if num == 0:
		get_tree().change_scene("res://Node2D.tscn")
