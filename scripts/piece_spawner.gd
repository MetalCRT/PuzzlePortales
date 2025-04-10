extends Node

var current_tetromino
var bag = []
var next_tetromino

@onready var board = $"../Board" as Board
@onready var ui: CanvasLayer = $"../UI" as UI
var is_game_over = false


#enum Tetromino { I, O, T, J, L, S, Z }

func _ready():
	#fill_bag()
	#spawn_next_piece()
	current_tetromino = Shared.Tetromino.values().pick_random()
	next_tetromino = Shared.Tetromino.values().pick_random()
	board.spawn_tetromino(current_tetromino, false, null)
	board.spawn_tetromino(next_tetromino, true, Vector2(100, 50))
	board.tetromino_locked.connect(on_tetromino_locked)
	board.game_over.connect(on_game_over)


func on_tetromino_locked():
	if is_game_over:
		return
	current_tetromino = next_tetromino
	next_tetromino = Shared.Tetromino.values().pick_random()
	board.spawn_tetromino(current_tetromino, false, null)
	board.spawn_tetromino(next_tetromino, true, Vector2(100, 50))

func fill_bag():
	bag = Shared.Tetromino.values()
	bag.shuffle()

func spawn_next_piece():
	if bag.size() == 0:
		fill_bag()
	current_tetromino = bag.pop_front()

func on_game_over():
	is_game_over = true
	ui.show_game_over()
