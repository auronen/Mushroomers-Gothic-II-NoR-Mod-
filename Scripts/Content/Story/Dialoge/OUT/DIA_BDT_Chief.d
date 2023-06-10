
instance DIA_Chief_EXIT(DIA_Proto_End)
{
	npc = BDT_801_Chief;
};

// ����� ===================================================
instance DIA_Chief_Start(C_INFO)
{
	npc = BDT_801_Chief;
	nr = 0;
	condition = DIA_NoCond_cond;
	information = DIA_Chief_Start_info;
	important = TRUE;
};

func void DIA_Chief_Start_info()
{
	AI_Output(self,other,"DIA_Chief_Start_01_00");	//��� ��� � ���? ������ �������� � ����� ������? ��-��.
	AI_Output(self,other,"DIA_Chief_Start_01_01");	//��� ���� ��� �����?
	Info_ClearChoices(DIA_Chief_Start);
	Info_AddChoice(DIA_Chief_Start,"�� � ������ ����� �������...",DIA_Chief_Start_NoReason);
	if (MIS_KhorinisPost == LOG_Running)	{
		Info_AddChoice(DIA_Chief_Start,"� ���� ������ �� ����.",DIA_Chief_Start_Vino);
	};
};
//------------------------------------------------
func void DIA_Chief_Start_NoReason()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Chief_Start_NoReason_03_00");	//�� � ������ ����� �������...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Chief_Start_NoReason_07_00");	//�� � ������ ����� �������...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Chief_Start_NoReason_10_00");	//�� � ������ ����� �������...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_Start_NoReason_14_00");	//�� � ������ ����� �������...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Chief_Start_NoReason_16_00");	//�� � ������ ����� �������...
	};
	AI_Output(self,other,"DIA_Chief_Start_NoReason_01_01");	//��, �������� �����? �� �������!
	AI_Output(self,other,"DIA_Chief_Start_NoReason_01_02");	//������ ��� ����� �������!
	AI_TurnAway(self,other);
	AI_Output(self,other,"DIA_Chief_Start_NoReason_01_03");	//������, ����������� ���!
	B_Attack(BDT_802_Bootlegger,other,AR_KILL,0);
	B_Attack(BDT_803_Bootlegger,other,AR_KILL,0);
	B_Attack(BDT_804_Bootlegger,other,AR_KILL,0);
	AI_StopProcessInfos(self);
	MIS_KhorinisPost_FailChief = TRUE;
	B_LogEntry_KhorinisPost_FailChief();
};
//------------------------------------------------
func void DIA_Chief_Start_Vino()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Chief_Start_Vino_03_00");	//� ���� ������ �� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Chief_Start_Vino_07_00");	//� ���� ������ �� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Chief_Start_Vino_10_00");	//� ���� ������ �� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_Start_Vino_14_00");	//� ���� ������ �� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Chief_Start_Vino_16_00");	//� ���� ������ �� ����.
	};
	AI_Output(self,other,"DIA_Chief_Start_Vino_01_01");	//������!
	
