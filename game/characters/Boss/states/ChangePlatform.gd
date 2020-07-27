extends BossBaseState

export var MAX_SPEED = 15
export var ACCELERATION = 10
export var DECELERATION = 16

var coin = preload("res://objects/Coin/Coin.tscn")


var boss_position
var target_position
var good_x 
var velocity

func enter():
    var rightPosition = boss.RightPlatformPosition + Vector3(0, 1, 0)
    var leftPosition = boss.LeftPlatformPosition + Vector3(0, 1, 0)
    velocity = Vector3.ZERO
    boss_position = boss.global_transform.origin
    if boss_position.distance_to(rightPosition) < boss_position.distance_to(leftPosition):
        target_position = leftPosition
    elif boss_position.distance_to(rightPosition) > boss_position.distance_to(leftPosition):
        target_position = rightPosition
    else:
        target_position = rightPosition if randf() < 0.5 else leftPosition
    good_x = false

func update(delta):
    boss_position = boss.global_transform.origin
    if abs(boss_position.x - target_position.x) > 0.1 and not good_x:
        var direction = Vector3.ZERO
        direction.x = target_position.x - boss_position.x
        direction = direction.normalized()

        velocity = velocity.linear_interpolate(direction * MAX_SPEED, delta * ACCELERATION)
        velocity.y = -12

        velocity = boss.move_and_slide(velocity, Vector3.UP)
    elif abs(boss_position.y - target_position.y) > 0.1:
        #TODO: Jump nicely
        good_x = true
        velocity = Vector3.ZERO
        var direction = Vector3.ZERO
        direction.y = 1
        direction = direction.normalized()
        boss.set_collision_mask_bit(2, false)

        velocity = velocity.linear_interpolate(direction * MAX_SPEED * 2, delta * ACCELERATION)

        velocity = boss.move_and_slide(velocity, Vector3.UP)
    else:
        boss.set_collision_mask_bit(2, true)
        velocity = Vector3.ZERO

        velocity = velocity.linear_interpolate(Vector3(0, -1, 0) * 12, delta * ACCELERATION)

        velocity = boss.move_and_slide(velocity, Vector3.UP)
        emit_signal("finished", "attack")

    if $CoinPlaceTimer.time_left <= 0:
        var c = coin.instance()
        c.global_transform = boss.global_transform
        get_tree().root.get_node("BossLevel").add_child(c)
        $CoinPlaceTimer.start(0.2)
