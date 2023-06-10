

instance DIA_Elena_EXIT(DIA_Proto_End)
{
	npc = CMP_Elena;
};

// ===============================================
instance DIA_Elena_MR_Hello_Till(C_INFO)
{
	npc = CMP_Elena;		nr = 1;
	condition = DIA_Elena_MR_Hello_Till_cond;
	information = DIA_Elena_MR_Hello_Till_info;
	description = "������, ���!";
};
func int DIA_Elena_MR_Hello_Till_cond()
{
	if (C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Elena_MR_Hello_Till_info()
{
		AI_Output(other,self,"DIA_Elena_MR_Hello_Till_14_00");	//������, ���!
	AI_Output(self,other,"DIA_Elena_MR_Hello_Till_16_01");	//������, ����! � �� �����.
		AI_Output(other,self,"DIA_Elena_MR_Hello_Till_14_02");	//�� ���� ����� ���������?
	AI_Output(self,other,"DIA_Elena_MR_Hello_Till_16_03");	//���.
};
// ===============================================
instance DIA_Elena_MR_Hello(C_INFO)
{
	npc = CMP_Elena;		nr = 2;
	condition = DIA_Elena_MR_Hello_cond;
	information = DIA_Elena_MR_Hello_info;
	description = "�� ���������� � ������� ��������?";
};
func int DIA_Elena_MR_Hello_cond()
{
	if (!C_HeroIs_Till() && DIA_WhileCompetition_cond())	{
		return TRUE;
	};
};
func void DIA_Elena_MR_Hello_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elena_MR_Hello_03_00");	//�� ���������� � ������� ��������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elena_MR_Hello_07_00");	//�� ���������� � ������� ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elena_MR_Hello_10_00");	//�� ���������� � ������� ��������?
	} else	{							//����
		AI_Output(other,self,"DIA_Elena_MR_Hello_16_00");	//�� ���������� � ������� ��������?
	};
	AI_Output(self,other,"DIA_Elena_MR_Hello_16_01");	//��. � ������� ���� ��� ������ ����� �����.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elena_MR_Hello_03_02");	//�� �� ���� �������������� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elena_MR_Hello_07_02");	//�� �� ���� �������������� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elena_MR_Hello_10_02");	//�� �� ���� �������������� �����?
	} else	{							//����
		AI_Output(other,self,"DIA_Elena_MR_Hello_16_02");	//�� �� ���� �������������� �����?
	};
	AI_Output(self,other,"DIA_Elena_MR_Hello_16_03");	//�����.
};
// ===============================================
instance DIA_Elena_Advice(C_INFO)
{
	npc = CMP_Elena;		nr = 3;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Elena_Advice_info;
	description = "���� ��� ���� �����?";
	permanent = TRUE;
};
func void DIA_Elena_Advice_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elena_Advice_03_00");	//���� ��� ���� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elena_Advice_07_00");	//���� ��� ���� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elena_Advice_10_00");	//���� ��� ���� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elena_Advice_14_00");	//���� ��� ���� �����?
	} else	{							//����
		AI_Output(other,self,"DIA_Elena_Advice_16_00");	//���� ��� ���� �����?
	};
	AI_Output(self,other,"DIA_Elena_Advice_16_01");	//����������� ������ � ����� � ��� ���������. ����� ������ �� ������ ������� ������.
};
// ===============================================
instance DIA_Elena_PreTrade(C_INFO)
{
	npc = CMP_Elena;		nr = 4;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Elena_PreTrade_info;
	description = "������� ��� ���� �����?";
};
func void DIA_Elena_PreTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elena_PreTrade_03_00");	//������� ��� ���� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elena_PreTrade_07_00");	//������� ��� ���� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elena_PreTrade_10_00");	//������� ��� ���� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elena_PreTrade_14_00");	//������� ��� ���� �����?
	} else	{							//����
		AI_Output(other,self,"DIA_Elena_PreTrade_16_00");	//������� ��� ���� �����?
	};
	AI_Output(self,other,"DIA_Elena_PreTrade_16_01");	//���. ��� ����� ��������.
};

