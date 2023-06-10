/**************************************************************************

							��������� �� ����

  ��������������� ������ self ����� � ���� (������ �����, �� ����� �����
other) � �������� ���������.

  ��������� � ���������!!!
  
***************************************************************************/

func void ZS_MM_GetOutOfWater()
{
	// ������� ����������, ��� ��� Flee
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	// ��������� � ��������� �����
	AI_Dodge(self);
	Npc_GetTarget(self);
	if (Hlp_IsValidNpc(other))
	{
		AI_TurnAway(self, other);
	};
};


func int ZS_MM_GetOutOfWater_Loop()
{
	// ���� � ��� ��� ����� ��� ��� �����
	if (C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE))
	{
		// ���������� �������
		if (Hlp_IsValidNpc(other))
		{
			AI_Flee(self);
		}
		else
		{
			AI_GotoWP(self, Npc_GetNearestWP(self));
		};
		return LOOP_CONTINUE;
	};
	// ����� - ����� ���������
	return LOOP_END;
};

func void ZS_MM_GetOutOfWater_End()
{
};
