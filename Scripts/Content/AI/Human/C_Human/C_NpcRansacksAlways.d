/**************************************************************************

  ����������� �� slf ���������� ������������ other (��): TRUE - ��, FALSE -
�� �����������.
  
  ������ ��� �������!!!
 
***************************************************************************/

func int C_NpcRansacksAlways(var C_Npc slf)
{
	// ��������
	var C_NPC Garwig;
	Garwig = Hlp_GetNpc(Nov_608_Garwig);
	// ���� � ������ � � �� ���� ������ �����
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Garwig)) && (Npc_HasItems(other,Holy_Hammer_MIS) > 0))
	{
		return TRUE;
	};
	
	//����� �� �����������
	return FALSE;
};

