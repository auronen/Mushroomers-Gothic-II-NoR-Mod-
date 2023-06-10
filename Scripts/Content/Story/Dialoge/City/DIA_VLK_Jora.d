
instance DIA_Jora_EXIT(DIA_Proto_End)
{
	npc = VLK_408_Jora;
};

// ==============================================

instance DIA_Jora_Hello(C_INFO)
{
	nr = 0;
	npc = VLK_408_Jora;
	condition = DIA_WhenAsked_cond;
	information = DIA_Jora_MR_Hello_info;
	important = TRUE;
};
func void DIA_Jora_MR_Hello_info()
{
	if (C_HeroIs_Elena())	{
		AI_Output(self,other,"DIA_Jora_MR_Hello_08_00");	//�����, ������ ����! ��� ���� ������ ������ �� �����, � ��� ������� ������ �� ���������.
		AI_Output(other,self,"DIA_Jora_MR_Hello_13_01");	//� � ���� ��� ����������.
	}
	else	if (C_HeroIs_Rupert())	{
		AI_Output(self,other,"DIA_Jora_MR_Hello_08_02");	//��! � ������ ������ �� ��� ���� � ����!
		AI_Output(self,other,"DIA_Jora_MR_Hello_08_03");	//����� ������� 55 �������, ������� �� ��� ��������.
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Jora_Sum);
	}
	else	{
		AI_Output(self,other,"DIA_Jora_MR_Hello_08_04");	//������ ��������! �������� ������!
	};
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Jora);
};
// ==============================================
instance DIA_Jora_Debt_Rupert(C_INFO)
{
	nr = 1;
	npc = VLK_408_Jora;
	condition = DIA_Jora_Debt_Rupert_cond;
	information = DIA_Jora_Debt_Rupert_info;
	description = "� ������ ������� ���� ������ (55 ���.).";
	permanent = TRUE;
};
func int DIA_Jora_Debt_Rupert_cond()
{
	if (C_HeroIs_Rupert() && !MIS_Rupert_Debts_Paid[Creditor_Jora])	{
		return TRUE;
	};
};
func void DIA_Jora_Debt_Rupert_info()
{
	AI_Output(other,self,"DIA_Jora_Debt_Rupert_03_00");	//� ������ ������� ���� ������.
	if (C_NpcHasGold(other,55))	{
		AI_Output(self,other,"DIA_Jora_Debt_Rupert_08_01");	//�� �������? � � �� � �� �������� �� ��������.
		B_GiveInvItems(other,self,ItMi_Gold,55);
		B_RupertPayDebt(Creditor_Jora);
	}
	else	{
		AI_Output(self,other,"DIA_Jora_Debt_Rupert_08_02");	//� ��� ���?
	};
};
// �������� ==============================================
instance DIA_Jora_Trade(C_INFO)
{
	nr = 50;
	npc = VLK_408_Jora;
	condition = DIA_Jora_Trade_cond;
	information = DIA_Jora_Trade_info;
	description = "������, ��� � ���� ����.";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Jora_Trade_cond()
{
	if (!C_HeroIs_Rupert() || MIS_Rupert_Debts_Paid[Creditor_Jora])	{
		return TRUE;
	};
};
func void DIA_Jora_Trade_info()
{
	B_GiveTradeInv_Jora(self);
};