// ����� ��������� �������� ===============================
instance DIA_Elena_After_HeroWon(C_INFO)
{
	npc = CMP_Elena;		nr = 10;
	condition = DIA_Elena_After_HeroWon_cond;
	information = DIA_Elena_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Elena_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Elena_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Elena_After_HeroWon_16_01");	//���� ������� ������ ���� � ��������!
	//���� ��� � ����-�� ������ �����, ��� � ���
	if ((MR_Counter_Elena < MR_Counter_Erol) || (MR_Counter_Elena < MR_Counter_Odo) || (MR_Counter_Elena < MR_Counter_Rupert)
		|| (MR_Counter_Elena < MR_Counter_Sarah) || (MR_Counter_Elena < MR_Counter_Talbin) || (MR_Counter_Elena < MR_Counter_Till))
	{
		AI_Output(self,other,"DIA_Elena_After_HeroWon_16_02");	//� �� ������ ����.
	};
	AI_Output(self,other,"DIA_Elena_After_HeroWon_16_03");	//� �-�� ������, ��� ����� ���� ���� ������� �������� � ����� �����.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elena_After_HeroWon_03_04");	//�� ������ ���� ����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elena_After_HeroWon_07_04");	//�� ������ ���� ����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elena_After_HeroWon_10_04");	//�� ������ ���� ����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elena_After_HeroWon_14_04");	//�� ������ ���� ����������?
	} else	{							//����
		AI_Output(other,self,"DIA_Elena_After_HeroWon_16_04");	//�� ������ ���� ����������?
	};
	AI_Output(self,other,"DIA_Elena_After_HeroWon_16_05");	//����� ��, ����������.
};
// ===============================================
instance DIA_Elena_After_Won(C_INFO)
{
	npc = CMP_Elena;		nr = 11;
	condition = DIA_Elena_After_Won_cond;
	information = DIA_Elena_After_Won_info;
	description = "��� �� �������� � ��������?";
};
func int DIA_Elena_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Elena_After_Won_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elena_After_Won_03_00");	//��� �� �������� � ��������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elena_After_Won_07_00");	//��� �� �������� � ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elena_After_Won_10_00");	//��� �� �������� � ��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elena_After_Won_14_00");	//��� �� �������� � ��������?
	} else	{							//����
		AI_Output(other,self,"DIA_Elena_After_Won_16_00");	//��� �� �������� � ��������?
	};
	AI_Output(self,other,"DIA_Elena_After_Won_16_01");	//��. � ����� ���� �� ������� � ������� ���� ��������� ����.
	Info_ClearChoices(DIA_Elena_After_Won);
	Info_AddChoice(DIA_Elena_After_Won,"�� �����, ���� ������ �������.",DIA_Elena_After_Won_Tease);
	Info_AddChoice(DIA_Elena_After_Won,"����� ���������� � ����������� �������!",DIA_Elena_After_Won_Cheer);
};
func void DIA_Elena_After_Won_Cheer()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elena_After_Won_Cheer_03_00");	//����� ���������� � ����������� �������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elena_After_Won_Cheer_07_00");	//����� ���������� � ����������� �������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elena_After_Won_Cheer_10_00");	//����� ���������� � ����������� �������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elena_After_Won_Cheer_14_00");	//(�����) ����� ���������� � �������!
	} else	{							//����
		AI_Output(other,self,"DIA_Elena_After_Won_Cheer_16_00");	//����� ���������� � ����������� �������!
	};
	AI_Output(self,other,"DIA_Elena_After_Won_Cheer_16_01");	//�������!
	Info_ClearChoices(DIA_Elena_After_Won);
};
func void DIA_Elena_After_Won_Tease()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elena_After_Won_Tease_03_00");	//�� �����, ���� ������ �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elena_After_Won_Tease_07_00");	//�� �����, ���� ������ �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elena_After_Won_Tease_10_00");	//�� �����, ���� ������ �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elena_After_Won_Tease_14_00");	//�� �����, ���� ������ �������.
	} else	{							//����
		AI_Output(other,self,"DIA_Elena_After_Won_Tease_16_00");	//�� �����, ���� ������ �������.
	};
	AI_Output(self,other,"DIA_Elena_After_Won_Tease_16_01");	//�����, ��� ������.
	Info_ClearChoices(DIA_Elena_After_Won);
};

// ===============================================
instance DIA_Elena_After_Perm(C_INFO)
{
	npc = CMP_Elena;		nr = 12;
	condition = DIA_Elena_After_Perm_cond;
	information = DIA_Elena_After_Perm_info;
	description = "��� ������ ������ ����������?";
	permanent = TRUE;
};
func int DIA_Elena_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond() && (Npc_KnowsInfo(other,DIA_Elena_MR_Hello) || Npc_KnowsInfo(other,DIA_Elena_MR_Hello_Till)))
	{
		return TRUE;
	};
};
func void DIA_Elena_After_Perm_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elena_After_Perm_03_00");	//��� ������ ������ ����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elena_After_Perm_07_00");	//��� ������ ������ ����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elena_After_Perm_10_00");	//��� ������ ������ ����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elena_After_Perm_14_00");	//��� ������ ������ ����������?
	} else	{							//����
		AI_Output(other,self,"DIA_Elena_After_Perm_16_00");	//��� ������ ������ ����������?
	};
	AI_Output(self,other,"DIA_Elena_After_Perm_16_01");	//�� �� ��� ���� �� ��������. �� ����� ������ ����� ������.
};
