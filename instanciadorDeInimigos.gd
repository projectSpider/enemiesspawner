extends Node

export(PackedScene) var cena setget set_cena
#export(PackedScene) var posicaoA setget set_posicaoA

export(NodePath) onready var posicao_path setget set_posicao
export(String) onready var id  setget set_id

var posicao 

var contador = 0
var posicao1 = false
var posicao2 = false
var posicao3 = false

func _ready():
	atualizar()
	posicao = get_parent().get_node(posicao_path)

func set_posicao(p):
	posicao_path = p
	atualizar()
	
func set_cena(valor):
	cena = valor
	atualizar()
	
func set_id(i):
	id = i
	atualizar()
	
func instanciar():
	var instancia = cena.instance()
	instancia.set_name(str(instancia.get_name(), contador))	
	
	if !posicao1:
		instancia.set_global_transform(posicao.get_global_transform())
#		posicao1 = true
#	elif !posicao2:
#		instancia.set_transform(get_node("../cenario/posicao2").get_global_transform())
#		posicao2 = true
#	elif !posicao3:
#		instancia.set_transform(get_node("../cenario/posicao3").get_global_transform())
#		posicao3 = true
	
	add_child(instancia)
	
	contador += 1
	
	return instancia
	
func atualizar():
	if Engine.editor_hint:
		for filho in get_children():
			filho.queue_free()
		
		if cena == null:
			var sprite = Sprite.new()
			var texture = preload("res://icon.png")
			texture.set_flags(0)
	
			sprite.set_texture(texture)
			add_child(sprite)
		else:
			add_child(cena.instance())

func _on_InstanciadorDeInimigos_body_entered( body ):
	if body.name == id:
		self.instanciar()