//------------------------------------------------
	if (Npc_HasItems(other,ItWr_Letter_Vino2Chief))	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Chief_Start_Vino_03_02");	//��� ���.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Chief_Start_Vino_07_02");	//��� ���.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Chief_Start_Vino_10_02");	//��� ���.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Chief_Start_Vino_14_02");	//��� ���.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Chief_Start_Vino_16_02");	//��� ���.
		};
		B_GiveInvItems(other,self,ItWr_Letter_Vino2Chief,1);
		AI_StandUp(self);
		AI_UseItemToState(self,ItWr_Letter_Vino2Chief,1);
		AI_Wait(self,1.0);
		AI_UseItemToState(self,ItWr_Letter_Vino2Chief,-1);
		AI_Output(self,other,"DIA_Chief_Start_Vino_01_03");	//������, ��� ������������� ��� ������.
		AI_Output(self,other,"DIA_Chief_Start_Vino_01_04");	//������, �� ���� ���� ������ �����������.

		self.guild = GIL_OUT;	Npc_SetTrueGuild(self,GIL_OUT);
		BDT_802_Bootlegger.guild = GIL_OUT;	Npc_SetTrueGuild(BDT_802_Bootlegger,GIL_OUT);
		Npc_SetAttitude(BDT_802_Bootlegger, ATT_NEUTRAL);
		BDT_803_Bootlegger.guild = GIL_OUT;	Npc_SetTrueGuild(BDT_803_Bootlegger,GIL_OUT);
		Npc_SetAttitude(BDT_803_Bootlegger, ATT_NEUTRAL);
		BDT_804_Bootlegger.guild = GIL_OUT;	Npc_SetTrueGuild(BDT_804_Bootlegger,GIL_OUT);
		Npc_SetAttitude(BDT_804_Bootlegger, ATT_NEUTRAL);
		
		AI_StopProcessInfos(self);
		MIS_KhorinisPost_VinoDelivered = TRUE;
		B_GivePlayerXP(XP_KhorinisPost_BootleggerDelivered);
		if (hero.aivar[AIV_Gender] == MALE)	{
			B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_BootleggerDelivered);
		}
		else	{
			B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_BootleggerDelivered_Fem);
		};
	}
	//------------------------------------------------
	else	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Chief_Start_Vino_03_05");	//� ���� ��� ���...
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Chief_Start_Vino_07_05");	//� ���� ��� ���...
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Chief_Start_Vino_10_05");	//� ���� ��� ���...
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Chief_Start_Vino_14_05");	//� ���� ��� ���...
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Chief_Start_Vino_16_05");	//� ���� ��� ���...
		};
		AI_Output(self,other,"DIA_Chief_Start_Vino_01_06");	//� ���, �� ���� ����� ������ �� �������. � ������� �� ���� ���.
		AI_Output(self,other,"DIA_Chief_Start_Vino_01_07");	//��, ������, ��� ���-��� ������� ��� ��������!
		AI_StopProcessInfos(self);
		
		B_Attack(BDT_802_Bootlegger,other,AR_KILL,0);
		B_Attack(BDT_803_Bootlegger,other,AR_KILL,0);
		B_Attack(BDT_804_Bootlegger,other,AR_KILL,0);
		MIS_KhorinisPost_FailChief = TRUE;
		B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_BootleggerUnfriendly);
		B_LogEntry_KhorinisPost_FailChief();
	};
};

