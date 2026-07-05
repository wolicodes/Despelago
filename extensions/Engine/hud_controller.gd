extends "res://Engine/hud_controller.gd"

# MOD maps every room IDs to an ordered list, so that we can display user-friendly,
# sequential room numbers at the top right of the screen.
const ROOM_NUMBERS := {
	StagesEnum.stage_names.ZONE_1_1: {
		0: 1, 1: 2, 2: 3, 13: 4, 3: 5, 11: 6, 16: 7, 15: 8, 4: 9, 12: 10,
		5: 11, 6: 12, 17: 13, 18: 14, 22: 15, 7: 16, 8: 17, 9: 18, 10: 19,
		20: 20, 21: 21, 32: 22, 44: 23, 30: 24, 29: 25, 45: 26, 23: 27,
		46: 28, 47: 29,
	},
	StagesEnum.stage_names.ZONE_1_2: {
		0: 1, 49: 2, 50: 3, 24: 4, 25: 5, 27: 6, 26: 7, 12: 8, 39: 9, 34: 10,
		31: 11, 36: 12, 38: 13, 28: 14, 40: 15, 51: 16, 52: 17, 53: 18, 41: 19,
	},
	StagesEnum.stage_names.ZONE_2_1: {
		0: 1, 30: 2, 31: 3, 1: 4, 2: 5, 3: 6, 4: 7, 5: 8, 7: 9, 8: 10,
		9: 11, 52: 12, 53: 13, 54: 14, 55: 15, 56: 16,
	},
	StagesEnum.stage_names.ZONE_2_2: {
		0: 1, 10: 2, 11: 3, 12: 4, 13: 5, 16: 6, 14: 7, 15: 8, 17: 9, 27: 10,
		18: 11, 19: 12, 34: 13, 21: 14, 22: 15, 20: 16, 25: 17, 26: 18, 58: 19,
	},
	StagesEnum.stage_names.ZONE_2_3: {
		0: 1, 28: 2, 29: 3, 32: 4, 33: 5, 36: 6, 40: 7, 37: 8, 42: 9, 35: 10,
		39: 11, 38: 12, 48: 13, 49: 14, 50: 15, 45: 16, 44: 17,
	},
	StagesEnum.stage_names.ZONE_3_1: {
		0: 1, 1: 2, 2: 3, 3: 4, 4: 5, 5: 6, 6: 7, 7: 8, 8: 9, 9: 10,
		10: 11, 11: 12, 12: 13, 13: 14, 14: 15, 15: 16, 16: 17, 17: 18,
		19: 19, 20: 20, 21: 21, 22: 22, 23: 23, 24: 24, 63: 25,
	},
	StagesEnum.stage_names.ZONE_3_2: {
		0: 1, 25: 2, 26: 3, 27: 4, 33: 5, 29: 6, 30: 7, 31: 8, 32: 9, 28: 10,
		34: 11, 59: 12, 61: 13, 36: 14, 37: 15, 62: 16, 60: 17, 41: 18, 42: 19,
		53: 20,
	},
	StagesEnum.stage_names.ZONE_3_3: {
		0: 1, 46: 2, 39: 3, 40: 4, 44: 5, 45: 6, 47: 7, 48: 8, 49: 9, 51: 10,
		58: 11, 43: 12, 52: 13, 54: 14, 55: 15,
	},
}

const ZONE_LABELS := {
	StagesEnum.stage_names.ZONE_1_1: "1-1",
	StagesEnum.stage_names.ZONE_1_2: "1-2",
	StagesEnum.stage_names.ZONE_2_1: "2-1",
	StagesEnum.stage_names.ZONE_2_2: "2-2",
	StagesEnum.stage_names.ZONE_2_3: "2-3",
	StagesEnum.stage_names.ZONE_3_1: "3-1",
	StagesEnum.stage_names.ZONE_3_2: "3-2",
	StagesEnum.stage_names.ZONE_3_3: "3-3",
}

const SPECIAL_LABELS := {
	StagesEnum.stage_names.ZONE_3_1: {
		26: "You are here: <3",
	},
}

func updateRoomNumber(n):
	var special = SPECIAL_LABELS.get(StageManager.current_stage)
	if special != null and special.has(n):
		room_number_label.text = special[n]
		room_number_label.visible = true
		return

	var zone_map = ROOM_NUMBERS.get(StageManager.current_stage)
	if zone_map == null or not zone_map.has(n):
		room_number_label.visible = false
		return

	var zone_label = ZONE_LABELS.get(StageManager.current_stage, "")
	room_number_label.text = "%s Room %d" % [zone_label, zone_map[n]]
	room_number_label.visible = true
