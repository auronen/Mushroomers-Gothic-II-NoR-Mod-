
//��� ����� �������������� ��������� 
//������ ����� �� ��������� ����� ����������� ������ 
//(���� �� ��������� ������� ���������)
func void ZS_BecomingNPC()
{
	Npc_ClearAIQueue(self);
	B_ResetAll(self);
	AI_StandUp(self);
	//��������� ��������
	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PC_Noone))	{
		other.flags = 0;
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS]);
	};
};

//====================================================

instance DIA_ChoosePlayer_End(DIA_Proto_End){};
	
func int DIA_ChoosePlayer_cond()
{
	//� ������������� ��
	if ((self.npcType == NPCTYPE_HERO) && !Npc_IsPlayer(self))	{
		return TRUE;
	};
};
//--------------------------------
instance DIA_ChoosePlayer_Choose(C_INFO)
{
	nr = 1;
	condition = DIA_ChoosePlayer_cond;
	information = DIA_ChoosePlayer_Choose_info;
	description = "������� ���������";
	permanent = TRUE;
};

func void DIA_ChoosePlayer_Choose_info()
{
	Npc_SetTalentSkill(self,NPC_TALENT_PATRONGOD,PATRONGOD);
	
	self.aivar[AIV_INVINCIBLE] = FALSE;
	self.aivar[AIV_NpcStartedTalk] = FALSE;
	self.aivar[AIV_TalkedToPlayer] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_NpcStartedTalk] = FALSE;
	other.aivar[AIV_TalkedToPlayer] = FALSE;
	NPC_SetAsPlayer(self);
	Npc_ClearAIQueue(self);
	AI_StandUp(self);
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	PrintScreen(ConcatStrings("������ ��������: ", hero.name), -1, 12, FONT_ScreenSmall, 2);
	AI_StartState(other,ZS_BecomingNPC,1,"");
	DIA_ChoosePlayer_End.npc = 0;
	DIA_ChoosePlayer_Choose.npc = 0;
};


//====================================================
	
//--------------------------------
instance DIA_Difficulty(C_INFO)
{
	nr = 2;
	condition = DIA_ChoosePlayer_cond;
	information = DIA_Difficulty_info;
	description = "��������� ���������...";
	permanent = TRUE;
};

func void DIA_Difficulty_info()
{
	Info_ClearChoices(DIA_Difficulty);
	Info_AddChoice(DIA_Difficulty,Dialog_Back,DIA_Difficulty_Back);
//	Info_AddChoice(DIA_Difficulty,"������������ �������� (����)...",DIA_Difficulty_Length);
	Info_AddChoice(DIA_Difficulty,"������� ������ � ������� ��������...",DIA_Difficulty_MM_Flee);
	Info_AddChoice(DIA_Difficulty,"���������� ����������...",DIA_Difficulty_CmpActivity);
	Info_AddChoice(DIA_Difficulty,"���������� ������...",DIA_Difficulty_MrAmount);
};

func void DIA_Difficulty_Back()
{
	Info_ClearChoices(DIA_Difficulty);
};

func void DIA_Difficulty_MrAmount()
{
	Info_ClearChoices(DIA_Difficulty);
	Info_AddChoice(DIA_Difficulty,Dialog_Back,DIA_Difficulty_info);
	if (MR_Opts_MrAmount == MR_OptsAmount_More)	{
		Info_AddChoice(DIA_Difficulty,"����� (�������)",DIA_Difficulty_MrAmount_More);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"�����",DIA_Difficulty_MrAmount_More);
	};
	if (MR_Opts_MrAmount == MR_OptsAmount_Norm)	{
		Info_AddChoice(DIA_Difficulty,"������ (�������)",DIA_Difficulty_MrAmount_Norm);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"������",DIA_Difficulty_MrAmount_Norm);
	};
	if (MR_Opts_MrAmount == MR_OptsAmount_Less)	{
		Info_AddChoice(DIA_Difficulty,"���� (�������)",DIA_Difficulty_MrAmount_Less);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"����",DIA_Difficulty_MrAmount_Less);
	};
};

