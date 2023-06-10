/**************************************************************************

								���������
 
  B_Attack	(slf,	oth,	attack_reason,	wait)
  �������� slf (�) ������� �� oth (��) �� ������� attack_reason ����������
(wait = FALSE) ��� � ��������� 0.8 ���. (wait = TRUE)
  
  ����������� ��������� ������� ��������� � slf ����������� � ���������
ZS_Attack.

  ���� slf ��� �������� oth, �� ������� ��������� ����� ���������� �� �����
���������, ����. ����� �� ��������.
  
***************************************************************************/



func void B_Attack(var C_Npc slf,var C_Npc oth,var int attack_reason,var int wait)
{
	PrintSelfVsOther("B_Attack 1");
	// ���������� ������� �������� ����� ������ (���. � ZS_Attack � ZS_MM_Attack)
	slf.aivar[AIV_WaitBeforeAttack] = wait;
	
	// ���� ������� ��������� - ������
	if(attack_reason == AR_SuddenEnemyInferno)
	{
		// �������� ������ �� ���������
		slf.aivar[AIV_EnemyOverride] = FALSE;
		// ������� ���������� ���������� ���� ��������
		Npc_SendPassivePerc(slf,PERC_ASSESSFIGHTSOUND,slf,oth);
	};
	
	// ���� � ������ ������������ � ��
	if(Npc_IsInState(slf,ZS_Talk))
	{
		// �������� ����� ������������� ��� �����
		slf.aivar[AIV_INVINCIBLE] = FALSE;
		oth.aivar[AIV_INVINCIBLE] = FALSE; //PB: ���������! ������� � �������� ����� ���� ������ ���� - ����� ���������� ������� (����� �������� �� ����)
	};
	
	// ���� � ��� � ��� ��������
	if(Npc_IsInState(slf,ZS_Attack) && (Hlp_GetInstanceID(oth) == slf.aivar[AIV_LASTTARGET]))
	{
		// � ���� � �� ��������� ��� �����, � ����� ������� ��������� ��������� �������
		if(!C_NpcHasAttackReasonToKill(slf) && (attack_reason > slf.aivar[AIV_ATTACKREASON]))
		{
			// ��������� ����� ������� ���������
			slf.aivar[AIV_ATTACKREASON] = attack_reason;
			// ���� �� ��
			if(Npc_IsPlayer(oth))
			{
				// �� ��������� ������� ��������� �� ��
				slf.aivar[AIV_LastPlayerAR] = attack_reason;
			};
		};
	}
	else // ���� � �� ����� �� �������� ��� �������� � ���-�� ������
	{
		// ��������� ������� ���������
		slf.aivar[AIV_ATTACKREASON] = attack_reason;
		// �, ��� �������������, - ������� ��������� �� ��
		if(Npc_IsPlayer(oth))
		{
			slf.aivar[AIV_LastPlayerAR] = attack_reason;
		};
	};
	
	// ������������ ---------------------------------------------------
	
	// ��������� ������������ �� ����
	if (NPC_IsPlayer(oth))
	{
		// ������� ��������� - �������� ����
		if (slf.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
		{
			B_MemorizePlayerCrime(slf,oth,CRIME_SHEEPKILLER);
		};
		
		// � ������� �� ��������� ��� ������
		if((slf.aivar[AIV_ATTACKREASON] == AR_ReactToDamage) || (slf.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
			|| (slf.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight))	//NS - ��� �������� ��������� �����
		{
			// �� � �� ������, � �� �� ��� ����
			if(!C_NpcIsToughGuy(slf) && !(slf.npcType == NPCTYPE_FRIEND))
			{
				B_MemorizePlayerCrime(slf,oth,CRIME_ATTACK);
			};
		}; 
			
		// ������� ��������� - ����� ��� �� ������� (�� ���� � ������)
		if((slf.aivar[AIV_ATTACKREASON] == AR_Theft) || (slf.aivar[AIV_ATTACKREASON] == AR_UseMob))
		{
			B_MemorizePlayerCrime(slf,oth,CRIME_THEFT);
		};
		
		// ������� ��������� - ��������
		if(slf.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
		{
			B_MemorizePlayerCrime(slf,oth,CRIME_MURDER);
		};
	};
	
	// -----------------------------------------------------------------
	
	// ���� � ��� �������� 
	if(Npc_IsInState(slf,ZS_Attack))
	{
		slf.aivar[AIV_PursuitEnd] = FALSE; // �������� ����������� �������������
		return;// �� ������ ������ �� ������
	};
	
	// ���� � �����, ����� �����
	if(slf.aivar[AIV_ATTACKREASON] == AR_KILL)
	{
		// ���������� ���������� ���������
		B_SetAttitude(slf,ATT_HOSTILE);
	};
	
	// ���� �� ��
	if(Npc_IsPlayer(oth))
	{
		// �������� ���������� ���������� ��������
		slf.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
		// � ��� �����������
		slf.aivar[AIV_LastFightComment] = FALSE;
	};
	
	// ���� � �� ������������, � �� ���� ������� ����� �� ���
	if(!Npc_IsInState(slf,ZS_Talk))
	{
		// ���� �� ����� �� ���� �������� (������ ��� �������)
		if ((HERO_ACTION_Pickpocket == PICKPOCKET_Fail) && (HERO_ACTION_Pickpocket_Victim == Hlp_GetInstanceID(self)))
		{
			HERO_ACTION_Pickpocket = PICKPOCKET_None;	// �����
		}
		else
		{
			// �������� ��� ������ ��������
			Npc_ClearAIQueue(slf);
		};
	};
	
	// �������� ��� ����������
	B_ClearPerceptions(slf);
	
	// �����������
	Npc_SetTarget(slf,oth);
	
	// ���� � ����
	if(C_BodyStateContains(slf,BS_LIE))
	{
		// ������� � ��������� ����� ����� ����, ��� ������
		AI_StartState(slf,ZS_Attack,1,"");
	}
	else // ���� �� ����
	{
		// ������� � ��������� ����� ����������
		AI_StartState(slf,ZS_Attack,0,"");
	};
};

