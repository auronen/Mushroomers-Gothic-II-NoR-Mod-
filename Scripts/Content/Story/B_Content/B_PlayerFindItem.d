/**************************************************************************

							������ �������

  ����� ����� �������� itm � ���������� amount.
  �������� ����� ��������� � ���������, ������ ���������
  
***************************************************************************/


func void B_PlayerFindItem(var int itm, var int amount)
{
	if(Npc_IsPlayer(self) && (amount > 0))
	{
		var string concatText;
		var string itemname;
		CreateInvItems(self, itm, amount);
		itemname = item.name;
		if(itm == ItMi_Gold) // ������
		{
			if ((amount % 10 == 1) && (amount % 100 != 11)) // ����������� �������� �����
			{
				concatText = ConcatStrings(IntToString(amount),PRINT_Gold1);	// 1, 21, 101... �������
			}
			else
			{
				concatText = ConcatStrings(IntToString(amount),PRINT_Gold);		// amount �������
			};
			Snd_Play("Geldbeutel");
		}
		else // �� ������
		{
			concatText = item.name; // �������� ��������
			// ���� �������� ��������� ��������� - � ������� ������� �������
			if(amount > 1) 
			{
				concatText = ConcatStrings(concatText," (");
				concatText = ConcatStrings(concatText,IntToString(amount));
				concatText = ConcatStrings(concatText,PRINT_Items);
				concatText = ConcatStrings(concatText,")");
			};
		};
		concatText = ConcatStrings(PRINT_Found, concatText);
		Print(concatText);
	};
};

