extends Node


const BLUE_FRAME = preload("uid://c3spk88yhrvka")
const GREEN_FRAME = preload("uid://bl7stqy8jtkmg")
const RED_FRAME = preload("uid://cwm6hauvl741u")
const YELLOW_FRAME = preload("uid://ca8tsm4xp2xhy")

const TILE_IMAGES: TileImagesHolder = preload("uid://c6hyabb22rj2m")

const FRAME_IMAGES: Array[Texture2D] = [
	BLUE_FRAME,
	GREEN_FRAME,
	RED_FRAME,
	YELLOW_FRAME
]


func get_random_item_image() -> Texture2D:
	return TILE_IMAGES.tile_images.pick_random()


func get_random_frame_image() -> Texture2D:
	return FRAME_IMAGES.pick_random() 


func shuffle_images() -> void:
	TILE_IMAGES.tile_images.shuffle()


func get_image_at_index(index: int) -> Texture2D:
	if index > TILE_IMAGES.tile_images.size() or index < 0:
		printerr("get_image_at_index index out of bounds: ", index)
	
	return TILE_IMAGES.tile_images[index]
