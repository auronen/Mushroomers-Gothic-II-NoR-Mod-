/**************************************************************************

							���������� ������
 
  �������� self (�) ������ ������ other (��).

  B_AssessPlayer() ���������� ���  ��������� ���������� PERC_ASSESSPLAYER
� � ��������, ��������� �� ����������� �� �� �� ����������, � ��������.
�������� ����������� ���������� ������, �����, ����� � ���������, ������
�������.

  ������� �������: ������� �� �������� �� � ������� ��������� - ����������,
�������, ������ ������� � ��. ����� ������ ������ ������������ ����������.

  �����������: �� ���������� ������ � ���� �� ����� �� �������� ��������.

  ������ ����� ��������� � ��, ���� ���� �� ������, ������, ��������,
����������. ��������� � ���� ������� ������������� �� ������. ����� 
����������� ����� �� ������� (��. C_RefuseTalk). 
����������� ���� �� ��������� �� ������� ����� ������� �����������, 
��� ������ - ��������� � ������, �� �� ����, ��� ��� � 20 ���.

***************************************************************************/

//���� �� ����������?
func void B_AssessPlayer_ImportantInfo()
{
	B_SetNameByIndex(self,-1);
	// ���� �� ���������� ������ � � ���� ���� ��� ���� ������ ���������
		/* DEBUG INFO
		PrintSelf("Check important info");
		//*/
	B_AssignAmbientInfos(self);	//���� ����� ���� �������!
	if((Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG) && Npc_CheckInfo(self,1))
	{ 
		/* DEBUG INFO
		PrintSelf("I have important info");
		//*/
		// ���� � ������� ������
		if(C_NpcIsGateGuard(self))
		{
			// ������ ��������, ��������� ��������������� ����
			self.aivar[AIV_NpcStartedTalk] = TRUE;
			B_AssessTalk();
			return; // ������ ������ �� ������
		}
		// ���� �� ������� � �� 
		else if(!C_BodyStateContains(other,BS_FALL)		// �� ������,
			&& !C_BodyStateContains(other,BS_SWIM)		// � �� ������,
			&& !C_BodyStateContains(other,BS_DIVE)  	// � �� ������,
			&& !C_BodyStateContains(other,BS_CLIMB)  	// � �� ����������,
//			&& (B_GetPlayerCrime(self) == CRIME_NONE)	// � �� ����������,
//			&& (C_RefuseTalk(self,other) == FALSE)		// � ��� ������� ���������� �� ���������,
			&& (C_PlayerHasFakeGuild(self,other) == FALSE))	//� � �� �� ������ �������
		{
			// ������ ��������, ��������� ��������������� ����
			self.aivar[AIV_NpcStartedTalk] = TRUE;
			B_AssessTalk();
			return; // ������ ������ �� ������
		};
		/* DEBUG INFO
		PrintScreen(IntToString(C_BodyStateContains(other,BS_FALL)), 30, 20, FONT_ScreenSmall, 3);
		PrintScreen(IntToString(C_BodyStateContains(other,BS_SWIM)), 30, 22, FONT_ScreenSmall, 3);
		PrintScreen(IntToString(C_BodyStateContains(other,BS_DIVE)), 30, 24, FONT_ScreenSmall, 3);
		PrintScreen(IntToString(B_GetPlayerCrime(self)), 30, 30, FONT_ScreenSmall, 3);
		PrintScreen(IntToString(C_RefuseTalk(self,other)), 30, 32, FONT_ScreenSmall, 3);
		PrintScreen(IntToString(C_PlayerHasFakeGuild(self,other)), 30, 34, FONT_ScreenSmall, 3);
		//*/
	};	
};

