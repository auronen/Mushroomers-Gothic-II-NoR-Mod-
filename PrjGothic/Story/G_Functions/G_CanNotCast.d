
func void G_CanNotCast(var int bIsPlayer,var int nCircleNeeded,var int nCirclePossessed)
{
	if(bIsPlayer)
	{
		var string strMessage;
		var int nDifference;
		var string strDifference;
		nDifference = nCircleNeeded - nCirclePossessed;
		strDifference = IntToString(nDifference);
		strMessage = ConcatStrings(strDifference," ");
		strMessage = ConcatStrings(strMessage,PRINT_MAGCIRCLES_MISSING);
		Print(strMessage);
	};
};

