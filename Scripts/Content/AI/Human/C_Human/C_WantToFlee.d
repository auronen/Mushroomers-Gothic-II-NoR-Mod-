/**************************************************************************

  ����� �� slf ������� �� oth.
  ��� �����.
  
  ���������� � ZS_Attack.
 
***************************************************************************/

func int C_WantToFlee(var C_Npc slf,var C_Npc oth)
{
	// �� ������� --------------------------------------------------------------
	
	// ���� ������ �������
	if (!Hlp_IsValidNpc(oth) || !Hlp_IsValidNpc(slf))
	{
		/* DEBUG INFO
		PrintSelfVsOther("No enemy. No fright.");
		//*/
		return FALSE; // �� � �� �������
	};

	// ���� � ����� -
	if (slf.attribute[ATR_HITPOINTS] == 0)
	{
		/* DEBUG INFO
		PrintSelfVsOther("I'm dead! How can I flee?");
		//*/
		return FALSE; // �� ��� ��� ��� �����
	};
	
	// ���� � � ��
	if ((slf.aivar[AIV_PARTYMEMBER] == TRUE) || (slf.npcType == NPCTYPE_FRIEND))
	{
		/* DEBUG INFO
		PrintSelfVsOther("I'm with hero! I can't flee");
		//*/
		return FALSE; // ������ �� �����!
	};
	
	// ���� � ������, ������� ��� ������
	if (C_NpcIsToughGuy(slf) || (slf.guild == GIL_DMT) || (slf.guild == GIL_PAL)) 
	{
		/* DEBUG INFO
		if ((slf.guild == GIL_PAL)) 
		{
			/* DEBUG INFO
			PrintSelfVsOther("Innos with me so I can't flee");
		}
		else if (slf.guild == GIL_DMT)
		{
			PrintSelfVsOther("The rage of my Master follows me so I never flee");
		}
		else
		{
			PrintSelfVsOther("Tough guys never flee");
		};
		//*/
		return FALSE; // �� �����
	};
	
	// ���� � �� ������
	if ((slf.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom) || (slf.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)
		|| (slf.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill) || (slf.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
		|| (slf.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder) || (Npc_WasInState(slf, ZS_Guard_Passage)))
	{
		/* DEBUG INFO
		PrintSelfVsOther("I'm guard. I can't flee");
		//*/
		return FALSE; // �� �����
	};
	
	// ���� � �������� �� �����
	if (slf.aivar[AIV_ArenaFight] == AF_RUNNING) 
	{
		/* DEBUG INFO
		PrintSelfVsOther("It's arena fight! No flee");
		//*/
		return FALSE; // �� �����
	};	
	
	// ���� � � ������ ��� ������ ������� ��� �����
	if ((slf.aivar[AIV_ATTACKREASON] == AR_SuddenEnemyInferno) || (slf.aivar[AIV_ATTACKREASON] == AR_KILL))
	{
		/* DEBUG INFO
		PrintSelfVsOther("I wanna kill him!!! Flee?!");
		//*/
		return FALSE; // �� �����
	};
	
	// ���� �� ������ ��� ��� ��������� �������
	if (HasFlags(oth.aivar[AIV_Temper], TEMPER_NoFightParker) || (oth.aivar[AIV_EnemyOverride] == TRUE))
	{
		/* DEBUG INFO
		PrintSelfVsOther("He never fights. No reason to flee");
		//*/
		return FALSE; // �� �����
	};
	
	// ������� -----------------------------------------------------------------
	
	/* ���� � ������
	if (HasFlags(slf.aivar[AIV_Temper], TEMPER_NoFightParker))
	{
		// DEBUG INFO	PrintSelfVsOther("I can't fight, so I'd better flee");
		return TRUE; // �����
	};
	//*/
	
	//���� ������, ���� ������ �������� ��������
	if (C_NpcIs(slf, CMP_Till) && (slf.attribute[ATR_HITPOINTS] < slf.attribute[ATR_HITPOINTS_MAX] / 2))	{
		// DEBUG INFO
		PrintSelfVsOther("Run, Till, run!");
		return TRUE;
	};
	
	// � ��������� ������� -----v
	
	//������� �� 0
	if ((slf.attribute[ATR_HITPOINTS] == 0) || (oth.attribute[ATR_HITPOINTS] == 0)
		|| (slf.attribute[ATR_HITPOINTS_MAX] == 0) || (oth.attribute[ATR_HITPOINTS_MAX] == 0))
	{
		return FALSE;
	};
	
	// �����������, ��� � ��������� � ����� 
	var int p; // � %
	
	//������ �� ������ �� ��� �����
	p = (slf.attribute[ATR_HITPOINTS_MAX] / slf.attribute[ATR_HITPOINTS] - 2) * 2
		- (oth.attribute[ATR_HITPOINTS_MAX] / oth.attribute[ATR_HITPOINTS] - 1);
	
	// ��� �� ��� ��������
	if (oth.attribute[ATR_HITPOINTS_MAX] >= slf.attribute[ATR_HITPOINTS_MAX])
	{
		p = p + (oth.attribute[ATR_HITPOINTS_MAX] / slf.attribute[ATR_HITPOINTS_MAX] - 1) * 5;
	}
	else
	{
		p = p - (slf.attribute[ATR_HITPOINTS_MAX] / oth.attribute[ATR_HITPOINTS_MAX]);
	};
	
	// ������� � ������� �� ��� ��������� ������� �������� � �������
	//p = p + (Npc_GetComrades(oth) - Npc_GetComrades(slf)) * 10;	

	
	// ���� � ����
	if ((slf.fight_tactic == FAI_HUMAN_COWARD))
	{
		p = p + 10; // ���� ������� ����
	};

	// ���� �� ����
	if ((oth.fight_tactic == FAI_HUMAN_COWARD) || (oth.fight_tactic == FAI_MONSTER_COWARD))
	{
		p = p - 10; // ���� ������� ����
	};
	
	// ���� �� ���
	if (C_NpcIsEvil(oth))
	{
		p = p + 10; // ���� ������� ����
	};
	
	/* DEBUG INFO
	var string txt;
	txt = IntToString(p);
	//*/
	// ������� � ������� � ���������� ������������
	if (Hlp_Random(100) < p)
	{
		/* DEBUG INFO
		txt = ConcatStrings(txt, "%\nI'd better flee...");
		PrintSelfVsOther(txt);
		//*/
		return TRUE;
	};
	
	/* DEBUG INFO
	txt = ConcatStrings(txt, "%");
	PrintSelfVsOther(txt);
	//*/
	
	// � ��������� ������� - �� �����
	return FALSE;
};