func void B_AssessPlayer()
{

	// �� �������� ��������, ���� ------------------------------------------
	
	// �� - ��������� ������
	var C_Npc pcl;
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: PC_Levelinspektor");
		//*/
		return;
	};
	
	// �� ����������
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: AIV_INVINCIBLE");
		//*/
		return;
	};
	
	// �� � ��������
	if(C_NpcIsDown(other))
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: C_NpcIsDown");
		//*/
		return;
	};
	
	// ��� �� ������� ��
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PC_Noone))
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: PC_Noone");
		//*/
		return;
	};
	
	// ����������� ---------------------------------------------------------
	
	// ���� �� - �� �������	
	if(other.guild > GIL_SEPERATOR_HUM)
	{ 
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: other.guild > GIL_SEPERATOR_HUM");
		//*/
		// ���� � �� ������ �����
		if(C_NpcIsGateGuard(self))
		{
			//��������
			AI_StandupQuick(self);
			//� ������� �� �� ��� �� �������
			B_Attack(self,other,AR_MonsterCloseToGate,0);
			return; //������ ������ �� ������
		}
		// ���� � �� �� ������ � �� �� ���������� �������
		else if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
		{
			// � ���� � �� ���� �� � �� �� � ����� �������
			if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (self.npcType != NPCTYPE_FRIEND))
			{
				// ������� �� �� ��� �� ����� �� �������
				B_Attack(self,other,AR_GuildEnemy,0);
				return; //������ ������ �� ������
			};
		};
	};
	
	// ����� ----------------------------------------------------------------
	
	// ���� �� - ����
	if(B_AssessEnemy())
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: B_AssessEnemy");
		//*/
		return; // ������ ������ �� ������
	};
	// ���� � ����, ��� �� - ������, � � ����� ������� �� ������, � ���������� �� �� ������ ��������
	if((B_GetPlayerCrime(self) == CRIME_MURDER) && C_WantToAttackMurder(self,other)
		&& (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))
	{
		// �� ������� �� �� ��� �� ������
		B_Attack(self,other,AR_HumanMurderedHuman,0);
		return; //������ ������ �� ������
	};
	
	// �������� �� -------------------------------------------------------------

	// ���� �� ����� �� �������� � �������
	if (HERO_ACTION_Pickpocket == PICKPOCKET_Sleep)
	{
		// ���� � �� ���� ���������� ����, �� �� ����
		if(!C_WantToAttackThief(self,other))
		{ 
			// �� ���� ��� ������, ��� � ���� ������ �����,
			if(C_NpcIsGateGuard(self))
			{
				B_MemorizePlayerCrime(self,other,CRIME_THEFT);	// ��������� ������������ ��
			};
		}
		else	//����� - ���� ��������
		{
			HERO_ACTION_Pickpocket = PICKPOCKET_Fail;	// ��������, ��� �� �������� �����
			B_Attack(self,other,AR_Theft,1);	// ������� �� �� ��� �� ����
			return;	// ������ ������
			//NS: ��������! ���������� ������� � ����������� � ����� ��� ������
		};
	};
	
	// ������� �� ���� � ���������
	if(B_AssessEnterRoom())
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: B_AssessEnterRoom");
		//*/
		return;
	};
	
	// ������� �� ���������� ������
	if(B_AssessDrawWeapon())
	{
		/* DEBUG INFO
		PrintSelf("B_AssessPlayer: B_AssessDrawWeapon");
		//*/
		return;
	}
	else // ���� ������� �� ��������� ������ ���
	{
		// ���������, ��� � �� ������ �� ������ ������
		Player_DrawWeaponComment = FALSE;
	};
	
	// ���� �� ��������
	if(C_BodyStateContains(other,BS_SNEAK))
	{
		// � ���� � ��� �� ����� �� ��, �� ���� ��������� �� ���
		if(!Npc_IsInState(self,ZS_ObservePlayer) && C_WantToReactToSneaker(self,other))
		{
			// ���������� �� ������ ��������
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			// ������ ������� �� ��
			AI_StartState(self,ZS_ObservePlayer,1,"");
			return; //������ ������ �� ������
		};
	}
	// � ���� �� �������� � �� �����
	else if(!C_BodyStateContains(other,BS_STAND))
	{
		// ���������, ��� � �� ��������� ��, ������ �� ��������
		Player_SneakerComment = FALSE;
	};
	
	// ���� ���� � �������
	if (Npc_IsInState(self,ZS_SneakToWp))	{
		if(C_GetNpcPortalGuild(self) <= GIL_OUTDOOR)	{
			Npc_ClearAIQueue(self);
			AI_StartState(self,ZS_ObservePlayer,0,"");
			return;
		}
		else	{
			Npc_ClearAIQueue(self);
			AI_StartState(self,ZS_Flee,0,"");
			return;
		};
	};
	
	// ���� �� �� �����
	if(!C_BodyStateContains(other,BS_LIE))
	{
		// ���������, ��� � �� ��������, ����� �� �������� �� ���� �������
		Player_GetOutOfMyBedComment = FALSE;
	};
	
	// ��������� --------------------------------------------------------------

	B_AssessPlayer_ImportantInfo();
	
	//MR �� - ���������� ----------------------------------------
	//� ���� ������ ���������� �������� �� � ������� �� ����, ����� ��������� �� ���
	var int crime;	crime = B_GetKnownPlayerCrime(self);
	if ((crime != CRIME_NONE) && !C_NpcIsGateGuard(self) && (HERO_Imprisoned == 0)
		&& (C_NpcBelongsToCity(self) || C_NpcBelongsToFarm(self) || C_NpcBelongsToMonastery(self)))	{
		if (crime == CRIME_MURDER)	{
			if (C_WantToAttackMurder(self,other))	{
				B_Attack(self,other,AR_HumanMurderedHuman,0);
				return;
			};
		}
		else	if (crime == CRIME_THEFT)	{
			if (C_WantToAttackThief(self,other))	{
				B_Attack(self,other,AR_GuardCalledToThief,0);
				return;
			};
		}
		else	if (crime == CRIME_ATTACK)	{
			if (C_NpcBelongsToMonastery(self) || (self.guild == GIL_MIL))	{
				B_Attack(self,other,AR_GuardStopsFight,0);
				return;
			};
		}
		else	if (crime == CRIME_SHEEPKILLER)	{
			if (C_WantToAttackSheepKiller(self,other))	{
				B_Attack(self,other,AR_SheepKiller,0);
				return;
			};
		};
	};
	
	// ����  
	if(C_BodyStateContains(self,BS_WALK) 						// �� ����,
		&& (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)	// � �� ���������� ������,
		&& (Npc_RefuseTalk(other) == FALSE) 					// � �� ����������� ��������� �������� �������,
		&& !C_NpcIsGateGuard(self)								// � � �� �� ������ �����,
		&& (C_PlayerHasFakeGuild(self,other) == FALSE))			// � �� �� � ������ �������
	{ // ��
		// ���������� �� ��
		B_LookAtNpc(self,other);
		// ���������������� ���
		B_Say_GuildGreetings(self,other);
		// ��������� �������� �� ��
		B_StopLookAt(self);
		// ���������� �������� ������� �� 20 ���.
		Npc_SetRefuseTalk(other,20);
	};
	
	// ������ ����� ------------------------------------------------------------
	
	// ���� � �� ������ ����� � �� ������ ��������
	if(C_NpcIsGateGuard(self) && (Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG))
	{
		// �� �������� ������� ��������������
		B_GuardPassageStatusReset(self);
	};
	
	// �� ������� ���� ����� ---------------------------------------------------
	// ����� ��� ������� ��� �������
	if ((Npc_HasEquippedArmor(other) == FALSE)
		 || (C_BodyStateContains(other,BS_JUMP) || C_BodyStateContains(other,BS_CLIMB))
		 && (Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) > 0))
	{
		// ���� ��� �� ��� ����� � � ��� ���� 
		if (!HasFlags(self.aivar[AIV_IgnoreFlags],IGNORE_Armor) && !HasFlags(self.flags,NPC_FLAG_FRIEND) && (Hlp_Random(5) == 0)
			&& (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) && Npc_CanSeeNpc(self,other))	{
			AI_StartState(self,ZS_ObservePlayer,1,"");
		};
	};
	
	//� ��� � �� ��������� ���������
	if(C_NpcGetAttitude(self,other) == ATT_ANGRY)
	{
		//����� �� ��� ������������
		AI_StartState(self,ZS_ObservePlayer,1,"");
	};
	
	//���������
	B_OnAssessPlayer();
};



