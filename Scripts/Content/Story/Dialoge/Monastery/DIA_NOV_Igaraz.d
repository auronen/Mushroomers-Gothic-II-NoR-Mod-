

instance DIA_Igaraz_EXIT(DIA_Proto_End)
{
	npc = NOV_601_Igaraz;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Igaraz_NoTalk_Odo(C_Info)
{
	npc = NOV_601_Igaraz;			nr = 1;
	condition = DIA_Igaraz_NoTalk_Odo_Cond;
	information = DIA_Igaraz_NoTalk_Odo_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Igaraz_NoTalk_Odo_Cond()
{
	if (C_HeroIs_Odo() && DIA_WhenAsked_cond() && (Wld_IsTime(8,30,22,7)))	{
		return TRUE;
	};
};
func void DIA_Igaraz_NoTalk_Odo_Info()
{
	AI_Output(self,other,"DIA_Igaraz_NoTalk_Odo_13_00");	//������, �� � ������ ������� ����� ��� ����������.
	AI_StopProcessInfos(self);
};

//===================================================
var int DIA_Igaraz_MR_Perm_Odo_Once;
instance DIA_Igaraz_MR_Perm_Odo(C_Info)
{
	npc = NOV_601_Igaraz;			nr = 2;
	condition = DIA_Igaraz_MR_Perm_Odo_Cond;
	information = DIA_Igaraz_MR_Perm_Odo_Info;
	permanent = TRUE;
	description = "������ �� ������ ��� �����?";
};
func int DIA_Igaraz_MR_Perm_Odo_Cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Igaraz_MR_Perm_Odo_Info()
{
	DIA_Igaraz_MR_Perm_Odo_Once = TRUE;
		AI_Output(other,self,"DIA_Igaraz_MR_Perm_Odo_03_00");	//������ �� ������ ��� �����?
	AI_Output(self,other,"DIA_Igaraz_MR_Perm_Odo_13_01");	//� �������� ������� ������������ ������������� ����.
	AI_Output(self,other,"DIA_Igaraz_MR_Perm_Odo_13_02");	//���� ��� �� ������� ����� �����, ������ ���� ���������! (�������)
	AI_Output(self,other,"DIA_Igaraz_MR_Perm_Odo_13_03");	//����. � ������, ��� ������� ����� ������� ����. ��� ����� � � ������� ��� ������. 
};

//===================================================
instance DIA_Igaraz_Odo_Wine(C_Info)
{
	npc = NOV_601_Igaraz;			nr = 3;
	condition = DIA_Igaraz_Odo_Wine_Cond;
	information = DIA_Igaraz_Odo_Wine_Info;
	description = "��� �� ������ ��� ��� ���� ����?";
	permanent = TRUE;
};
func int DIA_Igaraz_Odo_Wine_Cond()
{
	if (C_HeroIs_Odo() && MIS_Odo_Wine_SecretAsk && DIA_Igaraz_MR_Perm_Odo_Once && !MIS_Odo_Wine_SecretGot)	{
		return TRUE;
	};
};
func void DIA_Igaraz_Odo_Wine_Info()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_03_00");	//��� �� ������ ��� ��� ���� ����?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_13_01");	//(� ���������) ��, � �������� � ������� ������� �����, ��� �������� ����.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_13_02");	//��������, ��� ���� ������� ���������, ����� � ����� �����...
	Info_ClearChoices(DIA_Igaraz_Odo_Wine);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"�������� ��� ������ ����, ��� � ���� ��������!",DIA_Igaraz_Odo_Wine_Fight);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"�������, ���� ���� ������ �� �������.",DIA_Igaraz_Odo_Wine_Best);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"� ��� �� ����������� ������ ������ ����?",DIA_Igaraz_Odo_Wine_AskSecret);
};
func void DIA_Igaraz_Odo_Wine_Best()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Best_03_00");	//�������, ���� ���� ������ �� �������, � ����� � �� ���� �������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Best_13_01");	//��, ������������ ���� �������� �������� ����� ��� ��, ��� � ��� �������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Best_13_02");	//� ���� ������ ����� � ������, ��������� ����.
	Info_ClearChoices(DIA_Igaraz_Odo_Wine);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"�������� ��� ������ ����, ��� � ���� ��������!",DIA_Igaraz_Odo_Wine_Fight);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"����� �� ���� ����� � ���� ����?",DIA_Igaraz_Odo_Wine_Much);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"��� �������� ���� ����?",DIA_Igaraz_Odo_Wine_Customers);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"������, ���� ���� ������� �� ������� ����� ���������?",DIA_Igaraz_Odo_Wine_Grape);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"� ��� �� ����������� ������ ������ ����?",DIA_Igaraz_Odo_Wine_AskSecret);
};
func void DIA_Igaraz_Odo_Wine_Much()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Much_03_00");	//����� �� ���� ����� � ���� ����?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Much_13_01");	//����� ������, � ��� ����� �������� ���������. ��� ���� �� ������� �����, ���������� �������� �����.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Much_13_02");	//� ��� �� ���-�� ������, ����� ����� ��������� ���� ������.
	Info_ClearChoices(DIA_Igaraz_Odo_Wine);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"�������� ��� ������ ����, ��� � ���� ��������!",DIA_Igaraz_Odo_Wine_Fight);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"� ��� ������ �������?",DIA_Igaraz_Odo_Wine_Bottles);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"������, ������� ����� - ��� ��� �� �����?",DIA_Igaraz_Odo_Wine_Barrels);
	Info_AddChoice(DIA_Igaraz_Odo_Wine,"� ��� �� ����������� ������ ������ ����?",DIA_Igaraz_Odo_Wine_AskSecret);
};
func void DIA_Igaraz_Odo_Wine_Barrels()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Barrels_03_00");	//������, ������� ����� - ��� ��� �� �����, ��� � ������� ��������?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_01");	//�������! ���� ����� �� �����������, ��� ����, ��� �������� ���� ���������� �������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_02");	//��� ������ ����. ��� �������� ����� ������� ����. ��� ������� ������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_03");	//������� ����� ��������� � ������ � �����. � ����� �������� ����, ������ ���� ������, ����� ����������� ��������� �����.
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Barrels_03_04");	//�����?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_05");	//��, ������� � ����� ������, ���������� � ����. ���� �� ����� ����� �� ��������, �� ����� � ����� ��������� ���� ����, ����� � ����.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_06");	//���� ������ ��������� ������ � ����� ���������. ����� ��� ����� ��� �������... (������)
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Barrels_13_07");	//� �� ������ ��� �������� ���� �����! �� ���� ������ ��������. ���� ������ ������...
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Barrels_03_08");	//� ��� ������ �� �����, ������.
	AI_StopProcessInfos(self);
	MIS_Odo_Wine_SecretGot = TRUE;
	B_LogEntry(TOPIC_Odo_Wine,TOPIC_Odo_Wine_Igaraz);
	B_GivePlayerXP(XP_Odo_Herbs_WineSecret);
};
func void DIA_Igaraz_Odo_Wine_Bottles()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Bottles_03_00");	//� ��� ������ �������?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Bottles_13_01");	//�� ���������� ������������ ������. ������ ������� ��������� �����������, ����������� ����� ����� ������� � ����������� ���������� �������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Bottles_13_02");	//������ ���������� ��������, �� ������� ������ ������ ����� ������ ������ ���������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Bottles_13_03");	//���, ������� ���.
	B_GiveInvItems(self,other,ItFo_Wine,1);
	Info_ClearChoices(DIA_Igaraz_Odo_Wine);
};
func void DIA_Igaraz_Odo_Wine_Grape()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Grape_03_00");	//������, ���� ���� ������� �� ������-�� ������� ����� ���������?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_01");	//������-��, �� ���������� ��������� ������ ������. �������, ����� �������� ��� ������ � ������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_02");	//����� ����� ��������� ���������, ������� ��� ������ � ��������. �� �� � ���� ������ �� ����.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_03");	//����� �� ����������� ����� �������� ������. ��������� �������� ������� � ��������, �� � ������, ��� ��� ������� ������ ������ ������� �����.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_04");	//������� - �� ���������� ��, ����� ��� ����� ������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_05");	//������, ��� �������� ������ ��� ������ ������������, �� ���� �� �� ������ ���� - �� ���������, �����, ���� ��� ������ ������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_06");	//���, ������, �� ������ ��� ������� - �� �������� ����� �������, ��� �������. � �����...
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Grape_13_07");	//���, �������, � ��������. ��� � ��� �� ��������?
	Info_ClearChoices(DIA_Igaraz_Odo_Wine);
};
func void DIA_Igaraz_Odo_Wine_Customers()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Customers_03_00");	//��� �������� ���� ����?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Customers_13_01");	//�� ��� ������� �� �������. � �� �� �� ������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Customers_13_02");	//��� �� ���������� ����� �����������, �� ������� � ���� �� ������.
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Customers_13_03");	//�������, ��������� ��������� �� �����������. ����� �������, ��� � ��� ���� ������.
	AI_StopProcessInfos(self);
};
func void DIA_Igaraz_Odo_Wine_AskSecret()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_AskSecret_03_00");	//� ��� �� ����������� ������ ������ ����?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_AskSecret_13_01");	//��� � ���� � ���������. �� �� �� � ������, ����� ��� ����� �� ����.
	AI_StopProcessInfos(self);
};
func void DIA_Igaraz_Odo_Wine_Fight()
{
		AI_Output(other,self,"DIA_Igaraz_Odo_Wine_Fight_03_00");	//�������� ��� ������ ����, ��� � ���� ��������!
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Fight_13_01");	//���? �� ���� �������, ��� ������?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Fight_13_02");	//���� ���� �� ���� �������, � ���� ������ �� ��������. ���� ��� ����� ������ ������ �� �����. ���� ��� ����?
	AI_Output(self,other,"DIA_Igaraz_Odo_Wine_Fight_13_03");	//����� ������ �������, ��� �� ��� ������.
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Igaraz_Odo_StopTalk(C_Info)
{
	npc = NOV_601_Igaraz;			nr = 4;
	condition = DIA_Igaraz_Odo_StopTalk_Cond;
	information = DIA_Igaraz_Odo_StopTalk_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Igaraz_Odo_StopTalk_Cond()
{
	if (C_HeroIs_Odo() && DIA_WhenAsked_cond() && Wld_IsTime(22,7,8,30) && MIS_Odo_Wine_SecretGot)	{
		return TRUE;
	};
};
func void DIA_Igaraz_Odo_StopTalk_Info()
{
	if (Hlp_Random(100) < 50)	{
		AI_Output(self,other,"DIA_Igaraz_Odo_StopTalk_13_01");	//������, � � ����� ��� ����������.
	}
	else	{
		AI_Output(self,other,"DIA_Igaraz_Odo_StopTalk_13_02");	//� ������ ��� ���������.
	};
	AI_StopProcessInfos(self);
};