//===================================================
instance DIA_Chief_Payment(C_INFO)
{
	npc = BDT_801_Chief;
	nr = 1;
	condition = DIA_Chief_Payment_cond;
	information = DIA_Chief_Payment_info;
	description = "��� ������ �������?";
};
func int DIA_Chief_Payment_cond()
{
	if (MIS_KhorinisPost_VinoDelivered)	{
		return TRUE;
	};
};
func void DIA_Chief_Payment_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Chief_Payment_03_00");	//��� ������ �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Chief_Payment_07_00");	//��, ��� ������ ���� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Chief_Payment_10_00");	//��, ��� ������ ���� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_Payment_14_00");	//��, ��� ������ ���� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Chief_Payment_16_00");	//��, ��� ������ ���� �������?
	};
	AI_Output(self,other,"DIA_Chief_Payment_01_01");	//��, � �� ������ �� ��������! ��� ��� ��������.
	AI_Output(self,other,"DIA_Chief_Payment_01_02");	//��, ���������, � ������ �� ����... ���� ���� ������ �����. �����, ��� � �� ����� ��������� ����.
	AI_Output(self,other,"DIA_Chief_Payment_01_03");	//�� ���� ������ ������������� - � ���� ���� ��� ���� �����������.
	AI_Output(self,other,"DIA_Chief_Payment_01_04");	//��� ����� ���-��� ��������� � �����. ���������� ���� ����� ��������. �� ���, ����������?
	Info_ClearChoices(DIA_Chief_Payment);
	Info_AddChoice(DIA_Chief_Payment,"���, ��� ��� �����������.",DIA_Chief_Payment_No);
	Info_AddChoice(DIA_Chief_Payment,"����� ���� ��� ������!",DIA_Chief_Payment_GiveMyMoney);
	Info_AddChoice(DIA_Chief_Payment,"������, � �������� �� ��� ����.",DIA_Chief_Payment_Yes);
};
//------------------------------------------------
func void DIA_Chief_Payment_No()
{
	var int x;	x = 0;
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Chief_Payment_No_03_00");	//���, ��� ��� �����������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Chief_Payment_No_07_00");	//���, ��� ��� �����������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Chief_Payment_No_10_00");	//���, ��� ��� �����������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_Payment_No_14_00");	//���, ��� ��� �����������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Chief_Payment_No_16_00");	//���, ��� ��� �����������.
	};
	AI_Output(self,other,"DIA_Chief_Payment_No_01_01");	//��� ������.
	AI_StopProcessInfos(self);
	x = 1;	if (x == 1)	{
		MIS_KhorinisPost = LOG_FAILED;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_BootleggerNoPay);
	};
};
//------------------------------------------------
func void DIA_Chief_Payment_GiveMyMoney()
{
	var int x;	x = 0;
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_03_00");	//����� ���� ��� ������!
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_03_01");	//�� �� ����� �� �������, � ���� ������, ��� ��� ��������, ���� � ������ ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_07_00");	//����� ���� ��� ������!
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_07_01");	//�� �� ����� �� �������, � ���� ������, ��� ��� ��������, ���� � ������ ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_10_00");	//����� ���� ��� ������!
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_10_01");	//�� �� ����� �� �������, � ���� ������, ��� ��� ��������, ���� � ������ ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_14_00");	//����� ���� ��� ������!
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_14_01");	//�� �� ����� �� �������, � ���� ������, ��� ��� ��������, ���� � ������ ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_16_00");	//����� ���� ��� ������!
		AI_Output(other,self,"DIA_Chief_Payment_GiveMyMoney_16_01");	//�� �� ����� �� �������, � ���� ������, ��� ��� ��������, ���� � ������ ������.
	};
	AI_Output(self,other,"DIA_Chief_Payment_GiveMyMoney_01_02");	//�� ����� ������ �� ����. �� �� �� ����� ��������?
	AI_Output(self,other,"DIA_Chief_Payment_GiveMyMoney_01_03");	//� ���� ���� ���-�� ���� ������, �� ����� �� � ������.
	AI_StopProcessInfos(self);
	x = 1;	if (x == 1)	{
		B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_BootleggerVinoPay);
		if (Npc_IsDead(BAU_952_Vino)) {
			B_CloseLogOnDeath(BAU_952_Vino);
		};
	};
};
//------------------------------------------------
func void DIA_Chief_Payment_Yes()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Chief_Payment_Yes_03_00");	//������, � �������� �� ��� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Chief_Payment_Yes_07_00");	//������, � �������� �� ��� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Chief_Payment_Yes_10_00");	//������, � �������� �� ��� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_Payment_Yes_14_00");	//������, � �������� �� ��� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Chief_Payment_Yes_16_00");	//������, � �������� �� ��� ����.
	};
	AI_Output(self,other,"DIA_Chief_Payment_Yes_01_01");	//�� �����! ������, ��� ����� � �������.
	AI_Output(self,other,"DIA_Chief_Payment_Yes_01_02");	//����� � ����� �������� ����� ������� � ������� ���� ����� ���. �� ���� ��������.
	Info_ClearChoices(DIA_Chief_Payment);
	MIS_KhorinisPost_Stage_FromBootlegger = TRUE;
	B_GiveInvItems(self,other,ItMi_Packet_Halvor,1);
	B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_BootleggerNewJob);
	if (Npc_IsDead(VLK_469_Halvor)) {
		B_CloseLogOnDeath(VLK_469_Halvor);
	};
};

