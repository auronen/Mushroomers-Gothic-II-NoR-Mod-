/**************************************************************************

							������ ������������

  B_FinishingMove	(slf,	oth)
  �������� slf ������� ����������� ���� ���������������� oth.
���������� �� ZS_Attack ������ ����������������� ������ AI_FinishingMove.
��� ������������� ��������� slf � ����� ��� � ���������� ��� ������ �����.
   
***************************************************************************/


func void B_FinishingMove(var C_Npc slf,var C_Npc oth)
{
	// ���� � �� � ������ ���
	if(!Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		// ���� ���� ������ �������� ���
		if (Npc_HasEquippedMeleeWeapon(slf))
		{
			// ������� ���
			var C_Item weapon;
			weapon = Npc_GetEquippedMeleeWeapon(slf);
			Npc_SetToFightMode(slf, weapon);
		}
		else // ���� ���
		{
			// ������� � ������ ����� � ������ �����
			Npc_SetToFightMode(slf,ItMw_1h_MISC_Sword);
		};
	};
	
	// ������� ����������� ���� 
	AI_FinishingMove(slf,oth);
};

