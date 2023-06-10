
instance DIA_Mortis_EXIT(DIA_Proto_End)
{
	npc = Mil_314_Mortis;
};

//==============================================
instance DIA_Mortis_Start(C_INFO)
{
	nr = 1;
	npc = Mil_314_Mortis;
	condition = DIA_NoCond_cond;
	information = DIA_Mortis_Start_info;
	description = "�� ������?";
};
func void DIA_Mortis_Start_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Mortis_Start_03_00");	//�� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Mortis_Start_07_00");	//�� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Mortis_Start_10_00");	//�� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Mortis_Start_14_00");	//�� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Mortis_Start_16_00");	//�� ������?
	};
	AI_Output(self,other,"DIA_Mortis_Start_12_01");	//(�����������) � �� ��� �� �����?
	AI_Output(self,other,"DIA_Mortis_Start_12_02");	//� ����������� ������� ���� ���������� � ������.
	AI_Output(self,other,"DIA_Mortis_Start_12_03");	//���� ���� ����� ������, �������� � ��������� � ������, ��� ����� � ������. � � �����.
	AI_StopProcessInfos(self);
};

//==============================================
instance DIA_Mortis_Training(C_INFO)
{
	nr = 2;
	npc = Mil_314_Mortis;
	condition = DIA_NoCond_cond;
	information = DIA_Mortis_Training_info;
	description = "�� �� ��� �� ���� �������������?";
};
func int DIA_Mortis_Training_cond()
{
	return TRUE;
};
func void DIA_Mortis_Training_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Mortis_Training_03_00");	//�� �� ��� �� ���� �������������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Mortis_Training_07_00");	//�� �� ��� �� ���� �������������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Mortis_Training_10_00");	//�� �� ��� �� ���� �������������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Mortis_Training_14_00");	//�� �� ��� �� ���� �������������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Mortis_Training_16_00");	//�� �� ��� �� ���� �������������?
	};
	AI_Output(self,other,"DIA_Mortis_Training_12_01");	//���, ���� �� �� �������� � ��������� ������.
	AI_Output(self,other,"DIA_Mortis_Training_12_02");	//� �� ����������� � ��� �� ��������.
	AI_StopProcessInfos(self);
};
//==============================================
instance DIA_Mortis_Perm(C_INFO)
{
	nr = 3;
	npc = Mil_314_Mortis;
	condition = DIA_Mortis_MR_Perm_cond;
	information = DIA_Mortis_MR_Perm_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Mortis_MR_Perm_cond()
{
	if (Npc_KnowsInfo(other,DIA_Mortis_Training) && Npc_KnowsInfo(other,DIA_Mortis_Start) && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Mortis_MR_Perm_info()
{
	AI_Output(self,other,"DIA_Mortis_MR_Perm_13_00");	//����� ����-������ �������, ���� �� ������� ��������� ������ ���������.
	if (Wld_IsTime(7,0,21,0))	{
		AI_Output(self,other,"DIA_Mortis_MR_Perm_13_01");	//� � �����.
	}
	else	{
		AI_Output(self,other,"DIA_Mortis_MR_Perm_13_02");	//� � �����.
	};
	AI_StopProcessInfos(self);
};


