extends Node

var error_dictionary : Dictionary = {
	0: {"name": "Ok", "description": "All systems go! No errors found here."},
	1: {"name": "Failed", "description": "Oops, something went wrong."},
	2: {"name": "Unavailable", "description": "The resource you're looking for isn't available."},
	3: {"name": "Unconfigured", "description": "Uh-oh, the setup isn't complete. Make sure you can configure this thing correctly."},
	4: {"name": "Unauthorized", "description": "You're not allowed to be in here!"},
	5: {"name": "Parameter Range Error", "description": "Whoa there! That parameter's out of range."},
	6: {"name": "Out of Memory", "description": "Running out of memory, time to do some cleanup!"},
	7: {"name": "File Not Found", "description": "Oh no! No file was found."},
	8: {"name": "File Bad Drive", "description": "Yikes! Bad drive error."},
	9: {"name": "File Bad Path", "description": "That path? Nope, doesn’t work."},
	10: {"name": "File No Permission", "description": "Access denied! You need permission to enter here."},
	11: {"name": "File Already in Use", "description": "No backseat driving! This file's already in use."},
	12: {"name": "File Can't Open", "description": "Can't seem to open that file."},
	13: {"name": "File Can't Write", "description": "Nope, can't write to that file."},
	14: {"name": "File Can't Read", "description": "It's all blurry! We can't read that file!"},
	15: {"name": "File Unrecognized", "description": "That file type? It's not recognized arround here."},
	16: {"name": "File Corrupt", "description": "Yikes, that file's corrupt!"},
	17: {"name": "File Missing Dependencies", "description": "Who misplaced these? We seem to be missing dependencies!"},
	18: {"name": "File EOF", "description": "End of file reached. That's all folks, that's a wrap!"},
	19: {"name": "Can't Open", "description": "Can't open this. What a bummer."},
	20: {"name": "Can't Create", "description": "Trying to create that? Nope can't do it."},
	21: {"name": "Query Failed", "description": "Query didn't go through. Try again!"},
	22: {"name": "Already in Use", "description": "It's busy! Seems to be already in use."},
	23: {"name": "Locked", "description": "Locked up tight, access denied."},
	24: {"name": "Timeout", "description": "Oops, timed out! Try again."},
	25: {"name": "Can't Connect", "description": "Can't connect to that connection."},
	26: {"name": "Can't Resolve", "description": "Can't resolve that. We should give it another shot!"},
	27: {"name": "Connection Error", "description": "Someone unplugged the network, connection error!"},
	28: {"name": "Can't Acquire Resource", "description": "Can't grab that resource right now."},
	29: {"name": "Can't Fork", "description": "Can't fork this process, what gives?"},
	30: {"name": "Invalid Data", "description": "Data looks invalid to me!"},
	31: {"name": "Invalid Parameter", "description": "Bad parameter! You should fix that up."},
	32: {"name": "Already Exists", "description": "That already exists. Try something else!"},
	33: {"name": "Does Not Exist", "description": "Sorry to say but that doesn't exist."},
	34: {"name": "Database Can't Read", "description": "Can't read from the database, Uh-oh!"},
	35: {"name": "Database Can't Write", "description": "Can't write to the database. Uh-oh!"},
	36: {"name": "Compilation Failed", "description": "Compilation failed."},
	37: {"name": "Method Not Found", "description": "Where'd that method go? Can't seem to find it anywhere."},
	38: {"name": "Link Failed", "description": "Linking failed. Let's try that again."},
	39: {"name": "Script Failed", "description": "Script didn't run. What happened?"},
	40: {"name": "Cyclic Link", "description": "Whoa! Cyclic link error."},
	41: {"name": "Invalid Declaration", "description": "That declaration? Sorry, it's invalid!"},
	42: {"name": "Duplicate Symbol", "description": "Duplicate symbol. You gotta make it unique!"},
	43: {"name": "Parse Error", "description": "Parse error. Something's off here."},
	44: {"name": "Busy", "description": "It's busy! Hold on."},
	45: {"name": "Skip", "description": "Seems we are skipping that action!"},
	46: {"name": "Help", "description": "I think it needs help, Send in the Medics!"},
	47: {"name": "Bug", "description": "Uh-oh, there's a bug; make sure to squash it!"},
	48: {"name": "Printer on Fire", "description": "Whoa! The Printer's on fire call the Fire Department. (Just kidding this one's an easter egg)"},
}