func void DIA_Difficulty_MrAmount_SetSkill(var int skill)
{
	Npc_SetTalentSkill(PC_Elena, NPC_TALENT_MRCOUNT, skill);
	Npc_SetTalentSkill(PC_Erol, NPC_TALENT_MRCOUNT, skill);
	Npc_SetTalentSkill(PC_Sarah, NPC_TALENT_MRCOUNT, skill);
	Npc_SetTalentSkill(PC_Talbin, NPC_TALENT_MRCOUNT, skill);
	Npc_SetTalentSkill(PC_Till, NPC_TALENT_MRCOUNT, skill);
	Npc_SetTalentSkill(PC_Rupert, NPC_TALENT_MRCOUNT, skill);
	Npc_SetTalentSkill(PC_Odo, NPC_TALENT_MRCOUNT, skill);
};
func void DIA_Difficulty_MrAmount_Less()
{
	MR_Opts_MrAmount = MR_OptsAmount_Less;
	DIA_Difficulty_MrAmount_SetSkill(MR_OptsAmount_Index_Less);
	DIA_Difficulty_MrAmount();
};
func void DIA_Difficulty_MrAmount_Norm()
{
	MR_Opts_MrAmount = MR_OptsAmount_Norm;
	DIA_Difficulty_MrAmount_SetSkill(MR_OptsAmount_Index_Norm);
	DIA_Difficulty_MrAmount();
};
func void DIA_Difficulty_MrAmount_More()
{
	MR_Opts_MrAmount = MR_OptsAmount_More;
	DIA_Difficulty_MrAmount_SetSkill(MR_OptsAmount_Index_More);
	DIA_Difficulty_MrAmount();
};


func void DIA_Difficulty_CmpActivity()
{
	Info_ClearChoices(DIA_Difficulty);
	Info_AddChoice(DIA_Difficulty,Dialog_Back,DIA_Difficulty_info);
	if (MR_Opts_CmpActivity == MR_Opts_SuperMore)	{
		Info_AddChoice(DIA_Difficulty,"����������� (�������)",DIA_Difficulty_CmpActivity_SuperMore);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"�����������",DIA_Difficulty_CmpActivity_SuperMore);
	};
	if (MR_Opts_CmpActivity == MR_Opts_MuchMore)	{
		Info_AddChoice(DIA_Difficulty,"����� ������� (�������)",DIA_Difficulty_CmpActivity_MuchMore);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"����� �������",DIA_Difficulty_CmpActivity_MuchMore);
	};
	if (MR_Opts_CmpActivity == MR_Opts_More)	{
		Info_AddChoice(DIA_Difficulty,"������� (�������)",DIA_Difficulty_CmpActivity_More);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"�������",DIA_Difficulty_CmpActivity_More);
	};
	if (MR_Opts_CmpActivity == MR_Opts_Norm)	{
		Info_AddChoice(DIA_Difficulty,"������� (�������)",DIA_Difficulty_CmpActivity_Norm);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"�������",DIA_Difficulty_CmpActivity_Norm);
	};
	if (MR_Opts_CmpActivity == MR_Opts_Less)	{
		Info_AddChoice(DIA_Difficulty,"������ (�������)",DIA_Difficulty_CmpActivity_Less);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"������",DIA_Difficulty_CmpActivity_Less);
	};
	if (MR_Opts_CmpActivity == MR_Opts_MuchLess)	{
		Info_AddChoice(DIA_Difficulty,"����� ������ (�������)",DIA_Difficulty_CmpActivity_MuchLess);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"����� ������",DIA_Difficulty_CmpActivity_MuchLess);
	};
};

func void DIA_Difficulty_CmpActivity_SetSkill(var int skill)
{
	Npc_SetTalentSkill(PC_Elena, NPC_TALENT_CMPACTIVITY, skill);
	Npc_SetTalentSkill(PC_Erol, NPC_TALENT_CMPACTIVITY, skill);
	Npc_SetTalentSkill(PC_Sarah, NPC_TALENT_CMPACTIVITY, skill);
	Npc_SetTalentSkill(PC_Talbin, NPC_TALENT_CMPACTIVITY, skill);
	Npc_SetTalentSkill(PC_Till, NPC_TALENT_CMPACTIVITY, skill);
	Npc_SetTalentSkill(PC_Rupert, NPC_TALENT_CMPACTIVITY, skill);
	Npc_SetTalentSkill(PC_Odo, NPC_TALENT_CMPACTIVITY, skill);
};

