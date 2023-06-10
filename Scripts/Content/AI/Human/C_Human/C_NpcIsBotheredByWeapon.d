/**************************************************************************

  ������� �� slf, ��� oth (������ ��) ������ ������: TRUE - �������,
FALSE - ���.
 
***************************************************************************/

func int C_NpcIsBotheredByWeapon(var C_Npc slf,var C_Npc oth)
{
	// �� �������, ���� ---------------------------------------------------
	//���� ������� ������������
	if (HasFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_DrawWeapon))	{
		return FALSE;
	};
	
	// � � ����� ������� � �� (��� �� �� ������ ������)
	if(slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return FALSE;
	};
	
	// � ���� �� � ������ ������ ��
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(other))
	{
		return FALSE;
	};
	
	// � ��� ��������� ��������� - �������
	if(C_NpcGetAttitude(slf,oth) == ATT_ANGRY)
	{
		return TRUE;
	};
	
	// � ������ ������, � �� ������ ������ �������� ���
	if(C_NpcIsToughGuy(slf) && Npc_IsInFightMode(oth,FMODE_MELEE))
	{
		return FALSE;
	};
	
	// �� ������
	if(C_NpcGetAttitude(slf,oth) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	
	// � ���� ������ �����
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	
	// �� ������� �� �������
	if(Npc_IsInFightMode(oth,FMODE_FIST))
	{
		return FALSE;
	};
	
	// �� �������, �� ���������� �� �������
	if(Npc_IsInFightMode(oth,FMODE_MAGIC) && (Npc_GetActiveSpellCat(oth) != SPELL_BAD))
	{
		return FALSE;
	};
	
	// � ������ ��� ���
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_ORC))
	{
		return FALSE;
	};
	
	//� ��������
	if (HasFlags(slf.aivar[AIV_Behaviour], BEHAV_Hidden | BEHAV_Invisible))	{
		return FALSE;
	};

	// ����� ������� ------------------------------------------------------
	
	return TRUE;
};

