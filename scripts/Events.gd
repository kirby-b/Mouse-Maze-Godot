extends Node

# Signals that the player hit the out area
signal player_fail
# Signals the player made it to the end of a maze
signal player_win
# Signals the player hit a win they shouldnt have(LVL 3)
signal player_cheat
# Signals the player hit the "secret end" jumpscare(The way LVL 3 should go)
signal jumpscare
