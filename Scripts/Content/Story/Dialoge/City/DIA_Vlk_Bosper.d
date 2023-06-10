
instance DIA_Bosper_EXIT(DIA_Proto_End)
{
	npc = VLK_413_Bosper;
};


/////////////////////////////////////// ������ /////////////////////////////////////////////
//===================================================
instance DIA_Bosper_NeedFur_Talbin(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 11;
	condition = DIA_Bosper_NeedFur_Talbin_Cond;
	information = DIA_Bosper_NeedFur_Talbin_Info;
	description = "�� ������ � ���� �����?";
};
func int DIA_Bosper_NeedFur_Talbin_Cond()
{
	if (C_HeroIs_Talbin())	{
		return TRUE;
	};
};

func void DIA_Bosper_NeedFur_Talbin_Info()
{
		AI_Output(other,self,"DIA_Bosper_NeedFur_Talbin_07_00");	//�� ������ � ���� �����?
	AI_Output(self,other,"DIA_Bosper_NeedFur_Talbin_11_01");	//��� ������ �������� ��� ����� ������ � �������, � ��� � ���� ���������� ���.
	AI_Output(self,other,"DIA_Bosper_NeedFur_Talbin_11_02");	//�� �� ��� ������������ ������ ��� ����� �� �������� �����.
	AI_Output(self,other,"DIA_Bosper_NeedFur_Talbin_11_03");	//������� � � ������������� ����� � ���� ����� � ���� ���������.
	B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_Bosper);
	B_LogNote(TOPIC_Trader,TOPIC_Talbin_Hunt_Bosper);
};

//===================================================
instance DIA_Bosper_FurShadow_Talbin(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 12;
	condition = DIA_Bosper_FurShadow_Talbin_Cond;
	information = DIA_Bosper_FurShadow_Talbin_Info;
	permanent = TRUE;
	description = "� ������ ����� ���������.";
};
func int DIA_Bosper_FurShadow_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Bosper_NeedFur_Talbin) && Npc_HasItems(other, ItAt_ShadowFur))	{
		return TRUE;
	};
};

func void DIA_Bosper_FurShadow_Talbin_Info()
{
	if (!MIS_Talbin_Hunt_ShadowFur)	{
		if (Npc_HasItems(other, ItAt_ShadowFur) > 1)	{
			AI_Output(other,self,"DIA_Bosper_FurShadow_Talbin_07_00");	//� ������ ����� ���������.
			AI_Output(self,other,"DIA_Bosper_FurShadow_Talbin_11_01");	//� ���� �� ���������! �������, ������ ���.
		}
		else	{
			AI_Output(other,self,"DIA_Bosper_FurShadow_Talbin_07_02");	//� ������ ����� ���������.
			AI_Output(self,other,"DIA_Bosper_FurShadow_Talbin_11_03");	//�����������! ���� �������� ���, �������.
		};
		B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_ShadowFur);
		B_GivePlayerXP(XP_Talbin_Hunt_ShadowFur);
	};
	MIS_Talbin_Hunt_ShadowFur = TRUE;
	B_TradeItems(other,self,ItAt_ShadowFur,-1,Value_ShadowFur);
};

//===================================================
instance DIA_Bosper_HornShadow_Talbin(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 13;
	condition = DIA_Bosper_HornShadow_Talbin_Cond;
	information = DIA_Bosper_HornShadow_Talbin_Info;
	permanent = TRUE;
	description = "� ������ ��� ���������.";
};
func int DIA_Bosper_HornShadow_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Bosper_NeedFur_Talbin) && Npc_HasItems(other, ItAt_ShadowHorn))	{
		return TRUE;
	};
};

