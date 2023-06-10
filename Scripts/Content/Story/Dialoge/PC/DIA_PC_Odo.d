

instance DIA_Odo_EXIT(DIA_Proto_End)
{
	npc = CMP_Odo;
};

// ===============================================
instance DIA_Odo_MR_Hello(C_INFO)
{
	npc = CMP_Odo;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Odo_MR_Hello_info;
	description = "�� ���������� � ����� ������ ��� �����������?";
};
func void DIA_Odo_MR_Hello_info()
{
	if (hero.voice == 3)	{			//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_03_00");	//�� ���������� � ����� ������ ��� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_07_00");	//�� ���������� � ����� ������ ��� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_10_00");	//�� ���������� � ����� ������ ��� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_14_00");	//�� ���������� � ����� ������ ��� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_MR_Hello_16_00");	//�� ���������� � ����� ������ ��� �����������?
	};
	AI_Output(self,other,"DIA_Odo_MR_Hello_03_01");	//���� ��������� �� ���� �������� ���� ��� ���������.
	AI_Output(self,other,"DIA_Odo_MR_Hello_03_02");	//������� � ������� � �����.
	AI_Output(self,other,"DIA_Odo_MR_Hello_03_03");	//������, � ���� �������� ��� �������� ������?
	Info_ClearChoices(DIA_Odo_MR_Hello);
	Info_AddChoice(DIA_Odo_MR_Hello,"���.",DIA_Odo_MR_Hello_No);
	If (Npc_HasItems(other,ItPl_Perm_Herb))	{
		Info_AddChoice(DIA_Odo_MR_Hello,"����.",DIA_Odo_MR_Hello_Yes);
	};
};
func void DIA_Odo_MR_Hello_No()
{
	if (hero.voice == 3)	{			//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_No_03_00");	//���.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_No_07_00");	//���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_No_10_00");	//���.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_No_14_00");	//���.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_MR_Hello_No_16_00");	//���.
	};
	Info_ClearChoices(DIA_Odo_MR_Hello);
};
func void DIA_Odo_MR_Hello_Yes()
{
	if (hero.voice == 3)	{			//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_Yes_03_00");	//����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_Yes_07_00");	//����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_Yes_10_00");	//����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_Yes_14_00");	//����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_MR_Hello_Yes_16_00");	//����.
	};
	AI_Output(self,other,"DIA_Odo_MR_Hello_Yes_03_01");	//�����, ������ ��� ���? ��� ������ ������� �� ���� ��� ����� �� � ����.
	Info_ClearChoices(DIA_Odo_MR_Hello);
	Info_AddChoice(DIA_Odo_MR_Hello,"�� �����.",DIA_Odo_MR_Hello_DontGive);
	Info_AddChoice(DIA_Odo_MR_Hello,"500 �������.",DIA_Odo_MR_Hello_Gold);
	Info_AddChoice(DIA_Odo_MR_Hello,"�����.",DIA_Odo_MR_Hello_Free);
};
func void DIA_Odo_MR_Hello_Free()
{
	if (hero.voice == 3)	{			//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_Free_03_00");	//�����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_Free_07_00");	//�����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_Free_10_00");	//�����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_Free_14_00");	//�����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_MR_Hello_Free_16_00");	//�����.
	};
	B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_Odo_MR_Hello_Free_03_01");	//�������� ���� �������! � ��� ����� ���� ��� ��� ������ �����.
	//������ ������������� �� ������ ����
	B_Adanos_Bless4Good();
	Info_ClearChoices(DIA_Odo_MR_Hello);
};
func void DIA_Odo_MR_Hello_Gold()
{
	if (hero.voice == 3)	{			//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_Gold_03_00");	//500 �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_Gold_07_00");	//500 �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_Gold_10_00");	//500 �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_Gold_14_00");	//� ���� 500 �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_MR_Hello_Gold_16_00");	//500 �������.
	};
	if (MR_Counter_Odo >= 500)	{
		AI_Output(self,other,"DIA_Odo_MR_Hello_Gold_03_01");	//�� ������. ��� ����� �� �����.
		B_GiveGold(self,other,500);
		B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	}
	else	{
		AI_Output(self,other,"DIA_Odo_MR_Hello_Gold_03_02");	//� ���� ��� ����� �����.
	};
	Info_ClearChoices(DIA_Odo_MR_Hello);
};
func void DIA_Odo_MR_Hello_DontGive()
{
	if (hero.voice == 3)	{			//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_DontGive_03_00");	//�� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_MR_Hello_DontGive_07_00");	//�� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_DontGive_10_00");	//�� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_MR_Hello_DontGive_14_00");	//�� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_MR_Hello_DontGive_16_00");	//�� �����.
	};
	Info_ClearChoices(DIA_Odo_MR_Hello);
};
// ===============================================
instance DIA_Odo_Novice(C_INFO)
{
	npc = CMP_Odo;		nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Odo_Novice_info;
	description = "�� ���������?";
};
func void DIA_Odo_Novice_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Odo_Novice_03_00");	//�� ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_Novice_07_00");	//�� ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_Novice_10_00");	//�� ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_Novice_14_00");	//�� ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_Novice_16_00");	//�� ���������?
	};
	AI_Output(self,other,"DIA_Odo_Novice_03_01");	//��, ����� ��� �� ��������?
};
// ===============================================
instance DIA_Odo_Monastery(C_INFO)
{
	npc = CMP_Odo;		nr = 3;
	condition = DIA_Odo_Monastery_cond;
	information = DIA_Odo_Monastery_info;
	description = "������ ���� � ���������?";
	permanent = TRUE;
};
func int DIA_Odo_Monastery_cond()
{
	if (Npc_KnowsInfo(other,DIA_Odo_Novice))	{
		return TRUE;
	};
};
func void DIA_Odo_Monastery_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Odo_Monastery_03_00");	//������ ���� � ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_Monastery_07_00");	//������ ���� � ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_Monastery_10_00");	//������ ���� � ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_Monastery_14_00");	//������ ���� � ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_Monastery_16_00");	//������ ���� � ���������?
	};
	AI_Output(self,other,"DIA_Odo_Monastery_03_01");	//��������, �� �� ��� ��������� � ����-�� ��������.
	AI_Output(self,other,"DIA_Odo_Monastery_03_02");	//� ���������� ������, ��� ������� ��� ���.
};
// ===============================================
instance DIA_Odo_PreTrade(C_INFO)
{
	npc = CMP_Odo;		nr = 4;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Odo_PreTrade_info;
	description = "������ ��� ���� �����.";
};
func void DIA_Odo_PreTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Odo_PreTrade_03_00");	//������ ��� ���� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_PreTrade_07_00");	//������ ��� ���� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_PreTrade_10_00");	//������ ��� ���� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_PreTrade_14_00");	//������ ��� ���� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_PreTrade_16_00");	//������ ��� ���� �����.
	};
	AI_Output(self,other,"DIA_Odo_PreTrade_03_01");	//���. �� ���� ���������.
};

