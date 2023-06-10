/**************************************************************************

								�����
  
  �������� self (�) ������� ���� other (��).
  ����� ���������� - ����������� + �������������. ��������� ����������
�������.
  ����� ����������� - ���.
  
  ����� AIV_TAPOSITION:
	0 - � �� ���� ������ �� ������
	1 - ���� 1 ���
	2 - ���� 2 ����
 
***************************************************************************/

func void B_AssessSurprise()
{
	Npc_SetTarget(self,other);
	self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
};


// ������ =================================================================

func void ZS_Attack()
{
	////PrintSelfVsOther("Attack 1");
	// ����� ����������
	Perception_Set_Minimal();
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_AssessSurprise);
	// ���������� ����
	B_ValidateOther();
	// ���� �� ���� �������� ���� 
	if(self.aivar[AIV_LOADGAME] == FALSE)
	{
		// �������� ������� �����
		B_Say_AttackReason();
		// ��������, �� ����� �� ������� �� ����
		if(C_WantToFlee(self,other))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Flee,0,"");
			return;
		};
	};
	// ���� � ��� �� ������
	if(Npc_IsInFightMode(self,FMODE_NONE))
	{
		// ����������� ������ (��� �� ��������)
		AI_EquipBestRangedWeapon(self);
		AI_EquipBestMeleeWeapon(self);
	};
	// ���������� ���, ��� ����� �� �����
	AI_Standup(self);
	B_StopLookAt(self);
	// ����������� � ����
	B_TurnToNpc(self,other);
	// ������� �� ���
	AI_SetWalkMode(self,NPC_RUN);
	// �������� ������� ��������������
	B_GuardPassageStatusReset(self);
	// ��������� ������������ ��������� �� �� ������ �����
	self.aivar[AIV_LastAbsolutionLevel] = B_GetCurrentAbsolutionLevel(self);
	// �������� ���������� ���������
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0;
	Npc_SetStateTime(self,0);
	
	//�������� � ������ �����, ���� ��� ���� ������� �����-�� �������� ��������, � �� ��� ������� �� �������� ��
	if (self.aivar[AIV_ATTACKREASON] == AR_KILL || self.aivar[AIV_ATTACKREASON] == AR_NONE || self.aivar[AIV_ATTACKREASON] == AR_SuddenEnemyInferno)	{
		Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, other, self);
	};
};

// ���� ===================================================================

