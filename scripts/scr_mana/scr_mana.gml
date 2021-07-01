// Scrip
function Mana(_item_index) constructor
{
	item_index = _item_index;
	can_use = true;
	max_mana = 100;
	mana = 100;
	gem_name = "";
	mana_type = -1;
	
	Use = function(_amount)
	{
		if (mana - _amount >= 0)
		{
			mana -= _amount;
			return true;
		}
		else
		{
			return false;
		}
	}
	
	Recharge = function(_amount)
	{
		mana = min(mana + _amount, max_mana);
	}
	
	Percent = function()
	{
		return mana / max_mana;
	}
	
	Imbue = function()
	{
		if (can_use)
		{
			global.i_inv.equipped_mana = self;
			return true;
		}
		else
		{
			return false;
		}
	}
}

function Ruby(_item_index) : Mana(_item_index) constructor
{
	gem_name = "Ruby";
	mana_type = MANA_TYPE.RUBY;
}

function Sapphire(_item_index) : Mana(_item_index) constructor
{
	gem_name = "Sapphire";
	mana_type = MANA_TYPE.SAPPHIRE;
}

function Emerald(_item_index) : Mana(_item_index) constructor
{
	gem_name = "Emerald";
	mana_type = MANA_TYPE.EMERALD;
}

function GetRubyImbueText()
{
	if (obj_inventory.equipped != -1)
	{
		return obj_inventory.equipped.ruby_imbue_text;
	}
	else
	{
		return "You have nothing equipped. Equip an item first to see what powers can be imbued by this gem.";
	}
}

function GetEmeraldImbueText()
{
	if (obj_inventory.equipped != -1)
	{
		return obj_inventory.equipped.emerald_imbue_text;
	}
	else
	{
		return "You have nothing equipped. Equip an item first to see what powers can be imbued by this gem.";
	}
}

function GetSapphireImbueText()
{
	if (obj_inventory.equipped != -1)
	{
		return obj_inventory.equipped.sapphire_imbue_text;
	}
	else
	{
		return "You have nothing equipped. Equip an item first to see what powers can be imbued by this gem.";
	}
}