func void DIA_Bosper_HornShadow_Talbin_Info()
{
	if (!MIS_Talbin_Hunt_ShadowHorn)	{
		if (Npc_HasItems(other, ItAt_ShadowHorn) > 1)	{
			AI_Output(other,self,"DIA_Bosper_HornShadow_Talbin_07_00");	//� ������ ���� ���������.
		}
		else	{
			AI_Output(other,self,"DIA_Bosper_HornShadow_Talbin_07_01");	//� ������ ��� ���������.
		};
		B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_ShadowFur);
		B_GivePlayerXP(XP_Talbin_Hunt_ShadowHorn);
	};
	MIS_Talbin_Hunt_ShadowHorn = TRUE;
	B_TradeItems(other,self,ItAt_ShadowHorn,-1,Value_ShadowFur);
};

//================================================
instance DIA_Bosper_AskMandibles_Talbin(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 14;
	condition = DIA_Bosper_AskMandibles_Talbin_Cond;
	information = DIA_Bosper_AskMandibles_Talbin_Info;
	important = TRUE;
};
func int DIA_Bosper_AskMandibles_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && MIS_Talbin_Hunt_ShadowFur && MIS_Talbin_Hunt_ShadowHorn)	{
		return TRUE;
	};
};
func void DIA_Bosper_AskMandibles_Talbin_Info()
{
	AI_Output(self,other,"DIA_Bosper_AskMandibles_Talbin_11_00");	//������� �������. � ���� ��� ���� ���� ��� ���� �����.
	AI_Output(self,other,"DIA_Bosper_AskMandibles_Talbin_11_01");	//������� �� ��� ������� ��� ����, ������. ��� ��� ����-�� ������������ ����� �������.
	AI_Output(self,other,"DIA_Bosper_AskMandibles_Talbin_11_02");	//���� �� ������� ������� ���� �� ��� �����, � ����� ���� �������.
	B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_AskMandibles);
	MIS_Talbin_Hunt_NeedTeacherMandibles = TRUE;	
};

//================================================
instance DIA_Bosper_GiveMandibles_Talbin(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 15;
	condition = DIA_Bosper_GiveMandibles_Talbin_Cond;
	information = DIA_Bosper_GiveMandibles_Talbin_Info;
	description = "� ������ ���� �����.";
};
func int DIA_Bosper_GiveMandibles_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Bosper_AskMandibles_Talbin) 
		 && (Npc_HasItems(other,ItAt_CrawlerMandibles) >= 3))	{
		return TRUE;
	};
};
func void DIA_Bosper_GiveMandibles_Talbin_Info()
{
		AI_Output(other,self,"DIA_Bosper_GiveMandibles_Talbin_07_00");	//���, � ������ ���� �����.
	B_GiveInvItems(other,self,ItAt_CrawlerMandibles,3);
	AI_Output(self,other,"DIA_Bosper_GiveMandibles_Talbin_11_01");	//�� ���� ����� �������! ���, ������ 50 �������. � ��� ���� ���. 
	AI_Output(self,other,"DIA_Bosper_GiveMandibles_Talbin_11_02");	//� ����� ��� ��� ������ �������, �� �����, ���� �� �������� ������. 
	//B_GiveInvItems(self,other,ItMi_Gold,50);
	//B_GiveInvItems(self,other,ItRw_Bow_M_04,1);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = 50;
	ItemTrans_items[1] = ItRw_Bow_M_04;
	ItemTrans_amount[1] = 1;
	B_ItemsTransaction(self,other);
	MIS_Talbin_Hunt_CrawlerMandibles = TRUE;
	B_LogEntry_Talbin_Hunt(TOPIC_Talbin_Hunt_Mandibles);
	B_GivePlayerXP(XP_Talbin_Hunt_Mandibles);
};

//================================================
instance DIA_Bosper_Talbin_CanMeasureTusk(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 16;
	condition = DIA_Bosper_Talbin_CanMeasureTusk_Cond;
	information = DIA_Bosper_Talbin_CanMeasureTusk_Info;
	description = "�� ������ �������� ����� ���� ������ � �������� ����������?";
};
func int DIA_Bosper_Talbin_CanMeasureTusk_Cond()
{
	if (C_HeroIs_Talbin()
		&& Npc_KnowsInfo(other,DIA_Lutero_Talbin_TuskBig) 
		&& (Npc_HasItems(other,ItAt_KeilerHogTuskBig)))	{
		return TRUE;
	};
};
func void DIA_Bosper_Talbin_CanMeasureTusk_Info()
{
		AI_Output(other,self,"DIA_Bosper_Talbin_CanMeasureTusk_07_00");	//�� ������ �������� ����� ���� ������ � �������� ����������?
	AI_Output(self,other,"DIA_Bosper_Talbin_CanMeasureTusk_11_01");	//����������! ��� ���� - ����� 25 �������.
};