func int ZS_Attack_Loop()
{
	////PrintSelfVsOther("Attack Loop 1");
	// ���������� �� �����
	Npc_GetTarget(self);
	
	// ����������� ����� ---------------------------------------------------
	
	// ���� �� ������� ������
	if ((self.aivar[AIV_FightDistCancel] > 0) && Npc_GetDistToNpc(self,other) > self.aivar[AIV_FightDistCancel]) 
	{
		// ���������� ����� � �������������
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};

	////PrintSelfVsOther("Attack Loop 2");
	// ������������� -------------------------------------------------------
	
	// ���� � ��� ����� ���� �� ���, �� ��� �� ��������� �������������
	if((Npc_GetStateTime(self) > self.aivar[AIV_MM_FollowTime]) && (self.aivar[AIV_PursuitEnd] == FALSE))
	{
		// ����������
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		// ��������� ���������� � ������������ �������������
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		// ���� �� ������� - ����������������
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$RUNCOWARD");
			}
			else	{
				B_Say(self,other,"$RUNCOWARD_F");
			};
		};
	};
	
	// ���� ������������� ���������
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		// ���� � ��� �� ��������
		if(Npc_GetDistToNpc(self,other) > self.senses_range)
		{
			// ���������� �����
			return LOOP_END;
		};
		// �� � �������� ��������� (����������, �����������) -----v
		// ���� � ��� ��� �������-�� �������
		if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			// ���� �� ����������� ��� �������� �������, �� �� ��������� � ����
			if(((Npc_GetDistToNpc(self,other) < self.aivar[AIV_Dist])
					|| (!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP)))
				&& (C_WantToFollowInWater(self, other)))
			{
				// �������� ����������� �������������
				self.aivar[AIV_PursuitEnd] = FALSE;
				// ����� ������� ��������
				Npc_SetStateTime(self,0);
				self.aivar[AIV_StateTime] = 0;
			}
			// �����
			else
			{
				// ����������� � ����
				B_TurnToNpc(self,other);
				// ���������, ��� �� � ������� ������� � ���
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
			};
		};
		// ������ ������ �� ������
		return LOOP_CONTINUE;
	};
	
	//PrintSelfVsOther("Attack Loop 3");
	// �������� ---------------------------------------------------------------
	// ���� ��������� �� ����������
	if(C_NpcIsHero(other) && (B_GetCurrentAbsolutionLevel(self) > self.aivar[AIV_LastAbsolutionLevel]) )
	{
		// ���������� �����
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	
	//PrintSelfVsOther("Attack Loop 4");
	// �������� ----------------------------------------------------------------
	// ���� �� ������ ��� ������, � � �� ���� ����� � ����
	if(!C_WantToFollowInWater(self, other))
	{
		// ���������� �������������
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_CONTINUE;
	};
	
	// ���� � �����-���� � ����, �� �� ����� �����
	if((C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		&& (!HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_FollowInWater)))
	{
		// ���������� ����� � �������������
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		AI_StartState(self, ZS_MM_GetOutOfWater, 0, "");
		return LOOP_END;
	};
	
	//PrintSelfVsOther("Attack Loop 5");
	// �������� ����� ----------------------------------------------------------
	// ���� ����, ��������� ����� ������
	if(self.aivar[AIV_WaitBeforeAttack] >= 1)
	{
		AI_Wait(self,0.8);
		// ������ ����� �� ����
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};
	
	// ���������� �� "����" ----------------------------------------------------
	// ���� ��� ������ ������ ������� �� ����
	if(self.aivar[AIV_MaxDistToWp] > 0)
	{
		// ���������, �� ���� �� �� ��� ������� ������
		if((Npc_GetDistToWP(self,self.wp) > self.aivar[AIV_MaxDistToWp])
			&& (Npc_GetDistToWP(other,self.wp) > self.aivar[AIV_MaxDistToWp]))
		{
			// ������� � ����� ��� "�� �����"
			self.fight_tactic = FAI_NAILED;
		}
		else
		{
			// ���� ��� - ��������� � ������ �������� �����
			self.fight_tactic = self.aivar[AIV_OriginalFightTactic];
		};
	};

	// �������� ---------------------------------------------------------------
	// ������� ����������
	B_CreateAmmo(self);
	// ������� ���������� ������
	B_SelectWeapon(self,other);
	
	
	// ����� -------------------------------------------------------------------
	// �� ����� ��� ������
	if((self.aivar[AIV_ArenaFight] == AF_RUNNING) && Npc_IsPlayer(other))
	{ 
		//��������� ������ ���������� �������
		if (Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))	{
			self.aivar[AIV_ArenaFight] = AF_WRONG_WEAPON;
			//���������� ���������� �� ������
			B_AssessTalk();
			if(self.aivar[AIV_NpcStartedTalk] == TRUE)	{
				self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
				return LOOP_END;
			};
		};
		//�� ����� ������, ����, ����� �������� ���
		if (Npc_IsInFightMode(other,FMODE_NONE))	{
			if (Npc_GetStateTime(self) < 7)	{
				return LOOP_CONTINUE;
			}
			else	{
				self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
				self.aivar[AIV_ArenaFight] = AF_AFTER;
				return LOOP_END;
			};
		};
		//*/
	};

	
	// ����� ������ ------------------------------------------------------------
	/* ����� 2 � 8 ������ ������� ����� */
	
	// ���� �� �� ��������� ��������
	if(!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP))
	{
		// ����� �������
		Npc_SetStateTime(self,0);
	};
	
	// ���� ������ ��� ������ 2 ������, � � ��� �� ���� ������
	if((Npc_GetStateTime(self) > 2) && (self.aivar[AIV_TAPOSITION] == 0))
	{
		// �������
		B_CallGuards();
		// ���������, ��� ���� 1 ���
		self.aivar[AIV_TAPOSITION] = 1;
	};
	
	// ���� ������ ��� 8 ������, � � ��� ���� ��� ���� ������
	if((Npc_GetStateTime(self) > 8) && (self.aivar[AIV_TAPOSITION] == 1))
	{
		// ������� ��� ���
		B_CallGuards();
		// ���������, ��� ���� 2 ����
		self.aivar[AIV_TAPOSITION] = 2;
	};

	//PrintSelfVsOther("Attack Loop 6");
	// ����� ------------------------------------------------------------------
	// ���� �� ��� ��� ����� � �� ��������
	if(Hlp_IsValidNpc(other) && (C_NpcIsDown(other) == FALSE))
	{
		if(other.aivar[AIV_INVINCIBLE] == FALSE)	// ���� �� ��������
		{
			// �������
			//PrintSelfVsOther("Attack 2");
			AI_Attack(self);
		}
		else	// ���� �� ��������
		{
			//PrintSelfVsOther("Attack 3");
			// �������� ��� ������
			Npc_ClearAIQueue(self);
		};
		// ���������, ��� � �� ���� �������
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		// ������ ������ �� ������
		return LOOP_CONTINUE;
	};
	
	//PrintSelfVsOther("Attack Loop None");
	// ����� ��� ---------------------------------------------------------------
	// �� ��������, ��� ��� ������ ��� 
	
	// �������� ���
	Npc_ClearAIQueue(self);
	
	// ���� �� - ����������� ��
	if(Hlp_IsValidNpc(other) && Npc_IsPlayer(other) && C_NpcIsDown(other))
	{
		// �������� ��������� ��������� � �� �� �������
		Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	};
	
	// ����� ������ ����� -------------------------------------------------------
	// ���� � �� ���� ���������� ����� ������������
	if(self.aivar[AIV_ATTACKREASON] != AR_KILL)
	{
		// ������������� �� ���������� �����
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
	};
	
	// ����		
	if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other)		// �� ���� � �� ��������
		&& ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || Npc_IsPlayer(other)) // � �� ������ ��� �� ��
		&& (Npc_GetHeightToNpc(self,other) < PERC_DIST_HEIGHT)	// � �� �� ������� ������ (���� ���� ��)
		&& (other.aivar[AIV_INVINCIBLE] == FALSE))	// � �� ��������
	{
		// ���� �� �� ���������� ��������
		if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
		{
			// ��������� ������ ���������
			self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
			// ���� �� ��
			if(Npc_IsPlayer(other))
			{
				// ��������� ������� ��������� �� �� � ��� �������� ��������
				self.aivar[AIV_LastPlayerAR] = AR_GuildEnemy;
				self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
				// ���������, ��� ����� ���� �����������������
				self.aivar[AIV_LastFightComment] = FALSE;
			};
		}
		// ����� - �� �� �� ���������� ��������, �� �� �����
		else if(C_NpcGetAttitude(self,other) == ATT_HOSTILE)
		{
			// ������� ����� �� ��, ��� � ������� ����� � ��
			self.aivar[AIV_ATTACKREASON] = self.aivar[AIV_LastPlayerAR];
		};
		// ������ ������ �� ����, ����� ������������
		return LOOP_CONTINUE;
	};
	// ����� - ������ ����� ���, �� ��������, ������, ���������� ��� ����������� ���� ������-��������
	
	// �������� ��� ������
	Npc_ClearAIQueue(self);
	// ���� ��������� ����� � �� �������� � ��� ��������� ���� - �� ��
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		&& (self.aivar[AIV_LASTTARGET] != Hlp_GetInstanceID(hero)))
	{
		// �� ���� �������������� �����
		self.aivar[AIV_LastFightComment] = TRUE;
	};
	// ���������� �����
	return LOOP_END;
};

