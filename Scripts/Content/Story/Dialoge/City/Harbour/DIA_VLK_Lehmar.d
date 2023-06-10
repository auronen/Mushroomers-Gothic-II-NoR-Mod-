
instance DIA_Lehmar_EXIT(DIA_Proto_End)
{
	npc = VLK_484_Lehmar;
};


/////////////////////////////////////// ������ //////////////////////////////////////////////
// ==============================================
instance DIA_Lehmar_Rupert_Hello(C_INFO)
{
	nr = 1;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_MR_Hello_cond;
	information = DIA_Lehmar_Rupert_MR_Hello_info;
	important = TRUE;
};
func int DIA_Lehmar_Rupert_MR_Hello_cond()
{
	if (C_HeroIs_Rupert() && !MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_09_00");	//������-����? 
		AI_Output(other,self,"DIA_Lehmar_Rupert_MR_Hello_03_01");	//�...
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_09_02");	//(����������) �� ������ ��� 500 �������.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Sum);
		AI_Output(other,self,"DIA_Lehmar_Rupert_MR_Hello_03_03");	//�������?! �� � �� ���� � ���� �����!
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_09_04");	//������ ���� ������ �����!
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_09_05");	//� ��� �� ��������� ��������������������. �������� ��������� � ������ ����. � ��� �������� ��������.
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_09_06");	//��� �� ����������� �������?
	Info_ClearChoices(DIA_Lehmar_Rupert_Hello);
	if (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordKnown)	{
		Info_AddChoice(DIA_Lehmar_Rupert_Hello,"� ������, ���� ����� ��� �� ���������� ����.",DIA_Lehmar_Rupert_AskSword_info);
	}
	else	{
		Info_AddChoice(DIA_Lehmar_Rupert_Hello,"�����, � ���� ���-������ ���������� ����?",DIA_Lehmar_Rupert_MR_Hello_AskRelief);
	};
	Info_AddChoice(DIA_Lehmar_Rupert_Hello,"����������, ��� ��� ��� ��������� ����!",DIA_Lehmar_Rupert_MR_Hello_NoPay);
	if (C_NpcHasGold(other,500))	{
		Info_AddChoice(DIA_Lehmar_Rupert_Hello,"��� ������. (500 ���.)",DIA_Lehmar_Rupert_MR_Hello_Pay);
	};
	MIS_Rupert_Debts_Lehmar_Day = Wld_GetDay() + 3;
};
func void DIA_Lehmar_Rupert_MR_Hello_Pay()
{
		AI_Output(other,self,"DIA_Lehmar_Rupert_MR_Hello_Pay_03_00");	//��� ������.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	B_RupertPayDebt(Creditor_Lehmar);
	Info_ClearChoices(DIA_Lehmar_Rupert_Hello);
};
func void DIA_Lehmar_Rupert_MR_Hello_NoPay()
{
		AI_Output(other,self,"DIA_Lehmar_Rupert_MR_Hello_NoPay_03_00");	//����������, ��� ��� ��� ��������� ����! � ������� ������, �������!
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_NoPay_09_01");	//��� ����� ������, � �� ���� ������!
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_NoPay_09_02");	//(����������)
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_NoPay_09_03");	//��, ������. � ��� ���� ��� ��� ���. ��� 20 ��������� � ����. ��� 100 ������� �� ������ ����, ���� �� �� ������ �������.
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_NoPay_09_04");	//� ����� - ��� ��������� ��������! ���� ����� ��� ��� � �� ������ �����, �������� ������� ����.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Percent);
	Info_ClearChoices(DIA_Lehmar_Rupert_Hello);
};
func void DIA_Lehmar_Rupert_MR_Hello_AskRelief()
{
		AI_Output(other,self,"DIA_Lehmar_Rupert_MR_Hello_AskRelief_03_00");	//�����, � ���� ���-������ ���������� ����?
	AI_Output(self,other,"DIA_Lehmar_Rupert_MR_Hello_AskRelief_09_01");	//���. � ���� ��� ������, � ��� �� ��������� ����� �������, ��� ��.
};

// ----------------------------------------------
instance DIA_Lehmar_Rupert_AskSword(C_INFO)
{
	nr = 2;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_AskSword_cond;
	information = DIA_Lehmar_Rupert_AskSword_info;
	description = "� ������, ���� ����� ��� �� ���������� ����.";
};
func int DIA_Lehmar_Rupert_AskSword_cond()
{
	if (C_HeroIs_Rupert() && (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordKnown)
		&& !MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_AskSword_info()
{
		AI_Output(other,self,"DIA_Lehmar_Rupert_AskSword_03_00");	//� ������, ���� ����� ��� �� ���������� ����. ���, ���� � ������� ���� �����?
	AI_Output(self,other,"DIA_Lehmar_Rupert_AskSword_09_01");	//��?! ��� �� ����? ����... ������ �� � ���.
	AI_Output(self,other,"DIA_Lehmar_Rupert_AskSword_09_02");	//����������� ��� - ���� �� �������� ����� ���, �� � ����� ���� ��� ��������. �� ����� ������ ������ ��� ������ �����.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Told);
	MIS_Rupert_Debts_Lehmar_Sword = MIS_Rupert_Debts_Lehmar_SwordTold;
	Info_ClearChoices(DIA_Lehmar_Rupert_Hello);
};

// ----------------------------------------------
instance DIA_Lehmar_Rupert_GiveMoney(C_INFO)
{
	nr = 3;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_GiveMoney_cond;
	information = DIA_Lehmar_Rupert_GiveMoney_info;
	description = "� ������ ������� ����.";
	permanent = TRUE;
};
func int DIA_Lehmar_Rupert_GiveMoney_cond()
{
	//�������?
	if (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordGiven)	{
		MIS_Rupert_Debts_Lehmar_Sum = 100;
	}
	else	{
		MIS_Rupert_Debts_Lehmar_Sum = 500 + 100 * (3 + Wld_GetDay() - MIS_Rupert_Debts_Lehmar_Day);
	};
	DIA_Lehmar_Rupert_GiveMoney.description = C_BuildPriceString("� ������ ������� ���� ",MIS_Rupert_Debts_Lehmar_Sum);
	
	if (C_HeroIs_Rupert()
		&& !MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_GiveMoney_info()
{
	AI_Output(other,self,"DIA_Lehmar_Rupert_GiveMoney_03_00");	//� ������ ������� ����.
	if (C_NpcHasGold(other,MIS_Rupert_Debts_Lehmar_Sum))	{
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveMoney_09_01");	//����� ������ � ������ ������!
		B_GiveInvItems(other,self,ItMi_Gold,MIS_Rupert_Debts_Lehmar_Sum);
		B_RupertPayDebt(Creditor_Lehmar);
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveMoney_09_02");	//(���� ��� ���) ����� � ��� ��� �������� � ������������� ��������...
	}
	else	{
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveMoney_09_03");	//����� ������� ������! �� �������!
	};
	AI_StopProcessInfos(self);
};

// ----------------------------------------------
instance DIA_Lehmar_Rupert_GiveSword(C_INFO)
{
	nr = 4;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_GiveSword_cond;
	information = DIA_Lehmar_Rupert_GiveSword_info;
	description = "� ������ ���� ������ ���.";
};
func int DIA_Lehmar_Rupert_GiveSword_cond()
{
	if (C_HeroIs_Rupert() &&
		((MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordKnown) || (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordTold))
		&& !MIS_Rupert_Debts_Paid[Creditor_Lehmar]
		&& (Npc_HasItems(other,ItMw_1H_Sword_Lehmar) > 0))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_GiveSword_info()
{
	AI_Output(other,self,"DIA_Lehmar_Rupert_GiveSword_03_00");	//� ������ ���� ������ ���.
	if (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordTold)	{
		B_GiveInvItems(other,self,ItMw_1H_Sword_Lehmar,1);
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_01");	//��, ������ ������ �� �� ������ �������� ����� �� �����.
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_02");	//��� �� � ��������������, � ����� ���� ��������. �� ����� ������ ��� ������ 100 �������.
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_03");	//� �����, ���� �� ������� �� �������. ������ ���� ������.
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Sword);
		B_GivePlayerXP(XP_Rupert_Debts_Lehmar_Sword);
	}
	else	{
	AI_Output(other,self,"DIA_Lehmar_Rupert_GiveSword_03_04");	//������, ���� ����� �����.
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_05");	//���? ������ ��?.. �, �� �����.
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_06");	//� ������������� ����� ��� ����� ���. 
	AI_Output(other,self,"DIA_Lehmar_Rupert_GiveSword_03_07");	//�������� � �������� ������ �����?
		AI_Output(self,other,"DIA_Lehmar_Rupert_GiveSword_09_08");	//��, ������ ���� ���! ����� ��� ����, � ������, ���� � �� ���������!
		B_GiveInvItems(other,self,ItMw_1H_Sword_Lehmar,1);
		B_RupertPayDebt(Creditor_Lehmar);
		AI_StopProcessInfos(self);
	};
	MIS_Rupert_Debts_Lehmar_Sword = MIS_Rupert_Debts_Lehmar_SwordGiven;
};

// ----------------------------------------------
instance DIA_Lehmar_Rupert_Punishment(C_INFO)
{
	nr = 5;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_Punishment_cond;
	information = DIA_Lehmar_Rupert_Punishment_info;
	important = TRUE;
};
func int DIA_Lehmar_Rupert_Punishment_cond()
{
	if (C_HeroIs_Rupert() && 
		((MIS_Rupert_Debts_Lehmar_Day < Wld_GetDay()) && !MIS_Rupert_Debts_Paid[Creditor_Lehmar]))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_Punishment_info()
{
	AI_GotoNpc(VLK_415_Meldor,other);
	AI_GotoNpc(VLK_4941_Thug,other); 
		AI_Output(self,other,"DIA_Lehmar_Rupert_Punishment_09_00");	//��! ������ ��������� ���!
	AI_Output(other,self,"DIA_Lehmar_Rupert_Punishment_03_01");	//� �����...
		AI_Output(self,other,"DIA_Lehmar_Rupert_Punishment_09_02");	//��� �������, ��� �� ��� �����! � ���� �����, ��� ����������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,0);
	B_Attack(VLK_415_Meldor,other,AR_NONE,0);
	B_Attack(VLK_4941_Thug,other,AR_NONE,0);
	MIS_Rupert_Debts_Paid[Creditor_Lehmar] = TRUE;
};

// ----------------------------------------------
instance DIA_Lehmar_Rupert_GetOut(C_INFO)
{
	nr = 6;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Rupert_GetOut_cond;
	information = DIA_Lehmar_Rupert_GetOut_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Lehmar_Rupert_GetOut_cond()
{
	if (C_HeroIs_Rupert() && DIA_WhenAsked_cond()
		&& MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		return TRUE;
	};
};
func void DIA_Lehmar_Rupert_GetOut_info()
{
		AI_Output(self,other,"DIA_Lehmar_Rupert_GetOut_09_00");	//����� ���!
	AI_StopProcessInfos(self);
};



/////////////////////////////////////// ����� //////////////////////////////////////////////
// ==============================================
instance DIA_Lehmar_Elena_AboutCup(C_INFO)
{
	nr = 10;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Elena_AboutCup_cond;
	information = DIA_Lehmar_Elena_AboutCup_info;
	description = "� �������, � ���� ���� ����� ��������.";
};
func int DIA_Lehmar_Elena_AboutCup_cond()
{
	if (C_HeroIs_Elena()
		 && MIS_Elena_Present_KnowsLehmar
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_AboutCup_info()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_AboutCup_16_00");	//����������. � �������, � ���� ���� ����� ��������.
	AI_Output(self,other,"DIA_Lehmar_Elena_AboutCup_09_01");	//� ���?
		AI_Output(other,self,"DIA_Lehmar_Elena_AboutCup_16_02");	//� �� ������ ��� ��������.
	AI_Output(self,other,"DIA_Lehmar_Elena_AboutCup_09_03");	//���.
		AI_Output(other,self,"DIA_Lehmar_Elena_AboutCup_16_04");	//�� ������?
	AI_Output(self,other,"DIA_Lehmar_Elena_AboutCup_09_05");	//� �� ������ ����� ����� �����������!
	AI_Output(self,other,"DIA_Lehmar_Elena_AboutCup_09_06");	//��� ��� ����� - ���� ������, ���� �� ������!
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_LehmarNo);
	AI_StopProcessInfos(self);
};
// ==============================================
instance DIA_Lehmar_Elena_AboutCupPerm(C_INFO)
{
	nr = 11;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Elena_AboutCupPerm_cond;
	information = DIA_Lehmar_Elena_AboutCupPerm_info;
	description = "� �������, ������� ��������.";
	permanent = TRUE;
};
func int DIA_Lehmar_Elena_AboutCupPerm_cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lehmar_Elena_AboutCup)
		&& !MIS_Elena_Present_CupLehmarGot && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_AboutCupPerm_info()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_AboutCupPerm_16_00");	//� �������, ������� ��������.
	AI_Output(self,other,"DIA_Lehmar_Elena_AboutCupPerm_09_01");	//���. �� �� ���������.
	AI_StopProcessInfos(self);
};

// ==============================================
instance DIA_Lehmar_Elena_CupLost(C_INFO)
{
	npc = VLK_484_Lehmar;				nr = 12;
	condition = DIA_Lehmar_Elena_CupLost_cond;
	information = DIA_Lehmar_Elena_CupLost_info;
	important = TRUE;
};
func int DIA_Lehmar_Elena_CupLost_cond()
{
	if (C_HeroIs_Elena()
		&& MIS_Elena_Present_CupLehmarGot)	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_CupLost_info()
{
	MIS_Elena_Present_LehamarAskedCupBack = MIS_Elena_Present_Lehamar_Mad;
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_09_00");	//�� ��, �����! ��, � ����!
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_09_01");	//� ���� ������ ����� ��������, ����� ����, ��� �� � ��� ������������.
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_09_02");	//�������, � �����? ����� ��� �����, �������!
	Info_ClearChoices(DIA_Lehmar_Elena_CupLost);
	Info_AddChoice(DIA_Lehmar_Elena_CupLost,"(� ��������� ����������) ��� ��� � ���� ������? � ������ �������� ���...",DIA_Lehmar_Elena_CupLost_Bought);
	Info_AddChoice(DIA_Lehmar_Elena_CupLost,"(����) � ���� ��� ���.",DIA_Lehmar_Elena_CupLost_No);
	B_StartOtherRoutine(self,"START");
	B_StartOtherRoutine(VLK_415_Meldor,"START");
};
func void DIA_Lehmar_Elena_CupLost_No()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_No_17_00");	//(����) � ���� ��� ���.
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_No_09_01");	//(� �������) � ���� � ���� �����?
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_No_17_02");	//��, ��������.
	//������� ��� ����. ���� ����� � ���������, ��������
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
	B_LogEntry(TOPIC_Elena_Present,ConcatStrings(TOPIC_Elena_Present_LehmarCupTheft,TOPIC_Elena_Present_LehmarCupMine));
};
func void DIA_Lehmar_Elena_CupLost_Bought()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_Bought_17_00");	//(��������) ��� ��� � ���� ������? � ������ �������� ���...
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_Bought_09_01");	//(���������) � � ���� ������� ��������...
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_Bought_09_02");	//����� ����� ������ ��!
	Info_ClearChoices(DIA_Lehmar_Elena_CupLost);
	Info_AddChoice(DIA_Lehmar_Elena_CupLost,"� �� ���� ������ ���������! ������ �� ����.",DIA_Lehmar_Elena_CupLost_MyCup);
	if (Npc_HasItems(other,ItMi_FaithfulnessCup_02))	{
		Info_AddChoice(DIA_Lehmar_Elena_CupLost,"���, ������. � ������ �� �����, ������.",DIA_Lehmar_Elena_CupLost_Return);
	}
	else	{
		Info_AddChoice(DIA_Lehmar_Elena_CupLost,"� ���� ��� ��� � �����. �������, � �������.",DIA_Lehmar_Elena_CupLost_NoCup);
	};
};
func void DIA_Lehmar_Elena_CupLost_Return()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_Return_17_00");	//���, ������. � ������ �� �����, ������.
	B_GiveInvItems(other,self,ItMi_FaithfulnessCup_02,1);
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_Return_09_01");	//�����, � ���� ����.
	B_GivePlayerXP(XP_Elena_CupReterned);
	MIS_Elena_Present_LehamarAskedCupBack = MIS_Elena_Present_Lehamar_Returned;
	MIS_Elena_Present_ReadyCnt -= 1;
	if (MIS_Elena_Present_ReadyCnt == 0)	{
		MIS_Elena_Present = LOG_Running;
		B_LogEntry_Status(TOPIC_Elena_Present,LOG_Running,ConcatStrings(TOPIC_Elena_Present_LehmarCupTheft,TOPIC_Elena_Present_LehmarReturned));
	}
	else	{
		B_LogEntry(TOPIC_Elena_Present,ConcatStrings(TOPIC_Elena_Present_LehmarCupTheft,TOPIC_Elena_Present_LehmarReturned));
	};
	Info_ClearChoices(DIA_Lehmar_Elena_CupLost);
	Info_AddChoice(DIA_Lehmar_Elena_CupLost,"��� ���� ��� ����� ���� �����?",DIA_Lehmar_Elena_WhyTreasure_info);
};
func void DIA_Lehmar_Elena_WhyTreasure_info()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_WhyTreasure_17_00");	//��� ���� ��� ����� ���� �����?
	AI_Output(self,other,"DIA_Lehmar_Elena_WhyTreasure_09_01");	//�� ���� �� �� ����������... ����� ��� ��� �������.
	AI_Output(self,other,"DIA_Lehmar_Elena_WhyTreasure_09_02");	//�� �� ������� � ��� ����� �������, ������ ������ ��������, � ��� ������� � �����-�� ����������� �� �������!
	AI_Output(self,other,"DIA_Lehmar_Elena_WhyTreasure_09_03");	//���� ��� � ��� �� �����, �� ����. �����, � ������� ���.
	Info_ClearChoices(DIA_Lehmar_Elena_CupLost);
};

func void DIA_Lehmar_Elena_CupLost_NoCup()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_NoCup_17_00");	//� ���� ��� ��� � �����. �������, � �������.
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_NoCup_09_01");	//� ����� ����� � ������ ���� ������?
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_NoCup_17_02");	//������ �������� ����, �� ��� ���� ������ �� ����.
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_NoCup_09_03");	//�� � ������ ������, ������! � ����� � ���� ������ �� �����.
	MIS_Elena_Present_LehamarAskedCupBack = MIS_Elena_Present_Lehamar_Waits;
	B_LogEntry(TOPIC_Elena_Present,ConcatStrings(TOPIC_Elena_Present_LehmarCupTheft,TOPIC_Elena_Present_LehmarWaits));
	AI_StopProcessInfos(self);
};

func void DIA_Lehmar_Elena_CupLost_MyCup()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_CupLost_MyCup_17_00");	//� �� ���� ������ ���������! ������ �� ����.
	AI_Output(self,other,"DIA_Lehmar_Elena_CupLost_MyCup_09_01");	//�� ��, �����! ������ �������� ��� ���������� ���!
	B_LogEntry(TOPIC_Elena_Present,ConcatStrings(TOPIC_Elena_Present_LehmarCupTheft,TOPIC_Elena_Present_LehmarCupMine));
	AI_StopProcessInfos(self);
};

