/**************************************************************************

  ����� �� slf �� ���� (��������): TRUE - �����, FALSE - ���.
 
***************************************************************************/

func int C_NpcIsDown(var C_Npc slf)
{
	//���� ���� ������ ���
	if (!Hlp_IsValidNpc(slf))
	{
		return TRUE;		// �� � ��������
	};
	
	// ���� � ��� ��������, ������� ��� ����
	if(Npc_IsInState(slf,ZS_Unconscious) || Npc_IsInState(slf,ZS_MagicSleep) || Npc_IsInState(slf,ZS_MagicSleep_Short) || Npc_IsDead(slf))
	{
		return TRUE;		// �� � ��������
	};
	// �����
	return FALSE;		// �� ��������
};

