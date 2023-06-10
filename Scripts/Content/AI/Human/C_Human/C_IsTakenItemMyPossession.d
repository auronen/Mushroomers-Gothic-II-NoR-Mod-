/**************************************************************************

  int C_IsTakenItemMyPossession	(slf,	oth,	item)
  ������� �� self (����) ��, ��� other (��) ���� ���� item (�����������
�� ��� ���): TRUE - �����������, FALSE - �� �����������. �������� ������
��� ��.
  ������������ ��� ���������� ����� B_AssessTheft.
  
  � ����� ������ - �� �����������. 
 
***************************************************************************/

func int C_IsTakenItemMyPossession(var C_Npc slf,var C_Npc oth,var C_Item itm)
{
	// �����������, ���� --------------------------------------------------
	
	// ��� ��� ������ ����
	if(Npc_OwnedByNpc(itm,slf))
	{
		return TRUE;
	};
	
	// �� �� �������� ��������, ���� ������� ��� ������� ���, ��������, �������
	//NS: ������ �������� ������� �� ���������
	// � ��� ������ ������� �� �����������, �������, ��� � ���� �����...
	if((itm.flags & ITEM_DROPPED) == ITEM_DROPPED)
	{
		/* DEBUG INFO
		PrintSelf("Item's dropped");
		//*/
		return FALSE;
	};
	
	// ���� ��������, ��� ���������� � ��������� ���� �������
	if(C_NpcIsBotheredByPlayerRoomGuild(self) || (C_GetPlayerPortalGuild() == GIL_PUBLIC))
	{
		return TRUE;
	};
	
	// ��� ���� ����������� ������������� �������
	if(Wld_GetGuildAttitude(slf.guild,itm.ownerGuild) == ATT_FRIENDLY)
	{
		return TRUE;
	};
	
	// �� ���� ��������� ������� -------------------------------------------
	
	// ��� �� ��� ����, ��� ��� �����, ��� � ��� ������ ��
	return FALSE;
};