// ==============================================
instance DIA_Lehmar_Elena_ReturnCup(C_INFO)
{
	npc = VLK_484_Lehmar;				nr = 13;
	condition = DIA_Lehmar_Elena_ReturnCup_cond;
	information = DIA_Lehmar_Elena_ReturnCup_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Lehmar_Elena_ReturnCup_cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond()
		&& (MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_Waits))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_ReturnCup_info()
{
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnCup_09_00");	//�� �������� �����?
	if (Npc_HasItems(other,ItMi_FaithfulnessCup_02))	{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnCup_17_01");	//��, ��� ��.
		DIA_Lehmar_Elena_CupLost_Return();
	}
	else	{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnCup_17_02");	//��� ���...
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnCup_09_03");	//����� ���� ������!
		AI_StopProcessInfos(self);
	};
};

// ==============================================
var int DIA_Lehmar_Elena_AfterReturnPerm_Once;
instance DIA_Lehmar_Elena_AfterReturnPerm(C_INFO)
{
	npc = VLK_484_Lehmar;				nr = 14;
	condition = DIA_Lehmar_Elena_AfterReturnPerm_cond;
	information = DIA_Lehmar_Elena_AfterReturnPerm_info;
	description = "��� ��� ������ �� �����.";
	permanent = TRUE;
};
func int DIA_Lehmar_Elena_AfterReturnPerm_cond()
{
	if (C_HeroIs_Elena()
		&& (MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_Returned))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_AfterReturnPerm_info()
{
	AI_Output(other,self,"DIA_Lehmar_Elena_AfterReturnPerm_17_00");	//��� ��� ������ �� �����.
	if (!DIA_Lehmar_Elena_AfterReturnPerm_Once)	{
		AI_Output(self,other,"DIA_Lehmar_Elena_AfterReturnPerm_09_01");	//��������� �������. �� � ��� ���� ��� ����� �� ������.
		DIA_Lehmar_Elena_AfterReturnPerm_Once = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Lehmar_Elena_AfterReturnPerm_09_02");	//������ ������ ���� � �����.
	};
};

// ==============================================
instance DIA_Lehmar_Elena_ReturnOtherCup(C_INFO)
{
	npc = VLK_484_Lehmar;				nr = 15;
	condition = DIA_Lehmar_Elena_ReturnOtherCup_cond;
	information = DIA_Lehmar_Elena_ReturnOtherCup_info;
	description = "���� ����� ������ ����� ��������?";
};
func int DIA_Lehmar_Elena_ReturnOtherCup_cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_Returned)
		 && Npc_HasItems(other,ItMi_FaithfulnessCup_01))	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_ReturnOtherCup_info()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup_17_00");	//���� ����� ������ ����� ��������?
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup_09_01");	//��, ���� ������! ��� ��?
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup_17_02");	//�� � ����.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup_09_03");	//������� �� �� ���� ������?
	Info_ClearChoices(DIA_Lehmar_Elena_ReturnOtherCup);
	Info_AddChoice(DIA_Lehmar_Elena_ReturnOtherCup,"������� ���.",DIA_Lehmar_Elena_ReturnOtherCup0);
	Info_AddChoice(DIA_Lehmar_Elena_ReturnOtherCup,"1000 �������.",DIA_Lehmar_Elena_ReturnOtherCup1000);
	Info_AddChoice(DIA_Lehmar_Elena_ReturnOtherCup,"850 �������.",DIA_Lehmar_Elena_ReturnOtherCup850);
	Info_AddChoice(DIA_Lehmar_Elena_ReturnOtherCup,"500 �������.",DIA_Lehmar_Elena_ReturnOtherCup500);
	Info_AddChoice(DIA_Lehmar_Elena_ReturnOtherCup,"350 �������.",DIA_Lehmar_Elena_ReturnOtherCup350);
};
func void DIA_Lehmar_Elena_ReturnOtherCup350()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup350_17_00");	//350 �������.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup350_09_01");	//������. ��� ���� ������. � ������ �����, � ���� ������ ����.
	B_GiveInvItems(other,self,ItMi_FaithfulnessCup_01,1);
	B_GiveInvItems(self,other,ItMi_Gold,350);
	B_GivePlayerXP(XP_Elena_Cup2ReternedPayed);
	AI_StopProcessInfos(self);
};
func void DIA_Lehmar_Elena_ReturnOtherCup500()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup500_17_00");	//500 �������.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup500_09_01");	//�����. ����� ������ � �������� � ���� ����!
	B_GiveInvItems(other,self,ItMi_FaithfulnessCup_01,1);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_StopProcessInfos(self);
};
func void DIA_Lehmar_Elena_ReturnOtherCup850()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup850_17_00");	//850 �������.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup850_09_01");	//�������?!
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup850_17_02");	//����� �� ������� ��� �������� ��� �����. � ������ ���� ������� ��� ������.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup850_09_03");	//(������ ������) ������. ����� ������ � ������ ������.
	B_GiveInvItems(other,self,ItMi_FaithfulnessCup_01,1);
	B_GiveInvItems(self,other,ItMi_Gold,850);
	AI_StopProcessInfos(self);
};
func void DIA_Lehmar_Elena_ReturnOtherCup1000()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup1000_17_00");	//1000 �������.
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup1000_09_01");	//���?! �� �� ������ �������?
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup1000_09_02");	//�������, ���� � ���������, �� � ���� ����� ������ ����?
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup1000_09_03");	//�� ��� ���� ����� �������. ���� �� �����!
	AI_StopProcessInfos(self);
};
func void DIA_Lehmar_Elena_ReturnOtherCup0()
{
		AI_Output(other,self,"DIA_Lehmar_Elena_ReturnOtherCup0_17_00");	//������� ���.
	B_GiveInvItems(other,self,ItMi_FaithfulnessCup_01,1);
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup0_09_01");	//�� �����, �� ������ ���� ��� ������?
	AI_Output(self,other,"DIA_Lehmar_Elena_ReturnOtherCup0_09_02");	//���, ������ 500 �������. ����, � ������ �� ���������!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	B_GivePlayerXP(XP_Elena_Cup2ReternedFree);
	AI_StopProcessInfos(self);
	//������
	B_Adanos_Bless4Good();
};

