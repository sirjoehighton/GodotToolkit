extends Node

func _ready() -> void:
	error_lookup_function_validation()

func error_lookup_function_validation():
	for error_code in Toolkit.error_dictionary.keys():
		var error_info = Toolkit.error_dictionary[error_code]
		print("Error Code: ", error_code, " | Name: ", error_info.name, " | Description: ", error_info.description)
