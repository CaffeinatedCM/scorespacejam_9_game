extends Node

signal health_changed(value)
signal on_no_health()

export var MAX_HEALTH = 3
export var DAMAGE = 1

onready var health = MAX_HEALTH setget set_health

func set_health(value):
    health = value
    emit_signal("health_changed", value)
    if value <= 0:
        emit_signal("on_no_health")