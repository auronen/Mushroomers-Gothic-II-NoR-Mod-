/**************************************************************************

								�������

  �������� self (�) ������� �� other (��).
  
  ������� ������������, ���� ������� ���������� �� �������������� ��� �� 
���� (���� ��� ��� ��������). ����� ������� ���������� ����������.
  ���������: ������ ��������� �����, ���� ����������� ���������� 
�������.
  
  ����� ���������� - ������ �����, �����, �����������.
  ����� ����������� - ���, �� ����������� ���������.
  
***************************************************************************/

// ����������� ����������������� �������
const int FleeTimeMin = 3;	//���.

func void ZS_Flee()
{
	PrintSelfVsOther("ZS_Flee");
	// �������������
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	B_ValidateOther();
	self.aivar[AIV_StateTime] = 0;
	AI_StandUpQuick(self);
	// ������ ������
	if (self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX] / 3)	{
		// ���� ���� - �������� � ����� ����������
		if(self.aivar[AIV_LOADGAME] == FALSE)
		{
			B_Say_Overlay(self,other,"$RUNAWAY");
		};
	};
	B_RemoveWeapon(self);
	// ������� �� ���
	AI_SetWalkMode(self,NPC_RUN);
	if (self.guild < GIL_SEPERATOR_HUM)	{
		Mdl_ApplyOverlayMds(self,"HUMANS_FLEE.MDS");
	};
};

func int ZS_Flee_Loop()
{
	// ����������, �� ���� �����
	Npc_GetTarget(self);
	// ���� � ������ ���������� ������
	if(Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL)
	{
		// ������������
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	// ���� �� ����
	if(C_NpcIsDown(other))
	{
		// ���� ������������
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	// ���� � ���� ��� �������� �����
	if (Npc_GetStateTime(self) > 0)
	{
		self.aivar[AIV_StateTime] += Npc_GetStateTime(self);
		if (self.aivar[AIV_StateTime] > FleeTimeMin)
		{
			// �������� - � �� ���������� �� �������
			if ((!C_WantToFlee(self, other)) && (Hlp_Random(100) < 20))
			{
				Npc_ClearAIQueue(self);
				return LOOP_END;
			};
		};
		Npc_SetStateTime(self,0);
	};
	// ����� - ���������� �������
	AI_Flee(self);
	return LOOP_CONTINUE;
};

func void ZS_Flee_End()
{
	// ������� � ����������� ������� �����������
	Mdl_RemoveOverlayMds(self,"HUMANS_FLEE.MDS");
	AI_Standup(self);
	// ���������� ����������, ���� ������� �������
	if ((Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL) || C_NpcIsDown(other))
	{
		AI_StartState(self,ZS_HealSelf,1,"");
	};
};

