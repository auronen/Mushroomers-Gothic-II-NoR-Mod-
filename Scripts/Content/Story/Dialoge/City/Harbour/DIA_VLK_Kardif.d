
instance DIA_Kardif_EXIT(DIA_Proto_End)
{
	npc = VLK_431_Kardif;
};

///////////////////////////// ������ ///////////////////////////////
//-----------------------------------------
instance DIA_Kardif_AskDebt(C_INFO)
{
	nr = 10;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_AskDebt_cond;
	information = DIA_Kardif_AskDebt_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Kardif_AskDebt_cond()
{
	if (C_HeroIs_Rupert() && (MIS_Rupert_Debts_Paid[Creditor_Kardif] == FALSE) 
		&& DIA_WhenAsked_cond())
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_AskDebt_info()
{
	AI_Output(self,other,"DIA_Kardif_AskDebt_14_00");	//�� ������ �� ��������, ���� �� ������� ����.
};
//-----------------------------------------
instance DIA_Kardif_PayDebt(C_INFO)
{
	nr = 11;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_PayDebt_cond;
	information = DIA_Kardif_PayDebt_info;
	permanent = TRUE;
	description = "� ���� ������� ����. (60 ���.)";
};
func int DIA_Kardif_PayDebt_cond()
{
	if (C_HeroIs_Rupert() && (MIS_Rupert_Debts_Paid[Creditor_Kardif] == FALSE))
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_PayDebt_info()
{
	AI_Output(other,self,"DIA_Kardif_PayDebt_03_00");	//� ���� ������� ����.
	if (C_NpcHasGold(other,60))	{
		B_GiveInvItems(other,self,ItMi_gold,60);
		B_RupertPayDebt(Creditor_Kardif);
		VLK_432_Moe.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
		Kardif_TellRumors = TRUE;
		B_LogNote(TOPIC_Misk,TOPIC_Misk_KardifRumors);
		AI_Output(self,other,"DIA_Kardif_PayDebt_14_00");	//������. �� ������ �� ������ ������ ������� ������.
	}
	else	{
		AI_Output(self,other,"DIA_Kardif_PayDebt_14_01");	//����� ������� ������. 60 �������.
	};
};


/////////////////////////////////////// ����� //////////////////////////////////////////////

// ==============================================
instance DIA_Kardif_Elena_AboutCup(C_INFO)
{
	nr = 20;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Elena_AboutCup_cond;
	information = DIA_Kardif_Elena_AboutCup_info;
	description = "�� ���� ������ ��� ��� � �����?";
};
func int DIA_Kardif_Elena_AboutCup_cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lehmar_Elena_AboutCup)
		&& !Kardif_TellRumors
		&& !MIS_Elena_Present_CupLehmarGot && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Kardif_Elena_AboutCup_info()
{
		AI_Output(other,self,"DIA_Kardif_Elena_AboutCup_16_00");	//�� ���� ������ ��� ��� � �����?
	AI_Output(self,other,"DIA_Kardif_Elena_AboutCup_14_01");	//����� ����. ��� ������� �� ����, ������� � ���� ������ � ��� ������ �� ������ �����.
	Kardif_TellRumors = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_KardifRumors);
};

// ==============================================
instance DIA_Kardif_Elena_AboutLehmar(C_INFO)
{
	nr = 21;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Elena_AboutLehmar_cond;
	information = DIA_Kardif_Elena_AboutLehmar_info;
	description = "� ���� �������� ��� ������ (20 ���.)";
	permanent = TRUE;
};
func int DIA_Kardif_Elena_AboutLehmar_cond()
{
	if (C_HeroIs_Elena()
		&& Kardif_TellRumors && MIS_Elena_Present_KnowsLehmar && Npc_KnowsInfo(other,DIA_Lehmar_Elena_AboutCup)
		&& !MIS_Elena_Present_KardifTold && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Kardif_Elena_AboutLehmar_info()
{
	if (C_NpcHasGold(other,20))	{
		B_GiveInvItems(other,self,ItMi_Gold,20);
			AI_Output(other,self,"DIA_Kardif_Elena_AboutLehmar_16_00");	//� ���������� ������ ���� ���� ����, ������� � ���� ��������.
			AI_Output(other,self,"DIA_Kardif_Elena_AboutLehmar_16_01");	//�� ������� �� �� ������������.
		AI_Output(self,other,"DIA_Kardif_Elena_AboutLehmar_14_02");	//����� ������������ �� �����? ������ ����� ����� �����.
		AI_Output(self,other,"DIA_Kardif_Elena_AboutLehmar_14_03");	//���� ���� ����� ������� ���-�� � �����, �������� � ��������. �� �� ������ ������� ������ �����, �� � ����� ���-����� �����.
		AI_Output(self,other,"DIA_Kardif_Elena_AboutLehmar_14_04");	//�����, ��� ��� � ���� �������.
		MIS_Elena_Present_KardifTold = TRUE;
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_KardifTold);
	}
	else	{
		AI_Output(self,other,"DIA_Kardif_Elena_AboutLehmar_14_05");	//20 �������, �������.
	};
};

/////////////////////////////////////// ���� //////////////////////////////////////////////
var int Kardif_Sarah_Liqueur_Offer;
var int Kardif_Sarah_Liqueur_GivenOnce;

// ==============================================
instance DIA_Kardif_Sarah_Hello(C_INFO)
{
	nr = 30;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Sarah_MR_Hello_cond;
	information = DIA_Kardif_Sarah_MR_Hello_info;
	important = TRUE;
};
func int DIA_Kardif_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah()
		&& DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Kardif_Sarah_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Kardif_Sarah_MR_Hello_14_00");	//�� ��� �� �������� ����! ���, ��������� � ����� �� �����, ��� ������ �����?
		AI_Output(other,self,"DIA_Kardif_Sarah_MR_Hello_16_01");	//����������� �� ������ ��������.
	AI_Output(self,other,"DIA_Kardif_Sarah_MR_Hello_14_02");	//��-��. ������, ����-�� �� �����, ��� � ������ �������� ���������?
	Info_ClearChoices(DIA_Kardif_Sarah_Hello);
	Info_AddChoice(DIA_Kardif_Sarah_Hello,"��, ����� ���, ��� ��������� ��������, �� ����� �� �������.",DIA_Kardif_Sarah_MR_Hello_UARight);
	Info_AddChoice(DIA_Kardif_Sarah_Hello,"�����, ��� ������.",DIA_Kardif_Sarah_MR_Hello_No);
};
func void DIA_Kardif_Sarah_MR_Hello_No()
{
		AI_Output(other,self,"DIA_Kardif_Sarah_MR_Hello_No_16_00");	//�����, ��� ������.
	Info_ClearChoices(DIA_Kardif_Sarah_Hello);
};
func void DIA_Kardif_Sarah_MR_Hello_UARight()
{
		AI_Output(other,self,"DIA_Kardif_Sarah_MR_Hello_UARight_16_00");	//��, ����� ���, ��� ��������� ��������, �� ����� �� �������.
	AI_Output(self,other,"DIA_Kardif_Sarah_MR_Hello_UARight_14_01");	//���-���. � ������, �������� �������? ���� � ���� ���� ���������, ������� ������� ��� ��� ���� � �����, � ����, �������, ����������.
	Info_ClearChoices(DIA_Kardif_Sarah_Hello);
	Kardif_Sarah_Liqueur_Offer = TRUE;
};

// ==============================================
instance DIA_Kardif_Sarah_Liqueur(C_INFO)
{
	nr = 32;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Sarah_Liqueur_cond;
	information = DIA_Kardif_Sarah_Liqueur_Info;
	description = "�����, �������� ���� �������. (20 ���.)";
	permanent = TRUE;
};
func int DIA_Kardif_Sarah_Liqueur_cond()
{
	if (C_HeroIs_Sarah()
		&& Kardif_Sarah_Liqueur_Offer && !Kardif_Sarah_Liqueur_GivenOnce)	{
		return TRUE;
	};
};
func void DIA_Kardif_Sarah_Liqueur_Info()
{

	AI_Output(other,self,"DIA_Kardif_Sarah_Liqueur_16_00");	//�����, �������� ���� �������.
	if (C_NpcHasGold(other,Value_KardifLiqueur))	{
		B_GiveGold(other,self,Value_KardifLiqueur);
		AI_Output(self,other,"DIA_Kardif_Sarah_Liqueur_14_01");	//��������.
		//(+5 HP max)
		B_GiveInvItems(self,other,ItFo_KardifLiqueur,1);
		Kardif_Sarah_Liqueur_GivenOnce = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Kardif_Sarah_Liqueur_14_02");	//���, ���������, ������� ���� ���������.
	};
	Info_ClearChoices(DIA_Kardif_Sarah_Hello);
};

// ==============================================
instance DIA_Kardif_Sarah_TellRumors(C_INFO)
{
	nr = 33;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Sarah_TellRumors_cond;
	information = DIA_Kardif_Sarah_TellRumors_Info;
	description = "���� �����-������ �������?";
};
func int DIA_Kardif_Sarah_TellRumors_cond()
{
	if (C_HeroIs_Sarah()
		&& !Kardif_TellRumors)	{
		return TRUE;
	};
};
func void DIA_Kardif_Sarah_TellRumors_Info()
{
	AI_Output(other,self,"DIA_Kardif_Sarah_TellRumors_16_00");	//���� �����-������ �������?
	AI_Output(self,other,"DIA_Kardif_Sarah_TellRumors_14_01");	//�������, �� �� ������, ��� ��� ���� �������� - ��� ����� �����.
	AI_Output(self,other,"DIA_Kardif_Sarah_TellRumors_14_02");	//���� � ���� �������� ���� �������, � ��������, ��� �� ��� ����������.
	Kardif_TellRumors = TRUE;
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Kardif);
	B_LogNote(TOPIC_Misk,TOPIC_Misk_KardifRumors);
};


