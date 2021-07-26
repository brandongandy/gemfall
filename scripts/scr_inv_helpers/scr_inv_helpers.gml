// Scrip
function draw_gem_infobox(_gem, _x, _y)
{
	var _box_width = 156;
	var _box_height = 64;
	if (_x + _box_width > RESOLUTION_W)
	{
		_x = RESOLUTION_W - _box_width;
	}
	
	if (_y + _box_height + 32 > RESOLUTION_H)
	{
		_y -= (_box_height + 24);
	}
	
	scr_nine_slice_box_stretched(
		spr_textbox_bg, 
		_x, 
		_y + 12, 
		_x + _box_width, 
		_y + 12 + _box_height, 
		4);

	draw_set_color($6357d9);
	draw_text(_x + 6, _y + 14, _gem.gem_name + " Gem");
	draw_set_color(c_white);
	
	var _mana = "";
	var _mana_color;
	switch (_gem.mana_type)
	{
		case MANA_TYPE.RUBY:
			_mana = "Mana: Ruby";
			_mana_color = make_color_rgb(172, 50, 50);
			break;
		case MANA_TYPE.EMERALD:
			_mana = "Mana: Emerald";
			_mana_color = make_color_rgb(106, 190, 48);
			break;
		case MANA_TYPE.SAPPHIRE:
			_mana = "Mana: Sapphire";
			_mana_color = make_color_rgb(99, 155, 255);
			break;
		default:
			_mana = "";
			_mana_color = c_white;
			break;
	}
	
	draw_set_font(font_text_small);
	
	draw_set_color($e3f6fd);
	draw_text_ext(
		_x + 6,
		_y + 10 + string_height(_gem.gem_name),
		_gem.description,
		8,
		_box_width - 10);
	
	draw_set_color(_mana_color);
	draw_text(
		_x + 6, 
		_y + _box_height - string_height(_mana) + 8,
		_mana);
	draw_set_color(c_white);
	draw_set_font(font_text);
}

function draw_item_infobox(_item, _x, _y)
{
	var _box_width = 156;
	var _box_height = 64;
	if (_x + _box_width > RESOLUTION_W)
	{
		_x = RESOLUTION_W - _box_width;
	}
	
	if (_y + _box_height + 32 > RESOLUTION_H)
	{
		_y -= (_box_height + 24);
	}
	
	scr_nine_slice_box_stretched(
		spr_textbox_bg, 
		_x, 
		_y + 12, 
		_x + _box_width, 
		_y + 12 + _box_height, 
		4);

	draw_set_color($6357d9);
	draw_text(_x + 6, _y + 14, _item.item_name);
	draw_set_color(c_white);
	
	var _mana = "";
	var _mana_color;
	switch (_item.mana_type)
	{
		case MANA_TYPE.RUBY:
			_mana = "Mana: Ruby";
			_mana_color = make_color_rgb(172, 50, 50);
			break;
		case MANA_TYPE.EMERALD:
			_mana = "Mana: Emerald";
			_mana_color = make_color_rgb(106, 190, 48);
			break;
		case MANA_TYPE.SAPPHIRE:
			_mana = "Mana: Sapphire";
			_mana_color = make_color_rgb(99, 155, 255);
			break;
		default:
			_mana = "";
			_mana_color = c_white;
			break;
	}
	
	draw_set_font(font_text_small);
	
	draw_set_color($e3f6fd);
	draw_text_ext(
		_x + 6,
		_y + 10 + string_height(_item.item_name),
		_item.description,
		8,
		_box_width - 10);
	
	draw_set_color(_mana_color);
	draw_text(
		_x + 6, 
		_y + _box_height - string_height(_mana) + 8,
		_mana);
	draw_set_color(c_white);
	draw_set_font(font_text);
}

function draw_mana_gem_infobox(_gem, _x, _y)
{
	var _box_width = 156;
	var _box_height = 64;
	if (_x + _box_width > RESOLUTION_W)
	{
		_x = RESOLUTION_W - _box_width;
	}
	
	if (_y + _box_height + 32 > RESOLUTION_H)
	{
		_y -= (_box_height + 24);
	}
	
	scr_nine_slice_box_stretched(
		spr_textbox_bg, 
		_x, 
		_y + 12, 
		_x + _box_width, 
		_y + 12 + _box_height, 
		4);
	
	var _mana_color;
	switch (_gem.mana_type)
	{
		case MANA_TYPE.RUBY:
			_mana_color = make_color_rgb(172, 50, 50);
			break;
		case MANA_TYPE.EMERALD:
			_mana_color = make_color_rgb(106, 190, 48);
			break;
		case MANA_TYPE.SAPPHIRE:
			_mana_color = make_color_rgb(99, 155, 255);
			break;
		default:
			_mana_color = c_white;
			break;
	}
	
	draw_set_color(_mana_color);
	draw_text(_x + 6, _y + 14, _gem.gem_name);
	draw_set_color(c_white);
	
	draw_set_font(font_text_small);
	
	var _desc = "";
	switch (_gem.mana_type)
	{
		case MANA_TYPE.RUBY:
			_desc = GetRubyImbueText();
			break;
		case MANA_TYPE.EMERALD:
			_desc = GetEmeraldImbueText();
			break;
		case MANA_TYPE.SAPPHIRE:
			_desc = GetSapphireImbueText();
			break;
		default:
			_desc = "";
			break;
	}
	
	draw_set_color($e3f6fd);
	draw_text_ext(
		_x + 6,
		_y + 10 + string_height(_gem.gem_name),
		_desc,
		8,
		_box_width - 10);
	
	draw_set_color(c_white);
	draw_set_font(font_text);
}

function draw_journal_infobox(_journal_name, _x, _y)
{
	// TODO: adjust width based on journal name
	var _box_width = 96;
	var _box_height = 24;
	
	scr_nine_slice_box_stretched(
		spr_textbox_bg, 
		_x, 
		_y + 16, 
		_x + _box_width, 
		_y + 16 + _box_height, 
		4);
	
	draw_set_color(c_white);
	draw_text(_x + 6, _y + 20, _journal_name);
	draw_set_color(c_white);
}