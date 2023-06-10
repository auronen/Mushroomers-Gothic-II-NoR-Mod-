
//��������� �������, �������� ������
func void B_OnDeath(var C_NPC slf)
{
	//���� ��� ��������. ����� �������� ����� cast
	if (Npc_IsPlayer(other) && !Npc_IsInFightMode(hero,FMODE_MAGIC))	{
		B_HeroCountUsage();
	};
	
	//����� �����/������ ����� ������� � �����
	B_OnDamage_Arrows();
	
	//������ ��������� ����������
	B_CloseLogOnDeath(slf);

	//����������
	if (slf.npcType == NPCTYPE_Competitor) {
		B_OnCompetitorDeath(slf);
	};
	
	//���� ������� �������
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sheep_OldShepherd))	{
		OldShepherdSheeps_Dead_Cnt += 1;
		return;
	};
	
	//���� � ���������
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sheep_Monastery))	{
		MonasterySheep_Dead_Cnt += 1;
		return;
	};
	
	//�����, ���������� �� ���� ������
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Wolf_Maleth))	{
		MalethWolf_Dead_Cnt += 1;
		if (MalethWolf_Dead_Cnt == 6)	{
			if (MIS_MalethWolves == LOG_Running)	{
				B_LogEntry(TOPIC_MalethWolves,TOPIC_MalethWolves_Killed);
			}
			else	{
				MIS_MalethWolves = LOG_Running;
				B_LogEntry_Create(TOPIC_MalethWolves,LOG_MISSION,TOPIC_MalethWolves_Killed2);
			};
		};
		return;
	};
	
	//���� ������
	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sheep_Maleth)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Hammel_Maleth)))	{
		MalethSheep_Dead_Cnt += 1;
		return;
	};
	
	//���������
	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(OUT_1210_Grimbald)) && (MIS_GrimbaldOrcs == LOG_Running))	{
		B_LogEntry_Status(TOPIC_GrimbaldOrcs,LOG_FAILED,TOPIC_GrimbaldOrcs_Dead);
		MIS_GrimbaldOrcs = LOG_FAILED;
	};
	
	//���� ����������
	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(OrcWarrior_Grimbald1)) 
		|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(OrcWarrior_Grimbald2))
		|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(OrcWarrior_Grimbald3)))	{
		MIS_GrimbaldOrcs_DeadCnt += 1;
		if (Hlp_IsValidNpc(OUT_1210_Grimbald))	{
			if ((Npc_GetDistToNpc(self,OUT_1210_Grimbald) < PERC_DIST_INTERMEDIAT) || Npc_CanSeeNpc(OUT_1210_Grimbald,self))	{
				MIS_GrimbaldOrcs_DeadCnt_Seen += 1;
			};
		};
		if ((MIS_GrimbaldOrcs_DeadCnt == 3) && (MIS_GrimbaldOrcs == LOG_Running))	{
			B_LogEntry(TOPIC_GrimbaldOrcs,TOPIC_GrimbaldOrcs_OrcsDead);
		};
	};
	
	//���� ������
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Icewolf_Talbin) && !MIS_Talbin_WhiteWolf_Dead)	{
		B_LogEntry(TOPIC_Talbin_WhiteWolf,TOPIC_Talbin_WhiteWolf_Dead);
		MIS_Talbin_WhiteWolf_Dead = TRUE;
		if (Npc_IsDead(BAU_961_Gaan) && Npc_IsDead(BAU_963_Malak)) {
			B_LogEntry_Status(TOPIC_Talbin_WhiteWolf, LOG_FAILED,TOPIC_Talbin_WhiteWolf_Fail);
		};
		return;
	};

	// ���� -----------------------------------
	if (C_HeroIs_Till())	{
		//�������
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Green_Till_1))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Green_Till_2))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Black_Till_1))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Black_Till_2))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Black_Till_3))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Warrior_Till_1))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Warrior_Till_2))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Warrior_Visir_Till)))	{
			if (Npc_IsDead(Gobbo_Green_Till_1)
				&& Npc_IsDead(Gobbo_Green_Till_2)
				&& Npc_IsDead(Gobbo_Black_Till_3)
				&& Npc_IsDead(Gobbo_Warrior_Till_2))	{
				C_Till_Pet_CaveReady(MIS_Till_Pet_CaveReady_Gobbo1);
			};
			if (Npc_IsDead(Gobbo_Warrior_Visir_Till)
				&& Npc_IsDead(Gobbo_Warrior_Till_1)
				&& Npc_IsDead(Gobbo_Black_Till_1)
				&& Npc_IsDead(Gobbo_Black_Till_2))	{
				C_Till_Pet_CaveReady(MIS_Till_Pet_CaveReady_Gobbo2);
			};
		};
		if (C_NpcIs(self,Wolf_Till) && (MIS_Till_Pet == LOG_Running))	{
			MIS_Till_Pet_WolfsDead_Cnt += 1;
			if (MIS_Till_Pet_WolfsDead_Cnt >= 2)	{
				B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_WolfsDead);
				B_GivePlayerXP(XP_Till_WolfsDead);
			};
		};
	};
	
	// ���� ----------------------------------------
	if (C_HeroIs_Erol())	{
		// ����� ������, ����� �������� ������
		if (C_NpcIs(self, Wisp) && Npc_HasItems(other,ItAm_MR_WispDetector_Charged))	{
			Npc_RemoveInvItem(other,ItAm_MR_WispDetector_Charged);
			CreateInvItem(other,ItAm_MR_WispDetector_Ready);
			B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulWispKilled);
		};
	};
};