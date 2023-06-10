
var int CompetitorDeaths_Count;

//�������� ��������� ���������� �� 1 ������
func void B_RaiseCmpAttrPer1Death(var C_NPC slf)
{
	if (Hlp_IsValidNpc(slf) && !Npc_IsDead(slf)) {
		slf.attribute[ATR_HITPOINTS_MAX] += 30;
		slf.attribute[ATR_HITPOINTS] += 30;
		slf.attribute[ATR_MANA_MAX] += 5;
		slf.attribute[ATR_MANA] += 5;
		slf.attribute[ATR_STRENGTH] += 5;
		slf.attribute[ATR_DEXTERITY] += 5;
		
		B_AddFightSkill(slf, NPC_TALENT_1H, 3);
		B_AddFightSkill(slf, NPC_TALENT_2H, 3);
		B_AddFightSkill(slf, NPC_TALENT_BOW, 3);
		B_AddFightSkill(slf, NPC_TALENT_CROSSBOW, 3);
		
		if (CompetitorDeaths_Count == 3) {
			B_SetAttitude(slf, ATT_ANGRY);
		}
		else if (CompetitorDeaths_Count == 4) {
			B_SetAttitude(slf, ATT_HOSTILE);
		};
	};
};

func void B_OnCompetitorDeath(var C_NPC slf)
{
	if (slf.npcType != NPCTYPE_Competitor) {
		return;
	};
	
	//���-�� ������� ����������� +1
	CompetitorDeaths_Count += 1;
	
	//�������� ��������� ���� ����� �����������
	B_RaiseCmpAttrPer1Death(CMP_Elena);
	B_RaiseCmpAttrPer1Death(CMP_Erol);
	B_RaiseCmpAttrPer1Death(CMP_Odo);
	B_RaiseCmpAttrPer1Death(CMP_Rupert);
	B_RaiseCmpAttrPer1Death(CMP_Sarah);
	B_RaiseCmpAttrPer1Death(CMP_Talbin);
	B_RaiseCmpAttrPer1Death(CMP_Till);
	
	if (CompetitorDeaths_Count == 2) {
		if (Hlp_IsValidNpc(CMP_Sarah) && !Npc_IsDead(CMP_Sarah)) {
			Wld_InsertNpc(Mil_336_Rick,"NW_CITY_KASERN_BARRACK02_03");
		};
		if (Hlp_IsValidNpc(CMP_Rupert) && !Npc_IsDead(CMP_Rupert)) {
			Wld_InsertNpc(Mil_335_Rumbold,"NW_CITY_KASERN_BARRACK02_03");
		};
		if (Hlp_IsValidNpc(CMP_Till) && !Npc_IsDead(CMP_Till)) {
			Wld_InsertNpc(BAU_935_Bronko,"NW_FARM4_IN_06");
		};
		if (Hlp_IsValidNpc(CMP_Erol) && !Npc_IsDead(CMP_Erol)) {
			Wld_InsertNpc(OUT_1240_Patric,"NW_BIGFARM_HUT_BENCH");
		};
		if (Hlp_IsValidNpc(CMP_Elena) && !Npc_IsDead(CMP_Elena)) {
			B_StartOtherRoutine(Bau_903_Bodo,"GUARD");
		};
		if (Hlp_IsValidNpc(CMP_Talbin) && !Npc_IsDead(CMP_Talbin)) {
			B_StartOtherRoutine(OUT_1200_Engrom,"GUARD");
		};
		if (Hlp_IsValidNpc(CMP_Odo) && !Npc_IsDead(CMP_Odo)) {
			Wld_InsertNpc(Summoned_Skeleton_Odo,"NW_PATH_TO_MONASTERY_10");
		};
	}
	else if (CompetitorDeaths_Count == 3) {
		if (Hlp_IsValidNpc(CMP_Sarah) && !Npc_IsDead(CMP_Sarah)) {
			B_SetAttitude(Mil_336_Rick, ATT_ANGRY);
		};
		if (Hlp_IsValidNpc(CMP_Rupert) && !Npc_IsDead(CMP_Rupert)) {
			B_SetAttitude(Mil_335_Rumbold, ATT_ANGRY);
		};
		if (Hlp_IsValidNpc(CMP_Till) && !Npc_IsDead(CMP_Till)) {
			B_SetAttitude(BAU_935_Bronko, ATT_ANGRY);
		};
		if (Hlp_IsValidNpc(CMP_Erol) && !Npc_IsDead(CMP_Erol)) {
			B_SetAttitude(OUT_1240_Patric, ATT_ANGRY);
		};
		if (Hlp_IsValidNpc(CMP_Elena) && !Npc_IsDead(CMP_Elena)) {
			B_SetAttitude(Bau_903_Bodo, ATT_ANGRY);
		};
		if (Hlp_IsValidNpc(CMP_Talbin) && !Npc_IsDead(CMP_Talbin)) {
			B_SetAttitude(OUT_1200_Engrom, ATT_ANGRY);
		};
		if (Hlp_IsValidNpc(CMP_Odo) && !Npc_IsDead(CMP_Odo)) {
			B_SetAttitude(Summoned_Skeleton_Odo, ATT_ANGRY);
		};
	}
	else if (CompetitorDeaths_Count == 4) {
		if (Hlp_IsValidNpc(CMP_Sarah) && !Npc_IsDead(CMP_Sarah)) {
			B_SetAttitude(Mil_336_Rick, ATT_HOSTILE);
		};
		if (Hlp_IsValidNpc(CMP_Rupert) && !Npc_IsDead(CMP_Rupert)) {
			B_SetAttitude(Mil_335_Rumbold, ATT_HOSTILE);
		};
		if (Hlp_IsValidNpc(CMP_Till) && !Npc_IsDead(CMP_Till)) {
			B_SetAttitude(BAU_935_Bronko, ATT_HOSTILE);
		};
		if (Hlp_IsValidNpc(CMP_Erol) && !Npc_IsDead(CMP_Erol)) {
			B_SetAttitude(OUT_1240_Patric, ATT_HOSTILE);
		};
		if (Hlp_IsValidNpc(CMP_Elena) && !Npc_IsDead(CMP_Elena)) {
			B_SetAttitude(Bau_903_Bodo, ATT_HOSTILE);
		};
		if (Hlp_IsValidNpc(CMP_Talbin) && !Npc_IsDead(CMP_Talbin)) {
			B_SetAttitude(OUT_1200_Engrom, ATT_HOSTILE);
		};
		if (Hlp_IsValidNpc(CMP_Odo) && !Npc_IsDead(CMP_Odo)) {
			B_SetAttitude(Summoned_Skeleton_Odo, ATT_HOSTILE);
		};
	};
	
	if (Hlp_IsValidNpc(Mil_336_Rick) && C_NpcIs(slf, CMP_Sarah)) {
		Npc_ExchangeRoutine(Mil_336_Rick,"START");
		B_SetAttitude(Mil_336_Rick, ATT_NEUTRAL);
	};
	if (Hlp_IsValidNpc(Mil_335_Rumbold) && C_NpcIs(slf, CMP_Rupert)) {
		Npc_ExchangeRoutine(Mil_335_Rumbold,"START");
		B_SetAttitude(Mil_335_Rumbold, ATT_NEUTRAL);
	};
	if (Hlp_IsValidNpc(BAU_935_Bronko) && C_NpcIs(slf, CMP_Till)) {
		Npc_ExchangeRoutine(BAU_935_Bronko,"START");
		B_SetAttitude(BAU_935_Bronko, ATT_NEUTRAL);
	};
	if (Hlp_IsValidNpc(OUT_1240_Patric) && C_NpcIs(slf, CMP_Erol)) {
		Npc_ExchangeRoutine(OUT_1240_Patric,"AFTER");
		B_SetAttitude(OUT_1240_Patric, ATT_NEUTRAL);
	};
	if (Hlp_IsValidNpc(Bau_903_Bodo) && C_NpcIs(slf, CMP_Elena)) {
		Npc_ExchangeRoutine(Bau_903_Bodo,"START");
		B_SetAttitude(Bau_903_Bodo, ATT_NEUTRAL);
	};
	if (Hlp_IsValidNpc(OUT_1200_Engrom) && C_NpcIs(slf, CMP_Talbin)) {
		Npc_ExchangeRoutine(OUT_1200_Engrom,"AFTER");
		B_SetAttitude(OUT_1200_Engrom, ATT_NEUTRAL);
	};
	if (Hlp_IsValidNpc(Summoned_Skeleton_Odo) && C_NpcIs(slf, CMP_Odo)) {
		B_KillNpc(Summoned_Skeleton_Odo);
	};
};