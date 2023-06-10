
instance DIA_Canthar_EXIT(DIA_Proto_End)
{
	npc = VLK_468_Canthar;
};


// ���� ==============================================
var int DIA_Canthar_MR_Hello_Sarah_Counter;
instance DIA_Canthar_MR_Hello_Sarah(C_INFO)
{
	nr = 1;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_MR_Hello_Sarah_cond;
	information = DIA_Canthar_MR_Hello_Sarah_info;
	important = TRUE;
};
func int DIA_Canthar_MR_Hello_Sarah_cond()
{
	if (DIA_WhenAsked_cond() && C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Canthar_MR_Hello_Sarah_info()
{
	DIA_Canthar_MR_Hello_Sarah_Counter += 1;
	AI_Output(self,other,"DIA_Canthar_MR_Hello_Sarah_09_00");	//(� ��������) ����������, ����! ������� ������ ���-�� ������?
	AI_Output(other,self,"DIA_Canthar_MR_Hello_Sarah_16_01");	//���, ������ ������������ �� ���� ��������!
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Canthar_MR_Perm_Sarah(C_INFO)
{
	nr = 2;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_MR_Perm_Sarah_cond;
	information = DIA_Canthar_MR_Perm_Sarah_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Canthar_MR_Perm_Sarah_cond()
{
	if (DIA_WhenAsked_cond() && C_HeroIs_Sarah()
		&& Npc_KnowsInfo(other,DIA_Canthar_MR_Hello_Sarah))	{
		return TRUE;
	};
};func void DIA_Canthar_MR_Perm_Sarah_info()
{
	DIA_Canthar_MR_Hello_Sarah_Counter += 1;
	B_GiveAchievement_Sarah_Thorn();
	if (Hlp_Random(100) < 50)	{
		AI_Output(self,other,"DIA_Canthar_MR_Perm_Sarah_09_00");	//�������, �� ����� ��������!
	}
	else	{
		AI_Output(self,other,"DIA_Canthar_MR_Perm_Sarah_09_01");	//������ �� ����� ��������!
	};
	AI_StopProcessInfos(self);
};

// ������ ==============================================
instance DIA_Canthar_Rupert_MR_Hello(C_INFO)
{
	nr = 10;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_Rupert_MR_Hello_cond;
	information = DIA_Canthar_Rupert_MR_Hello_info;
	important = TRUE;
};
func int DIA_Canthar_Rupert_MR_Hello_cond()
{
	if (C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Canthar_Rupert_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Canthar_Rupert_MR_Hello_09_00");	//��! �� �� �����, ��� ������ ��� 150 �������?
	AI_Output(self,other,"DIA_Canthar_Rupert_MR_Hello_09_01");	//���� ����� ��������. ���� �� ������� ���� � ������� ������, �� �� ���� ������ ���������.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Canthar_Sum);
	Info_ClearChoices(DIA_Canthar_MR_Hello);
	Info_AddChoice(DIA_Canthar_MR_Hello, "(��������) ��� ������?",DIA_Canthar_MR_Hello_Rupert_Threat);
	Info_AddChoice(DIA_Canthar_MR_Hello, "(� �������) � ��� ��� ����� �����?",DIA_Canthar_MR_Hello_Rupert_OrWhat);
	Info_AddChoice(DIA_Canthar_MR_Hello, "(����������) �� ��������, � ����� ����� ������.",DIA_Canthar_MR_Hello_Rupert_OK);
};
func void DIA_Canthar_MR_Hello_Rupert_OK()
{
	AI_Output(other,self,"DIA_Canthar_MR_Hello_Rupert_OK_03_00");	//(����������) �� ��������, � ����� ����� ������.
		AI_Output(self,other,"DIA_Canthar_MR_Hello_Rupert_OK_09_01");	//(�����������) ����� ������� �� ���. 
	Info_ClearChoices(DIA_Canthar_MR_Hello);
};
func void DIA_Canthar_MR_Hello_Rupert_OrWhat()
{
	AI_Output(other,self,"DIA_Canthar_MR_Hello_Rupert_OrWhat_03_00");	//(� �������) � ��� ��� ����� �����?
		AI_Output(self,other,"DIA_Canthar_MR_Hello_Rupert_OrWhat_09_01");	//(�������) ������, ��� ���� �� �����������! 
	Info_ClearChoices(DIA_Canthar_MR_Hello);
};
func void DIA_Canthar_MR_Hello_Rupert_Threat()
{
	AI_Output(other,self,"DIA_Canthar_MR_Hello_Rupert_Threat_03_00");	//(��������) ��� ������?
		AI_Output(self,other,"DIA_Canthar_MR_Hello_Rupert_Threat_09_01");	//��������� ��������������. ����. 
	Info_ClearChoices(DIA_Canthar_MR_Hello);
};

// ==============================================
instance DIA_Canthar_Rupert_Debt(C_INFO)
{
	nr = 11;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_Rupert_Debt_cond;
	information = DIA_Canthar_Rupert_Debt_info;
	description = "� ���� ������� ���� (150 ���.).";
	permanent = TRUE;
};
func int DIA_Canthar_Rupert_Debt_cond()
{
	if (C_HeroIs_Rupert() && !MIS_Rupert_Debts_Paid[Creditor_Canthar])	{
		return TRUE;
	};
};
func void DIA_Canthar_Rupert_Debt_info()
{
	AI_Output(other,self,"DIA_Canthar_Rupert_Debt_03_00");	//� ���� ������� ����.
	if (C_NpcHasGold(other,150))	{
		AI_Output(self,other,"DIA_Canthar_Rupert_Debt_01_01");	//�����. ����� ����� ���������� � ����.
		AI_Output(self,other,"DIA_Canthar_Rupert_Debt_01_02");	//������ ���-������ ������?
		B_GiveInvItems(other,self,ItMi_Gold,150);
		B_RupertPayDebt(Creditor_Canthar);
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Canthar);
	}
	else	{
		AI_Output(self,other,"DIA_Canthar_Rupert_Debt_01_03");	//����� ���� ����� ������������ � �������� ��� 150 �������!
	};
};


// ��������� ==============================================
instance DIA_Canthar_MR_Hello(C_INFO)
{
	nr = 50;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_MR_Hello_cond;
	information = DIA_Canthar_MR_Hello_info;
	important = TRUE;
};
func int DIA_Canthar_MR_Hello_cond()
{
	if (!C_HeroIs_Sarah() && !C_HeroIs_Rupert()
		&& (DIA_WhenAsked_cond() || Wld_IsTime(7,50,20,0)))	{
		return TRUE;
	};
};
func void DIA_Canthar_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Canthar_MR_Hello_09_00");	//�����, �������! � ���� ������ ����������� ������ � ����� ������ ���� �� ���� �������!
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Canthar);
};


// �������� ==============================================
instance DIA_Canthar_Trade(C_INFO)
{
	nr = 51;
	npc = VLK_468_Canthar;
	condition = DIA_Canthar_Trade_cond;
	information = DIA_Canthar_Trade_info;
	description = "������ ���� ������.";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Canthar_Trade_cond()
{
	if (!C_HeroIs_Rupert() || MIS_Rupert_Debts_Paid[Creditor_Canthar])	{
		return TRUE;
	};
};
func void DIA_Canthar_Trade_info()
{
	B_GiveTradeInv_Canthar(self);
};
