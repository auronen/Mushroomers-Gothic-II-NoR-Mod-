/**************************************************************************

					�������� ������������ � ������

  �������� �� slf �������� �� ��, ��� oth (��) �������� �������:
TRUE - ��������, FALSE - ���.
  
  �� ������� �� �������!
  
  �� ����������� ������� �� ����� �������� ��� �������.
  
//NS: � ������ ����, ���� � ��� �� ��������� ������ AIV.
 
***************************************************************************/

func int C_PlayerIsFakePirate(var C_Npc slf,var C_Npc oth)
{
	// ���������� ���������� - ������ ��
	var C_Item itm;
	
	// ����� �� ��������, ���� --------------------------------------------
	
	// ���� ������� �� �������� ����� ��� ������ �������
	if(HasAnyFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_Armor | IGNORE_FakeGuild))
	{
		return FALSE;
	};
	
	// ---------------------------------------------------------------------
	
	// ���� �� ���� 
	
	if(Npc_HasEquippedArmor(other) == TRUE)
	{
		// � ������ ������
		itm = Npc_GetEquippedArmor(oth);
		if((Hlp_IsItem(itm,ITAR_PIR_L_Addon) == TRUE)
			|| (Hlp_IsItem(itm,ITAR_PIR_M_Addon) == TRUE)
			|| (Hlp_IsItem(itm,ITAR_PIR_H_Addon) == TRUE))
		{
			return TRUE;	// �� �� ��������� �����
		}
		else
		{
			return FALSE;	// �� �� �� ��������� �����
		};
	};
	
	// ���� �� �� ���� 
	
	return FALSE;		// �� �� �� ��������� �����
};