/////////////////////////////////////// ��� /////////////////////////////////////////////
// �������� ==============================================
var int DIA_Kardif_MRTrade_Once;
instance DIA_Kardif_MRTrade(C_INFO)
{
	nr = 90;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_MRTrade_cond;
	information = DIA_Kardif_MRTrade_info;
	description = "�����-�� ���.";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Kardif_MRTrade_cond()
{
	if (!C_HeroIs_Rupert() || (MIS_Rupert_Debts_Paid[Creditor_Kardif] == TRUE))
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_MRTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kardif_MRTrade_03_00");	//�����-�� ���.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_MRTrade_07_00");	//�����-�� ���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_MRTrade_10_00");	//�����-�� ���.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kardif_MRTrade_14_00");	//�����-�� ���.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_MRTrade_16_00");	//�����-�� ���.
	};
	if (!DIA_Kardif_MRTrade_Once)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Kardif);
		DIA_Kardif_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Kardif(self);
};

// ����� ===============================================================================

var int Kardif_RumorsTold[5];

// ==============================================
instance DIA_Kardif_TellRumors(C_INFO)
{
	nr = 1;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_TellRumors_cond;
	information = DIA_Kardif_TellRumors_Info;
	description = "������ ��� ���-��� ����������?";
};
func int DIA_Kardif_TellRumors_cond()
{
	if (!C_HeroIs_Sarah()
		&& !Kardif_TellRumors)	{
		return TRUE;
	};
};
func void DIA_Kardif_TellRumors_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kardif_TellRumors_03_00");	//������ ��� ���-��� ����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_TellRumors_07_00");	//������ ��� ���-��� ����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_TellRumors_10_00");	//������ ��� ���-��� ����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kardif_TellRumors_14_00");	//������ ��� ���-��� ����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_TellRumors_16_00");	//������ ��� ���-��� ����������?
	};
	AI_Output(self,other,"DIA_Kardif_TellRumors_14_01");	//���� � ���� �������� ���� �������.
	Kardif_TellRumors = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_KardifRumors);
};
//-----------------------------------------------------------------
func int DIA_Kardif_Rumors_NoMoney(var int amount)
{
	if (B_GiveGold(other,self,amount))	{
		return FALSE;
	};
	AI_Output(self,other,"DIA_Kardif_Rumors_NoMoney_14_00");	//�� ��� ���� �������.
	if (C_HeroIs_Sarah() && (Hlp_Random(3) == 0))	{
		AI_Output(self,other,"DIA_Kardif_Rumors_NoMoney_14_01");	//� ���� ����, ��������.
	};
	return TRUE;
};
//-------------------------------------------------------------
instance DIA_Kardif_Rumors01(C_INFO)
{
	nr = 51;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors01_cond;
	information = DIA_Kardif_Rumors01_info;
	description = "� ��� ������� � �����? (5 ���.)";
	permanent = TRUE;
};
func int DIA_Kardif_Rumors01_cond()
{
	if (Kardif_TellRumors && !Kardif_RumorsTold[0])
	{
		return TRUE;
	};
};
func void DIA_Kardif_Rumors01_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kardif_Rumors01_03_00");	//� ��� ������� � �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_Rumors01_07_00");	//� ��� ������� � �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors01_10_00");	//� ��� ������� � �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors01_14_00");	//� ��� ������� � �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_Rumors01_16_00");	//� ��� ������� � �����?
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		Kardif_RumorsTold[0] = TRUE;
		if (C_HeroIs_Sarah())	{
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_01a");	//������� �������?
		}
		else	{
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_01b");	//� ��������� ����� ��� ��������� �������.
		};
		if (MIS_FellanGoHome != LOG_SUCCESS)	{
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_01");	//������ ������ ��� � ��������, � ������ � ���� ������ ����� ��������.
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_02");	//���� �� ���� � ��������� ����� �� ��������. �������, ��� ���� �������, ����� ������ � �������.
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_03");	//������� ���, �����, ������� ����������� ���������, ����� ������� ���������, �� ��� ��� �����.
			MIS_FellanGoHome_WifeWaits = TRUE;
			B_LogNote(TOPIC_Rumors,Topic_Rumors_Fellan);
		}
		else	{
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_04");	//���� ������ ����� �� ���� �� ���� � ��������� ����� �� ��������. ����� �� ��� �� �� �� ����� ������ � �������.
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_05");	//������ ������� �� �������� �����, ��� ����� ������������, ��� ������. ���� ���� ������ ��������, �� ����������.
			AI_Output(self,other,"DIA_Kardif_Rumors01_14_06");	//���� ������ ������, ��� �������� ��� ���������, �� �� ������� ����� �� ��������. ��, ������, �� � �����, ��� ���?
			if (hero.voice == 3)	{			//���/������
				AI_Output(other,self,"DIA_Kardif_Rumors01_03_07");	//�? ���, ������ ��?
			} else if (hero.voice == 7)	{		//������
				AI_Output(other,self,"DIA_Kardif_Rumors01_07_07");	//�? ���, ������ ��?
			} else if (hero.voice == 10)	{	//����
				AI_Output(other,self,"DIA_Kardif_Rumors01_10_07");	//�? ���, ������ ��?
			} else if (hero.voice == 14)	{	//����
				AI_Output(other,self,"DIA_Kardif_Rumors01_14_07");	//�? ���, ������ ��?
			} else	{							//�����/����
				AI_Output(other,self,"DIA_Kardif_Rumors01_16_07");	//�? ���, ������ ��?
			};
		};
	};
};
//-------------------------------------------------------------
instance DIA_Kardif_Rumors02(C_INFO)
{
	nr = 52;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors02_cond;
	information = DIA_Kardif_Rumors02_info;
	description = "����� ������ ���� �����������? (5 ���.)";
	permanent = TRUE;
};
func int DIA_Kardif_Rumors02_cond()
{
	if (Kardif_TellRumors && !Kardif_RumorsTold[1])
	{
		return TRUE;
	};
};
func void DIA_Kardif_Rumors02_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kardif_Rumors02_03_00");	//����� ������ ���� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_Rumors02_07_00");	//����� ������ ���� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors02_10_00");	//����� ������ ���� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors02_14_00");	//����� ������ ���� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_Rumors02_16_00");	//����� ������ ���� �����������?
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		Kardif_RumorsTold[1] = TRUE;
		if (C_HeroIs_Sarah())	{
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_01");	//�� ��� ��� ������... ������ ����������� � �������� ��� ��� ����� ����� ������� � �����.
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_02");	//� ���� �� ������ �� ��� ���������, ������� �� ����������.
				AI_Output(other,self,"DIA_Kardif_Rumors02_16_03");	//������?
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_04");	//����� ���, ���... �����, � �����. � �� ��� ���, ������, ���-�� �������� ���������, ������ ��� ����� ���, ��� ���� �� ����. 
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_05");	//�� ���� ��, ��� ��� � ��� ���������, �� ��� ������ ��� �������� �� ������. � ���� ��� ������ ������, ����� ��� �� ��������.
			B_LogEntry_Create(TOPIC_Sarah_BadHabit,LOG_Mission,TOPIC_Sarah_BadHabit_Start);
			MIS_Sarah_BadHabit = LOG_Running;
		}
		else	{
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_06");	//���� ������ �������, ������� � �������� � �������� ������ - ���� ����� ��������� � ��������.
			AI_Output(self,other,"DIA_Kardif_Rumors02_14_07");	//������ ������, �������, ������ ����������� ���. ���� ������ ���� �� ���������� �������� ������ �� ����.
		};
		B_LogNote(TOPIC_Rumors,Topic_Rumors_Entertain);
	};
};
//-------------------------------------------------------------
instance DIA_Kardif_Rumors03(C_INFO)
{
	nr = 53;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors03_cond;
	information = DIA_Kardif_Rumors03_info;
	description = "����� �������� �� ����? (5 ���.)";
	permanent = TRUE;
};
func int DIA_Kardif_Rumors03_cond()
{
	if (Kardif_TellRumors && !Kardif_RumorsTold[2])
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_Rumors03_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kardif_Rumors03_03_00");	//����� �������� �� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_Rumors03_07_00");	//����� �������� �� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors03_10_00");	//����� �������� �� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors03_14_00");	//����� �������� �� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_Rumors03_16_00");	//����� �������� �� ����?
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		Kardif_RumorsTold[2] = TRUE;
		AI_Output(self,other,"DIA_Kardif_Rumors03_14_01");	//����� ���, ��� �������� ����������� � ������ ����, ��� ������� �� ������ �� ����.
		AI_Output(self,other,"DIA_Kardif_Rumors03_14_02");	//��������� ���� �� ������� ������ ��� �����, � ������ ���� � ����� �������.
		AI_Output(self,other,"DIA_Kardif_Rumors03_14_03");	//�� ������-�� ������������ �� ��� ������� � ����������.
		B_LogNote(TOPIC_Rumors,Topic_Rumors_Ships);
	};
};
//-------------------------------------------------------------
instance DIA_Kardif_Rumors04(C_INFO)
{
	nr = 54;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors04_cond;
	information = DIA_Kardif_Rumors04_info;
	description = "�������� ���-������ ��������. (5 ���.)";
	permanent = TRUE;
};
func int DIA_Kardif_Rumors04_cond()
{
	if (Kardif_TellRumors && !Kardif_RumorsTold[3])
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_Rumors04_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kardif_Rumors04_03_00");	//�������� ���-������ ��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_Rumors04_07_00");	//�������� ���-������ ��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors04_10_00");	//�������� ���-������ ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors04_14_00");	//�������� ���-������ ��������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_Rumors04_16_00");	//�������� ���-������ ��������.
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		Kardif_RumorsTold[3] = TRUE;
		AI_Output(self,other,"DIA_Kardif_Rumors04_14_01");	//������� �������� ���� �� ���� ����������� �� �������� ��������. ����� ���������� � �����. �� ��� ���� ���� ������.
		AI_Output(self,other,"DIA_Kardif_Rumors04_14_02");	//������� �� ��������� ��� ������. ����� ������ ���� ������� �� ����� � ����� �� ��� ����������.
		AI_Output(self,other,"DIA_Kardif_Rumors04_14_03");	//� ����� �� �������������� � ��������� � ����. ������ �� ������ ������, �� � ������� � 50 ��������.
		AI_Output(self,other,"DIA_Kardif_Rumors04_14_04");	//��������� �� ��� ������, �� ��� � �� �����. ������ ����� � �������� ���� ����������, ��� �� ��� ���� �� ����.
		B_LogNote(TOPIC_Rumors,Topic_Rumors_DrawnPocket);
	};
};
//-------------------------------------------------------------
instance DIA_Kardif_Rumors05(C_INFO)
{
	nr = 55;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors05_cond;
	information = DIA_Kardif_Rumors05_info;
	description = "��� ����������� ������? (5 ���.)";
	permanent = TRUE;
};
func int DIA_Kardif_Rumors05_cond()
{
	if (Kardif_TellRumors && !Kardif_RumorsTold[4])
	{
		return TRUE;
	};
	
};
func void DIA_Kardif_Rumors05_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kardif_Rumors05_03_00");	//��� ����������� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_Rumors05_07_00");	//��� ����������� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors05_10_00");	//��� ����������� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors05_14_00");	//��� ����������� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_Rumors05_16_00");	//��� ����������� ������?
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		Kardif_RumorsTold[4] = TRUE;
		AI_Output(self,other,"DIA_Kardif_Rumors05_14_01");	//�� ����, ��������� ���� ��� ���������... 
		AI_Output(self,other,"DIA_Kardif_Rumors05_14_02");	//�������� ������, ������ ��������, ��� ����� ������ ���� �������� � �������. �� � ������ ����, �������, � � ����� �� �������.
		Info_ClearChoices(DIA_Kardif_Rumors05);
		Info_AddChoice(DIA_Kardif_Rumors05,"��, ��� ����� ���� �� ��� ����������...",DIA_Kardif_Rumors05_Yes);
		Info_AddChoice(DIA_Kardif_Rumors05,"�� ����, ��� ��� ���������� �����������.",DIA_Kardif_Rumors05_No);
		B_LogNote(TOPIC_Rumors,Topic_Rumors_Elvrich);
	};
};
func void DIA_Kardif_Rumors05_Yes()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kardif_Rumors05_Yes_03_00");	//��, ��� ����� ���� �� ��� ����������...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_Rumors05_Yes_07_00");	//��, ��� ����� ���� �� ��� ����������...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors05_Yes_10_00");	//��, ��� ����� ���� �� ��� ����������...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors05_Yes_14_00");	//��, ��� ����� ���� �� ��� ����������...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_Rumors05_Yes_16_00");	//��, ��� ����� ���� �� ��� ����������...
	};
	Info_ClearChoices(DIA_Kardif_Rumors05);
};

