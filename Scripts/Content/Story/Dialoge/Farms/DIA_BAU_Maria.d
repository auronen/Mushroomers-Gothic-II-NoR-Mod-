

instance DIA_Maria_EXIT(DIA_Proto_End)
{
	npc = BAU_910_Maria;
};

/////////////////////////////////////// ����� /////////////////////////////////////////////

//===================================================
instance DIA_Maria_Elena_Start(C_Info)
{
	npc = BAU_910_Maria;				nr = 0;
	condition = DIA_Maria_Elena_Start_Cond;
	information = DIA_Maria_Elena_Start_Info;
	important = TRUE;
};
func int DIA_Maria_Elena_Start_Cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Maria_Elena_Start_Info()
{
	AI_Output(self,other,"DIA_Maria_Elena_Start_17_00");	//�����, �� ����� ����������� �����?
	AI_Output(self,other,"DIA_Maria_Elena_Start_17_01");	//����� ���� ����, � �� �� ����� �������. ��������� ���� ����!
};
//===================================================
instance DIA_Maria_Elena_Perm(C_Info)
{
	npc = BAU_910_Maria;				nr = 1;
	condition = DIA_Maria_Elena_Perm_Cond;
	information = DIA_Maria_Elena_Perm_Info;
	description = "� �� ���� �� ��� ����� ����?";
	permanent = TRUE;
};
func int DIA_Maria_Elena_Perm_Cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Maria_Elena_Perm_Info()
{
	AI_Output(other,self,"DIA_Maria_Elena_Perm_16_00");	//� �� ���� �� ��� ����� ����?
	if (Hlp_Random(100) < 50)	{
		AI_Output(self,other,"DIA_Maria_Elena_Perm_17_01");	//�� � ��� � ����� ������, ��� � �����!
		AI_Output(self,other,"DIA_Maria_Elena_Perm_17_02");	//��������� ���� �����-������ ��������-�����, �������� ����� ������������� �������.
	}
	else	{
		AI_Output(self,other,"DIA_Maria_Elena_Perm_17_03");	//�� ��� ���� �� �����, ���� ����������.
			AI_Output(other,self,"DIA_Maria_Elena_Perm_16_04");	//�� ������ �����?
		AI_Output(self,other,"DIA_Maria_Elena_Perm_17_05");	//�� ��� �� ����� � �����. ������ ������� �������. � ���� �� ������, ���� � � ����������...
	};
};


/////////////////////////////////////// ���� /////////////////////////////////////////////

//===================================================
instance DIA_Maria_Till_Hello(C_Info)
{
	npc = BAU_910_Maria;				nr = 11;
	condition = DIA_Maria_Till_MR_Hello_Cond;
	information = DIA_Maria_Till_MR_Hello_Info;
	description = "������������, ������� �����!";
};
func int DIA_Maria_Till_MR_Hello_Cond()
{
	if (C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Maria_Till_MR_Hello_Info()
{
	AI_Output(other,self,"DIA_Maria_Till_MR_Hello_14_00");	//������������, ������� �����!
		AI_Output(self,other,"DIA_Maria_Till_MR_Hello_17_01");	//����������,.. ����! ��� �� �����-��! �� ����� ���� ������.
};

//===================================================
instance DIA_Maria_Till_Perm(C_Info)
{
	npc = BAU_910_Maria;				nr = 12;
	condition = DIA_Maria_Till_Perm_Cond;
	information = DIA_Maria_Till_Perm_Info;
	description = "��� ���� ��������?";
	permanent = TRUE;
};
func int DIA_Maria_Till_Perm_Cond()
{
	if (C_HeroIs_Till() && Npc_KnowsInfo(other,DIA_Maria_Till_Hello))	{
		return TRUE;
	};
};
func void DIA_Maria_Till_Perm_Info()
{
	AI_Output(other,self,"DIA_Maria_Till_Perm_14_00");	//��� ���� ��������?
		AI_Output(self,other,"DIA_Maria_Till_Perm_17_01");	//�� �������, �������.
};

/////////////////////////////////////// ��������� /////////////////////////////////////////////

//===================================================
instance DIA_Maria_MR_Perm(C_Info)
{
	npc = BAU_910_Maria;				nr = 20;
	condition = DIA_Maria_MR_Perm_Cond;
	information = DIA_Maria_MR_Perm_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Maria_MR_Perm_Cond()
{
	if (!C_HeroIs_Elena() && !C_HeroIs_Till() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Maria_MR_Perm_Info()
{
	AI_Output(self,other,"DIA_Maria_MR_Perm_17_00");	//� ���� �����-�� ����? ����� �������� � ���� �����.
	AI_StopProcessInfos(self);
};
