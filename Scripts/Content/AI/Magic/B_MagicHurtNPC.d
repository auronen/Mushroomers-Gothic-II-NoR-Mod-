/**************************************************************************

						���������� ����

B_MagicHurtNpc	(slf,	oth,	damage)
  �������� slf (�) ������� ���� oth (��) ��������� damage � ������� �����

//NS: � ��������, ������������� ������. ����� ����, �� ���������������� �������
  
***************************************************************************/

func void B_MagicHurtNpc(var C_Npc slf,var C_Npc oth,var int damage)
{
	// ��������� �����
	Npc_ChangeAttribute(oth,ATR_HITPOINTS,-damage);
	// ���� ����������� ������������ � ������
	if(Npc_IsDead(oth))
	{
		// ������ �� ���� 
		//Ns: � ZS_Dead �� ���������, �.�. �� ����� other
		if((Npc_IsPlayer(slf) || (slf.aivar[AIV_PARTYMEMBER] == TRUE)) && (oth.aivar[AIV_VictoryXPGiven] == FALSE))
		{
			B_GivePlayerXP(slf.level * XP_PER_VICTORY);
			oth.aivar[AIV_VictoryXPGiven] = TRUE;
		};
		// �������� ���������� �� ��������
		Npc_SendPassivePerc(oth,PERC_ASSESSMURDER,slf,oth);//NS: ��������� 
	}
	else // ���� ������ ��� ����
	{
		// �������� ���������� � ���������
		Npc_SendPassivePerc(oth,PERC_ASSESSFIGHTSOUND,slf,oth);//NS: ��������� 
	};
};

