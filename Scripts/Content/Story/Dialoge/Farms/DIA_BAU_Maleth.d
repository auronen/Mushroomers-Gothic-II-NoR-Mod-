
instance DIA_Maleth_EXIT(DIA_Proto_End)
{
	npc = BAU_954_Maleth;
};

// ����� ==================================================================
instance DIA_Maleth_Hello(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_MR_Hello_cond;
	information = DIA_Maleth_MR_Hello_info;
	description = "����������, ������.";
};
func int DIA_Maleth_MR_Hello_cond()
{
	return TRUE;
};
func void DIA_Maleth_MR_Hello_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Maleth_MR_Hello_03_00");	//����������, ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Maleth_MR_Hello_07_00");	//����������, ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Maleth_MR_Hello_10_00");	//����������, ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Maleth_MR_Hello_14_00");	//����������, ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Maleth_MR_Hello_16_00");	//����������, ������.
	};
	AI_Output(self,other,"DIA_Maleth_MR_Hello_08_01");	//�� ����� ���, � �������, ��������...
};


// �����: �������� ����� ==========================================================
instance DIA_Maleth_UASad(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 2;
	condition = DIA_Maleth_UASad_cond;
	information = DIA_Maleth_UASad_info;
	description = "������, �� �� � ����. ���-�� ���������?";
};
func int DIA_Maleth_UASad_cond()
{
	if (Npc_KnowsInfo(other,DIA_Maleth_Hello))	{	return TRUE;	};
};
func void DIA_Maleth_UASad_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Maleth_UASad_03_00");	//������, �� �� � ����. ���-�� ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Maleth_UASad_07_00");	//������, �� �� � ����. ���-�� ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Maleth_UASad_10_00");	//������, �� �� � ����. ���-�� ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Maleth_UASad_14_00");	//������, �� �� � ����. ���-�� ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Maleth_UASad_16_00");	//������, �� �� � ����. ���-�� ���������?
	};
	AI_Output(self,other,"DIA_Maleth_UASad_08_01");	//� ��� � ������� ����� ���������? �����!
	AI_Output(self,other,"DIA_Maleth_UASad_08_02");	//����� ��� ������, �� � �������� ����� ��� ��� ����� �������� � �����.
	AI_Output(self,other,"DIA_Maleth_UASad_08_03");	//���� ������ ����� ��� ���� ��������, ��� �������� ����� ����.
	AI_Output(self,other,"DIA_Maleth_UASad_08_04");	//�� �� ������ � 10 ����, ��� ��������� ��� ����!
	AI_Output(self,other,"DIA_Maleth_UASad_08_06");	//��� �������� ���� ���� �� �� ������ ����, � ���� ���-�� ��������.
	AI_Output(self,other,"DIA_Maleth_UASad_08_07");	//���� ��� ������ � ������, ������ � ���� ������ ���� ����� �������!
	
	if (MIS_MalethWolves != LOG_Running)	{
		MIS_MalethWolves = LOG_Running;
		B_LogEntry_Create(TOPIC_MalethWolves,LOG_MISSION,TOPIC_MalethWolves_Start);
	};
};

