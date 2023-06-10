/**************************************************************************

							���������� ������
  
  ��������� �� �� � �������� ���. ���������� �������� ����� ����� 
AIV_SummonedTime:
    -1 - ����������
    0 - ������
    ���� - ������� �������� ���.

  ����� ���������� - ������.
  ����� ����������� - ���.
 
***************************************************************************/


//������� ================================
instance DIA_Summoned_EXIT(DIA_Proto_End)
{
};

//-------------------------------------------

instance DIA_Summoned_FREE(C_Info)
{
	nr = 1;
	condition = DIA_Summoned_FREE_Condition;
	information = DIA_Summoned_FREE_Info;
	permanent = TRUE;
	description = "��������";
};


func int DIA_Summoned_FREE_Condition()
{
	return TRUE;
};

func void DIA_Summoned_FREE_Info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_SummonedTime] = 0;
};


//�������� � �� =========================
//��� ������ � �������������

//��������� - ����� ������������
instance HELPER_Teleport(C_NPC)
{
	name[0] = "�������� � ��";
	guild = GIL_MEATBUG;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_HITPOINTS_MAX] = 10;
	npcType = npctype_main;
	noFocus = TRUE;
    Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Npc_SetToFistMode(self);
	start_aistate = ZS_Follow_Player;
};
//��������
func void B_Summoned_TeleportToPlayer()
{
	//���� �� ������� ������
	if (Npc_GetDistToNpc(self,hero) > 1000)	{
		//����������������� � ����
		var string wp;	wp = Npc_GetNearestWP(hero);
		//���� ����� � �� ��� WP, �� ����� ����������������� � ���������������� ���������� NPC
		if (Npc_GetDistToWP(hero, wp) > 500)	{
			if (!Hlp_IsValidNpc(HELPER_Teleport))	{
				var C_NPC slf;	slf = Hlp_GetNpc(self);
				Wld_SpawnNpcRange(hero,HELPER_Teleport,1,1000);
				self = Hlp_GetNpc(slf);
			};
			wp = "HELPER_TELEPORT";
		};
		Npc_ClearAIQueue(self);
		AI_Teleport(self,wp);
	};
};

//���������� =========================================

func void B_SummonedAssessTalk()
{
	DIA_Summoned_EXIT.npc = Hlp_GetInstanceID(self);
	DIA_Summoned_FREE.npc = Hlp_GetInstanceID(self);
	AI_ProcessInfos(self);
	//Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};

// ----------------------------------------

func void B_SummonedAssessPlayer()
{
	B_Summoned_TeleportToPlayer();
	B_MM_AssessPlayer();
};

//��������� =========================================

func void ZS_MM_Rtn_Summoned()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_SummonedAssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_MM_AssessOthersDamage);
	//������ ������� ��� ������� �������
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector))
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_SummonedAssessTalk);
	};
	//���������� � ��
	B_SetAttitude(self,ATT_FRIENDLY);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.aivar[AIV_Behaviour] = self.aivar[AIV_Behaviour] | BEHAV_Summoned;
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	//����� ������� �� ��������� - ���� �� ������ ����
	if (self.aivar[AIV_SummonedTime] == 0)	{
		// ������ ������� � 3 ���� ������!
		if (PATRONGOD == PATRONGOD_Beliar)	{
			self.aivar[AIV_SummonedTime] = 3 * MONSTER_SUMMON_TIME;
		}
		else	{
			self.aivar[AIV_SummonedTime] = MONSTER_SUMMON_TIME;
		};
	};
};

func int ZS_MM_Rtn_Summoned_Loop()
{
	B_MM_WispDetect();
	B_Summoned_TeleportToPlayer();
	if(Npc_GetDistToNpc(self,hero) > 500)
	{
		AI_GotoNpc(self,hero);
	}
	else if(Npc_GetStateTime(self) >= 1)
	{
		//������� ��������������� ��������
		if(Hlp_IsValidNpc(HELPER_Teleport))	{
			Wld_RemoveNpc(HELPER_Teleport);
		};
		//���� �� ����� �� - ����������� � ����
		if(!Npc_CanSeeNpc(self,hero))
		{
			AI_TurnToNPC(self,hero);
		};
		// ���� self.aivar[AIV_SummonedTime] == -1, �� ����� ������� �� ����������
		if (self.aivar[AIV_SummonedTime] >= 0)	{
			self.aivar[AIV_SummonedTime] -= Npc_GetStateTime(self);
			//����� �����?
			if (self.aivar[AIV_SummonedTime] <= 0)	{
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS]);
			};
		};
		Npc_SetStateTime(self,0);
	};
	self.wp = Npc_GetNearestWP(self);
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Summoned_End()
{
};


