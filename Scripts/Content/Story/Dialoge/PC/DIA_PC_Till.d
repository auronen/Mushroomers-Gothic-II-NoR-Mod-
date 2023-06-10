

instance DIA_Till_EXIT(DIA_Proto_End)
{
	npc = CMP_Till;
};


// ===============================================
instance DIA_Till_MR_Hello(C_INFO)
{
	npc = CMP_Till;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Till_MR_Hello_info;
	description = "� �� ����� ���������?";
};
func void DIA_Till_MR_Hello_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Till_MR_Hello_03_00");	//� �� ����� ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Till_MR_Hello_07_00");	//� �� ����� ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Till_MR_Hello_10_00");	//� �� ����� ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Till_MR_Hello_16_00");	//� �� ����� ���������?
	};
	AI_Output(self,other,"DIA_Till_MR_Hello_14_01");	//��. �� ��, ����� � ����� �����, �� ���� �������.
	if (!C_HeroIs_Elena())	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Till_MR_Hello_03_02");	//� ��� ���� ����?
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Till_MR_Hello_07_02");	//� ��� ���� ����?
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Till_MR_Hello_10_02");	//� ��� ���� ����?
		} else	{							//����
			AI_Output(other,self,"DIA_Till_MR_Hello_16_02");	//� ��� ���� ����?
		};
		AI_Output(self,other,"DIA_Till_MR_Hello_14_03");	//�����. �� ������� ����� �� ����� ������� ���� �� �������.
	};
};
// ===============================================
instance DIA_Till_Advice(C_INFO)
{
	npc = CMP_Till;		nr = 2;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Till_Advice_info;
	description = "������ ���-������ � ������?";
	permanent = TRUE;
};
func void DIA_Till_Advice_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Till_Advice_03_00");	//������ ���-������ � ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Till_Advice_07_00");	//������ ���-������ � ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Till_Advice_10_00");	//������ ���-������ � ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Till_Advice_16_00");	//������ ���-������ � ������?
	};
	AI_Output(self,other,"DIA_Till_Advice_14_01");	//��� �� ����� �� ����� � ���, ���� �� ������ ���������.
};
// ===============================================
instance DIA_Till_PreTrade(C_INFO)
{
	npc = CMP_Till;		nr = 3;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Till_PreTrade_info;
	description = "������ ��� ���� �����!";
};
func void DIA_Till_PreTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Till_PreTrade_03_00");	//������ ��� ���� �����!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Till_PreTrade_07_00");	//������ ��� ���� �����!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Till_PreTrade_10_00");	//������ ��� ���� �����!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Till_PreTrade_16_00");	//������ ��� ���� �����!
	};
	AI_Output(self,other,"DIA_Till_PreTrade_14_01");	//���! ���� ��� ������ �������, ���� � �� ������ ����.
};

// ����� ��������� �������� ===============================
instance DIA_Till_After_HeroWon(C_INFO)
{
	npc = CMP_Till;		nr = 10;
	condition = DIA_Till_After_HeroWon_cond;
	information = DIA_Till_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Till_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Till_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Till_After_HeroWon_14_01");	//(�����) ���������� � �������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Till_After_HeroWon_03_00");	//�� �� �� �������������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Till_After_HeroWon_07_00");	//�� �� �� �������������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Till_After_HeroWon_10_00");	//�� �� �� �������������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Till_After_HeroWon_16_00");	//�� �� �� �������������.
	};
	AI_Output(self,other,"DIA_Till_After_HeroWon_14_02");	//����� ���� ��������!
};
// ===============================================
instance DIA_Till_After_Won(C_INFO)
{
	npc = CMP_Till;		nr = 11;
	condition = DIA_Till_After_Won_cond;
	information = DIA_Till_After_Won_info;
	important = TRUE;
};
func int DIA_Till_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Till_After_Won_info()
{
	AI_Output(self,other,"DIA_Till_After_Won_14_01");	//������? � ������� �������! � ������ ������� ��������!
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Till_After_Won_03_02");	//� ��� ��� - ���� ������ ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Till_After_Won_07_02");	//� ��� ��� - ���� ������ ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Till_After_Won_10_02");	//� ��� ��� - ���� ������ ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Till_After_Won_16_02");	//� ��� ��� - ���� ������ ���������?
	};
	AI_Output(self,other,"DIA_Till_After_Won_14_03");	//��, ���... ��� ������, ������ �� ����� ���������.
};

// ===============================================
instance DIA_Till_After_Perm(C_INFO)
{
	npc = CMP_Till;		nr = 12;
	condition = DIA_Till_After_Perm_cond;
	information = DIA_Till_After_Perm_info;
	description = "��� �� ������ ������ ������?";
	permanent = TRUE;
};
func int DIA_Till_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond() && Npc_KnowsInfo(other,DIA_Till_MR_Hello))
	{
		return TRUE;
	};
};
func void DIA_Till_After_Perm_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Till_After_Perm_03_00");	//��� �� ������ ������ ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Till_After_Perm_07_00");	//��� �� ������ ������ ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Till_After_Perm_10_00");	//��� �� ������ ������ ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Till_After_Perm_16_00");	//��� �� ������ ������ ������?
	};
	if (!C_HeroIs_Elena())	{
		AI_Output(self,other,"DIA_Till_After_Perm_14_01");	//� ���� ����� ����?
	}
	else	{
		AI_Output(self,other,"DIA_Till_After_Perm_14_02");	//���� ����� �������� �������� �� �����. �� �����-������ � ���� ��� ��� �����������!
	};
};