//==========================================================
instance DIA_Maleth_IllKillWolves(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 3;
	condition = DIA_Maleth_IllKillWolves_cond;
	information = DIA_Maleth_IllKillWolves_info;
	description = "� ��������� � ������ �������.";
};
func int DIA_Maleth_IllKillWolves_cond()
{
	if (MIS_MalethWolves == LOG_Running && (MalethWolf_Dead_Cnt < 6))	{	return TRUE;	};
};
func void DIA_Maleth_IllKillWolves_info()
{
	var int x; x = 0;
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Maleth_IllKillWolves_03_00");	//� ��������� � ������ �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Maleth_IllKillWolves_07_00");	//� ��������� � ������ �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Maleth_IllKillWolves_10_00");	//� ��������� � ������ �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Maleth_IllKillWolves_14_00");	//� ��������� � ������ �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Maleth_IllKillWolves_16_00");	//� ��������� � ������ �������.
	};
	AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_01");	//���� �� ������, �� �� ������ ����������! ��� �� ���� ��� ���, � �� � ��� ����������.
	x = 1; if (x == 1)	{
		B_LogEntry(TOPIC_MalethWolves,TOPIC_MalethWolves_Number);
	};
	AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_02");	//�� ���... ����� ����� ���� ����, ��� ����.
	if (C_HeroIs_Talbin())	{
		AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_03");	//�� ��, ��������, ������� �������  � ���������� � ����.
		AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_04");	//������ � �� ����� ���������� ���� ������� �������.
	}
	else	{
		AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_05");	//� ���� ����� ������ ������ ���� �����.
		AI_Output(self,other,"DIA_Maleth_IllKillWolves_08_06");	//�� �� �� �������, ��� � ����� ��������� ����, ���� �� ��������� ���� ������?
	};
	x = 2; if (x == 2)	{
		B_LogEntry(TOPIC_MalethWolves,TOPIC_MalethWolves_Payment);
	};
};

//==========================================================
instance DIA_Maleth_WolvesKilled(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 4;
	condition = DIA_Maleth_WolvesKilled_cond;
	information = DIA_Maleth_WolvesKilled_info;
	description = "����� ���� ������ �� �����������.";
};
func int DIA_Maleth_WolvesKilled_cond()
{
	if ((MIS_MalethWolves == LOG_Running) && Npc_KnowsInfo(other, DIA_Maleth_UASad)
		&& (MalethWolf_Dead_Cnt >= 6))	{	return TRUE;	};
};
func void DIA_Maleth_WolvesKilled_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_03_00");	//����� ���� ������ �� �����������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_07_00");	//����� ���� ������ �� �����������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_10_00");	//����� ���� ������ �� �����������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_14_00");	//����� ���� ������ �� �����������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_16_00");	//����� ���� ������ �� �����������.
	};
	AI_Output(self,other,"DIA_Maleth_WolvesKilled_08_01");	//���� ��� ������, � ����� ����������� ����!
	if (Npc_KnowsInfo(other,DIA_Maleth_IllKillWolves))	{
		AI_Output(self,other,"DIA_Maleth_WolvesKilled_08_02");	//��, ��� � � �������, ��� ����� ���� ������������. ����� ���...
	}
	else	{
	//UNFINISHED �������� �����
		AI_Output(self,other,"DIA_Maleth_WolvesKilled_08_02b");	//�� ��� ����� ���� ������������. ����� ���...
	};
	AI_Output(self,other,"DIA_Maleth_WolvesKilled_08_03");	//����� ���: ���� ��� ���� ����, � ���� ������ ���� �������� � ����� ������. ����?
	Info_ClearChoices(DIA_Maleth_WolvesKilled);
	Info_AddChoice(DIA_Maleth_WolvesKilled,"���, ���� ��� �� ����������.",DIA_Maleth_WolvesKilled_No);
	if (hero.voice == 3)	{			//���/������/����
		Info_AddChoice(DIA_Maleth_WolvesKilled,"�� �����.",DIA_Maleth_WolvesKilled_Yes);
	} else	{							//���������
		Info_AddChoice(DIA_Maleth_WolvesKilled,"������������.",DIA_Maleth_WolvesKilled_Yes);
	};
	MalethSheep_Dead_Cnt = 0;	//����� ��������
};
func void DIA_Maleth_WolvesKilled_No()
{
	Info_ClearChoices(DIA_Maleth_WolvesKilled);
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_No_03_00");	//���, ���� ��� �� ����������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_No_07_00");	//���, ���� ��� �� ����������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_No_10_00");	//���, ���� ��� �� ����������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_No_14_00");	//���, ���� ��� �� ����������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_No_16_00");	//���, ���� ��� �� ����������.
	};
	AI_Output(self,other,"DIA_Maleth_WolvesKilled_No_08_01");	//������. ����� � ��� ���� 7 �������. ��� ���, ��� � ���� ������ ����.
		B_GiveInvItems(self,other,ItMi_gold,7);
		B_GivePlayerXP(XP_MalethWolves);
		MIS_MalethWolves = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_MalethWolves,LOG_SUCCESS,TOPIC_MalethWolves_Paid);
};
func void DIA_Maleth_WolvesKilled_Yes()
{
	Info_ClearChoices(DIA_Maleth_WolvesKilled);
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_Yes_03_00");	//�� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_Yes_07_00");	//������������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_Yes_10_00");	//������������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_Yes_14_00");	//������������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Maleth_WolvesKilled_Yes_16_00");	//������������.
	};
	AI_Output(self,other,"DIA_Maleth_WolvesKilled_Yes_08_01");	//�������. ��� ���� ������.
	MIS_MalethWolves_SheepKilled = MalethSheep_Dead_Cnt;	//���������� �������, ���� ����� ��� ����, �� ����� �������
	MIS_MalethWolves_FeedDay = Wld_GetDay() + 1;	//���� ��� � ����
		B_GivePlayerXP(XP_MalethWolves);
		MIS_MalethWolves = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_MalethWolves,LOG_SUCCESS,TOPIC_MalethWolves_Food);
		B_LogNote(Topic_Misk, Topic_Misk_MalethFood);
};

