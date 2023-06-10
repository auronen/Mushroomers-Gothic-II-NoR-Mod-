
instance DIA_IdolKadar_EXIT(DIA_Proto_End)
{
	npc = PC_IdolKadar;
};

//=====================================================
var int DIA_IdolKadar_Hallo_Once;
instance DIA_IdolKadar_Hallo(C_INFO)
{
	npc = PC_IdolKadar;		nr = 1;
	condition = DIA_IdolKadar_Hallo_cond;
	information = DIA_IdolKadar_Hallo_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_IdolKadar_Hallo_cond()
{
	if (!DIA_IdolKadar_Hallo_Once || DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_IdolKadar_Hallo_info()
{
	if (!DIA_IdolKadar_Hallo_Once) {
		DIA_IdolKadar_Hallo_Once = TRUE;
		CreateInvItem(self, ItAr_Guru_M);
		AI_EquipArmor(self, ItAr_Guru_M);
		CreateInvItem(self,ItMW_Addon_Stab02);
		AI_EquipBestMeleeWeapon(self);
		B_GiveAchievement_SnowStudio();
		B_StartOtherRoutine(self, "REST");
		B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_IdolKadar);
	};
	AI_Output(self,other,"DIA_IdolKadar_Hallo");	 //��������! �������: ����� ����� �����, �� ������ ����������� ��� ����, �� ������ ������ ��� ����, �� ������ ����� ������! ������ ������!
	AI_StopProcessInfos(self);
};

