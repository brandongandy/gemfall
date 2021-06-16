// Scrip
function Mana() constructor
{
	max_mana = 100;
	mana = 100;
	
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
}