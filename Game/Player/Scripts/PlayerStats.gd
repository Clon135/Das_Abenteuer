extends CanvasLayer

var health
var klasse

func add_live(health):
	
	if klasse == "magier" || klasse == "elf":
		if health == 1:
			$MediumHealth/Hearts/Heart1.add_heart()
		if health == 2:
			$MediumHealth/Hearts/Heart1.add_heart()
			$MediumHealth/Hearts/Heart2.add_heart()
		if health == 3:
			$MediumHealth/Hearts/Heart1.add_heart()
			$MediumHealth/Hearts/Heart2.add_heart()
			$MediumHealth/Hearts/Heart3.add_heart()
		if health == 4:
			$MediumHealth/Hearts/Heart1.add_heart()
			$MediumHealth/Hearts/Heart2.add_heart()
			$MediumHealth/Hearts/Heart3.add_heart()
			$MediumHealth/Hearts/Heart4.add_heart()
		if health == 5:
			$MediumHealth/Hearts/Heart1.add_heart()
			$MediumHealth/Hearts/Heart2.add_heart()
			$MediumHealth/Hearts/Heart3.add_heart()
			$MediumHealth/Hearts/Heart4.add_heart()
			$MediumHealth/Hearts/Heart5.add_heart()
	if klasse == "ritter":
		if health == 1:
			$HighHealth/Hearts/Heart1.add_heart()
		if health == 2:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
		if health == 3:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
		if health == 4:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
			$HighHealth/Hearts/Heart4.add_heart()
		if health == 5:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
			$HighHealth/Hearts/Heart4.add_heart()
			$HighHealth/Hearts/Heart5.add_heart()
		if health == 6:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
			$HighHealth/Hearts/Heart4.add_heart()
			$HighHealth/Hearts/Heart5.add_heart()
			$HighHealth/Hearts/Heart6.add_heart()
		if health == 7:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
			$HighHealth/Hearts/Heart4.add_heart()
			$HighHealth/Hearts/Heart5.add_heart()
			$HighHealth/Hearts/Heart6.add_heart()
			$HighHealth/Hearts/Heart7.add_heart()
		if health == 8:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
			$HighHealth/Hearts/Heart4.add_heart()
			$HighHealth/Hearts/Heart5.add_heart()
			$HighHealth/Hearts/Heart6.add_heart()
			$HighHealth/Hearts/Heart7.add_heart()
			$HighHealth/Hearts/Heart8.add_heart()

func sub_live(health):
	
	if klasse == "magier" || klasse == "elf":
		if health == 0:
			$MediumHealth/Hearts/Heart1.sub_heart()
			$MediumHealth/Hearts/Heart2.sub_heart()
			$MediumHealth/Hearts/Heart3.sub_heart()
			$MediumHealth/Hearts/Heart4.sub_heart()
			$MediumHealth/Hearts/Heart5.sub_heart()
		if health == 1:
			$MediumHealth/Hearts/Heart2.sub_heart()
			$MediumHealth/Hearts/Heart3.sub_heart()
			$MediumHealth/Hearts/Heart4.sub_heart()
			$MediumHealth/Hearts/Heart5.sub_heart()
		if health == 2:
			$MediumHealth/Hearts/Heart3.sub_heart()
			$MediumHealth/Hearts/Heart4.sub_heart()
			$MediumHealth/Hearts/Heart5.sub_heart()
		if health == 3:
			$MediumHealth/Hearts/Heart4.sub_heart()
			$MediumHealth/Hearts/Heart5.sub_heart()
		if health == 4:
			$MediumHealth/Hearts/Heart5.sub_heart()
	if klasse == "ritter":
		if health == 0:
			$HighHealth/Hearts/Heart1.sub_heart()
			$HighHealth/Hearts/Heart2.sub_heart()
			$HighHealth/Hearts/Heart3.sub_heart()
			$HighHealth/Hearts/Heart4.sub_heart()
			$HighHealth/Hearts/Heart5.sub_heart()
			$HighHealth/Hearts/Heart6.sub_heart()
			$HighHealth/Hearts/Heart7.sub_heart()
			$HighHealth/Hearts/Heart8.sub_heart()
		if health == 1:
			$HighHealth/Hearts/Heart2.sub_heart()
			$HighHealth/Hearts/Heart3.sub_heart()
			$HighHealth/Hearts/Heart4.sub_heart()
			$HighHealth/Hearts/Heart5.sub_heart()
			$HighHealth/Hearts/Heart6.sub_heart()
			$HighHealth/Hearts/Heart7.sub_heart()
			$HighHealth/Hearts/Heart8.sub_heart()
		if health == 2:
			$HighHealth/Hearts/Heart3.sub_heart()
			$HighHealth/Hearts/Heart4.sub_heart()
			$HighHealth/Hearts/Heart5.sub_heart()
			$HighHealth/Hearts/Heart6.sub_heart()
			$HighHealth/Hearts/Heart7.sub_heart()
			$HighHealth/Hearts/Heart8.sub_heart()
		if health == 3:
			$HighHealth/Hearts/Heart4.sub_heart()
			$HighHealth/Hearts/Heart5.sub_heart()
			$HighHealth/Hearts/Heart6.sub_heart()
			$HighHealth/Hearts/Heart7.sub_heart()
			$HighHealth/Hearts/Heart8.sub_heart()
		if health == 4:
			$HighHealth/Hearts/Heart5.sub_heart()
			$HighHealth/Hearts/Heart6.sub_heart()
			$HighHealth/Hearts/Heart7.sub_heart()
			$HighHealth/Hearts/Heart8.sub_heart()
		if health == 5:
			$HighHealth/Hearts/Heart6.sub_heart()
			$HighHealth/Hearts/Heart7.sub_heart()
			$HighHealth/Hearts/Heart8.sub_heart()
		if health == 6:
			$HighHealth/Hearts/Heart7.sub_heart()
			$HighHealth/Hearts/Heart8.sub_heart()
		if health == 7:
			$HighHealth/Hearts/Heart8.sub_heart()