var http_result_code_dictionary : Dictionary = {
	0: {"name": "Success", "description": "Request successful."},
	1: {"name": "Chunked Body Size Mismatch", "description": "Chunked Body Size Mismatch."},
	2: {"name": "Can`t Connect", "description": "Request failed while connecting."},
	3: {"name": "Can`t Resolve", "description": "Request failed while resolving."},
	4: {"name": "Conection Error", "description": "Request failed due to connection (read/write) error."},
	5: {"name": "TLS Handshake Error", "description": "Request failed on TLS handshake."},
	6: {"name": "No Response", "description": "Request does not have a response (yet)."},
	7: {"name": "Body Size Limit Exceeded", "description": "Request exceeded its maximum size limit."},
	8: {"name": "Body Decompress Failed", "description": "Body Decompress Failed."},
	9: {"name": "Request Failed", "description": "Request failed."},
	10: {"name": "Download File Can't Open", "description": "HTTPRequest couldn't open the download file."},
	11: {"name": "Download File Write Error", "description": "HTTPRequest couldn't write to the download file."},
	12: {"name": "Redirect Limit Reached", "description": "Request reached its maximum redirect limit."},
	13: {"name": "Timeout", "description": "Request failed due to a timeout."},
}

## For Converting Strings to Booleans
func string_to_bool(INPUT : String) -> bool:
	var str = INPUT.strip_edges().to_lower()
	if str in ["true", "1", "yes"]:
		return true
	elif str in ["false", "0", "no"]:
		return false
	else:
		push_error("Invalid String To Boolean: " + INPUT)
		return false

## For Easily Logging Input's & Outputs
func input_and_output_log(INPUT,OUTPUT):
	print("INPUT : ",type_string(typeof(INPUT))," = ",str(INPUT)," | OUTPUT : ",type_string(typeof(OUTPUT))," = ",str(OUTPUT))

## For Looking up Error Code Names & Descriptions
func error_lookup(ERROR_CODE : int) -> Dictionary:
	if ERROR_CODE in error_dictionary:
		return error_dictionary[ERROR_CODE]
	else:
		return {"name": "ERR_UNKNOWN", "description": "No description available."}

## For Looking up HTTP Result Code Names & Descriptions
func http_result_code_lookup(RESULT_CODE : int) -> Dictionary:
	if RESULT_CODE in http_result_code_dictionary:
		return http_result_code_dictionary[RESULT_CODE]
	else:
		return {"name": "RESULT_UNKNOWN", "description": "No description available."}

## For making awaitable GET requests in one line of code
func http_get_request(url: String, custom_headers: PackedStringArray = PackedStringArray()) -> Dictionary:
	if not url:
		push_error("HTTPRequest URL Error: URL can't be empty")
		return {}
	var http = HTTPRequest.new()
	get_tree().root.call_deferred("add_child", http)
	await http.tree_entered
	var err = http.request(url, custom_headers)
	var response = await http.request_completed
	var parsed_dict = {
		"result": response[0],
		"response_code": response[1],
		"headers": response[2],
		"body": response[3],
		"json_body": JSON.parse_string(response[3].get_string_from_utf8())
	}
	http.queue_free()
	if err != OK:
		var error = error_lookup(err)
		var error_msg = "HTTPRequest %s: %s" % [error.name, error.description]
		push_error(error_msg)
	if parsed_dict.result != OK:
		var result_lookup = http_result_code_lookup(parsed_dict.result)
		var result_msg = "HTTPRequest %s: %s" % [result_lookup.name, result_lookup.description]
		push_error(result_msg)
	return parsed_dict

## For making awaitable POST requests in one line of code
func http_post_request(url: String, custom_headers: PackedStringArray = PackedStringArray(), payload: String = "") -> Dictionary:
	if not url:
		push_error("HTTPRequest URL Error: URL can't be empty")
		return {}
	var http = HTTPRequest.new()
	get_tree().root.call_deferred("add_child", http)
	await http.tree_entered
	var err = http.request(url, custom_headers, HTTPClient.METHOD_POST, payload)
	var response = await http.request_completed
	var parsed_dict = {
		"result": response[0],
		"response_code": response[1],
		"headers": response[2],
		"body": response[3],
		"json_body": JSON.parse_string(response[3].get_string_from_utf8())
	}
	http.queue_free()
	if err != OK:
		var error = error_lookup(err)
		var error_msg = "HTTPRequest %s: %s" % [error.name, error.description]
		push_error(error_msg)
	if parsed_dict.result != OK:
		var result_lookup = http_result_code_lookup(parsed_dict.result)
		var result_msg = "HTTPRequest %s: %s" % [result_lookup.name, result_lookup.description]
		push_error(result_msg)
	return parsed_dict

## For setting the volume of the corrosponding audio bus name
func set_audio_bus_volume(AUDIO_BUS_NAME : String, VOLUME_DB : float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(AUDIO_BUS_NAME), VOLUME_DB)

## For setting the current windowed window on the current screen is sat on to the center of that specific screen.
func center_window_to_screen():
	var DisplayScreenSize = DisplayServer.screen_get_size(DisplayServer.window_get_current_screen())
	var DisplayWindowSize = DisplayServer.window_get_size()
	DisplayServer.window_set_position(Vector2i(DisplayScreenSize.x - DisplayWindowSize.x, DisplayScreenSize.y - DisplayWindowSize.y) / 2)