//================================================
var int DIA_Bosper_Talbin_MeasureTusk_Got;
instance DIA_Bosper_Talbin_MeasureTusk(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 17;
	condition = DIA_Bosper_Talbin_MeasureTusk_Cond;
	information = DIA_Bosper_Talbin_MeasureTusk_Info;
	description = "������ ��� �����. (25 ���.)";
	permanent = TRUE;
};
func int DIA_Bosper_Talbin_MeasureTusk_Cond()
{
	if (C_HeroIs_Talbin()
		&& Npc_KnowsInfo(other,DIA_Bosper_Talbin_CanMeasureTusk) 
		&& (Npc_HasItems(other,ItAt_KeilerHogTuskBig))
		&& (!DIA_Bosper_Talbin_MeasureTusk_Got))	{
		return TRUE;
	};
};
func void DIA_Bosper_Talbin_MeasureTusk_Info()
{
	AI_Output(other,self,"DIA_Bosper_Talbin_MeasureTusk_07_00");	//������ ��� �����.
	if (B_GiveGold(other,self,25))	{
		DIA_Bosper_Talbin_MeasureTusk_Got = TRUE;
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_01");	//�������... ���. ���! ������ � ���� ����������� ������!
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_02");	//� ���� ��� �������, ������ � ���� �������!
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_03");	//������, ��� ����� ������� �����, ������� ��� ����������� ������� � �����.
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_04");	//������, ����� ������ �� ���!
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_05");	//� ��� ���� 300 �������.
		Info_ClearChoices(DIA_Bosper_Talbin_MeasureTusk);
		Info_AddChoice(DIA_Bosper_Talbin_MeasureTusk,"���.",DIA_Bosper_Talbin_MeasureTusk_No);
		Info_AddChoice(DIA_Bosper_Talbin_MeasureTusk,"�� �����!",DIA_Bosper_Talbin_MeasureTusk_OK);
		Info_AddChoice(DIA_Bosper_Talbin_MeasureTusk,"����� ����.",DIA_Bosper_Talbin_MeasureTusk_More);
	}
	else	{
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_11_01a");	//������� 25 �������.
	};
};
func void DIA_Bosper_Talbin_MeasureTusk_No()
{
	AI_Output(other,self,"DIA_Bosper_Talbin_MeasureTusk_No_07_00");	//���. � ���� ��� ���� ����������.
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_No_11_01");	//����. ����� ����� ���� ����������.
	B_GiveInvItems(self,other,ItWr_TuskCertificate,1);
	Info_ClearChoices(DIA_Bosper_Talbin_MeasureTusk);
	B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_KeilsMeasured);
	B_GivePlayerXP(XP_Talbin_Hunt_KeilsMeasured);
};
func void DIA_Bosper_Talbin_MeasureTusk_More()
{
	AI_Output(other,self,"DIA_Bosper_Talbin_MeasureTusk_More_07_00");	//����� ����.
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_More_11_01");	//�� ����� ����� ���: 250 ������� � ����� �������.
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_More_11_02");	//��� �������� ������, ����� ����� ������� ������!
	Info_ClearChoices(DIA_Bosper_Talbin_MeasureTusk);
	Info_AddChoice(DIA_Bosper_Talbin_MeasureTusk,"���.",DIA_Bosper_Talbin_MeasureTusk_No);
	Info_AddChoice(DIA_Bosper_Talbin_MeasureTusk,"�� �����!",DIA_Bosper_Talbin_MeasureTusk_OK2);
};
func void DIA_Bosper_Talbin_MeasureTusk_OK()
{
	AI_Output(other,self,"DIA_Bosper_Talbin_MeasureTusk_OK_07_00");	//�� �����!
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_OK_11_01");	//����� ������.
	B_TradeItems(other,self,ItAt_KeilerHogTuskBig,1,300);
	Info_ClearChoices(DIA_Bosper_Talbin_MeasureTusk);
	MIS_Talbin_Hunt_KeilerSold = TRUE;
	B_LogEntry_Talbin_Hunt(TOPIC_Talbin_Hunt_KeilsSoldBosper);
	B_GivePlayerXP(XP_Talbin_Hunt_KeilsSold);
};
func void DIA_Bosper_Talbin_MeasureTusk_OK2()
{
	AI_Output(other,self,"DIA_Bosper_Talbin_MeasureTusk_OK_07_00");	//�� �����!
	B_GiveInvItems(other,self,ItAt_KeilerHogTuskBig,1);
		AI_Output(self,other,"DIA_Bosper_Talbin_MeasureTusk_OK2_11_01");	//����� ������ � �����.
	//B_TradeItems(other,self,ItAt_KeilerHogTuskBig,1,250);
	//B_GiveInvItems(self,other,ItPl_Dex_Herb_01,1);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = 250;
	ItemTrans_items[1] = ItPl_Dex_Herb_01;
	ItemTrans_amount[1] = 1;
	B_ItemsTransaction(self,other);
	Info_ClearChoices(DIA_Bosper_Talbin_MeasureTusk);
	MIS_Talbin_Hunt_KeilerSold = TRUE;
	B_LogEntry_Talbin_Hunt(TOPIC_Talbin_Hunt_KeilsSoldBosper2);
	B_GivePlayerXP(XP_Talbin_Hunt_KeilsSold);
};