//==========================================================
instance DIA_Maleth_Feed(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 5;
	condition = DIA_Maleth_Feed_cond;
	information = DIA_Maleth_Feed_info;
	description = "� �� ���� �� ����������?";
	permanent = TRUE;
};
func int DIA_Maleth_Feed_cond()
{
	if ((MIS_MalethWolves == LOG_SUCCESS) && (MIS_MalethWolves_FeedDay > 0))	{	return TRUE;	};
};
func void DIA_Maleth_Feed_info()
{
	var int x;	x = 0;
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Maleth_Feed_03_00");	//� �� ���� �� ����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Maleth_Feed_07_00");	//� �� ���� �� ����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Maleth_Feed_10_00");	//� �� ���� �� ����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Maleth_Feed_14_00");	//� �� ���� �� ����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Maleth_Feed_16_00");	//� �� ���� �� ����������?
	};
	if ((MIS_MalethWolves_FeedDay > Wld_getDay()) || Wld_IsTime(23,0,7,0))	{
		AI_Output(self,other,"DIA_Maleth_Feed_08_01");	//������ � ���� ��� ��� ���� ���. ������� ������ ����.
	}
	else 	if (MalethSheep_Dead_Cnt > MIS_MalethWolves_SheepKilled)	{
		AI_Output(self,other,"DIA_Maleth_Feed_08_02");	//� ���� ����� ������ ��������� ����. � ������ ������� ����, ������ ���� ��� � �������.
		B_LogNote(Topic_Misk,Topic_Misk_MalethStop);
	}
	else {
		AI_Output(self,other,"DIA_Maleth_Feed_08_03");	//�������, ��������.
		MIS_MalethWolves_FeedDay = Wld_GetDay() + 1;
		x = 1; if (x == 1)	{
			//���� ���
			x = C_Random(4);
			if (x == 0)	{	B_GiveInvItems(self,other,ItFo_Bread,1);	}	else
			if (x == 1)	{	B_GiveInvItems(self,other,ItFo_Stew,1);	}	else
			if (x == 2)	{	B_GiveInvItems(self,other,ItFo_Cheese,1);	}	else
						{	B_GiveInvItems(self,other,ItFo_Apple,1);	};
			//������ ��� ���
			if (C_Random(24) > C_GetHour())	{
				if (x == 0)	{CreateInvItem(self,ItFo_Bread);B_UseItem(self,ItFo_Apple);}	else
				if (x == 2)	{CreateInvItem(self,ItFo_Bread);B_UseItem(self,ItFo_Stew);}	else
							{CreateInvItem(self,ItFo_Bread);B_UseItem(self,ItFo_Bread);};
			};
			//���� �������
			x = C_Random(4);
			if (x == 0)	{	B_GiveInvItems(self,other,ItFo_Water,1);	}	else
			if (x == 1)	{	B_GiveInvItems(self,other,ItFo_Wine,1);	}	else
			if (x == 2)	{	B_GiveInvItems(self,other,ItFo_Milk,1);	}	else
						{	B_GiveInvItems(self,other,ItFo_Booze,1);	};
		};
	};
};


