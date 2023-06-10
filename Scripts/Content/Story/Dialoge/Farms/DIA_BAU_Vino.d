
instance DIA_Vino_EXIT(DIA_Proto_End)
{
	npc = BAU_952_Vino;
};

// ����� ==================================================================
instance DIA_Vino_Start(C_INFO)
{
	npc = BAU_952_Vino;
	nr = 0;
	condition = DIA_Vino_Start_cond;
	information = DIA_Vino_Start_info;
	important = TRUE;
};
func int DIA_Vino_Start_cond()
{
	if (Npc_IsInState(self,ZS_Talk))	{	return TRUE;	};
};
func void DIA_Vino_Start_info()
{
	Vino_Sleep_Day = ((Wld_GetDay() + 1) * 24 + 10) * 60 + Hlp_Random(60);
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Vino_Start_05_00");	//������ ��-���� �������� �� ����� �����?
	};
	AI_Output(self,other,"DIA_Vino_Start_05_01");	//����� �������, ��! � ����.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vino_Start_03_02");	//�...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vino_Start_07_02");	//�...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vino_Start_10_02");	//�...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vino_Start_14_02");	//�...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vino_Start_16_02");	//�...
	};
	AI_Output(self,other,"DIA_Vino_Start_05_03");	//�, �� �������, � ��� ����� �� �������. � ������� ��������...
	AI_Output(self,other,"DIA_Vino_Start_05_04");	//�����, ��� ����... ����... ��.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"SLEEP");
	Npc_SetRefuseTalk(self, 20);
	if (Vino_Search == TRUE)	{
		B_LogEntry(TOPIC_LostBau,TOPIC_LostBau_Found);
	}
	else	{
		B_LogEntry_Create(TOPIC_LostBau,LOG_MISSION,TOPIC_LostBau_Found_1st);
		MIS_LostBau = LOG_Running;
	};
	Vino_Found = TRUE;
	
	AI_Wait(BAU_950_Lobart,10);
	AI_GoToWP(BAU_950_Lobart,"NW_FARM1_ENTRANCE_03");
};
instance DIA_Vino_Drunk(C_INFO)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_Drunk_cond;
	information = DIA_Vino_Drunk_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Vino_Drunk_cond()
{
	if (Npc_IsInState(self,ZS_Talk) && (Vino_Sleep_Day > Wld_GetFullTime()))
	{
		return TRUE;
	}
	//���� �������, ���� ��������� � ����, ����� ��� ��� ���� ����������
	else if (Npc_IsInRoutine(self,Rtn_Sleep_952))	{
		B_StartOtherRoutine(self,"START");
	};
};
func void DIA_Vino_Drunk_info()
{
	var int rnd; rnd = Hlp_Random(100);
	if (rnd < 10)	{
		AI_Output(self,other,"DIA_Vino_Start_05_01");	//����� �������, ��! � ����.
		AI_Output(self,other,"DIA_Vino_Start_05_03");	//�, �� �������, � ��� ����� �� �������. � ������� ��������...
	}
	else if (rnd < 30)	{
		AI_Output(self,other,"DIA_Vino_Drunk_A_05_01");	//���, � ������ �� ����... �� �����, ������ ����...
		AI_Output(self,other,"DIA_Vino_Drunk_A_05_03");	//� ���� ���? � �� ����� ����, �?
	}
	else if (rnd < 50)	{
		AI_Output(self,other,"DIA_Vino_Drunk_B_05_01");	//�� ���? ���-�� �� ��� �� ���������...
		AI_Output(self,other,"DIA_Vino_Drunk_B_05_03");	//� �� ���� � ����� �������������! 
	}
	else if (rnd < 70)	{
		AI_Output(self,other,"DIA_Vino_Drunk_C_05_01");	//���, �������! ������, �� ��� �� ��������!
		AI_Output(self,other,"DIA_Vino_Drunk_C_05_03");	//���, ��� ���-�� ��� ���...
		AI_TurnAway(self,other);
	}
	else {
		AI_Output(self,other,"DIA_Vino_Drunk_D_05_01");	//�������, � �����. ��� ����� ������� ���������...
	};
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self, 5);
};
// ==================================================================
var int DIA_Vino_HowAU_Lobart_once;
instance DIA_Vino_HowAU(C_INFO)
{
	npc = BAU_952_Vino;
	nr = 2;
	condition = DIA_Vino_HowAU_cond;
	information = DIA_Vino_HowAU_info;
	description = "��� ��?";
	permanent = TRUE;
};
func int DIA_Vino_HowAU_cond()
{
	if (Npc_KnowsInfo(other,DIA_Vino_Start))	{	return TRUE;	};
};
func void DIA_Vino_HowAU_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vino_HowAU_03_00");	//��� ��?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vino_HowAU_07_00");	//��� ��?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vino_HowAU_10_00");	//��� ��?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vino_HowAU_14_00");	//��� ��?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vino_HowAU_16_00");	//��� ��?
	};
	if (DIA_Vino_HowAU_Lobart_once == FALSE)	{
		AI_Output(self,other,"DIA_Vino_HowAU_05_02");	//������ ���� �� ����, ��� ����� � ����-�� �������. ��� ���� ������ �����...
		AI_Output(self,other,"DIA_Vino_HowAU_05_03");	//� �����, � ����� ���� ��������� ����� �� ����. ������ �� ��������� �� ��� �� ���������.
		DIA_Vino_HowAU_Lobart_once = TRUE;
	}
	else if (Hlp_Random(100) < 50)	{
		AI_Output(self,other,"DIA_Vino_HowAU_05_01");	//������ �����... ��������� ���������, �� ���� ���� ���� ��������� ������� ������!
	}
	else		{
		AI_Output(self,other,"DIA_Vino_HowAU_05_04");	//��, �� ������� ����, � ���� ����� ������.
	};
};