func void DIA_Difficulty_CmpActivity_MuchLess()
{
	MR_Opts_CmpActivity = MR_Opts_MuchLess;
	DIA_Difficulty_CmpActivity_SetSkill(MR_Opts_Index_MuchLess);
	DIA_Difficulty_CmpActivity();
};
func void DIA_Difficulty_CmpActivity_Less()
{
	MR_Opts_CmpActivity = MR_Opts_Less;
	DIA_Difficulty_CmpActivity_SetSkill(MR_Opts_Index_Less);
	DIA_Difficulty_CmpActivity();
};
func void DIA_Difficulty_CmpActivity_Norm()
{
	MR_Opts_CmpActivity = MR_Opts_Norm;
	DIA_Difficulty_CmpActivity_SetSkill(MR_Opts_Index_Norm);
	DIA_Difficulty_CmpActivity();
};
func void DIA_Difficulty_CmpActivity_More()
{
	MR_Opts_CmpActivity = MR_Opts_More;
	DIA_Difficulty_CmpActivity_SetSkill(MR_Opts_Index_More);
	DIA_Difficulty_CmpActivity();
};
func void DIA_Difficulty_CmpActivity_MuchMore()
{
	MR_Opts_CmpActivity = MR_Opts_MuchMore;
	DIA_Difficulty_CmpActivity_SetSkill(MR_Opts_Index_MuchMore);
	DIA_Difficulty_CmpActivity();
};
func void DIA_Difficulty_CmpActivity_SuperMore()
{
	MR_Opts_CmpActivity = MR_Opts_SuperMore;
	DIA_Difficulty_CmpActivity_SetSkill(MR_Opts_Index_SuperMore);
	DIA_Difficulty_CmpActivity();
};

func void DIA_Difficulty_Length()
{
	Info_ClearChoices(DIA_Difficulty);
	Info_AddChoice(DIA_Difficulty,Dialog_Back,DIA_Difficulty_info);
	if (Competition_Len == 3)	{
		Info_AddChoice(DIA_Difficulty,"3 ��� (�������)",DIA_Difficulty_Length_3);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"3 ��� ",DIA_Difficulty_Length_3);
	};
	if (Competition_Len == 5)	{
		Info_AddChoice(DIA_Difficulty,"5 ���� (�������)",DIA_Difficulty_Length_5);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"5 ���� ",DIA_Difficulty_Length_5);
	};
	if (Competition_Len == 7)	{
		Info_AddChoice(DIA_Difficulty,"7 ���� (�������)",DIA_Difficulty_Length_7);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"7 ����",DIA_Difficulty_Length_7);
	};
};

func void DIA_Difficulty_Length_7()
{
	Competition_Len = 7;
	DIA_Difficulty_Length();
};
func void DIA_Difficulty_Length_5()
{
	Competition_Len = 5;
	DIA_Difficulty_Length();
};
func void DIA_Difficulty_Length_3()
{
	Competition_Len = 3;
	DIA_Difficulty_Length();
};

func void DIA_Difficulty_MM_Flee()
{
	Info_ClearChoices(DIA_Difficulty);
	Info_AddChoice(DIA_Difficulty,Dialog_Back,DIA_Difficulty_info);
	if (MR_Opts_MM_Flee == MR_Opts_MM_Flee_Never)	{
		Info_AddChoice(DIA_Difficulty,"������� (�������)",DIA_Difficulty_MM_Flee_Never);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"�������",DIA_Difficulty_MM_Flee_Never);
	};
	if (MR_Opts_MM_Flee == MR_Opts_MM_Flee_Random)	{
		Info_AddChoice(DIA_Difficulty,"�������� (�������)",DIA_Difficulty_MM_Flee_Random);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"��������",DIA_Difficulty_MM_Flee_Random);
	};
	if (MR_Opts_MM_Flee == MR_Opts_MM_Flee_Always)	{
		Info_AddChoice(DIA_Difficulty,"������ (�������)",DIA_Difficulty_MM_Flee_Always);
	}
	else	{
		Info_AddChoice(DIA_Difficulty,"������",DIA_Difficulty_MM_Flee_Always);
	};
};
func void DIA_Difficulty_MM_Flee_Never()
{
	MR_Opts_MM_Flee = MR_Opts_MM_Flee_Never;
	DIA_Difficulty_MM_Flee();
};
func void DIA_Difficulty_MM_Flee_Random()
{
	MR_Opts_MM_Flee = MR_Opts_MM_Flee_Random;
	DIA_Difficulty_MM_Flee();
};
func void DIA_Difficulty_MM_Flee_Always()
{
	MR_Opts_MM_Flee = MR_Opts_MM_Flee_Always;
	DIA_Difficulty_MM_Flee();
};


// ======================================

func void B_Assign_ChoosePlayer(var C_NPC slf)
{
	if (slf.npcType == NPCTYPE_HERO)	{
		DIA_ChoosePlayer_End.npc = Hlp_GetInstanceID(slf);
		DIA_ChoosePlayer_Choose.npc = Hlp_GetInstanceID(slf);
		DIA_Difficulty.npc = Hlp_GetInstanceID(slf);
	};
};

