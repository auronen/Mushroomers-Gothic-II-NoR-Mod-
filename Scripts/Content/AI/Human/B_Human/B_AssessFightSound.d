/**************************************************************************

						���������� ���� ��������
 
  �������� self (�) ������, ��� other (��������) ����� �� victim (������).

  B_AssessFightSound() ���������� ��� ��������� ���������� 
PERC_ASSESSFIGHTSOUND � �� ��. ��������.

  ������� �������: ������ ��������� �� ������.
  ���� � �������� (�������������) - ������� �� ��������.

  �������� �����������: ��� ������������ � ������� - ����� � ���������
� ��� �������, ��������� �� "���������" ���� �� ��������� �������������.

***************************************************************************/

//������������� ��������
func void B_Attack_BodyGuard(var C_NPC slf, var C_NPC oth)
{
	if (oth.guild < GIL_SEPERATOR_HUM)	{
		B_Attack(slf, oth, AR_ReactToDamage, 0);
	}
	else {
		B_Attack(slf, oth, AR_MonsterVsHuman, 0);
	};
};

//������ �� ����, ���� � �������?
func int B_AssessGuardedDamage()
{
	//MEM_Debug("B_AssessGuardedDamage");
	//MEM_Debug(self.name);
	//MEM_Debug(victim.name);
	//MEM_Debug(other.name);
	// � ��� �������� - �� �����������
	if (Npc_IsInState(self, ZS_Attack))	{
		return FALSE;
	};

	// ���� � ��������
	if (HasFlags(self.aivar[AIV_Temper], TEMPER_BodyGuard)) {
		//� � ������� ������
		if (C_IsBodyGuard(self,victim)) {
			//�� ������� �� ��������
			B_Attack_BodyGuard(self, other);
			return TRUE;
		};
		//� ���� � ������� ��������  � �� ������� ������ ������
		if (C_IsBodyGuard(self,other)) {
			if (C_NpcGetAttitude(self,victim) != ATT_FRIENDLY)	{
				//�� ������� �� ������
				B_Attack_BodyGuard(self, victim);
			}
			else	{
				AI_StartState(self,ZS_WatchFight,0,"");
			};
			return TRUE;
		};
	};
	//���� ������� ��������
	if (HasFlags(other.aivar[AIV_Temper], TEMPER_BodyGuard)) {
		//� �� �������� ���� � � �� ������� ������ ������
		if (C_IsBodyGuard(other, self)) {
			if (C_NpcGetAttitude(self,victim) != ATT_FRIENDLY)	{
				//�� ������� �� ������
				B_Attack_BodyGuard(self, victim);
			}
			else	{
				AI_StartState(self,ZS_WatchFight,0,"");
			};
			return TRUE;
		};
	};
	//���� ������ ��������
	if (HasFlags(victim.aivar[AIV_Temper], TEMPER_BodyGuard)) {
		//� �� �������� ����
		if (C_IsBodyGuard(victim, self)) {
			//�� ������� �� ��������
			B_Attack_BodyGuard(self, other);
			return TRUE;
		};
	};
	//����� - ���
	return FALSE;
};

