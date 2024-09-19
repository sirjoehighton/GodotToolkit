extends Node

func string_to_bool(INPUT : String) -> bool:
	var str = INPUT.strip_edges().to_lower()
	if str in ["true", "1", "yes"]:
		return true
	elif str in ["false", "0", "no"]:
		return false
	else:
		return false