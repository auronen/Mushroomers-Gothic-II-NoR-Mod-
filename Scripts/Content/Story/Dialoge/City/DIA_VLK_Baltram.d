
instance DIA_Baltram_EXIT(DIA_Proto_End)
{
	npc = VLK_410_Baltram;
};

// ==============================================

instance DIA_Baltram_MR_Hello(C_INFO)
{
	nr = 1;
	npc = VLK_410_Baltram;
	condition = DIA_WhenAsked_cond;
	information = DIA_Baltram_MR_Hello_info;
	important = TRUE;
};
func void DIA_Baltram_MR_Hello_info()
{
	if (C_HeroIs_Rupert())	{
		AI_Output(self,other,"DIA_Baltram_MR_Hello_01_00");	//��� ��� 75 �������?
		AI_Output(self,other,"DIA_Baltram_MR_Hello_01_01");	//����� ����, ��� � ��������� ��������� ������!
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Baltram_Sum);
	}
	else	{
		AI_Output(self,other,"DIA_Baltram_MR_Hello_01_02");	//����� ������ ��������! ������ ��� � �����.
	};
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Baltram);
};

// ==============================================
instance DIA_Baltram_Debt_Rupert(C_INFO)
{
	nr = 2;
	npc = VLK_410_Baltram;
	condition = DIA_Baltram_Debt_Rupert_cond;
	information = DIA_Baltram_Debt_Rupert_info;
	description = "��� ���� ������ (75 ���.).";
	permanent = TRUE;
};
func int DIA_Baltram_Debt_Rupert_cond()
{
	if (C_HeroIs_Rupert() && !MIS_Rupert_Debts_Paid[Creditor_Baltram])	{
		return TRUE;
	};
};
func void DIA_Baltram_Debt_Rupert_info()
{
	AI_Output(other,self,"DIA_Baltram_Debt_Rupert_03_00");	//� ������ ������� ���� ������.
	if (B_GiveGold(other,self,75))	{
		AI_Output(self,other,"DIA_Baltram_Debt_Rupert_01_01");	//��, ������ � ����� ��� �� ����� ����� ����.
		B_RupertPayDebt(Creditor_Baltram);
	}
	else	{
		AI_Output(self,other,"DIA_Baltram_Debt_Rupert_01_02");	//����� �� ������ �������� �� - 75 �������, � �� �������� ������!
	};
};

// �������� ==============================================
instance DIA_Baltram_Trade(C_INFO)
{
	nr = 50;
	npc = VLK_410_Baltram;
	condition = DIA_Baltram_Trade_cond;
	information = DIA_Baltram_Trade_info;
	description = "������ ���� ��������.";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Baltram_Trade_cond()
{
	if (!C_HeroIs_Rupert() || MIS_Rupert_Debts_Paid[Creditor_Baltram])	{
		return TRUE;
	};
};
func void DIA_Baltram_Trade_info()
{
	B_GiveTradeInv_Baltram(self);
};
