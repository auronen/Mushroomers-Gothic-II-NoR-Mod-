
instance DIA_Gaan_EXIT(DIA_Proto_End)
{
	npc = BAU_961_Gaan;
};

///////////////////////////// ������ ///////////////////////////////
//-----------------------------------------
instance DIA_Gaan_Talbin_WhyDontBelieve(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 1;
	condition = DIA_Gaan_Talbin_WhyDontBelieve_cond;
	information = DIA_Gaan_Talbin_WhyDontBelieve_info;
	description = "������ �� �� ������ ������?";
};
func int DIA_Gaan_Talbin_WhyDontBelieve_cond()
{
	if (C_HeroIs_Talbin() && (MIS_Talbin_WhiteWolf == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_WhyDontBelieve_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_WhyDontBelieve_07_00");	//������ �� �� ������ ������?
	AI_Output(self,other,"DIA_Gaan_Talbin_WhyDontBelieve_03_01");	//������ ��� �� ����. � ��� ����� ������ �� ��������, � ������� ���� � �������� ����, ��� ���� ���� �������.
	AI_Output(self,other,"DIA_Gaan_Talbin_WhyDontBelieve_03_02");	//����� � ������� �� ����� ����� ����� ������! � � �� �����, ����� ��� ����� ��������� ����, ����� ������� ���� � ��������.
	AI_Output(self,other,"DIA_Gaan_Talbin_WhyDontBelieve_03_03");	//����� ����, ���� ��� ��������� ��� ��������� ���� ����. � ������ ���� ����� ������� �� ����������� �����.
	AI_Output(self,other,"DIA_Gaan_Talbin_WhyDontBelieve_03_04");	//������ ��� � �� ��� ������ �� ��������.
};
//-----------------------------------------
instance DIA_Gaan_Talbin_MalakDoesntLie(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 2;
	condition = DIA_Gaan_Talbin_MalakDoesntLie_cond;
	information = DIA_Gaan_Talbin_MalakDoesntLie_info;
	description = "� �� �����, ��� ����� ����.";
};
func int DIA_Gaan_Talbin_MalakDoesntLie_cond()
{
	if (C_HeroIs_Talbin() && (MIS_Talbin_WhiteWolf == LOG_Running)
		 && Npc_KnowsInfo(other,DIA_Gaan_Talbin_WhyDontBelieve)
		 && !Npc_KnowsInfo(other,DIA_Gaan_Talbin_MalakLies)
		 && !MIS_Talbin_WhiteWolf_Dead)	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_MalakDoesntLie_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_MalakDoesntLie_07_00");	//� �� �����, ��� ����� ����. �� �������� ����� ����������.
	AI_Output(self,other,"DIA_Gaan_Talbin_MalakDoesntLie_03_01");	//���� �� �������, ��� � ��������. ����� ���-������ ��� ������, � ������ ��������� �� ����������� �����!
};
//-----------------------------------------
instance DIA_Gaan_Talbin_MalakLies(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 3;
	condition = DIA_Gaan_Talbin_MalakLies_cond;
	information = DIA_Gaan_Talbin_MalakLies_info;
	description = "����� �� ����, ����� ����.";
};

func int DIA_Gaan_Talbin_MalakLies_cond()
{
	if (C_HeroIs_Talbin() && (MIS_Talbin_WhiteWolf == LOG_Running)
		 && Npc_KnowsInfo(other,DIA_Gaan_Talbin_WhyDontBelieve)
		 && !Npc_KnowsInfo(other,DIA_Gaan_Talbin_MalakDoesntLie)
		 && !MIS_Talbin_WhiteWolf_Dead)	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_MalakLies_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_MalakLies_07_00");	//����� �� ����, ����� ����. ������ �� ��� ������� ������ �����?
	AI_Output(self,other,"DIA_Gaan_Talbin_MalakLies_03_01");	//��� � � � ���.
		AI_Output(other,self,"DIA_Gaan_Talbin_MalakLies_07_02");	//�� � ���-���� ����� �������, ��� �� ��� �����.
	AI_Output(self,other,"DIA_Gaan_Talbin_MalakLies_03_03");	//���� ����. � � �� ��������� ������� ���� ����� �� �������.
};
//-----------------------------------------
instance DIA_Gaan_Talbin_WhiteWolfDead(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 5;
	condition = DIA_Gaan_Talbin_WhiteWolfDead_cond;
	information = DIA_Gaan_Talbin_WhiteWolfDead_info;
	description = "� ����� ������ �����.";
};
func int DIA_Gaan_Talbin_WhiteWolfDead_cond()
{
	if (C_HeroIs_Talbin() && (MIS_Talbin_WhiteWolf > 0)
		 && Npc_HasItems(other,ItAt_IceWolfFur))	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_WhiteWolfDead_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_WhiteWolfDead_07_00");	//� ����� ������ �����.
		AI_Output(other,self,"DIA_Gaan_Talbin_WhiteWolfDead_07_01");	//��������-�� �� ��� ��� �����!
	AI_Output(self,other,"DIA_Gaan_Talbin_WhiteWolfDead_03_02");	//���... �� ����� ����! ��� �����, ��� ����! � ����� ��� ��������! ������� ������ ��������� �� �����.
	AI_Output(self,other,"DIA_Gaan_Talbin_WhiteWolfDead_03_03");	//���������� ������� - � �����.
		AI_Output(other,self,"DIA_Gaan_Talbin_WhiteWolfDead_07_04");	//������.
	B_GivePlayerXP(XP_Talbin_WhiteWolf_GaanTold);
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Gaan_Talbin_Perm(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 9;
	condition = DIA_Gaan_Talbin_Perm_cond;
	information = DIA_Gaan_Talbin_Perm_info;
	description = "��� ���� �� �����?";
	permanent = TRUE;
};
func int DIA_Gaan_Talbin_Perm_cond()
{
	if (C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_Perm_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_Perm_07_00");	//��� ���� �� �����?
	AI_Output(self,other,"DIA_Gaan_Talbin_Perm_03_01");	//��� ��������.
	if (MIS_Talbin_WhiteWolf == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_Gaan_Talbin_Perm_03_02");	//���� �� ������� ������, ������� ������ ����������� ���� ��� ������ ������� ������.
	};
};


//===================================================
instance DIA_Gaan_Talbin_preTeachMandibles(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 50;
	condition = DIA_Gaan_Talbin_preTeachMandibles_cond;
	information = DIA_Gaan_Talbin_preTeachMandibles_info;
	description = "�� ������, ��� ��������� �������� ����� ���������?";
};
func int DIA_Gaan_Talbin_preTeachMandibles_cond()
{
	if (C_HeroIs_Talbin()
		 && MIS_Talbin_Hunt_NeedTeacherMandibles && !player_talent_takeanimaltrophy[TROPHY_Mandibles])	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_preTeachMandibles_info()
{
		AI_Output(other,self,"DIA_Gaan_Talbin_preTeachMandibles_07_00");	//�� ������, ��� ��������� �������� ����� ���������?
	AI_Output(self,other,"DIA_Gaan_Talbin_preTeachMandibles_03_01");	//����.
	AI_Output(self,other,"DIA_Gaan_Talbin_preTeachMandibles_03_02");	//����� ���������� ������ �� 150 �������.
	B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Gaan);
};
//-----------------------------------------
instance DIA_Gaan_Talbin_TeachMandibles(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 51;
	condition = DIA_Gaan_Talbin_TeachMandibles_cond;
	information = DIA_Gaan_Talbin_TeachMandibles_info;
	description = "����� ���� �������� �����. (150 ���.)";
	permanent = TRUE;
};
func int DIA_Gaan_Talbin_TeachMandibles_cond()
{
	if (Npc_KnowsInfo(other,DIA_Gaan_Talbin_preTeachMandibles) && !player_talent_takeanimaltrophy[TROPHY_Mandibles])	{
		return TRUE;
	};
};
func void DIA_Gaan_Talbin_TeachMandibles_info()
{
	AI_Output(other,self,"DIA_Gaan_Talbin_TeachMandibles_07_00");	//����� ���� �������� �����.
	if (C_NpcHasGold(other,150))	{
		B_GiveGold(other,self,150);
		AI_Output(self,other,"DIA_Gaan_Talbin_TeachMandibles_03_01");	//����� �� �������� �������� ����� �� ������, �� ����� �������� ��� ����� ������ � ������� ������ ������ ���������� � ���������.
		player_talent_takeanimaltrophy[TROPHY_Mandibles] = TRUE;
		B_LogNote(TOPIC_TalentAnimalTrophy,"...��������� ����� � �������� � ������� ��������.");
		B_InsertNpc(Minecrawler,"NW_MAGECAVE_23");
		B_InsertNpc(Minecrawler,"NW_TROLLAREA_TROLLLAKECAVE_03");
		B_InsertNpc(Minecrawler,"NW_RITUALFOREST_CAVE_05");
		B_InsertNpc(MinecrawlerWarrior,"NW_RITUALFOREST_CAVE_07");
	}
	else	{
		AI_Output(self,other,"DIA_Gaan_Talbin_TeachMandibles_03_02");	//��� ������ � ���� ����� ������.
	};
};


///////////////////////////// ����� ///////////////////////////////
//-----------------------------------------
instance DIA_Gaan_Elena_ShadowFur(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 20;
	condition = DIA_Gaan_Elena_ShadowFur_cond;
	information = DIA_Gaan_Elena_ShadowFur_info;
	description = "�� ������ ������� ��� ����� ���������?";
};
func int DIA_Gaan_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena() && Npc_KnowsInfo(other,DIA_Gaan_Others_AUHunter)
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Gaan_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Gaan_Elena_ShadowFur_16_00");	//�� ������ ������� ��� ����� ���������?
	AI_Output(self,other,"DIA_Gaan_Elena_ShadowFur_03_01");	//��� ��, ���� �� ��� ����.
	AI_Output(self,other,"DIA_Gaan_Elena_ShadowFur_03_02");	//�� �����, �� ������� ���������, ���������� ��� ��� ����� �� ������.
};


///////////////////////////// ��������� ///////////////////////////////
//-----------------------------------------
instance DIA_Gaan_Others_AUHunter(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 10;
	condition = DIA_Gaan_Others_AUHunter_cond;
	information = DIA_Gaan_Others_AUHunter_info;
	description = "�� �������?";
};
func int DIA_Gaan_Others_AUHunter_cond()
{
	if (!C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Gaan_Others_AUHunter_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Gaan_Others_AUHunter_03_00");	//�� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Gaan_Others_AUHunter_10_00");	//�� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Gaan_Others_AUHunter_14_00");	//�� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Gaan_Others_AUHunter_16_00");	//�� �������?
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Gaan_Others_AUHunter_03_01m");	//(� ���������� ����������) ��� �� ���������?
	}
	else	{
		AI_Output(self,other,"DIA_Gaan_Others_AUHunter_03_01f");	//(� ���������� ����������) ��� �� ����������?
	};
	AI_Output(self,other,"DIA_Gaan_Others_AUHunter_03_02");	//�������, � �������. � � �����, ����� ����� ����� �� ������������ � ����� �������.
};
//-----------------------------------------
var int DIA_Gaan_Others_ManyBeasts_WhiteWolfTold;
instance DIA_Gaan_Others_ManyBeasts(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 11;
	condition = DIA_Gaan_Others_ManyBeasts_cond;
	information = DIA_Gaan_Others_ManyBeasts_info;
	description = "� ��� ����� ����� ������?";
};
func int DIA_Gaan_Others_ManyBeasts_cond()
{
	if (!C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Gaan_Others_AUHunter))	{
		return TRUE;
	};
};
func void DIA_Gaan_Others_ManyBeasts_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Gaan_Others_ManyBeasts_03_00");	//� ��� ����� ����� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Gaan_Others_ManyBeasts_10_00");	//� ��� ����� ����� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Gaan_Others_ManyBeasts_14_00");	//� ��� ����� ����� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Gaan_Others_ManyBeasts_16_00");	//� ��� ����� ����� ������?
	};
	AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_01");	//� �������� ���������� � �������, � � ���� ���������� ������ �� �����.
	AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_02");	//�� ������ � ��� ���������� ����� � ���������, ��� ��� ������ � ���.
	if (Wld_GetDay() < 4)	{
		AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_03");	//������� ��������� ��������� ����� ��� ������ �����.
		AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_04");	//�� � �� �� ��� �� ������, ��� ����� ����� ������� �� ����� �������. �� ��������, ������, ������.
	}
	else	{
		AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_05");	//������� �������� ����� ����.
		AI_Output(self,other,"DIA_Gaan_Others_ManyBeasts_03_06");	//�� �� ��� �� �� �������, ���� �� ��� �������� ������ �� ������� ��� ��� �����.
		DIA_Gaan_Others_ManyBeasts_WhiteWolfTold = TRUE;
	};
};
//-----------------------------------------
instance DIA_Gaan_Others_ManyMrms(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 12;
	condition = DIA_Gaan_Others_ManyMrms_cond;
	information = DIA_Gaan_Others_ManyMrms_info;
	description = "� ����� ��� ����?";
};
func int DIA_Gaan_Others_ManyMrms_cond()
{
	if (!C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Gaan_Others_AUHunter))	{
		return TRUE;
	};
};
func void DIA_Gaan_Others_ManyMrms_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Gaan_Others_ManyMrms_03_00");	//� ����� ��� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Gaan_Others_ManyMrms_10_00");	//� ����� ��� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Gaan_Others_ManyMrms_14_00");	//� ����� ��� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Gaan_Others_ManyMrms_16_00");	//� ����� ��� ����?
	};
	AI_Output(self,other,"DIA_Gaan_Others_ManyMrms_03_01");	//���� �������. ������ ����� ������ � �����, ��������� ���-������ �������.
};
//-----------------------------------------
instance DIA_Gaan_Others_Perm(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 13;
	condition = DIA_Gaan_Others_Perm_cond;
	information = DIA_Gaan_Others_Perm_info;
	description = "��� ��������?";
	permanent = TRUE;
};
func int DIA_Gaan_Others_Perm_cond()
{
	if (!C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Gaan_Others_AUHunter))	{
		return TRUE;
	};
};
func void DIA_Gaan_Others_Perm_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Gaan_Others_Perm_03_00");	//��� ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Gaan_Others_Perm_10_00");	//��� ��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Gaan_Others_Perm_14_00");	//��� ��������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Gaan_Others_Perm_16_00");	//��� ��������?
	};
	AI_Output(self,other,"DIA_Gaan_Others_Perm_03_01");	//��, ��� ��� ������.
	if (DIA_Gaan_Others_ManyBeasts_WhiteWolfTold == 1)	{
		AI_Output(self,other,"DIA_Gaan_Others_Perm_03_02");	//�� ������ ������ �����. �� ���� ��������� ��� ����� ����� ��������.
		DIA_Gaan_Others_ManyBeasts_WhiteWolfTold += 1;
	};
};
	
