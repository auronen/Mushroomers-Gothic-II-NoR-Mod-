
instance DIA_Akil_EXIT(DIA_Proto_End)
{
	npc = BAU_940_Akil;
};

// ��� ==================================================================
instance DIA_Akil_Odo_Straw(C_INFO)
{
	npc = BAU_940_Akil;		nr = 20;
	condition = DIA_Akil_Odo_Straw_cond;
	information = DIA_Akil_Odo_Straw_info;
	description = "�� �������� ����?";
};
func int DIA_Akil_Odo_Straw_cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Akil_Odo_Straw_info()
{
		AI_Output(other,self,"DIA_Akil_Odo_Straw_03_00");	//�� �������� ����?
	AI_Output(self,other,"DIA_Akil_Odo_Straw_13_01");	//��. ����� �� 14 �������. �� � ���� ������� �� �������!
	B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Akil_Price);
	MIS_Odo_Straw_Akil[Straw_Price] = 1;
};

// ����� ==================================================================
instance DIA_Akil_MR_Perm(C_INFO)
{
	npc = BAU_940_Akil;		nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Akil_MR_Perm_info;
	description = "��� ���� �� ����� �����?";
	permanent = TRUE;
};
func void DIA_Akil_MR_Perm_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Akil_MR_Perm_03_00");	//��� ���� �� ����� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Akil_MR_Perm_07_00");	//��� ���� �� ����� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Akil_MR_Perm_10_00");	//��� ���� �� ����� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Akil_MR_Perm_14_00");	//��� ���� �� ����� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Akil_MR_Perm_16_00");	//��� ���� �� ����� �����?
	};
	AI_Output(self,other,"DIA_Akil_MR_Perm_13_01");	//������ ������� � ��������� ����� ����.
	AI_Output(self,other,"DIA_Akil_MR_Perm_13_02");	//�� � ��������� ��� � �������.
};