// �����: ����� �������� ===================================================
instance DIA_Vino_Letter(C_INFO)
{
	npc = BAU_952_Vino;
	nr = 3;
	condition = DIA_Vino_Letter_cond;
	information = DIA_Vino_Letter_info;
	important = TRUE;
};
func int DIA_Vino_Letter_cond()
{
	if (Npc_KnowsInfo(other,DIA_Vino_Start) && Npc_KnowsInfo(other,DIA_Lobart_Start) && (Vino_Sleep_Day <= Wld_GetFullTime())
		&& !Npc_WasInState(self,ZS_Sleep_Deep))	{	return TRUE;	};
};
func void DIA_Vino_Letter_info()
{
	if (self.aivar[AIV_NpcStartedTalk] == TRUE)	{
		AI_PlayAni(self,"T_COMEOVERHERE");
		AI_Output(self,other,"DIA_Vino_Letter_05_00");	//��, ���! ������� ����!
		AI_Output(other,self,"XXX");	//
		AI_GotoNpc(other,self);
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Vino_Letter_03_01");	//��� �����?
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Vino_Letter_07_01");	//���� ����?
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Vino_Letter_10_01");	//���� ����?
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Vino_Letter_14_01");	//���� ����?
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Vino_Letter_16_01");	//��� �� �����?
		};
	}
	else	{
		AI_Output(self,other,"DIA_Vino_Letter_05_00a");	//������!
	};
	AI_Output(self,other,"DIA_Vino_Letter_05_02");	//� ������, �� ��������� �����. ��� ��� ��������� ������� � ��������� ���.
	AI_Output(self,other,"DIA_Vino_Letter_05_03");	//������ �������� ������ ���� �������? � ������ ��� ����������� � ����, �� �� ���� ���� � �����.
	AI_Output(self,other,"DIA_Vino_Letter_05_04");	//��� ����� �����. ��� ������ ��������� �������� ���� �� ��������.
	B_LogEntry_Status(TOPIC_LostBau,LOG_SUCCESS,TOPIC_LostBau_Letter);
	MIS_LostBau = LOG_SUCCESS;
	Info_ClearChoices(DIA_Vino_Letter);
	Info_AddChoice(DIA_Vino_Letter,"���, ��� �������.", DIA_Vino_Letter_No);
	Info_AddChoice(DIA_Vino_Letter,"������, � ������ ����.", DIA_Vino_Letter_Yes);
};
func void DIA_Vino_Letter_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vino_Letter_No_03_00");	//���, ��� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vino_Letter_No_07_00");	//���, ��� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vino_Letter_No_10_00");	//���, ��� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vino_Letter_No_14_00");	//���, ��� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vino_Letter_No_16_00");	//���, ��� �������.
	};
	AI_Output(self,other,"DIA_Vino_Letter_No_05_01");	//��, ����� �� ��������.
	AI_StopProcessInfos(self);
};
func void DIA_Vino_Letter_Yes()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vino_Letter_Yes_03_00");	//������, � ������ ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vino_Letter_Yes_07_00");	//������, � ������ ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vino_Letter_Yes_10_00");	//������, � ������ ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vino_Letter_Yes_14_00");	//������, � ������ ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vino_Letter_Yes_16_00");	//������, � ������ ����.
	};
	AI_Output(self,other,"DIA_Vino_Letter_Yes_05_01");	//�������! � ����, ��� �� ���� ����� ����������! ��� ������.
		B_GiveInvItems(self,other,ItWr_Letter_Vino2Chief,1);
	AI_Output(self,other,"DIA_Vino_Letter_Yes_05_02");	//�� ������� ���� ������ � ������ � �������� ��������.
	AI_Output(self,other,"DIA_Vino_Letter_Yes_05_03");	//������ ��� �� ������ ����� ���, ������� ����� � ����. �� ����� ������ ������ ������.
	AI_Output(self,other,"DIA_Vino_Letter_Yes_05_04");	//���� � ������ ����� ����, �� ������ �� ����.
	MIS_KhorinisPost = LOG_Running;
	MIS_KhorinisPost_Stage_FromVino = TRUE;
	B_LogEntry_Create(TOPIC_KhorinisPost,LOG_MISSION,TOPIC_KhorinisPost_Vino);
	Info_ClearChoices(DIA_Vino_Letter);
	
	B_SetNameByIndex(BDT_801_Chief,1);
	B_SetNameByIndex(BDT_802_Bootlegger,1);
	B_SetNameByIndex(BDT_803_Bootlegger,1);
	B_SetNameByIndex(BDT_804_Bootlegger,1);
	BDT_802_Bootlegger.aivar[AIV_EnemyOverride] = TRUE;
	BDT_803_Bootlegger.aivar[AIV_EnemyOverride] = TRUE;
	BDT_804_Bootlegger.aivar[AIV_EnemyOverride] = TRUE;
	
	B_LogEntry_KhorinisPost_FailChief();
};

