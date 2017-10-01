/**************************************************************************

  int C_IsUsedMobMyPossession	(slf,	oth)
  ������� �� slf (����) ��, ��� oth (��) �������������� �������� Mob (�����������
�� �� ���): TRUE - �����������, FALSE - �� �����������. �������� ������
��� ��, ����� �� ���� � ������.
  ������������ � ���������� B_AssessUseMob.
  
  � ����� ������ - �� �����������.
 
***************************************************************************/


func int C_IsUsedMobMyPossession(var C_Npc slf,var C_Npc oth)
{
	// �����������, ���� ---------------------------------------------------
	
	// ��� ��� ������
	if(Npc_IsDetectedMobOwnedByNpc(oth,slf))
	{
		return TRUE;
	};
	
	// ���� ��������, ��� �������� � ���� �������
	if (C_NpcIsBotheredByPlayerRoomGuild(slf) || (C_GetPlayerPortalGuild() == GIL_PUBLIC))
	{
		return TRUE;
	};
	
	// �� ���� ��������� ������� --------------------------------------------
	
	// ��� �� ��� ����, ��� ��� �����, ��� � ��� ������ ��
	return FALSE;
};