/////////////////////////////////////// ����� /////////////////////////////////////////////
//===================================================
instance DIA_Bosper_Elena_AskFur(C_Info)
{
	npc = VLK_413_Bosper;		nr = 20;
	condition = DIA_Bosper_Elena_AskFur_Cond;
	information = DIA_Bosper_Elena_AskFur_Info;
	description = "� ���� ���� ����� ���������?";
};
func int DIA_Bosper_Elena_AskFur_Cond()
{
	if (C_HeroIs_Elena()
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};

func void DIA_Bosper_Elena_AskFur_Info()
{
		AI_Output(other,self,"DIA_Bosper_Elena_AskFur_07_00");	//� ���� ���� ����� ���������?
	AI_Output(self,other,"DIA_Bosper_Elena_AskFur_11_01");	//���, ���. ���� ���������� ����� ����� ��� ������...
		AI_Output(other,self,"DIA_Bosper_Elena_AskFur_07_02");	//���, ��� ���� ������ �����������.
	AI_Output(self,other,"DIA_Bosper_Elena_AskFur_11_03");	//�������� ����� ����-�� �� ��������� - ����������, ������� ��� ���������.
	AI_Output(self,other,"DIA_Bosper_Elena_AskFur_11_04");	//� ����� ��� �� ����� ������ �� ���, � ��� ������, ������, ��� ������� ��������, ����� ��������� �� �������� �����.
};

//===================================================
instance DIA_Bosper_Elena_WhereHunters(C_Info)
{
	npc = VLK_413_Bosper;		nr = 21;
	condition = DIA_Bosper_Elena_WhereHunters_Cond;
	information = DIA_Bosper_Elena_WhereHunters_Info;
	description = "��� ��� ������ ���������?";
	permanent = TRUE;
};
func int DIA_Bosper_Elena_WhereHunters_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Bosper_Elena_AskFur))	{
		return TRUE;
	};
};

