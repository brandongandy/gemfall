// @description scr_merge_number
function scr_merge_number(_number1, _number2, _amount)
{
	// get the difference between numbers 1 and 2, then merge them by the amount
	// desired
	return _number1 - ((_number1 - _number2) * _amount);
}