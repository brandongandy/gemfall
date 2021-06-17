// Scrip
function Item(_item_index) constructor 
{
	// passed in by the constructor in obj_inventory, used to
	// set the sprite of the item
	item_index = _item_index;
	damage = 0;
	uses_ammo = false;
	ammo = 0;
	max_ammo = 0;
	owned = false;
	mana_type = -1;
	mana_cost = 0;
	
	// empty Use function as a placeholder
	Use = function() { return false; }
	
	SpendAmmo = function(_amount)
	{
		if (!uses_ammo)
		{
			return false;
		}
		
		if (ammo - _amount >= 0)
		{
			ammo -= _amount;
			return true;
		}
		else
		{
			return false;
		}
	}
	
	PickUp = function(_amount)
	{
		ammo = min(ammo + _amount, max_ammo);
	}
	
	Equip = function()
	{
		if (owned)
		{
			// TODO: this causes multiples of the same item to be equipped
			// fix me
			obj_inventory.equipped = self;
			return true;
		}
		else
		{
			return false;
		}
	}
}

function Bomb(_item_index) : Item(_item_index) constructor
{
	damage = 5;
	uses_ammo = true;
	max_ammo = 20;
	owned = true;
	
	Use = function()
	{
		with (obj_player)
		{
			if (global.i_lifted == noone)
			{
				if (ammo > 0)
				{
					//show_debug_message("making bomb");
					var _bomb = instance_create_layer(x, y, "Instances", obj_bomb);
					scr_activate_liftable(_bomb);
			
					ammo--;
				}
			}
		}
	}
}

function Bow(_item_index) : Item(_item_index) constructor
{
	damage = 5;
	uses_ammo = true;
	ammo = 5;
	max_ammo = 20;
	owned = true;
	
	Use = function()
	{
		with (obj_player)
		{
			state = scr_player_state_bow;
		}
	}
}

function Focus(_item_index) : Item(_item_index) constructor
{
	// This one works a little differently than the ones above
	// Its ammo is a Mana type, and its actions are based on the
	// "Equipped" ammo.
	uses_ammo = true;
}

function PotionEmpty(_item_index) : Item(_item_index) constructor
{
	owned = true;
}

function PotionHealth(_item_index) : Item(_item_index) constructor
{
	owned = true;
}

function PotionAntivenom(_item_index) : Item(_item_index) constructor
{
	owned = true;
}

function PotionSpeed(_item_index) : Item(_item_index) constructor
{
	owned = true;
}

function PotionSight(_item_index) : Item(_item_index) constructor
{
	owned = true;
}

function PotionCharge(_item_index) : Item(_item_index) constructor
{
	owned = true;
}