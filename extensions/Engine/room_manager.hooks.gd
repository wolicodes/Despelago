extends Object

# MOD remove floating tutorial windows
func _ready(chain: ModLoaderHookChain) -> void:
	var main_node := chain.reference_object as Room
	var tutorial = main_node.get_node_or_null("Tutorial")
	var tutorial_message = main_node.get_node_or_null("TutorialMessage")
	if tutorial:
		tutorial.queue_free()
	if tutorial_message:
		tutorial_message.queue_free()
	chain.execute_next()