// ������ ==========================================================
instance DIA_Maleth_HowAU(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 10;
	condition = DIA_Maleth_HowAU_cond;
	information = DIA_Maleth_HowAU_info;
	description = "��� ����?";
	permanent = TRUE;
};
func int DIA_Maleth_HowAU_cond()
{
	if (Npc_KnowsInfo(other,DIA_Maleth_UASad))	{	return TRUE;	};
};
func void DIA_Maleth_HowAU_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Maleth_HowAU_03_00");	//��� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Maleth_HowAU_07_00");	//��� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Maleth_HowAU_10_00");	//��� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Maleth_HowAU_14_00");	//��� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Maleth_HowAU_16_00");	//��� ����?
	};
	if ((MIS_MalethWolves != LOG_SUCCESS) || (MalethSheep_Dead_Cnt > MIS_MalethWolves_SheepKilled))	{
		AI_Output(self,other,"DIA_Maleth_HowAU_08_01");	//���� ���� ��������� ���������, �� � ����� �������!
	}
	else	{
		AI_Output(self,other,"DIA_Maleth_HowAU_08_02");	//���� ���� ����, � � ���� ��� � �������.
	};
};
//==============================================
instance DIA_Maleth_News(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 11;
	condition = DIA_Maleth_News_cond;
	information = DIA_Maleth_News_info;
	description = "����� �������?";
};
func int DIA_Maleth_News_cond()
{
	if (Npc_KnowsInfo(other,DIA_Maleth_Hello))	{	return TRUE;	};
};
func void DIA_Maleth_News_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Maleth_News_03_00");	//����� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Maleth_News_07_00");	//����� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Maleth_News_10_00");	//����� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Maleth_News_14_00");	//����� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Maleth_News_16_00");	//����� �������?
	};
	AI_Output(self,other,"DIA_Maleth_News_08_01");	//� ������, � ��� ���������� ���� � ������ �� ���������. ����� ����� �� �����.
	AI_Output(self,other,"DIA_Maleth_News_08_02");	//�� � �� �����, ��� ��� ������ ����. ���� ������ ������� �����!
};

//==============================================
// ���� ������� ��� ���� ��� �������� ������
var int DIA_Maleth_NoSheep_Once;
instance DIA_Maleth_NoSheep(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 0;
	condition = DIA_Maleth_NoSheep_cond;
	information = DIA_Maleth_NoSheep_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Maleth_NoSheep_cond()
{
	if (Npc_IsInState(self, ZS_Talk))	{
		if ((!Hlp_IsValidNpc(Hammel_Maleth) && !Hlp_IsValidNpc(Sheep_Maleth)) || (MalethSheep_Dead_Cnt >= 9))
		{	return TRUE;	};
	};
};
func void DIA_Maleth_NoSheep_info()
{
	if (DIA_Maleth_NoSheep_Once == FALSE)	{
		AI_Output(self,other,"DIA_Maleth_NoSheep_08_00");	//����! ��� �����! �� ����� �� ��������!
	};
		AI_Output(self,other,"DIA_Maleth_NoSheep_08_01");	//��� ��� ������ ������?
	if (!Npc_IsDead(BAU_950_Lobart) && (DIA_Maleth_NoSheep_Once == FALSE))	{
		AI_Output(self,other,"DIA_Maleth_NoSheep_08_02");	//������ ���� ����� �����. ��� ��� ���� - �������� �� ��� ���������...
	};
	DIA_Maleth_NoSheep_Once = TRUE;
	AI_StopProcessInfos(self);
};