func void B_AssessFightSound()
{
	//�� �������� ��������, ���� -------------------------------------------
	
	// ��� ������
	if(!Hlp_IsValidNpc(victim))
	{
		return;
	};
	
	//������������ �����
	if (HasFlags(self.aivar[AIV_IgnoreFlags], IGNORE_FightSound)) {
		return;
	};

	// ���� ���������� �� ��������� ������ ��������, 
	if((Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT))
	{
		//�� ����������� �������, �����	� - ����� ��� ������, � ���� �� ��������� - ��� ��������
		//NS: ��� � ���� �������������!
		if(((self.guild == GIL_OUT)	|| (self.guild == GIL_BDT))
			&& ((victim.guild == self.guild) || (other.guild == self.guild)))
		{
		}
		else
		{
			return;
		};
	};
	
	// ���� � �� ����� �������� � ����,
	if(!HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_FollowInWater))
	{
		// � ���� �� ��������� ������ ��� ������
		if(C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)
			|| C_BodyStateContains(victim,BS_SWIM) || C_BodyStateContains(victim,BS_DIVE))
		{
			return;
		};
	};
	
	// ���� ���� �� ��������� �� �����
	if((other.fight_tactic == FAI_NAILED) || (victim.fight_tactic == FAI_NAILED))
	{
		return;
	};
	
	// ���� ��������� ������� ������
	if((Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT) && (Npc_GetHeightToNpc(self,victim) > PERC_DIST_HEIGHT))
	{
		return;
	};
	
	// ���� � � ���������, � ��� - ���, � � �� �� ����
	if((C_GetNpcPortalGuild(self) != GIL_OUTDOOR) && 
		((C_GetNpcPortalGuild(self) != C_GetNpcPortalGuild(other)) && (C_GetNpcPortalGuild(self) != C_GetNpcPortalGuild(victim))) ||
		((Npc_GetHeightToNpc(self,other) > 500) && (Npc_GetHeightToNpc(self,victim) > 500)) &&
		(!Npc_CanSeeNpc(self,other) && !Npc_CanSeeNpc(self,victim)))
	{
		return;
	};
	
	// ���� ���� ���������� � ��������� � �������� ������ 5� �� ��������� //NS: ������, ��� ���������� ���������
	if((Npc_GetHeightToNpc(self,other) > 500) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_04") <= 3000))
	{
		return;
	};
	
	// � ��� - ������ ��� ��������
	if((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(self)))
	{
		return;
	};
	
	
	// ���� ----------------------------------------------------------------
	
	// ���� ������ - ����, �� �� ���������
	if((victim.guild == GIL_SHEEP) && (!HasFlags(victim.aivar[AIV_StoryFlags], STORY_Sheep)))
	{
		// � ���� � �� �������� ��������� �� ����,
		if(C_WantToAttackSheepKiller(self,other))
		{
			// �� ������� �� ��������
			B_Attack(self,other,AR_SheepKiller,0);
			return;
		}
		// � ���� ��������, �� ������ ��� � ���� ������ �����,
		else if(C_NpcIsGateGuard(self))
		{
			// �� ���������, ��� �������� �������� ������������
			B_MemorizePlayerCrime(self,other,CRIME_SHEEPKILLER);
			return; // � ������ ������ �� ������
		};
		// � ��������� ������� - �� �������� �� ���� ��������
		return;
	};
		
	//��� �� �������� ��������, ���� ----------------------------------------
	
	//� ���� ������ ����� ��� � �������
	if(C_NpcIsGateGuard(self) || HasFlags(self.aivar[AIV_Behaviour], BEHAV_Hidden))
	{
		return;
	};
	
	// ��� ��������� - �� ���� (�������)
	if((other.guild > GIL_SEPERATOR_HUM) && (victim.guild > GIL_SEPERATOR_HUM))
	{
		return;
	};
	
	// ������ - ���������� ������
	if((victim.guild > GIL_SEPERATOR_HUM) &&
		(HasAnyFlags(victim.aivar[AIV_TEMPER], TEMPER_NoFightParker) || (C_NpcGetAttitude(self,victim) != ATT_HOSTILE)))
	{
		return;
	};
	
	// ----------------------------------------------------------------------
	
	// ���� �������� - ������, � � �� ���� ������
	if((other.guild > GIL_SEPERATOR_HUM) && (C_NpcGetAttitude(self,victim) != ATT_HOSTILE))
	{
		// �� ������� �� �������
		B_Attack(self,other,AR_MonsterVsHuman,0);
		return;
	};
	
	// ���� ������ - ������, � � �� ���� �����������, � ����� ��� �� �����
	if((victim.guild > GIL_SEPERATOR_HUM) && (C_NpcGetAttitude(self,other) != ATT_HOSTILE) && !Npc_IsDead(victim))
	{
		// �� �������������� � ����� �� �������
		B_Attack(self,victim,AR_MonsterVsHuman,0);
		return;
	};
	
	// ���� ��� ��������� �������� �� ������
	if ((self.aivar[AIV_EnemyOverride] == TRUE)
		&& ((C_NpcGetAttitude(self,other) == ATT_HOSTILE) || (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY))) //NS: ���������
	{
		// ����� ������
		self.aivar[AIV_EnemyOverride] = FALSE;
		// �����������
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		// � ���� �������� ��� � ����
		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
		{
			// ��������� ��� ��� ����� �� �������
			B_Attack(self,other,AR_GuildEnemy,0);
			return;
		};
		return;
	};
	
	// ��� �� ������� ----------------------------------------------------------
	
	
	// ������ - ��� ����, �� �� ��� �� ������� ���������
	if (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY)
	{
		if (Npc_IsInState(victim,ZS_ReactToDamage))
		{
			return;
		};
		if(Npc_IsInFightMode(other,FMODE_MELEE)		//���� ��������� ����� � ��� �� ������� 
			|| Npc_IsInFightMode(other,FMODE_FIST) 	//��� � ������� �������� ���
			|| Npc_IsInFightMode(other,FMODE_NONE))	//��� �� ����� � ���
		{ 
			//� �������� - ��� ���� ��
			if((C_NpcGetAttitude(self,other) == ATT_FRIENDLY) || ((self.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(other)))
			{ 
				//� � ��� �� ����������� �� ��������� 
				if(!Npc_IsInState(self,ZS_ReactToDamage))
				{ 
					// ����� ������ �������� � ����������
					Npc_ClearAIQueue(self);		
					B_ClearPerceptions(self);	
					// ������� � ������ ��������
					AI_StartState(self,ZS_ReactToDamage,0,"");	//����������� ������� �� �����������, �� ����� � �����
					return; //�����
				};
			};
		};
	};
	
	// ������ ------------------------------------------------------------------
	/* ��������� ������ */
	
	// ���� � ����������� ��� ��������� ����� ����� ������: 
	if(((other.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)	//���������,
		|| (other.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)	//����������� �������,
		|| (other.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)	//��������,
		|| (other.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)			//���� �� �������,
		|| (other.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill))	//�������� ���������� ����� ������,
		&& (C_NpcGetAttitude(self,other) == ATT_FRIENDLY)) // � � ���� ���������,
	{
		// �� �������������� � ���������, ����� ����� ������
		B_Attack(self,victim,AR_GuardCalledToKill,0);
		return;
	};
	
	// ��� ����������� �������� ��� ������
	if(((victim.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill))
		&& (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY))
	{
		// �������������� � ������, ����� ����� �����������
		B_Attack(self,other,AR_GuardCalledToKill,0);
		return;
	};
	
	// ���� ����� ������� ���, �� �� ����� ���������:	
	if(((other.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)	//����������� �����,
		|| (other.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)	//����� �� �����������,
		|| (other.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon))	//����� �� ������ �������,
		&& (C_NpcGetAttitude(self,other) == ATT_FRIENDLY)) // � � ���� ���������
	{ // ��
		// ����� �������, �����
		if(((other.guild == GIL_SLD) || (other.guild == GIL_NONE))
			&& ((victim.guild == GIL_SLD) || (victim.guild == GIL_NONE)))
		{  // ��� ��������� �� ������� ���������, ��������� �� �������� ��� ��� �������,
		}
		else if(!Npc_IsPlayer(other) && !Npc_IsPlayer(victim)) 
		{  // ��� � ����� �� ��������� ��,
		}
		else if (Npc_IsInState(other,ZS_ReactToDamage))
		{	// ���� ��� �� ������� 
		}
		//�����
		else 
		{
			// �������������� � ���������, �� ������ �� �������
			B_Attack(self,victim,AR_GuardStopsFight,0);
			return;
		};
	};
	
	// ���������� ��� ������
	if(((victim.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon))
		&& (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY))
	{
		if(((other.guild == GIL_SLD) || (other.guild == GIL_NONE))
			&& ((victim.guild == GIL_SLD) || (victim.guild == GIL_NONE)))
		{
		}
		else if(!Npc_IsPlayer(other) && !Npc_IsPlayer(victim))
		{
		}
		else if (Npc_IsInState(victim,ZS_ReactToDamage))
		{
		}
		else
		{
			// �������������� � ������, �� ��������� �� �������
			B_Attack(self,other,AR_GuardStopsFight,0);
			return;
		};
	};
	
	// ��������� -----------------------------------------------------------
	if (B_AssessGuardedDamage()) {
		return;
	};
	
	// ��������� ---------------------------------------------------------------
	
	// ���� � ����������� � � ������ �� ���� ������� ��� �����, ��� ���� ����� ������� �����,
	if (self.guild == GIL_MIL)	{
		if(((other.aivar[AIV_ATTACKREASON] == AR_NONE) || (other.aivar[AIV_ATTACKREASON] == AR_KILL))
			&& ((victim.aivar[AIV_ATTACKREASON] == AR_NONE) || (victim.aivar[AIV_ATTACKREASON] == AR_KILL)))
		{ // ��
			// ���� � ���� ���������, �� �� ���� ������
			if((C_NpcGetAttitude(self,other) == ATT_FRIENDLY) && (C_NpcGetAttitude(self,victim) != ATT_FRIENDLY))
			{
				// ���������� ������
				B_Attack(self,victim,AR_GuardStopsFight,0);
				return;
			}
			// ���� � ���� ������, �� �� ���� ���������
			else if((C_NpcGetAttitude(self,victim) == ATT_FRIENDLY) && (C_NpcGetAttitude(self,other) != ATT_FRIENDLY))
			{
				// ���������� ���������
				B_Attack(self,other,AR_GuardStopsFight,0);
				return;
			}
			/* ���� �������� - ��
			else if(Npc_IsPlayer(other))
			{
				// ���������� ������
				B_Attack(self,victim,AR_GuardStopsFight,0);
				return;
			}
			// ���� �� - ������
			else if(Npc_IsPlayer(victim))
			{
				// ���������� ���������
				B_Attack(self,other,AR_GuardStopsFight,0);
				return;
			}
			//*/
			// �� ���� ��������� �������
			else
			{
				// ���������� ���������
				B_Attack(self,other,AR_GuardStopsFight,0);
				return;
			};
		};
	};
	
	// ������ ������������� --------------------------------------------
	
	// ���� �������� ������� �������������:
	if(((other.aivar[AIV_ATTACKREASON] == AR_UseMob)		//�� ������������ �������������
		|| (other.aivar[AIV_ATTACKREASON] == AR_Theft)		//�� ���������
		|| (other.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom))	//�� ���������
	&& (C_NpcGetAttitude(self,other) == ATT_FRIENDLY)) // � � ��� ����
	{
		// � ���� � ����� ������� �� ����-������
		if(C_WantToAttackThief(self,victim))
		{
			// �� �������
			B_Attack(self,victim,AR_GuardCalledToThief,0);
		};
		return; // ������ ������ �� ������
	};
	// ���������� ��� ������
	if(((victim.aivar[AIV_ATTACKREASON] == AR_UseMob)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_Theft)
		|| (victim.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom))
	&& (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY))
	{
		if(C_WantToAttackThief(self,other))
		{
			B_Attack(self,other,AR_GuardCalledToThief,0);
		};
		return;
	};
	
	
	// ���� �������� �������� ������������ ����� � � ��� ����,
	if((other.aivar[AIV_ATTACKREASON] == AR_ClearRoom) && (C_NpcGetAttitude(self,other) == ATT_FRIENDLY))
	{
		// �� �������, ��� ��������� ��������� (��� ����������� �� �������� ������� � �������)
		B_Attack(self,victim,AR_GuardCalledToRoom,0);
		return;
	};
	// ���������� ��� ������
	if((victim.aivar[AIV_ATTACKREASON] == AR_ClearRoom) && (C_NpcGetAttitude(self,victim) == ATT_FRIENDLY))
	{
		B_Attack(self,other,AR_GuardCalledToRoom,0);
		return;
	};
	
	// ----------------------------------------------------------------
	
	// ���� ���������� �� ��������� ������ ��������
	//NS: �������� ���������� ��� ����, �� ������ � ��� �������� ����
	if((Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT))
	{
		return; // ������ �� ������
	};
	
	// ���� � ���� ������ ��� �����������
	if((C_NpcGetAttitude(self,other) == ATT_HOSTILE) || (C_NpcGetAttitude(self,victim) == ATT_HOSTILE))
	{
		// � ���� � �� ������
		if(self.guild != GIL_BDT)
		{ 
			return; // ������ �� ������
		};
	};
	
	
	// ���� � �� ���� ������ ������ �� ������ 
	if(!Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return; // ������ �� ������
	};
		
	// � ���� ��������� �������
	// �������� ��������� ����
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	// � ������ ��������� �� ������
	AI_StartState(self,ZS_WatchFight,0,"");
};




