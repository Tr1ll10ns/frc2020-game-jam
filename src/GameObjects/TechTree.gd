extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("TechTree/Row 1/TextureMine3/Mine3/LabelMine3").text = "Chromium\nMines"
	get_node("TechTree/Row 1/TextureMissile3/Missile3/LabelMissile3").text = "Ultimate\nMissiles"
	get_node("TechTree/Row 2/TextureMine2/Mine2/LabelMine2").text = "Titanium\nMines"
	get_node("TechTree/Row 2/TextureMissile2/Missile2/LabelMissile2").text = "Advanced\nMissiles"
	get_node("TechTree/Row 3/TextureMine1/Mine1/LabelMine1").text = "Iron\nMines"
	get_node("TechTree/Row 3/TextureMissile1/Missile1/LabelMine2").text = "Basic\nMissiles"
	get_node("TechTree/Middle Row/TexturePower3/Power3/LabelPower3").text = "Nuclear\nPower"
	get_node("TechTree/Middle Row/TexturePower2/Power2/LabelPower2").text = "Solar\nPower"
	get_node("TechTree/Middle Row/TexturePower1/Power1/LabelPower1").text = "Coal\nPower"
	get_node("TechTree/Middle Row/TextureShield1/Shield1/LabelShield1").text = "Basic\nShields"
	get_node("TechTree/Middle Row/TextureShield2/Shield2/LabelShield2").text = "Advanced\nShields"
	get_node("TechTree/Middle Row/TextureShield3/Shield3/LabelShield3").text = "Ultimate\nShields"
	get_node("TechTree/Row 4/TextureLaser1/Laser1/LabelLaser1").text = "Basic\nLasers"
	get_node("TechTree/Row 4/TextureScience1/Science1/LabelScience1").text = "Basic\nLabs"
	get_node("TechTree/Row 5/TextureLaser2/Laser2/LabelLaser2").text = "Advanced\nLasers"
	get_node("TechTree/Row 5/TextureScience2/Science2/LabelScience2").text = "Advanced\nLabs"
	get_node("TechTree/Row 6/TextureLaser3/Laser3/LabelLaser3").text = "Ultimate\nLasers"
	get_node("TechTree/Row 6/TextureScience3/Science3/LabelScience3").text = "Supreme\nLabs"
	pass

var tech_costs = {
	"mine": {
		"mine2": 100,
		"mine3": 300
	},
	"power": {
		"power2": 100,
		"power3": 200
	},
	"science": {
		"science2": 200,
		"science3": 400
	},
	"missile": {
		"missile2": 300,
		"missile3": 600
	},
	"laser": {
		"laser2": 250,
		"laser3": 500
	},
	"shield": {
		"shield2": 100,
		"shield3": 300
	}
}

func _on_Tech_pressed(tech_name):
	#Generic method for when a tech is pressed
	# Need to check:
	#	Is tech already unlocked
	#	Is tech the next tier (can't directly research Tier 3)
	print(tech_name)
	
	var can_research = is_tech_valid(tech_name)
	var popup: String
	
	if(can_research):
		popup = "ResearchPopup"
		#Set the player's selected tech to this
		PlayerData.new().selected_tech = tech_name.substr(0, tech_name.length() - 1).to_lower()
	else:
		popup = "ResearchFailedPopup"
	
	get_node(popup).set_info(tech_name)
	get_node(popup).popup_centered()
	pass

func is_tech_valid(tech):
	var tech_name = tech.substr(0, tech.length() - 1).to_lower()
	var tech_num = int(tech.substr(tech.length() - 1)) - 1
	
	if(PlayerData.new().tech_level[tech_name] + 1 == tech_num):
		return true
	else:
		return false
	pass