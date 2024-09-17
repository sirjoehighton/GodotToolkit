@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_autoload_singleton("Toolkit","res://addons/godottoolkit/toolkit.gd")

func _exit_tree() -> void:
	remove_autoload_singleton("Toolkit")
