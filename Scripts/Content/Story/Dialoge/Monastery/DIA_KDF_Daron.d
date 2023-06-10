
instance DIA_Daron_EXIT(DIA_Proto_End)
{
	npc = KDF_511_Daron;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////
instance DIA_Daron_Start_Odo(C_INFO)
{
	nr = 1;
	npc = KDF_511_Daron;
	condition = DIA_Daron_Start_Odo_cond;
	information = DIA_Daron_Start_Odo_info;
	description = "���� � ������, ������ �� �����, ������?";
};
func int DIA_Daron_Start_Odo_cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Daron_Start_Odo_info()
{
		AI_Output(other,self,"DIA_Daron_Start_Odo_03_00");	//���� � ������, ������ �� �����, ������?
	AI_Output(self,other,"DIA_Daron_Start_Odo_10_01");	//� ���� ����� ������ ����� � ������� �������������.
	AI_Output(self,other,"DIA_Daron_Start_Odo_10_02");	//��-�� ����� ������������ � ����� ��������� � ������ ���������.
};
//---------------------------------
instance DIA_Daron_MR_Perm_Odo(C_INFO)
{
	nr = 2;
	npc = KDF_511_Daron;
	condition = DIA_Daron_MR_Perm_Odo_cond;
	information = DIA_Daron_MR_Perm_Odo_info;
	description = "� ���� ������ ���?";
	permanent = TRUE;
};
func int DIA_Daron_MR_Perm_Odo_cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Daron_MR_Perm_Odo_info()
{
		AI_Output(other,self,"DIA_Daron_MR_Perm_Odo_03_00");	//� ���� ������ ���?
	AI_Output(self,other,"DIA_Daron_MR_Perm_Odo_10_01");	//���, ���������. ��������� ������ �������������.
};

// ==============================================
instance DIA_Daron_Donate(C_INFO)
{
	nr = 3;
	npc = KDF_511_Daron;
	condition = DIA_Daron_Donate_cond;
	information = DIA_Daron_Donate_info;
	description = "� ���� ����������m�...";
	permanent = TRUE;
};
func int DIA_Daron_Donate_cond()
{
	return TRUE;
};
func void DIA_Daron_Donate_info()
{
	if (hero.voice == 3)	{		//������/���
		AI_Output(other,self,"DIA_Daron_Donate_03_00");	//� ���� ����������m�...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Daron_Donate_07_00");	//� ���� ����������m�...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Daron_Donate_10_00");	//� ���� ����������m�...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Daron_Donate_14_00");	//� ���� ����������m�...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Daron_Donate_16_00");	//� ���� ����������m�...
	};
	Info_ClearChoices(DIA_Daron_Donate);
	Info_AddChoice(DIA_Daron_Donate,"...����� � ���� ����� ������.",DIA_Daron_Donate0);
	if (C_NpcHasGold(other,10))	{
		Info_AddChoice(DIA_Daron_Donate,"...10 �������.",DIA_Daron_Donate10);
	};
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Daron_Donate,"...50 �������.",DIA_Daron_Donate50);
	};
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Daron_Donate,"...100 �������.",DIA_Daron_Donate100);
	};
};
func void DIA_Daron_Donate0()
{
	if (hero.voice == 3)	{		//������/���
		AI_Output(other,self,"DIA_Daron_Donate0_03_00");	//...����� � ���� ����� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Daron_Donate0_07_00");	//...����� � ���� ����� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Daron_Donate0_10_00");	//...����� � ���� ����� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Daron_Donate0_14_00");	//...����� � ���� ����� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Daron_Donate0_16_00");	//...����� � ���� ����� ������.
	};
	AI_Output(self,other,"DIA_Daron_Donate0_10_01");	//����������� � ����� - ����� ������ �����.
	Info_ClearChoices(DIA_Daron_Donate);
};

func void DIA_Daron_Donate10()
{
	PrayCounter_Innos += 1;
	Info_ClearChoices(DIA_Daron_Donate);
	B_GiveInvItems(other,self,ItMi_Gold,10);
	if (hero.voice == 3)	{		//������/���
		AI_Output(other,self,"DIA_Daron_Donate10_03_00");	//...10 �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Daron_Donate10_07_00");	//...10 �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Daron_Donate10_10_00");	//...10 �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Daron_Donate10_14_00");	//...10 �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Daron_Donate10_16_00");	//...10 �������.
	};
	AI_Output(self,other,"DIA_Daron_Donate10_10_01");	//���� �������� ������������� ���������� ���� � ������.
	PC_PrayInnos_PatronGod(1);
};

func void DIA_Daron_Donate50()
{
	PrayCounter_Innos += 1;
	Info_ClearChoices(DIA_Daron_Donate);
	B_GiveInvItems(other,self,ItMi_Gold,50);
	if (hero.voice == 3)	{		//������/���
		AI_Output(other,self,"DIA_Daron_Donate50_03_00");	//...50 �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Daron_Donate50_07_00");	//...50 �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Daron_Donate50_10_00");	//...50 �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Daron_Donate50_14_00");	//...50 �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Daron_Donate50_16_00");	//...50 �������.
	};
	AI_Output(self,other,"DIA_Daron_Donate50_10_01");	//���� ������������� �������� � ���� ��������.
	PC_PrayInnos_PatronGod(2);
};

func void DIA_Daron_Donate100()
{
	PrayCounter_Innos += 1;
	Info_ClearChoices(DIA_Daron_Donate);
	B_GiveInvItems(other,self,ItMi_Gold,100);
	if (hero.voice == 3)	{		//������/���
		AI_Output(other,self,"DIA_Daron_Donate100_03_00");	//...100 �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Daron_Donate100_07_00");	//...100 �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Daron_Donate100_10_00");	//...100 �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Daron_Donate100_14_00");	//...100 �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Daron_Donate100_16_00");	//...100 �������.
	};
	AI_Output(self,other,"DIA_Daron_Donate100_10_01");	//� ��������������� ������ ������ �� ������ ����!
	PC_PrayInnos_PatronGod(3);
};

