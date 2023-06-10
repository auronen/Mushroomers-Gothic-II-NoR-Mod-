/**************************************************************************

							��������� �� ��
  
  ��������� ���������� �� ��������� - 50�. 
  �������� ����������� ����������� ���������� (������, ���� ��������).
  ����� ���������� - ����������� � ������������, ������� ����������.
  ����� ����������� - ���.
 
  ����� AIV_TAPOSITION � ������ ������:
   NOTINPOS	- ���� �� ��
   ISINPOS	- ���� �� �����

***************************************************************************/

// ���������� �� ===========================================================

func void B_AssessFollowPlayer()
{
	// ��������� ��, ���� �� ������
	if((Npc_GetDistToNpc(self,hero) < self.aivar[AIV_FollowDist]) && (self.aivar[AIV_TAPOSITION] == NOTINPOS)
		|| (self.aivar[AIV_MaxDistToWp] > 0 && Npc_GetDistToWP(hero,self.wp) > self.aivar[AIV_MaxDistToWp]))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	B_AssessPlayer();
};

// ���������� ���� �������� ==============================================

func void B_AssessFollowFightSound()
{
	// ��������� ��������� ���������� ������, ����
	if(Npc_IsPlayer(other) || Npc_IsPlayer(victim)		// ��������� ��
		|| (other.aivar[AIV_PARTYMEMBER] == TRUE) || (victim.aivar[AIV_PARTYMEMBER] == TRUE)) // ��� ���-�� �� ��� �������
	{
		B_AssessFightSound();
	};
};


// ������ =================================================================

func void ZS_Follow_Player()
{
	// ����������
	self.senses_range = PERC_DIST_ACTIVE_MAX;
	Npc_SetPercTime(self,0.3);
	Perception_Set_Minimal();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessFollowPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFollowFightSound);
	B_ResetAll(self);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	// ��������� ����������
	if(self.aivar[AIV_FollowDist] == 0)
	{
		self.aivar[AIV_FollowDist] = 500;
	};
};

// ���� ===================================================================

func int ZS_Follow_Player_Loop()
{
	self.wp = Npc_GetNearestWP(self);
	if (C_FollowPlayerForbidden(self))	{
		return LOOP_CONTINUE;
	};
	// ���� �� ������� ������ (� ������) 
	if(Npc_GetDistToNpc(self,hero) > self.aivar[AIV_FollowDist]
		// ���������, �� ���� �� �� ������� ������
		&& ((self.aivar[AIV_MaxDistToWp] == 0) || (Npc_GetDistToWP(hero,self.wp) <= self.aivar[AIV_MaxDistToWp])))
	{
		// ��� ���� ��������� ---------------------------------------------
		if(!C_BodyStateContains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_GotoNpc(self,hero);
		self.aivar[AIV_TAPOSITION] = FALSE;
	}
	else // � �� ������
	// ���� ��� ������ ������ 1 ���.
	if(Npc_GetStateTime(self) > 1)
	{
		B_TurnToNpc(self,hero);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

// ���������� =============================================================

func void ZS_Follow_Player_End()
{
};

