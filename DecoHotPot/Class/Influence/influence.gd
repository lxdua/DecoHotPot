extends Resource
class_name Influence

enum InfluenceType { ADD, MULTIPLY_FROM_CURRENT, MULTIPLY_FROM_MAX }

@export var target: String
@export var type: InfluenceType
@export var value: int
