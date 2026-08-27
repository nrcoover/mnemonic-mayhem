extends Node


const TILE_IMAGES:TileImagesHolder = preload("uid://c6hyabb22rj2m")


func get_random_item_image() -> Texture2D:
	return TILE_IMAGES.tile_images.pick_random()