func void DIA_Kardif_Rumors05_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kardif_Rumors05_No_03_00");	//�� ����, ��� ��� ���������� �����������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_Rumors05_No_07_00");	//�� ����, ��� ��� ���������� �����������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors05_No_10_00");	//�� ����, ��� ��� ���������� �����������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors05_No_14_00");	//�� ����, ��� ��� ���������� �����������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_Rumors05_No_16_00");	//�� ����, ��� ��� ���������� �����������.
	};
	Info_ClearChoices(DIA_Kardif_Rumors05);
};

/*-------------------------------------------------------------
instance DIA_Kardif_Rumors_FellanAtHome(C_INFO)
{
	nr = 60;
	npc = VLK_431_Kardif;
	condition = DIA_Kardif_Rumors_FellanAtHome_cond;
	information = DIA_Kardif_Rumors_FellanAtHome_info;
	important = TRUE;
};
func int DIA_Kardif_Rumors_FellanAtHome_cond()
{
	if (Kardif_RumorsTold[0] && (MIS_FellanGoHome == LOG_SUCCESS))
	{
		return TRUE;
	};
};
func void DIA_Kardif_Rumors_FellanAtHome_info()
{
	AI_Output(self,other,"DIA_Kardif_Rumors_FellanAtHome_14_05");	//������, ������ �������� �����. ������ ��� ����� ������������, ��� ������. ���� ���� ������ ��������, �� ����������.
	AI_Output(self,other,"DIA_Kardif_Rumors_FellanAtHome_14_06");	//���� ������ ������, ��� �������� ��� ���������, �� �� ������� ����� �� ��������. ��, ������, �� � �����, ��� ���?
	if (hero.voice == 3)	{			//���/������/����
		AI_Output(other,self,"DIA_Kardif_Rumors_FellanAtHome_03_07");	//�? ���, ������ ��?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_Rumors_FellanAtHome_07_07");	//�? ���, ������ ��?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_Rumors_FellanAtHome_10_07");	//�? ���, ������ ��?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_Rumors_FellanAtHome_16_07");	//�? ���, ������ ��?
	};
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_After);
};
//*/

