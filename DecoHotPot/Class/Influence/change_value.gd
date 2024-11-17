extends Influence
class_name ChangeValue

enum Target { POWER, SCIPY, SATIETY }
enum Type { ADD, MULTIPLY_FROM_CURRENT, MULTIPLY_FROM_MAX }

@export var target: Target
@export var type: Type
@export var value: int
