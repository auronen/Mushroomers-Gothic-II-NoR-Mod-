

instance DIA_Sarah_EXIT(DIA_Proto_End)
{
	npc = CMP_Sarah;
};


// ===============================================
instance DIA_Sarah_MR_Hello(C_INFO)
{
	npc = CMP_Sarah;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Sarah_MR_Hello_info;
	description = "��� �� ���� ��������� � �������� �����������?";
};
func void DIA_Sarah_MR_Hello_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sarah_MR_Hello_03_00");	//��� �� ���� ��������� � �������� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sarah_MR_Hello_07_00");	//��� �� ���� ��������� � �������� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sarah_MR_Hello_10_00");	//��� �� ���� ��������� � �������� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sarah_MR_Hello_14_00");	//��� �� ���� ��������� � �������� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Sarah_MR_Hello_16_00");	//��� �� ���� ��������� � �������� �����������?
	};
	AI_Output(self,other,"DIA_Sarah_MR_Hello_16_01");	//��, � ������, ��� ��� �� �������� ����������.
};
// ===============================================
instance DIA_Sarah_Advice(C_INFO)
{
	npc = CMP_Sarah;		nr = 2;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Sarah_Advice_info;
	description = "������ ���� �����?";
	permanent = TRUE;
};
func void DIA_Sarah_Advice_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sarah_Advice_03_00");	//������ ���� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sarah_Advice_07_00");	//������ ���� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sarah_Advice_10_00");	//������ ���� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sarah_Advice_14_00");	//������ ���� �����?
	} else	{							//�����
		AI_Output(other,self,"DIA_Sarah_Advice_16_00");	//������ ���� �����?
	};
	AI_Output(self,other,"DIA_Sarah_Advice_16_01");	//���� ���� ���-�� ������� ���� - �������� ��������� �� �� �� ����� ����� ��������� ����.
	AI_Output(self,other,"DIA_Sarah_Advice_16_02");	//�� ����� ������� �����.
};
// ===============================================
instance DIA_Sarah_PreTrade(C_INFO)
{
	npc = CMP_Sarah;		nr = 3;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Sarah_PreTrade_info;
	description = "������ ��� ���� �����.";
};
func void DIA_Sarah_PreTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sarah_PreTrade_03_00");	//������ ��� ���� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sarah_PreTrade_07_00");	//������ ��� ���� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sarah_PreTrade_10_00");	//������ ��� ���� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sarah_PreTrade_14_00");	//������ ��� ���� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Sarah_PreTrade_16_00");	//������ ��� ���� �����.
	};
	AI_Output(self,other,"DIA_Sarah_PreTrade_16_01");	//���. � ���� ���� ��������!
};

// ����� ��������� �������� ===============================
instance DIA_Sarah_After_HeroWon(C_INFO)
{
	npc = CMP_Sarah;		nr = 10;
	condition = DIA_Sarah_After_HeroWon_cond;
	information = DIA_Sarah_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Sarah_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Sarah_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Sarah_After_HeroWon_10_01");	//(�����) ����� ���������� ��������!
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sarah_After_HeroWon_03_02");	//�� ���, ������ �� ������������ ��-�� ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sarah_After_HeroWon_07_02");	//�� ���, ������ �� ������������ ��-�� ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sarah_After_HeroWon_10_02");	//�� ���, ������ �� ������������ ��-�� ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sarah_After_HeroWon_14_02");	//�� ���, ������ �� ������������ ��-�� ���������?
	} else	{							//�����
		AI_Output(other,self,"DIA_Sarah_After_HeroWon_16_02");	//�� ���, ������ �� ������������ ��-�� ���������?
	};

	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Sarah_After_HeroWon_10_03");	//������������, �������. �� ��� �� �������� ���� �����, ��� �� �������!
	}
	else	{
		AI_Output(self,other,"DIA_Sarah_After_HeroWon_10_04");	//���� �� ��-�� ����! �� � �� ��� ������� �������������.
	};
};
// ===============================================
instance DIA_Sarah_After_Won(C_INFO)
{
	npc = CMP_Sarah;		nr = 11;
	condition = DIA_Sarah_After_Won_cond;
	information = DIA_Sarah_After_Won_info;
	description = "��� �� �������� �������?";
};
func int DIA_Sarah_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Sarah_After_Won_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sarah_After_Won_03_00");	//��� �� �������� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sarah_After_Won_07_00");	//��� �� �������� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sarah_After_Won_10_00");	//��� �� �������� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sarah_After_Won_14_00");	//��� �� �������� �������?
	} else	{							//�����
		AI_Output(other,self,"DIA_Sarah_After_Won_16_00");	//��� �� �������� �������?
	};
	AI_Output(self,other,"DIA_Sarah_After_Won_10_01");	//(�����) ��, �. � ���?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sarah_After_Won_03_02");	//������ ����� ����������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sarah_After_Won_07_02");	//������ ����� ����������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sarah_After_Won_10_02");	//������ ����� ����������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sarah_After_Won_14_02");	//������ ����� ����������.
	} else	{							//�����
		AI_Output(other,self,"DIA_Sarah_After_Won_16_02");	//������ ������ ����������.
	};
	AI_Output(self,other,"DIA_Sarah_After_Won_10_03");	//�������.
};

// ===============================================
instance DIA_Sarah_After_preTrade(C_INFO)
{
	npc = CMP_Sarah;		nr = 12;
	condition = DIA_Sarah_After_preTrade_cond;
	information = DIA_Sarah_After_preTrade_info;
	description = "��� ������ ������ ������?";
};
func int DIA_Sarah_After_preTrade_cond()
{
	if (!DIA_WhileCompetition_cond() && Npc_KnowsInfo(other,DIA_Sarah_MR_Hello))
	{
		return TRUE;
	};
};
func void DIA_Sarah_After_preTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sarah_After_preTrade_03_00");	//��� ������ ������ ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sarah_After_preTrade_07_00");	//��� ������ ������ ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sarah_After_preTrade_10_00");	//��� ������ ������ ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sarah_After_preTrade_14_00");	//��� ������ ������ ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Sarah_After_preTrade_16_00");	//��� ������ ������ ������?
	};
	AI_Output(self,other,"DIA_Sarah_After_preTrade_10_01");	//������� � ��������. ������, ������ ����-������ ������?
	Sarah_Trade = TRUE;
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Sarah);
};

// ===============================================
instance DIA_Sarah_After_Trade(C_INFO)
{
	npc = CMP_Sarah;		nr = 50;
	condition = DIA_Sarah_After_Trade_cond;
	information = DIA_Sarah_After_Trade_info;
	description = "(���������)";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Sarah_After_Trade_cond()
{
	if (Sarah_Trade)
	{
		return TRUE;
	};
};
func void DIA_Sarah_After_Trade_info()
{
	B_GiveTradeInv_Sarah(self);
};
