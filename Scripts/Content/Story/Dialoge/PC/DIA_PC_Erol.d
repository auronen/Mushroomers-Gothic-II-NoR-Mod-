

instance DIA_Erol_EXIT(DIA_Proto_End)
{
	npc = CMP_Erol;
};


// ===============================================
instance DIA_Erol_MR_Hello(C_INFO)
{
	npc = CMP_Erol;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Erol_MR_Hello_info;
	description = "�� ���� ���������� � �������� �����������?";
};
func void DIA_Erol_MR_Hello_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Erol_MR_Hello_03_00");	//�� ���� ���������� � �������� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Erol_MR_Hello_07_00");	//�� ���� ���������� � �������� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Erol_MR_Hello_14_00");	//�� ���� ���������� � �������� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Erol_MR_Hello_16_00");	//�� ���� ���������� � �������� �����������?
	};
	AI_Output(self,other,"DIA_Erol_MR_Hello_10_01");	//��. � ����� ����������� �� ������� � ������ ��� ����.
};
// ===============================================
instance DIA_Erol_Advice(C_INFO)
{
	npc = CMP_Erol;		nr = 2;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Erol_Advice_info;
	description = "���� ��� ���� �����?";
	permanent = TRUE;
};
func void DIA_Erol_Advice_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Erol_Advice_03_00");	//���� ��� ���� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Erol_Advice_07_00");	//���� ��� ���� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Erol_Advice_14_00");	//���� ��� ���� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Erol_Advice_16_00");	//���� ��� ���� �����?
	};
	AI_Output(self,other,"DIA_Erol_Advice_10_01");	//�� ���� � ��� ��� ������, �� ����� � ���������� ������.
	AI_Output(self,other,"DIA_Erol_Advice_10_02");	//� ���� �� ��� ����� - ������ ���� ������������. ��� ����� ��������� � ����� ��������, �� ����� ���.
	AI_Output(self,other,"DIA_Erol_Advice_10_03");	//��������� ����� ������ �����, � ������ ����������� ��� ����� � �����.
};
// ===============================================
instance DIA_Erol_PreTrade(C_INFO)
{
	npc = CMP_Erol;		nr = 3;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Erol_PreTrade_info;
	description = "������� ��� ���� �����?";
};
func void DIA_Erol_PreTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Erol_PreTrade_03_00");	//������� ��� ���� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Erol_PreTrade_07_00");	//������� ��� ���� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Erol_PreTrade_14_00");	//������� ��� ���� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Erol_PreTrade_16_00");	//������� ��� ���� �����?
	};
	AI_Output(self,other,"DIA_Erol_PreTrade_10_01");	//� ���� �����?
};

// ����� ��������� �������� ===============================
instance DIA_Erol_After_HeroWon(C_INFO)
{
	npc = CMP_Erol;		nr = 10;
	condition = DIA_Erol_After_HeroWon_cond;
	information = DIA_Erol_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Erol_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Erol_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Erol_After_HeroWon_10_01");	//�� � ��! ���������� �������� ��������, ����������� ��������.
	AI_Output(self,other,"DIA_Erol_After_HeroWon_10_02");	//��� ��������� ������������.
};
// ===============================================
instance DIA_Erol_After_Won(C_INFO)
{
	npc = CMP_Erol;		nr = 11;
	condition = DIA_Erol_After_Won_cond;
	information = DIA_Erol_After_Won_info;
	description = "���������� � ������� � ��������.";
};
func int DIA_Erol_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Erol_After_Won_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Erol_After_Won_03_00");	//���������� � ������� � ��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Erol_After_Won_07_00");	//���������� � ������� � ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Erol_After_Won_14_00");	//���������� � ������� � ��������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Erol_After_Won_16_00");	//���������� � ������� � ��������.
	};
	AI_Output(self,other,"DIA_Erol_After_Won_10_01");	//���������. ������ �� ������� �� ������� ����� �����?
	Info_ClearChoices(DIA_Erol_After_Won);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Erol_After_Won,"���, � ����� �����, ��� ������� ����������.",DIA_Erol_After_Won_No);
	}
	else	{
		Info_AddChoice(DIA_Erol_After_Won,"���, � ����� ������, ��� ������� ����������.",DIA_Erol_After_Won_No);
	};
	Info_AddChoice(DIA_Erol_After_Won,"��, ��� ���� ���������.",DIA_Erol_After_Won_Yes);
};
func void DIA_Erol_After_Won_Yes()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Erol_After_Won_Yes_03_00");	//��, ��� ���� ���������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Erol_After_Won_Yes_07_00");	//��, ��� ���� ���������.
	} else if (hero.voice == 14)	{		//����
		AI_Output(other,self,"DIA_Erol_After_Won_Yes_14_00");	//��, ��� ���� ���������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Erol_After_Won_Yes_16_00");	//��, ��� ���� ���������.
	};
	Info_ClearChoices(DIA_Erol_After_Won);
};
func void DIA_Erol_After_Won_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Erol_After_Won_No_03_00");	//���, � ����� �����, ��� ������� ����������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Erol_After_Won_No_07_00");	//���, � ����� �����, ��� ������� ����������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Erol_After_Won_No_14_00");	//���, � ����� �����, ��� ������� ����������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Erol_After_Won_No_16_00");	//���, � ����� ������, ��� ������� ����������.
	};
	Info_ClearChoices(DIA_Erol_After_Won);
};


// ===============================================
instance DIA_Erol_After_Perm(C_INFO)
{
	npc = CMP_Erol;		nr = 12;
	condition = DIA_Erol_After_Perm_cond;
	information = DIA_Erol_After_Perm_info;
	description = "��� ������ ���������?";
	permanent = TRUE;
};
func int DIA_Erol_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond() && Npc_KnowsInfo(other,DIA_Erol_MR_Hello))
	{
		return TRUE;
	};
};
func void DIA_Erol_After_Perm_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Erol_After_Perm_03_00");	//��� ������ ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Erol_After_Perm_07_00");	//��� ������ ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Erol_After_Perm_14_00");	//��� ������ ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Erol_After_Perm_16_00");	//��� ������ ���������?
	};
	AI_Output(self,other,"DIA_Erol_After_Perm_10_01");	//������ ��� ����� ��������� ����� ���� ���� �������. � ������� ��� ���� ������ ���������.
};
