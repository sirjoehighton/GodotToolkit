extends Node

var error_dictionary = {
	0: {"name": "OK", "description": "No errors found here."},
	1: {"name": "FAILED", "description": "A generic error occurred."},
	2: {"name": "ERR_UNAVAILABLE", "description": "The requested resource is unavailable."},
	3: {"name": "ERR_UNCONFIGURED", "description": "The configuration is incomplete."},
	4: {"name": "ERR_UNAUTHORIZED", "description": "Unauthorized access."},
	5: {"name": "ERR_PARAMETER_RANGE_ERROR", "description": "Parameter out of range."},
	6: {"name": "ERR_OUT_OF_MEMORY", "description": "Out of memory."},
	7: {"name": "ERR_FILE_NOT_FOUND", "description": "File not found."},
	8: {"name": "ERR_FILE_BAD_DRIVE", "description": "Bad drive error."},
	9: {"name": "ERR_FILE_BAD_PATH", "description": "Bad path error."},
	10: {"name": "ERR_FILE_NO_PERMISSION", "description": "No permission to access the file."},
	11: {"name": "ERR_FILE_ALREADY_IN_USE", "description": "File already in use."},
	12: {"name": "ERR_FILE_CANT_OPEN", "description": "Can't open the file."},
	13: {"name": "ERR_FILE_CANT_WRITE", "description": "Can't write to the file."},
	14: {"name": "ERR_FILE_CANT_READ", "description": "Can't read the file."},
	15: {"name": "ERR_FILE_UNRECOGNIZED", "description": "Unrecognized file error."},
	16: {"name": "ERR_FILE_CORRUPT", "description": "File is corrupt."},
	17: {"name": "ERR_FILE_MISSING_DEPENDENCIES", "description": "Missing dependencies."},
	18: {"name": "ERR_FILE_EOF", "description": "End of file error."},
	19: {"name": "ERR_CANT_OPEN", "description": "Can't open."},
	20: {"name": "ERR_CANT_CREATE", "description": "Can't create."},
	21: {"name": "ERR_QUERY_FAILED", "description": "Query failed."},
	22: {"name": "ERR_ALREADY_IN_USE", "description": "Already in use."},
	23: {"name": "ERR_LOCKED", "description": "Locked error."},
	24: {"name": "ERR_TIMEOUT", "description": "Timeout error."},
	25: {"name": "ERR_CANT_CONNECT", "description": "Can't connect."},
	26: {"name": "ERR_CANT_RESOLVE", "description": "Can't resolve."},
	27: {"name": "ERR_CONNECTION_ERROR", "description": "Connection error."},
	28: {"name": "ERR_CANT_ACQUIRE_RESOURCE", "description": "Can't acquire resource."},
	29: {"name": "ERR_CANT_FORK", "description": "Can't fork process."},
	30: {"name": "ERR_INVALID_DATA", "description": "Invalid data error."},
	31: {"name": "ERR_INVALID_PARAMETER", "description": "Invalid parameter error."},
	32: {"name": "ERR_ALREADY_EXISTS", "description": "Already exists."},
	33: {"name": "ERR_DOES_NOT_EXIST", "description": "Does not exist."},
	34: {"name": "ERR_DATABASE_CANT_READ", "description": "Database read error."},
	35: {"name": "ERR_DATABASE_CANT_WRITE", "description": "Database write error."},
	36: {"name": "ERR_COMPILATION_FAILED", "description": "Compilation failed."},
	37: {"name": "ERR_METHOD_NOT_FOUND", "description": "Method not found."},
	38: {"name": "ERR_LINK_FAILED", "description": "Linking failed."},
	39: {"name": "ERR_SCRIPT_FAILED", "description": "Script failed."},
	40: {"name": "ERR_CYCLIC_LINK", "description": "Cycling link error."},
	41: {"name": "ERR_INVALID_DECLARATION", "description": "Invalid declaration."},
	42: {"name": "ERR_DUPLICATE_SYMBOL", "description": "Duplicate symbol error."},
	43: {"name": "ERR_PARSE_ERROR", "description": "Parse error."},
	44: {"name": "ERR_BUSY", "description": "Busy error."},
	45: {"name": "ERR_SKIP", "description": "Skip error."},
	46: {"name": "ERR_HELP", "description": "Help error."},
	47: {"name": "ERR_BUG", "description": "Bug error, caused by an implementation issue in the method."},
	48: {"name": "ERR_PRINTER_ON_FIRE", "description": "Printer on fire! (This is an easter egg, no built-in methods return this error code)."},
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
