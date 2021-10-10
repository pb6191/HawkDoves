extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var healthNum = 100
var foodDays = 0
var oppChoice
var totalDays = 0
var totalPayoff = 0.0
var counter = 0
var foodArr = global.benefits
var costArr = global.costs
var probArr = global.probs
var numTrials = global.nTry
var arr1 = []
var arr2 = []
var arr3 = []
var arr4 = []
var arr5 = []
var arr6 = []
var arr7 = []
var arr8 = []
var gameType = global.gType

# Called when the node enters the scene tree for the first time.
func _ready():
	if gameType == 1:
		$"foodText".visible = false
		$"surviveText".visible = false
		$"healthText".visible = false
		$"healthBar".visible = false
	else:
		$"RichTextLabel".visible = false
	for i in foodArr.size():
		arr1.append(foodArr[i]/2)
		arr2.append(foodArr[i]/2)
		arr3.append(foodArr[i])
		arr4.append(0)
		arr5.append(0)
		arr6.append(foodArr[i])
		if gameType == 1:
			arr7.append((foodArr[i]-costArr[i])/2)
			arr8.append((foodArr[i]-costArr[i])/2)
		else:
			arr7.append(foodArr[i]/2)
			arr8.append(foodArr[i]/2)
	$"healthBar".value = healthNum
	$"healthBar3".value = foodArr[counter]*100/15
	$"healthBar2".value = costArr[counter]*100/15
	$"ItemList".add_item(" ", null, false)
	$"ItemList".add_item("Choice earnings", null, false)
	$"ItemList".set_item_custom_fg_color(1, Color(1, 1, 1, 1))
	$"ItemList".add_item("You share", null, false)
	$"ItemList".add_item("You fight", null, false)
	$"ItemList".set_item_custom_fg_color(2, Color(1, 1, 0, 1))
	$"ItemList".set_item_custom_fg_color(3, Color(1, 1, 0, 1))
	
	$"ItemList2".add_item(str(probArr[counter]), null, false)
	$"ItemList2".set_item_custom_fg_color(0, Color(0, 0, 1, 1))
	$"ItemList2".add_item(" ", null, false)
	$"ItemList2".add_item("Partner", null, false)
	$"ItemList2".set_item_custom_fg_color(2, Color(1, 0, 1, 1))
	$"ItemList2".add_item("shares", null, false)
	$"ItemList2".set_item_custom_fg_color(3, Color(1, 0, 1, 1))
	$"ItemList2".add_item(str(arr1[counter])+",", null, false)
	$"ItemList2".add_item(str(arr2[counter])+"", null, false)
	$"ItemList2".add_item(str(arr3[counter])+",", null, false)
	$"ItemList2".add_item(str(arr4[counter])+"", null, false)
	$"ItemList2".set_item_custom_fg_color(4, Color(1, 1, 0, 1))
	$"ItemList2".set_item_custom_fg_color(6, Color(1, 1, 0, 1))
	$"ItemList2".set_item_custom_fg_color(5, Color(1, 0, 1, 1))
	$"ItemList2".set_item_custom_fg_color(7, Color(1, 0, 1, 1))
	
	$"ItemList3".add_item(str(100.0-probArr[counter]), null, false)
	$"ItemList3".set_item_custom_fg_color(0, Color(0, 0, 1, 1))
	$"ItemList3".add_item(" ", null, false)
	$"ItemList3".add_item("Partner", null, false)
	$"ItemList3".set_item_custom_fg_color(2, Color(1, 0, 1, 1))
	$"ItemList3".add_item("fights", null, false)
	$"ItemList3".set_item_custom_fg_color(3, Color(1, 0, 1, 1))
	$"ItemList3".add_item(str(arr5[counter])+",", null, false)
	$"ItemList3".add_item(str(arr6[counter])+"", null, false)
	$"ItemList3".add_item(str(arr7[counter])+",", null, false)
	$"ItemList3".add_item(str(arr8[counter])+"", null, false)
	$"ItemList3".set_item_custom_fg_color(4, Color(1, 1, 0, 1))
	$"ItemList3".set_item_custom_fg_color(6, Color(1, 1, 0, 1))
	$"ItemList3".set_item_custom_fg_color(5, Color(1, 0, 1, 1))
	$"ItemList3".set_item_custom_fg_color(7, Color(1, 0, 1, 1))

	#$"ItemList".set_item_icon(11, load("res://shareBackground.png"))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func choseHawk():
	$"Button".visible = true
	#$"instr".visible = false
	$"healthBar2".visible = false
	$"healthBar3".visible = false
	$"healthText2".visible = false
	$"healthText3".visible = false
	$"ItemList".visible = false
	$"ItemList2".visible = false
	$"ItemList3".visible = false
	$"choiceHawk".visible = false
	$"youHawk".visible = true
	$"choiceDove".visible = false
	$"youWere".visible = true
	$"oppWas".visible = true
	rng.randomize()
	oppChoice = rng.randi_range(1, 100)
	if (oppChoice) > (probArr[counter]):
		$"oppHawk".visible = true
		foodDays = foodDays + arr7[counter]
		totalPayoff = totalPayoff + arr7[counter]
		$"RichTextLabel".text = "Total Payoff: "+str(totalPayoff)
		$"foodText".text = "You have food for "+str(foodDays)+" days"
		healthNum = healthNum - costArr[counter]
		$"healthBar".value = healthNum
	else:
		$"oppDove".visible = true
		foodDays = foodDays + arr3[counter]
		totalPayoff = totalPayoff + arr3[counter]
		$"RichTextLabel".text = "Total Payoff: "+str(totalPayoff)
		$"foodText".text = "You have food for "+str(foodDays)+" days"
	if counter == (arr1.size() - 1):
		counter = 0
	else:
		counter = counter + 1
	$"ItemList2".set_item_text(4, str(arr1[counter])+",")
	$"ItemList2".set_item_text(5, str(arr2[counter])+"")
	$"ItemList2".set_item_text(6, str(arr3[counter])+",")
	$"ItemList2".set_item_text(7, str(arr4[counter])+"")
	$"ItemList3".set_item_text(4, str(arr5[counter])+",")
	$"ItemList3".set_item_text(5, str(arr6[counter])+"")
	$"ItemList3".set_item_text(6, str(arr7[counter])+",")
	$"ItemList3".set_item_text(7, str(arr8[counter])+"")
	$"ItemList2".set_item_text(0, str(probArr[counter])+"")
	$"ItemList3".set_item_text(0, str(100.0-probArr[counter])+"")
	$"healthBar3".value = foodArr[counter]*100/15
	$"healthBar2".value = costArr[counter]*100/15