//==============================================================
instance DIA_Vino_Payment(C_INFO)
{
	npc = BAU_952_Vino;
	nr = 10;
	condition = DIA_Vino_Payment_cond;
	information = DIA_Vino_Payment_info;
	description = "� ����� ������.";
};
func int DIA_Vino_Payment_cond()
{
	if (MIS_KhorinisPost_VinoDelivered)	{
		if (hero.aivar[AIV_Gender] == FEMALE)	{
			DIA_Vino_Payment.description = "� ������� ������.";
		};
		return TRUE;
	};
};
func void DIA_Vino_Payment_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vino_Payment_03_00");	//� ����� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vino_Payment_07_00");	//� ����� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vino_Payment_10_00");	//� ����� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vino_Payment_14_00");	//� ����� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vino_Payment_16_00");	//� ������� ������.
	};
	AI_Output(self,other,"DIA_Vino_Payment_05_01");	//�, ������� ����! ������� �������!
	B_GivePlayerXP(XP_Ambient);
};


//==============================================================
instance DIA_Vino_Payment2(C_INFO)
{
	npc = BAU_952_Vino;
	nr = 11;
	condition = DIA_Vino_Payment2_cond;
	information = DIA_Vino_Payment2_info;
	description = "��� ������ ����� �� ��������?";
};
func int DIA_Vino_Payment2_cond()
{
	if (MIS_KhorinisPost_VinoDelivered && (MIS_KhorinisPost == LOG_Running) && !MIS_KhorinisPost_Stage_FromBootlegger
		&& Npc_KnowsInfo(other,DIA_Vino_Payment))	{	return TRUE;	};
};
func void DIA_Vino_Payment2_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vino_Payment2_03_00");	//��� ������ ����� �� ��������?
		AI_Output(other,self,"DIA_Vino_Payment2_03_03");	//���� ������ ������ ��� �� ����, � ������ ���� �� ����� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vino_Payment2_07_00");	//��� ������ ����� �� ��������?
		AI_Output(other,self,"DIA_Vino_Payment2_07_03");	//���� ������ ������ ��� �� ����, � ������ ���� �� ����� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vino_Payment2_10_00");	//��� ������ ����� �� ��������?
		AI_Output(other,self,"DIA_Vino_Payment2_10_03");	//���� ������ ������ ��� �� ����, � ������ ���� �� ����� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vino_Payment2_14_00");	//��� ������ ����� �� ��������?
		AI_Output(other,self,"DIA_Vino_Payment2_14_03");	//���� ������ ������ ��� �� ����, � ������ ���� �� ����� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vino_Payment2_16_00");	//��� ������ ����� �� ��������?
		AI_Output(other,self,"DIA_Vino_Payment2_16_03");	//���� ������ ������ ��� �� ����, � ������ ���� �� ����� �������.
	};
	AI_Output(self,other,"DIA_Vino_Payment2_05_04");	//���, �� �� ����������� ������� ������� �������� �����������, ������ �� ��, ��� �� �������� �������� ������ ����� ���������?
	Info_ClearChoices(DIA_Vino_Payment2);
	Info_AddChoice(DIA_Vino_Payment2,"����� ��, �� ���� ��� ������.",DIA_Vino_Payment2_No);
	Info_AddChoice(DIA_Vino_Payment2,"� ����� ���� ������� ��� �������������?",DIA_Vino_Payment2_Yes);
};
//-------------------------------------------
func void DIA_Vino_Payment2_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vino_Payment_No_03_00");	//����� ��, �� ���� ��� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vino_Payment_No_07_00");	//����� ��, �� ���� ��� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vino_Payment_No_10_00");	//����� ��, �� ���� ��� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vino_Payment_No_14_00");	//����� ��, �� ���� ��� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vino_Payment_No_16_00");	//����� ��, �� ���� ��� ������.
	};
	AI_Output(self,other,"DIA_Vino_Payment_No_05_01");	//� ����, ��� �� �� �� ����� �����! ���, �������� �����. ��� �������, �� ����������!
	B_GiveInvItems(self,other,ItFo_Wine_Vino,1);
	MIS_KhorinisPost = LOG_SUCCESS;
	B_LogEntry_Status(TOPIC_KhorinisPost,LOG_SUCCESS,TOPIC_KhorinisPost_VinoWine);
	Info_ClearChoices(DIA_Vino_Payment2);
};
//-------------------------------------------
func void DIA_Vino_Payment2_Yes()
{
	var int x;	x = 0;
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vino_Payment_Yes_03_00");	//� ����� ���� ������� ��� �������������? � ����� ������� �������� ������ ������� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vino_Payment_Yes_07_00");	//� ����� ���� ������� ��� �������������? � ����� ������� �������� ������ ������� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vino_Payment_Yes_10_00");	//� ����� ���� ������� ��� �������������? � ����� ������� �������� ������ ������� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vino_Payment_Yes_14_00");	//� ����� ���� ������� ��� �������������? � ����� ������� �������� ������ ������� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vino_Payment_Yes_16_00");	//� ����� ���� ������� ��� �������������? � ����� ������� �������� ������ ������� �����.
	};
	AI_Output(self,other,"DIA_Vino_Payment_Yes_05_01");	//��, �� ���� ���� ����! � ���� � ��� ��� �����.
	AI_Output(self,other,"DIA_Vino_Payment_Yes_05_02");	//�����, ���, ������ 10 �������. ��� ���, ��� � ���� ������ ����.
	x = 1;	if (x == 1)	{
		B_GiveInvItems(self,other,ItMi_Gold,10);
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_SUCCESS,TOPIC_KhorinisPost_Vino10gold);
	};
	MIS_KhorinisPost = LOG_SUCCESS;
	Info_ClearChoices(DIA_Vino_Payment2);
};
//*/