func void DIA_Bosper_Elena_WhereHunters_Info()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_07_00");	//�� �� ����������, ��� ��� ������ ���������?
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_11_01");	//��� ������ ���� �����?
	Info_ClearChoices(DIA_Bosper_Elena_WhereHunters);
	Info_AddChoice(DIA_Bosper_Elena_WhereHunters,Dialog_Back,DIA_Bosper_Elena_WhereHunters_Back);
	Info_AddChoice(DIA_Bosper_Elena_WhereHunters,"������.",DIA_Bosper_Elena_WhereHunters_Bartok);
	Info_AddChoice(DIA_Bosper_Elena_WhereHunters,"��������.",DIA_Bosper_Elena_WhereHunters_Dragomir);
	Info_AddChoice(DIA_Bosper_Elena_WhereHunters,"���������.",DIA_Bosper_Elena_WhereHunters_Grimbald);
	Info_AddChoice(DIA_Bosper_Elena_WhereHunters,"������.",DIA_Bosper_Elena_WhereHunters_Talbin);
};
func void DIA_Bosper_Elena_WhereHunters_Talbin()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_Talbin_07_00");	//������.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Talbin_11_01");	//�� � ��� ���� ������ ����� � ������ ���������� �� �������� ������.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Talbin_11_02");	//�� � �� ����, ��������� �� �� ��� ���.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Talbin_11_03");	//��� ���������� ������������� � ���� �������� ��������, � ������ �� ������ ������ � ������.
};
func void DIA_Bosper_Elena_WhereHunters_Grimbald()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_Grimbald_07_00");	//���������.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Grimbald_11_01");	//� ���������� � ���������� ������� � ����� �� ������ �������. ������ ������ ����� ����� ������ � ��� �� ������.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Grimbald_11_02");	//������ ������, � ������� �������� �� ���.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Grimbald_11_03");	//��� ��� ����� ������ ���� ��������� � ����� � ������� ����, �� �� ��� ��� ������� ��������.
};
func void DIA_Bosper_Elena_WhereHunters_Dragomir()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_Dragomir_07_00");	//��������.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Dragomir_11_01");	//�������� - ��������, � ����� ������ � ������.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Dragomir_11_02");	//���� �� ���� ��������� ����������� ������ � ���� �� ������-�������. �� ���� ������������� ���� ������ �� ����������.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Dragomir_11_03");	//�������� ������ ��������, ������ �� ����, ���� � ��������. �� �� ����� �������� �� �������� �����, ������������ ������ � ����.
};
func void DIA_Bosper_Elena_WhereHunters_Bartok()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_Bartok_07_00");	//������.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Bartok_11_01");	//��� � �������, ������ - ��� ������, � �� ����� ������� � ��� �����.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Bartok_11_02");	//�� ��� �� ������� ������� �������, �� �������� ��� ����� ������ � �������.
};
func void DIA_Bosper_Elena_WhereHunters_Back()
{
		AI_Output(other,self,"DIA_Bosper_Elena_WhereHunters_Back_07_00");	//�������, ��� ���.
	AI_Output(self,other,"DIA_Bosper_Elena_WhereHunters_Back_11_01");	//���������.
	Info_ClearChoices(DIA_Bosper_Elena_WhereHunters);
};

//===================================================
instance DIA_Bosper_Elena_GotFur(C_Info)
{
	npc = VLK_413_Bosper;		nr = 22;
	condition = DIA_Bosper_Elena_GotFur_Cond;
	information = DIA_Bosper_Elena_GotFur_Info;
	description = "� ���� ���� ��� ���� �����.";
};
func int DIA_Bosper_Elena_GotFur_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_HasItems(other,ItAt_ShadowFur)
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Bosper_Elena_GotFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_Elena_GotFur_07_00");	//� ���� ���� ��� ���� �����.
	AI_Output(other,self,"DIA_Bosper_Elena_GotFur_07_01");	//������ �������� ��� ����� ���, ����� � ������ ���� �� ������ ��������?
	if (Npc_KnowsInfo(other,DIA_Bosper_Elena_AskFur))	{
		AI_Output(self,other,"DIA_Bosper_Elena_GotFur_11_02");	//��� ���� ������� ������� ����� ���������!
	}
	else	{
		AI_Output(self,other,"DIA_Bosper_Elena_GotFur_11_03");	//��� �� ����� ���������!
	};
	AI_Output(self,other,"DIA_Bosper_Elena_GotFur_11_04");	//� � �������� ��������� ��. ��� ������ �� ������ ���� ���� � ����� ������ 300 �������.
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_BosperFurPrice);
};