// ����� ��������� �������� ===============================
instance DIA_Odo_After_HeroWon(C_INFO)
{
	npc = CMP_Odo;		nr = 10;
	condition = DIA_Odo_After_HeroWon_cond;
	information = DIA_Odo_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Odo_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Odo_After_HeroWon_info()
{
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Odo_After_HeroWon_03_01m");	//(� ���������) �� ������� � ��������, ��������� � ����.
	}
	else	{
		AI_Output(self,other,"DIA_Odo_After_HeroWon_03_01f");	//(� ���������) �� �������� � ��������, ��������� � ����.
	};
	AI_Output(self,other,"DIA_Odo_After_HeroWon_03_02");	//��� ������������.
};
// ===============================================
instance DIA_Odo_After_Won(C_INFO)
{
	npc = CMP_Odo;		nr = 11;
	condition = DIA_Odo_After_Won_cond;
	information = DIA_Odo_After_Won_info;
	description = "��� �� ���������, ������� ������� �������?";
};
func int DIA_Odo_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Odo_After_Won_info()
{
	if (hero.voice == 3)	{			//������
		AI_Output(other,self,"DIA_Odo_After_Won_03_00");	//��� �� ���������, ������� ������� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_After_Won_07_00");	//��� �� ���������, ������� ������� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_After_Won_10_00");	//��� �� ���������, ������� ������� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_After_Won_14_00");	//��� �� ���������, ������� ������� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_After_Won_16_00");	//��� �� ���������, ������� ������� �������?
	};
	AI_Output(self,other,"DIA_Odo_After_Won_10_01");	//(���������) ��, ��� �.
	if (hero.voice == 3)	{			//������
		AI_Output(other,self,"DIA_Odo_After_Won_03_02");	//����� ����������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_After_Won_07_02");	//����� ����������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_After_Won_10_02");	//����� ����������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_After_Won_14_02");	//����� ����������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_After_Won_16_02");	//����� ����������!
	};
	AI_Output(self,other,"DIA_Odo_After_Won_10_03");	//�������.
};

// ===============================================
instance DIA_Odo_After_Perm(C_INFO)
{
	npc = CMP_Odo;		nr = 12;
	condition = DIA_Odo_After_Perm_cond;
	information = DIA_Odo_After_Perm_info;
	description = "��� ������ ������ ������?";
	permanent = TRUE;
};
func int DIA_Odo_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond() && Npc_KnowsInfo(other,DIA_Odo_MR_Hello))
	{
		return TRUE;
	};
};
func void DIA_Odo_After_Perm_info()
{
	if (hero.voice == 3)	{			//������
		AI_Output(other,self,"DIA_Odo_After_Perm_03_00");	//��� ������ ������ ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Odo_After_Perm_07_00");	//��� ������ ������ ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Odo_After_Perm_10_00");	//��� ������ ������ ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Odo_After_Perm_14_00");	//��� ������ ������ ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Odo_After_Perm_16_00");	//��� ������ ������ ������?
	};
	AI_Output(self,other,"DIA_Odo_After_Perm_10_01");	//� ���� �������� ������ �������-��������, �������. ������ � ���� ������� ������������ ����� ��� ��� ������������.
	AI_Output(self,other,"DIA_Odo_After_Perm_10_02");	//� ������ ����� ���� �������� ��� ���� ������.
};
