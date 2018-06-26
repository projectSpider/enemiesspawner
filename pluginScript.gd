tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("InstanciadorDeInimigos", "Area", preload("instanciadorDeInimigos.gd"), preload("res://iconAsset.png"))
	pass
	
func _exit_tree():
	remove_custom_type("InstanciadorDeInimigos")
	pass
