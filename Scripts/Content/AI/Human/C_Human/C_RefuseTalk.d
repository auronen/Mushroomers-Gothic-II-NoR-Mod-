/**************************************************************************

							����� �� �������

  ��������� �� slf ������������� � oth (��): TRUE - ���������, FALSE - ���.
  
  ��� ������� ��-�� ������ �������, ������ ������� � ������.

//NS: ����������� ������� � ���������� ��! ��� ��� �� ������!
(��� ��������� �������� � C_PlayerHasFakeGuild).
 
***************************************************************************/


func int C_RefuseTalk(var C_Npc slf,var C_Npc oth)
{
	// ���������� ������� ������ �� ������� �� �������, � � ���� �� ������ �����, � ��� �� ����� �������������� ��
	if((Npc_RefuseTalk(slf) == TRUE) && C_NpcIsGateGuard(slf) && (slf.aivar[AIV_Guardpassage_Status] == GP_NONE))
	{
		return TRUE;	// �� �������������
	};
	
	// ���� ����� �� ������� � � ��� �����
	if((Npc_RefuseTalk(slf) == TRUE)
		&& (Npc_IsInState(slf,ZS_GotoBed) || Npc_IsInState(slf,ZS_GotoBed_Deep)
			|| Npc_IsInState(slf,ZS_Sleep) || Npc_IsInState(slf,ZS_Sleep_Deep)))
	{
		return TRUE;	// �� �������������
	};	
	
	// �� � ����-�� ��������, � � �� ����������
	if(C_PlayerHasFakeGuild(slf,oth) && (!HasFlags(slf.flags, NPC_FLAG_IMMORTAL)))
	{
		return TRUE;	// �� �������������
	};	
	
	// � ��������� ������� - �� ������������
	return FALSE;
};