// ==============================================
instance DIA_Lehmar_Elena_GetOut(C_INFO)
{
	npc = VLK_484_Lehmar;				nr = 16;
	condition = DIA_Lehmar_Elena_GetOut_cond;
	information = DIA_Lehmar_Elena_GetOut_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Lehmar_Elena_GetOut_cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond()
		&& ((MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_GotByForce)
			|| (MIS_Elena_Present_LehamarAskedCupBack == MIS_Elena_Present_Lehamar_Mad)
			|| Npc_KnowsInfo(other,DIA_Lehmar_Elena_ReturnOtherCup)))
	{
		return TRUE;
	};
};
func void DIA_Lehmar_Elena_GetOut_info()
{
	AI_Output(self,other,"DIA_Lehmar_Elena_GetOut_09_00");	//������ ���� � �����!
	AI_StopProcessInfos(self);
};

/////////////////////////////////////// ��������� /////////////////////////////////////////////
// ==============================================
instance DIA_Lehmar_Others_Hello(C_INFO)
{
	nr = 50;
	npc = VLK_484_Lehmar;
	condition = DIA_Lehmar_Others_MR_Hello_cond;
	information = DIA_Lehmar_Others_MR_Hello_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Lehmar_Others_MR_Hello_cond()
{
	var C_NPC owner;	owner = Wld_GetPlayerPortalOwner();
	if (!C_HeroIs_Rupert()
		&& !(C_HeroIs_Elena() && MIS_Elena_Present_KnowsLehmar)
		&& (C_NpcIs(owner,self))
		&& DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Lehmar_Others_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Lehmar_Others_MR_Hello_09_00");	//������ ������ �����?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Lehmar_Others_MR_Hello_03_01");	//���.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Lehmar_Others_MR_Hello_07_01");	//���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Lehmar_Others_MR_Hello_10_01");	//���.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Lehmar_Others_MR_Hello_14_01");	//���.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Lehmar_Others_MR_Hello_16_01");	//���.
	};
	AI_Output(self,other,"DIA_Lehmar_Others_MR_Hello_09_02");	//����� �� �������� ����� �������.
	AI_StopProcessInfos(self);
};