//===================================================
instance DIA_Kardif_WhereBuyYew(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 61;
	condition = DIA_Kardif_WhereBuyYew_Cond;
	information = DIA_Kardif_WhereBuyYew_Info;
	description = "� ���� ����� ������ ���? (5 ���.)";
};
func int DIA_Kardif_WhereBuyYew_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && Kardif_TellRumors
		&& Npc_KnowsInfo(other,DIA_Thorben_HammerWood) && !(Npc_KnowsInfo(other,DIA_Bruno_HasYew) || Npc_KnowsInfo(other,DIA_Fabio_HasYew)))	{
		return TRUE;
	};
};

func void DIA_Kardif_WhereBuyYew_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kardif_WhereBuyYew_03_00");	//� ���� ����� ������ ���?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kardif_WhereBuyYew_07_00");	//� ���� ����� ������ ���?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kardif_WhereBuyYew_10_00");	//� ���� ����� ������ ���?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kardif_WhereBuyYew_14_00");	//� ���� ����� ������ ���?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kardif_WhereBuyYew_16_00");	//� ���� ����� ������ ���?
	};
	if (!DIA_Kardif_Rumors_NoMoney(5))	{
		AI_Output(self,other,"DIA_Kardif_WhereBuyYew_06_01");	//�������� � ����� � �����, �������� �� �����.
		B_SetNameByIndex(VLK_442_Arbeiter,1);
		B_SetNameByIndex(VLK_443_Arbeiter,1);
		B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerHafenAsked);
	};
};