func choseDove():
	$"Button".visible = true
	#$"instr".visible = false
	$"healthBar2".visible = false
	$"healthBar3".visible = false
	$"healthText2".visible = false
	$"healthText3".visible = false
	$"ItemList".visible = false
	$"ItemList2".visible = false
	$"ItemList3".visible = false
	$"choiceHawk".visible = false
	$"youDove".visible = true
	$"choiceDove".visible = false
	$"youWere".visible = true
	$"oppWas".visible = true
	rng.randomize()
	oppChoice = rng.randi_range(1, 100)
	if (oppChoice) > (probArr[counter]):
		$"oppHawk".visible = true
		foodDays = foodDays + arr5[counter]
		totalPayoff = totalPayoff + arr5[counter]
		$"RichTextLabel".text = "Total Payoff: "+str(totalPayoff)
		$"foodText".text = "You have food for "+str(foodDays)+" days"
	else:
		$"oppDove".visible = true
		foodDays = foodDays + arr1[counter]
		totalPayoff = totalPayoff + arr1[counter]
		$"RichTextLabel".text = "Total Payoff: "+str(totalPayoff)
		$"foodText".text = "You have food for "+str(foodDays)+" days"
	if counter == (arr1.size() - 1):
		counter = 0
	else:
		counter = counter + 1
	$"ItemList2".set_item_text(4, str(arr1[counter])+",")
	$"ItemList2".set_item_text(5, str(arr2[counter])+"")
	$"ItemList2".set_item_text(6, str(arr3[counter])+",")
	$"ItemList2".set_item_text(7, str(arr4[counter])+"")
	$"ItemList3".set_item_text(4, str(arr5[counter])+",")
	$"ItemList3".set_item_text(5, str(arr6[counter])+"")
	$"ItemList3".set_item_text(6, str(arr7[counter])+",")
	$"ItemList3".set_item_text(7, str(arr8[counter])+"")
	$"ItemList2".set_item_text(0, str(probArr[counter])+"")
	$"ItemList3".set_item_text(0, str(100.0-probArr[counter])+"")
	$"healthBar3".value = foodArr[counter]*100/15
	$"healthBar2".value = costArr[counter]*100/15


func _on_choiceHawk_gui_input(event):
	if event.is_action("leftClk"):
		choseHawk()


func _on_choiceDove_gui_input(event):
	if event.is_action("leftClk"):
		choseDove()


func _on_Button_gui_input(event):
	if event.is_action("leftClk"):
		$"Button".visible = false
		#$"instr".visible = true
		if counter != 0:
			$"healthBar2".visible = true
			$"healthBar3".visible = true
			$"healthText2".visible = true
			$"healthText3".visible = true
			$"ItemList".visible = true
			$"ItemList2".visible = true
			$"ItemList3".visible = true
			$"choiceHawk".visible = true
			$"choiceDove".visible = true
		$"oppHawk".visible = false
		$"oppDove".visible = false
		$"youHawk".visible = false
		$"youDove".visible = false
		$"youWere".visible = false
		$"oppWas".visible = false
		if foodDays == 0:
			healthNum = healthNum - costArr[counter]
			$"healthBar".value = healthNum
		else:
			foodDays = foodDays - 1
			$"foodText".text = "You have food for "+str(foodDays)+" days"
		healthNum = healthNum + 1
		$"healthBar".value = healthNum
		totalDays = totalDays + 1
		$"surviveText".text = "You survived for "+str(totalDays)+" days"
		if (healthNum <= 0):
			died()

func died():
	$"Button".visible = false
	#$"instr".visible = false
	$"healthBar2".visible = false
	$"healthBar3".visible = false
	$"healthText2".visible = false
	$"healthText3".visible = false
	$"ItemList".visible = false
	$"ItemList2".visible = false
	$"ItemList3".visible = false
	$"choiceHawk".visible = false
	$"oppHawk".visible = false
	$"oppDove".visible = false
	$"youHawk".visible = false
	$"youDove".visible = false
	$"choiceDove".visible = false
	$"youWere".visible = false
	$"oppWas".visible = false
	$"died".visible = true


func _on_ItemList_item_selected(index):
	if index == 2:
		choseDove()
	if index == 3:
		choseHawk()


func _on_Button2_pressed():
	get_tree().change_scene("res://Menu.tscn")
