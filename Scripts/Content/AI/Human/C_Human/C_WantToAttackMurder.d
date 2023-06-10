/**************************************************************************

  ����� �� slf �������������� �������� ������ oth.
 
***************************************************************************/


func int C_WantToAttackMurder(var C_Npc slf,var C_Npc oth)
{
	// �� ����, ����
	
	// � ������, �������, ������� �� �������� ��� ������
	if((slf.guild == GIL_DMT)
		|| (slf.guild == GIL_STRF)
		|| (slf.guild == GIL_BDT))
	{
		return FALSE;
	};
	
	// ���� ������� �� �������� �������
	if(HasFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_Murder))
	{
		return FALSE;
	};
	
	// �� ��, � � ��� ����
	if(Npc_IsPlayer(oth) && (slf.npcType == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	
	// � ������ ��� ��������� �����
	if(C_NpcHasAttackReasonToKill(oth))
	{
		return FALSE;
	};
	
	// � ���� ������ �����
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	
	// � ��������� ������� - ����
	return TRUE;
};


