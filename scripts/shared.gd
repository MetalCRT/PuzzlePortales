extends Node

enum Tetromino {
	I, O, T, J, L, S, Z
}

var cells = {
	Tetromino.I: [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(2, 0)],
	Tetromino.J: [Vector2(-1, 1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)],
	Tetromino.L: [Vector2(1, 1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)],
	Tetromino.O: [Vector2(0, 1), Vector2(1, 1), Vector2(0, 0), Vector2(1, 0)],
	Tetromino.S: [Vector2(0, 1), Vector2(1, 1), Vector2(-1, 0), Vector2(0, 0)],
	Tetromino.T: [Vector2(0, 1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)],
	Tetromino.Z: [Vector2(-1, 1), Vector2(0, 1), Vector2(0, 0), Vector2(1, 0)]
}

var wall_kicks_i = [
	[Vector2(0,0), Vector2(-2,0), Vector2(1,0), Vector2(-2,-1), Vector2(1,2)],
	[Vector2(0,0), Vector2(2,0), Vector2(-1, 0), Vector2(2,1), Vector2(-1, -2)],
	[Vector2(0,0), Vector2(-1, 0), Vector2(2,0), Vector2(-1,2), Vector2(2, -1)],
	[Vector2(0,0), Vector2(1,0), Vector2(-2, 0), Vector2(1, -2), Vector2(-2, 1)],
	[Vector2(0,0), Vector2(2,0), Vector2(-1, 0), Vector2(2,1), Vector2(-1, -2)],
	[Vector2(0,0), Vector2(-2,0), Vector2(1, 0), Vector2(-2, -1), Vector2(1, 2)],
	[Vector2(0,0), Vector2(1,0), Vector2(-2,0), Vector2(1, -2), Vector2(-2,1)],
	[Vector2(0,0), Vector2(-1, 0), Vector2(2, 0), Vector2(-1,2), Vector2(2, -1)]
]

var wall_kicks_jlostz = [
	[Vector2(0,0), Vector2(-1,0), Vector2(-1,1), Vector2(0,-2), Vector2(-1, -2)],
	[Vector2(0,0), Vector2(1,0), Vector2(1, -1), Vector2(0,2), Vector2(1, 2)],
	[Vector2(0,0), Vector2(1, 0), Vector2(1,-1), Vector2(0,2), Vector2(1, 2)],
	[Vector2(0,0), Vector2(-1,0), Vector2(-1, 1), Vector2(0, -2), Vector2(-1, -2)],
	[Vector2(0,0), Vector2(1,0), Vector2(1, 1), Vector2(0,-2), Vector2(1, -2)],
	[Vector2(0,0), Vector2(-1,0), Vector2(-1, -1), Vector2(0, 2), Vector2(-1, 2)],
	[Vector2(0,0), Vector2(-1,0), Vector2(-1,-1), Vector2(0, 2), Vector2(-1, 2)],
	[Vector2(0,0), Vector2(1, 0), Vector2(1, 1), Vector2(0,-2), Vector2(1, -2)]
]
