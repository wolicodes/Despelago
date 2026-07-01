extends Object

func _ready(chain: ModLoaderHookChain) -> void:
	var main_node := chain.reference_object as Room
	var tuto = main_node.get_node_or_null("Tutorial")
	if tuto:
		tuto.hide()
	chain.execute_next()
