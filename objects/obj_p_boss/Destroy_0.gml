/// @description Drop items
// always drop an item, never a regular heart
if (entity_drop_list != -1)
{
	var _item = entity_drop_list[irandom(array_length(entity_drop_list) - 1)];
	scr_drop_items(x, y, [_item]);
}