//===================================================
instance DIA_Bosper_Elena_ProcessFur(C_Info)
{
	npc = VLK_413_Bosper;		nr = 23;
	condition = DIA_Bosper_Elena_ProcessFur_Cond;
	information = DIA_Bosper_Elena_ProcessFur_Info;
	description = "��������� ����� ���������. (300 ���.)";
	permanent = TRUE;
};
func int DIA_Bosper_Elena_ProcessFur_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_HasItems(other,ItAt_ShadowFur) && (MIS_Elena_Present_FurReadyTime == 0) && Npc_KnowsInfo(other,DIA_Bosper_Elena_GotFur)
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Bosper_Elena_ProcessFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_Elena_ProcessFur_07_00");	//��������� ����� ���������.
	if (C_NpcHasGold(other,300))	{
		//B_GiveInvItems(other,self,ItMi_Gold,300);
		//B_GiveInvItems(other,self,ItAt_ShadowFur,1);
		ItemTrans_items[0] = ItMi_Gold;
		ItemTrans_amount[0] = 300;
		ItemTrans_items[1] = ItAt_ShadowFur;
		ItemTrans_amount[1] = 1;
		B_ItemsTransaction(other,self);
		AI_Output(self,other,"DIA_Bosper_Elena_ProcessFur_11_01");	//���������� ���������� �� ������. �� ������� ���� ������� �������. �������, ��� �� ��� ���, � ����� �� ���������.
		MIS_Elena_Present_FurReadyTime = ((Wld_GetDay() + 3)*24 + 11)*60;
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_BosperWorks);
	}
	else	{
		AI_Output(self,other,"DIA_Bosper_Elena_ProcessFur_11_02");	//������� 300 �������.
	};
};

//===================================================
instance DIA_Bosper_Elena_FurReady(C_Info)
{
	npc = VLK_413_Bosper;		nr = 24;
	condition = DIA_Bosper_Elena_FurReady_Cond;
	information = DIA_Bosper_Elena_FurReady_Info;
	description = "����� ������?";
	permanent = TRUE;
};
func int DIA_Bosper_Elena_FurReady_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_FurReadyTime > 0)
		 && !MIS_Elena_Present_ReadyFurGot)	{
		return TRUE;
	};
};

func void DIA_Bosper_Elena_FurReady_Info()
{
	AI_Output(other,self,"DIA_Bosper_Elena_FurReady_07_00");	//����� ������?
	if (MIS_Elena_Present_FurReadyTime < Wld_GetDay_Shifted(5))	{
		AI_Output(self,other,"DIA_Bosper_Elena_FurReady_11_01");	//���, ���������. ���� ������, ��� � ��������, � ��� ������� � ���������.
		AI_Output(self,other,"DIA_Bosper_Elena_FurReady_11_02");	//����� � ������ �� ������ �������� ���� ������.
		B_GiveInvItems(self,other,ItAt_ShadowFur_Dressed,1);
		MIS_Elena_Present_ReadyFurGot = TRUE;
		B_GivePlayerXP(XP_Elena_ShadowFurReady);
		B_LogEntry_Elena_PresentGot(TOPIC_Elena_Present_FurReady);
	}
	else	{
		AI_Output(self,other,"DIA_Bosper_Elena_FurReady_11_03");	//��� ���. � ���������� �� ����.
	};
};


/////////////////////////////////////// ��� /////////////////////////////////////////////
//===================================================
var int DIA_Bosper_Trade_Once;
instance DIA_Bosper_Trade(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 90;
	condition = DIA_Bosper_Trade_Cond;
	information = DIA_Bosper_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ���� ������.";
};
func int DIA_Bosper_Trade_Cond()
{
	return TRUE;
};