// ��� ================================================
instance DIA_Gaan_PermAll(C_INFO)
{
	npc = BAU_961_Gaan;			nr = 14;
	condition = DIA_Gaan_Others_PermAll_cond;
	information = DIA_Gaan_Others_PermAll_info;
	description = "� ������ � ���������� ������ ���� �� ���������?";
	permanent = TRUE;
};
func int DIA_Gaan_Others_PermAll_cond()
{
	return TRUE;
};
func int DIA_Gaan_Others_PermAll_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Gaan_PermAll_03_00");	//� ������ � ���������� ������ ���� �� ���������?
	} else if (hero.voice == 7)	{	//������
		AI_Output(other,self,"DIA_Gaan_PermAll_07_00");	//� ������ � ���������� ������ ���� �� ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Gaan_PermAll_10_00");	//� ������ � ���������� ������ ���� �� ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Gaan_PermAll_14_00");	//� ������ � ���������� ������ ���� �� ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Gaan_PermAll_16_00");	//� ������ � ���������� ������ ���� �� ���������?
	};
	AI_Output(self,other,"DIA_Gaan_PermAll_03_01");	//������. �� ��� ��� ���� ������ ��� ����� �� �����.
	AI_Output(self,other,"DIA_Gaan_PermAll_03_02");	//������ ������� ������ ��� ����, ����� �����-������ ����� �������� �� ������ �� ������.
};