func load_in(_klasse, _gender):
	
	klasse = _klasse
	
	if _klasse == "elf" || _klasse == "magier":
		
		health = 5
	elif _klasse == "ritter":
		
		health = 8
	
	if _klasse == "magier" || _klasse == "elf":
		$MediumHealth.visible = true
		$HighHealth.visible = false
		if health == 1:
			$MediumHealth/Hearts/Heart1.add_heart()
		if health == 2:
			$MediumHealth/Hearts/Heart1.add_heart()
			$MediumHealth/Hearts/Heart2.add_heart()
		if health == 3:
			$MediumHealth/Hearts/Heart1.add_heart()
			$MediumHealth/Hearts/Heart2.add_heart()
			$MediumHealth/Hearts/Heart3.add_heart()
		if health == 4:
			$MediumHealth/Hearts/Heart1.add_heart()
			$MediumHealth/Hearts/Heart2.add_heart()
			$MediumHealth/Hearts/Heart3.add_heart()
			$MediumHealth/Hearts/Heart4.add_heart()
		if health == 5:
			$MediumHealth/Hearts/Heart1.add_heart()
			$MediumHealth/Hearts/Heart2.add_heart()
			$MediumHealth/Hearts/Heart3.add_heart()
			$MediumHealth/Hearts/Heart4.add_heart()
			$MediumHealth/Hearts/Heart5.add_heart()
	if _klasse == "ritter":
		$HighHealth.visible = true
		$MediumHealth.visible = false
		if health == 1:
			$HighHealth/Hearts/Heart1.add_heart()
		if health == 2:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
		if health == 3:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
		if health == 4:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
			$HighHealth/Hearts/Heart4.add_heart()
		if health == 5:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
			$HighHealth/Hearts/Heart4.add_heart()
			$HighHealth/Hearts/Heart5.add_heart()
		if health == 6:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
			$HighHealth/Hearts/Heart4.add_heart()
			$HighHealth/Hearts/Heart5.add_heart()
			$HighHealth/Hearts/Heart6.add_heart()
		if health == 7:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
			$HighHealth/Hearts/Heart4.add_heart()
			$HighHealth/Hearts/Heart5.add_heart()
			$HighHealth/Hearts/Heart6.add_heart()
			$HighHealth/Hearts/Heart7.add_heart()
		if health == 8:
			$HighHealth/Hearts/Heart1.add_heart()
			$HighHealth/Hearts/Heart2.add_heart()
			$HighHealth/Hearts/Heart3.add_heart()
			$HighHealth/Hearts/Heart4.add_heart()
			$HighHealth/Hearts/Heart5.add_heart()
			$HighHealth/Hearts/Heart6.add_heart()
			$HighHealth/Hearts/Heart7.add_heart()
			$HighHealth/Hearts/Heart8.add_heart()

func new_objektiv(_objektiv):
	if _objektiv != "":
		$Objektiv.show()
		$Objektiv.text = str(_objektiv)
	else:
		$Objektiv.hide()
		$Objektiv.text = str(_objektiv)


