// ����� ==================================================================

func void ZS_Attack_End()
{
	// ����������� ����
	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	
	// ���� � ��������� �������������
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		// ���� �� ��, � � �� ��� ����
		if(Hlp_IsValidNpc(other) && Npc_IsPlayer(other) && (self.npcType != NPCTYPE_FRIEND))
		{
			// ���������, ��� �� �����
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
		// ���� ���� �������� �� �����, ���������, ��� ��� �����������
		if(self.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			self.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	}
	// ����������� --------------------------------------------------------------------
	else	// �����
	{
		// ���� �� ����������
		if(B_GetCurrentAbsolutionLevel(self) > self.aivar[AIV_LastAbsolutionLevel])
		{
			// �������, ��� �� �������
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$WISEMOVE");
			}
			else	{
				B_Say(self,other,"$WISEMOVE_F");
			};
		}
		else	// ����� - ������� ����������� � �����
		{
			B_Say_AttackEnd();
		};
	};
	//���������� ��������� ����� � �� (�����, �.�. ����� �������� ������� - � �������� ���)
	if (Hlp_IsValidNpc(other) && Npc_IsPlayer(other))	{
		//���� �� �������� - � ������ ���� �����������, ���� ���� �� � ����� ��������� ����
		if (C_NpcIsDown(other))	{
			self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		}
		//����� - ����� � �� ��������
		else	{
			self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
		};
	};
	// ���� ��� ���� �� � �� �� � �� �� �� ��������� ��������
	if((other.aivar[AIV_KilledByPlayer] == TRUE) && (Wld_GetGuildAttitude(self.guild,hero.guild) != ATT_HOSTILE))
	{
		// ������� ��� ������
		B_SetAttitude(self,ATT_FRIENDLY);
	};
	// ���� �� ���� ��� ��������, � � ���� ��� ����� ����� ���
	if(Npc_IsInState(other,ZS_Unconscious) && C_NpcHasAttackReasonToKill(self))
	{
		// ������ ������������
		B_FinishingMove(self,other);
	};
	// ������ ������
	B_RemoveWeapon(self);
	// ������ --------------------------------------------------------------------
	// ���� �� ��������, � � ���� ��� ��������, � �� �� ������� ������
	if(C_NpcIsDown(other) && C_WantToRansack(self)
		&& ((other.aivar[AIV_RANSACKED] == FALSE) || C_NpcRansacksAlways(self))
		&& (!HasFlags(self.aivar[AIV_Behaviour], BEHAV_NeverRansack))
		&& (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT))
	{
		// ��������, ��� ��� �������
		other.aivar[AIV_RANSACKED] = TRUE;
		// ���� �� �������
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			// ������ ����������
			AI_StartState(self,ZS_RansackBody,0,"");
			// ������ ������
			return;
		}
		// ����� - �� �� �������
		// � ���� � ��������� ����, � � ���� ���� ����
		else if(C_NpcIs(self,OUT_1230_Trocar) && (Npc_HasItems(other,ItFoMuttonRaw) > 0))
		{
			// ������ �������� ����
			AI_StartState(self,ZS_GetMeat,0,"");
			// ������ ������
			return;
		};
	};
	// ���� � ���� ������ �������� ��������
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		// ����������
		AI_StartState(self,ZS_HealSelf,0,"");
		// ������ ������
		return;
	};
};