func void DIA_Bosper_Trade_Info()
{
	if (!DIA_Bosper_Trade_Once)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Bosper);
		DIA_Bosper_Trade_Once = TRUE;
	};
	B_GiveTradeInv_Bosper(self);
};

//===================================================
instance DIA_Bosper_HasYew(C_Info)
{
	npc = VLK_413_Bosper;		nr = 30;
	condition = DIA_Bosper_HasYew_Cond;
	information = DIA_Bosper_HasYew_Info;
	description = "�����, � ���� ��� ����?";
};
func int DIA_Bosper_HasYew_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_HasItems(other,ItMi_FellanHammer_Broken)
		&& Npc_KnowsInfo(other,DIA_Thorben_HammerWood))	{
		return TRUE;
	};
};

func void DIA_Bosper_HasYew_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Bosper_HasYew_03_00");	//�����, � ���� ��� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Bosper_HasYew_07_00");	//�����, � ���� ��� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Bosper_HasYew_10_00");	//�����, � ���� ��� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Bosper_HasYew_14_00");	//�����, � ���� ��� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Bosper_HasYew_16_00");	//�����, � ���� ��� ����?
	};
	AI_Output(self,other,"DIA_Bosper_HasYew_11_01");	//���� ���, ���� ���. � ���� ��� ����?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Bosper_HasYew_03_02");	//���, ���� �������� ���� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Bosper_HasYew_07_02");	//���, ���� �������� ���� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Bosper_HasYew_10_02");	//���, ���� �������� ���� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Bosper_HasYew_14_02");	//���, ���� �������� ���� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Bosper_HasYew_16_02");	//���, ���� �������� ���� �������.
	};
	AI_Output(self,other,"DIA_Bosper_HasYew_11_03");	//���-���. ��������� ������, ������� � �������. ��� ����������.
	AI_Output(self,other,"DIA_Bosper_HasYew_11_04");	//��� ���� ������������� �� ��� ������ ��������, ��� ������� ��������� �������� ����.
	AI_Output(self,other,"DIA_Bosper_HasYew_11_05");	//�������� ������������ � �����. ��� ���������� ��� ���� � ��� ��������� �����, ��� ��� �� �� ����� � ����.
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerBosper);
};

//===================================================
instance DIA_Bosper_ThorbenDiscount(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 40;
	condition = DIA_Bosper_ThorbenDiscount_Cond;
	information = DIA_Bosper_ThorbenDiscount_Info;
	important = TRUE;
};
func int DIA_Bosper_ThorbenDiscount_Cond()
{
	if (Npc_IsInState(self,ZS_Talk) && (THORBEN_Discount == TRUE))	{
		return TRUE;
	};
};

func void DIA_Bosper_ThorbenDiscount_Info()
{
	AI_Output(self,other,"DIA_Bosper_ThorbenDiscount_11_00");	//��������� ������ ������ ����� ������ � ���� ���������.
	AI_Output(self,other,"DIA_Bosper_ThorbenDiscount_11_01");	//������� � ���� ���������� ���� �������� ���� ����� �� �������.
};
//===================================================
instance DIA_Bosper_Belt(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 41;
	condition = DIA_Bosper_Belt_Cond;
	information = DIA_Bosper_Belt_Info;
	permanent = TRUE;
	description = "������ ���� �������� (+10, 500 ���.)";
};
func int DIA_Bosper_Belt_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Bosper_ThorbenDiscount) && (THORBEN_Discount == TRUE)
		&& (Bosper_BeltBought == FALSE))	{
		return TRUE;
	};
};

func void DIA_Bosper_Belt_Info()
{
	if (C_NpcHasGold(other,500))	{
		B_GiveInvItems(self,other,ItBe_Addon_DEX_10,1);
		B_GiveInvItems(other,self,ItMi_Gold,500);
		Bosper_BeltBought = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Bosper_Belt_NoGold_11_00");	//������� ������. � � ��� ����� ���� ����� ������ �����������.
	};
};



