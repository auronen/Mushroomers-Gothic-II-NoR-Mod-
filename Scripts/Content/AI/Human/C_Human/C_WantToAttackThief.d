/**************************************************************************

  ����� �� slf �������������� �������� oth �� �����.
 
***************************************************************************/

func int C_WantToAttackThief(var C_Npc slf,var C_Npc oth)
{
	// �� ����, ����
	
	// � ������, ������� ��� ������� �� ��������
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF))
	{
		return FALSE;
	};
	
	// ���� ������� �� �������� ��� ������������
	if(HasFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_Theft))
	{
		return FALSE;
	};
	
	// �� ���� ������� (� ��������� �����)
	if(slf.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		return FALSE;
	};
	
	// �� ��, � � - ��� ����
	if(Npc_IsPlayer(oth) && (slf.npcType == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	
	// � ������� ����
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	
	//� �������
	if (HasFlags(slf.aivar[AIV_Behaviour], BEHAV_Hidden) || HasFlags(slf.aivar[AIV_Behaviour], BEHAV_Invisible))	{
		return FALSE;
	};

	// � ���������� ������� - ����
	return TRUE;
};


