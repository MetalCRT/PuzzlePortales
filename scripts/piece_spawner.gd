extends Node

var current_tetromino
var bag = []
var next_tetromino
@onready var board = $"../Board" as Board

#enum Tetromino { I, O, T, J, L, S, Z }

	
func _ready():
	#fill_bag()
	#spawn_next_piece()
	current_tetromino = Shared.Tetromino.values().pick_random()
	next_tetromino = Shared.Tetromino.values().pick_random()
	board.spawn_tetromino(current_tetromino, false, null)
	board.spawn_tetromino(next_tetromino, true, Vector2(100, 50))
	board.tetromino_locked.connect(on_tetromino_locked)


func on_tetromino_locked():
	
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
