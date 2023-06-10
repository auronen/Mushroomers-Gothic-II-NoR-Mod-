/**************************************************************************

							����� ��
  
  �������� ����������� ����������� ���������� (������, ���� ��������). �����
��, ���� �� ������ ������, ��� �� 8�. ���������, ��� �����, ���� �� ����� 
���������� ������ 3�.
  ���� �� ������� �� ������, �������� ��������� ��������, � ����� �� ������
����� ������, ��� �� 12�, �� ������ �� ��������� ����� ����.
  ����� ���������� - ����������� � ������������, ������� ����������.
  ����� ����������� - ���.

  ������ �� ZS_Follow_Player.
  
//PB: ������ ������: ���� �� �� ������� �� ������, AIV_EnemyOverride �����������!
//NS: �� ����, ��� ������� ������������ �������� AIV_EnemyOverride
��� ������ ��, �� ������������ ��� �����. �.�. ���� �� ������� ����-��
�� ������, �� ����� ��� �� ��������, ����� ���������� AIV_EnemyOverride.
� ���� ��� ���� �� ����-�� ��������, �� ����� ����� ��������� ���������
�������� ���������, ���� AIV_EnemyOverride ��� ���������� ���-�� ���

***************************************************************************/


// ���������� �� ===========================================================

func void B_AssessGuidePlayer()
{
	// ���������, ���� �� ������ ������, ��� �� 8�
	if(Npc_GetDistToNpc(self,hero) > 800)
	{
		if(Npc_GetDistToWP(self,self.wp) < Npc_GetDistToWP(hero,self.wp))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			B_TurnToNpc(self,hero);
		};
		// ���� �� �����, � �� ������ ����-�� ������, ����� ������ �� �����
		if((Npc_GetDistToNpc(self,hero) > 1200) && (self.aivar[AIV_EnemyOverride] == TRUE)
			&& (C_NpcGetAttitude(self,hero) == ATT_HOSTILE))
		{
			self.aivar[AIV_EnemyOverride] = FALSE;
		};
	}
	// ���� �� ������ - ������� ����������
	else
	{
		B_AssessPlayer();
	};
};

// ���������� ���� �������� ==============================================

func void B_AssessGuideFightSound()
{
	// �������� ��������, ������ ���� ��������� ��
	if(Npc_IsPlayer(other) || Npc_IsPlayer(victim))
	{
		B_AssessFightSound();
	};
};

// ������ =================================================================

func void ZS_Guide_Player()
{
	// ����� ����������
	Perception_Set_Minimal();
	B_ResetAll(self);
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessGuidePlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessGuideFightSound);
};

// ���� ===================================================================

func int ZS_Guide_Player_Loop()
{
	// ������� ����������, ���� �� ������
	if((Npc_GetDistToNpc(self,hero) > 800) && (Npc_GetDistToWP(self,self.wp) < Npc_GetDistToWP(hero,self.wp)))
	{
		if (Npc_GetStateTime(self) > 0)	{
			B_AssessGuidePlayer();
			Npc_SetStateTime(self,0);
		};
	}
	// �� �� ������ -----v
	// ���� ��� �� ������ - ����� � ����
	else if(Npc_GetDistToWP(self,self.wp) > 300)
	{
		if(!C_BodyStateContains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_GotoWP(self,self.wp);
	}
	// ��� ������ - ����������� � ��
	else
	{
		if (Npc_GetStateTime(self) > 0)	{
			B_TurnToNpc(self,hero);
			Npc_SetStateTime(self,0);
		};
	};
	return LOOP_CONTINUE;
};

// ���������� =============================================================

func void ZS_Guide_Player_End()
{
};