//===================================================
instance DIA_Chief_WhoAU(C_INFO)
{
	npc = BDT_801_Chief;
	nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Chief_WhoAU_info;
	description = "� ��� �� �����?";
};
func void DIA_Chief_WhoAU_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Chief_WhoAU_03_00");	//� ��� �� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Chief_WhoAU_07_00");	//� ��� �� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Chief_WhoAU_10_00");	//� ��� �� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_WhoAU_14_00");	//� ��� �� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Chief_WhoAU_16_00");	//� ��� �� �����?
	};
	AI_Output(self,other,"DIA_Chief_WhoAU_01_01");	//������� ������� ��������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Chief_WhoAU_03_01");	//����� ��� �� ��� �������? ������ �� �� � ������, � ���� � ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Chief_WhoAU_07_01");	//����� ��� �� ��� �������? ������ �� �� � ������, � ���� � ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Chief_WhoAU_10_01");	//����� ��� �� ��� �������? ������ �� �� � ������, � ���� � ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_WhoAU_14_01");	//����� ��� �� ��� �������? ������ �� �� � ������, � ���� � ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Chief_WhoAU_16_01");	//����� ��� �� ��� �������? ������ �� �� � ������, � ���� � ����?
	};
	AI_Output(self,other,"DIA_Chief_WhoAU_01_02");	//���� �� ����� � ������ ������� �������. � ������ ����� �� ������? ��� �� ������ �����������!
	AI_Output(self,other,"DIA_Chief_WhoAU_01_03");	//��� ��� ���������� ������� � ������ ������. ��� ������� ��������� ����� ������� �������!
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Chief_WhoAU_03_04");	//� ��� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Chief_WhoAU_07_04");	//� ��� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Chief_WhoAU_10_04");	//� ��� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_WhoAU_14_04");	//� ��� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Chief_WhoAU_16_04");	//� ��� ������?
	};
	AI_Output(self,other,"DIA_Chief_WhoAU_01_05");	//� ��� � ����? ��� ��� �����. ����� �� ����-�� �������� ���, ������� ������� ������.
	AI_Output(self,other,"DIA_Chief_WhoAU_01_06");	//� ���� ����� �����... �� ������, ��� ��������� ���� ����, ������� �����!
	B_SetNameByIndex(BDT_801_Chief,2);
	B_SetNameByIndex(BDT_802_Bootlegger,2);
	B_SetNameByIndex(BDT_803_Bootlegger,2);
	B_SetNameByIndex(BDT_804_Bootlegger,2);
};


// �������� ===================================================
instance DIA_Chief_PreTrade(C_INFO)
{
	npc = BDT_801_Chief;
	nr = 50;
	condition = DIA_Chief_PreTrade_cond;
	information = DIA_Chief_PreTrade_info;
	description = "�����, ���������?";
	trade = TRUE;
};
func int DIA_Chief_PreTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Chief_WhoAU))	{	return TRUE;	};
};
func void DIA_Chief_PreTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Chief_PreTrade_03_00");	//�����, ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Chief_PreTrade_07_00");	//�����, ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Chief_PreTrade_10_00");	//�����, ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_PreTrade_14_00");	//�����, ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Chief_PreTrade_16_00");	//�����, ���������?
	};
	AI_Output(self,other,"DIA_Chief_PreTrade_01_01");	//� ������ �� � ���? � ���� ���� ������ ������, ������� �� ������� � ������.
	B_GiveTradeInv_Bootlegger(self);
	B_LogNote(Topic_Trader,TOPIC_Trader_Chief);
};
//===================================================
instance DIA_Chief_MRTrade(C_INFO)
{
	npc = BDT_801_Chief;
	nr = 51;
	condition = DIA_Chief_MRTrade_cond;
	information = DIA_Chief_MRTrade_info;
	description = "������ ��� ���� ������.";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Chief_MRTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Chief_PreTrade))	{	return TRUE;	};
};
func void DIA_Chief_MRTrade_info()
{
	AI_Output(self,other,"DIA_Chief_MRTrade_01_01");	//������, �������, �����.
	B_GiveTradeInv_Bootlegger(self);
};

//*/
