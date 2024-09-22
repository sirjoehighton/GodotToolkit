extends Node

var error_dictionary = {
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
