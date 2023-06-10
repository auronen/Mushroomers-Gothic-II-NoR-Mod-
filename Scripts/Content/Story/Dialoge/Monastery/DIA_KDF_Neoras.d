
instance DIA_Neoras_EXIT(DIA_Proto_End)
{
	npc = KDF_506_Neoras;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Neoras_Start_Odo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 1;
	condition = DIA_Neoras_Start_Odo_Cond;
	information = DIA_Neoras_Start_Odo_Info;
	description = "����������� ���, ������!";
};
func int DIA_Neoras_Start_Odo_Cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Neoras_Start_Odo_Info()
{
		AI_Output(other,self,"DIA_Neoras_Start_Odo_03_00");	//����������� ���, ������!
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_01");	//����������, ���������. � ���� �� ��� �����-�� ����? ���� ���, �� �������� ����.
		AI_Output(other,self,"DIA_Neoras_Start_Odo_03_02");	//������, � ������, ��� ����� ����������� ��� �����. ���� �����, � ��� �� ����� �� ����?
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_03");	//���... �� ����, ��� ����� ���-���. 
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_04");	//������� ������, ��� �� ����������, ����� ������� ��������, � � ������������ ����� ������ �� �� ��� �� �������. 
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_05");	//� ���� �� ��� ��������� ������ ������� �����... ��� ����� ���� �� ��������� ��������. �� � ������ ����� �� �������� ��. �������, � �������.
		AI_Output(other,self,"DIA_Neoras_Start_Odo_03_06");	//������, ��������� ��� ����������� �� ������ ���� ��������.
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_07");	//����� ������� ������ �� ���-�� ������, ��� ����� ������.
		AI_Output(other,self,"DIA_Neoras_Start_Odo_03_08");	//� �����, ��� ���������, ������. ������ ���������...
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_09");	//���� �� ��� ������� ������ - �������, � �� �������� ����.
		AI_Output(other,self,"DIA_Neoras_Start_Odo_03_10");	//�� ��� ����� ����������, ����� �������� ���������.
	AI_Output(self,other,"DIA_Neoras_Start_Odo_01_11");	//��� ���? ��� �, ����� ������� �������, ��� � �������� ���� ����� ��� ������� �������� ����. ������� ���, ��� �������. � ������ ������, �� ����� ���.
	B_LogEntry_Create(TOPIC_Odo_Herbs,LOG_MISSION,TOPIC_Odo_Herbs_Start);
	B_LogEntry(TOPIC_Odo_Herbs,TOPIC_Odo_Herbs_NoPerm);
	MIS_Odo_Herbs = LOG_Running;
};


//����� ===================================================
instance DIA_Neoras_Herbs_Odo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 10;
	condition = DIA_Neoras_Herbs_Odo_Cond;
	information = DIA_Neoras_Herbs_Odo_Info;
	description = "(������ �����)";
	permanent = TRUE;
};
func int DIA_Neoras_Herbs_Odo_Cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Herbs > 0))	{
		return TRUE;
	};
};
//����� ---------------------------------------
func void DIA_Neoras_Herbs_Odo_Back()
{
	Info_ClearChoices(DIA_Neoras_Herbs_Odo);
	MIS_Odo_Herbs_Give_Plant = 0;
	MIS_Odo_Herbs_Give_Cnt = 0;
	MIS_Odo_Herbs_Give_Price = 0;
};
func void DIA_Neoras_Herbs_Odo_BackMenu()
{
	AI_Output(other,self,"DIA_Neoras_Herbs_Odo_Back_03_00");	//� ������� ��� �����.
	DIA_Neoras_Herbs_Odo_Back();
};
//����� ---------------------------------------
func void DIA_Neoras_Herbs_Odo_Bonus()
{
	//����� ������� 100 ����� �� ��������, � ��� ����� 3 ������� ������
	if ((MIS_Odo_Herbs_AllCnt < 100) || (MIS_Odo_Herbs_PermCnt < 3)
		|| (MIS_Odo_Herbs_Bonus == TRUE))	{
		return;
	};
	//����� �����������
	MIS_Odo_Herbs_Bonus = TRUE;
	TEACH_Neoras = TRUE;
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_00");	//�� ������ ����� ���, ��������� ���.
	//�������� �� ������ �� ��������?
	if ((MIS_Odo_Herbs_Pay == 0) && (MIS_Odo_Herbs_PermCnt > 0))	{
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_01");	//� �� ������ �� �������� ������.
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_02");	//� ���� ��������� ����. ������ ��� �����.
		//B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
		//B_GiveInvItems(self,other,ItPo_Health_02,2);
		//B_GiveInvItems(self,other,ItPo_Health_03,1);
		//B_GiveInvItems(self,other,ItPo_Mana_02,3);
		ItemTrans_items[0] = ItPo_Perm_Mana;
		ItemTrans_amount[0] = 1;
		ItemTrans_items[1] = ItPo_Health_02;
		ItemTrans_amount[1] = 2;
		ItemTrans_items[2] = ItPo_Health_03;
		ItemTrans_amount[2] = 1;
		ItemTrans_items[3] = ItPo_Mana_02;
		ItemTrans_amount[3] = 3;
		B_ItemsTransaction(self,other);
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_03");	//� � ����� ������� � ���� ������ ���� ������� ������ �� ����������� ��������.
		MIS_Odo_Herbs_Pay = 5;
		B_LogEntry(TOPIC_Odo_Herbs,TOPIC_Odo_Herbs_Payment);
	}
	else	{
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_04");	//���� �� � ������� ������� �� ���� ������, � ��� ���� ��� ���� �����.
		//B_GiveInvItems(self,other,ItPo_Health_02,2);
		//B_GiveInvItems(self,other,ItPo_Mana_02,1);
		ItemTrans_items[0] = ItPo_Health_02;
		ItemTrans_amount[0] = 2;
		ItemTrans_items[1] = ItPo_Mana_02;
		ItemTrans_amount[1] = 1;
		B_ItemsTransaction(self,other);
	};
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_05");	//� ���� ���� � ����������� � ������ ������ �������. �������, ����� ������ ����� � ������� �����.
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_06");	//� �� ��������� ���������� ����� �������� ��������� ��� ����� ��������.
	AI_Output(other,self,"DIA_Neoras_Herbs_Odo_03_07");	//��������� ���, ������.
		AI_Output(self,other,"DIA_Neoras_Herbs_Odo_01_08");	//�� ��. ����� � ������� �������, � ���� ��� ���� ���� ������.
	MIS_Odo_Herbs = LOG_SUCCESS;
	B_LogEntry_Status(TOPIC_Odo_Herbs,LOG_SUCCESS,TOPIC_Odo_Herbs_Success);
	B_GivePlayerXP(XP_Odo_Herbs_Success);
	B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Neoras);
};
//1. ����?---------------------------------------
func void DIA_Neoras_Herbs_Odo_Menu()
{
	Info_ClearChoices(DIA_Neoras_Herbs_Odo);
	Info_AddChoice(DIA_Neoras_Herbs_Odo,Dialog_Back,DIA_Neoras_Herbs_Odo_BackMenu);
	var int HasAny;	HasAny = FALSE;
	if (Npc_HasItems(other,ItPl_Mana_Herb_01))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ �������� �������...",DIA_Neoras_Herbs_Odo_Mana_01);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Mana_Herb_02))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ �������� �����...",DIA_Neoras_Herbs_Odo_Mana_02);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Mana_Herb_03))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ �������� ������...",DIA_Neoras_Herbs_Odo_Mana_03);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_01))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ �������� �����...",DIA_Neoras_Herbs_Odo_Health_01);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_02))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ �������� ��������...",DIA_Neoras_Herbs_Odo_Health_02);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_03))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ �������� ������...",DIA_Neoras_Herbs_Odo_Health_03);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Speed_Herb_01))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ �������-�����...",DIA_Neoras_Herbs_Odo_Speed);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Temp_Herb))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ ������� �����...",DIA_Neoras_Herbs_Odo_Temp);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Blueplant))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ �������...",DIA_Neoras_Herbs_Odo_Blue);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Strength_Herb_01))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ �������� ������...",DIA_Neoras_Herbs_Odo_STR);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Dex_Herb_01))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ ����� �������...",DIA_Neoras_Herbs_Odo_DEX);
		HasAny = TRUE;
	};
	if (Npc_HasItems(other,ItPl_Perm_Herb))	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ ������� ������...",DIA_Neoras_Herbs_Odo_MR_Perm);
		HasAny = TRUE;
	};
	if (HasAny)	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"������ ��� �����",DIA_Neoras_Herbs_Odo_GiveAll);
	};
};
//2. �������?---------------------------------------
func void DIA_Neoras_Herbs_Odo_Count()
{
	Info_ClearChoices(DIA_Neoras_Herbs_Odo);
	Info_AddChoice(DIA_Neoras_Herbs_Odo,Dialog_Back,DIA_Neoras_Herbs_Odo_Back);
	Info_AddChoice(DIA_Neoras_Herbs_Odo,"1 �����",DIA_Neoras_Herbs_Odo_1);
	if (MIS_Odo_Herbs_Give_Cnt >= 5)	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"5 ����",DIA_Neoras_Herbs_Odo_5);
	};
	if (MIS_Odo_Herbs_Give_Cnt >= 10)	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,"10 ����",DIA_Neoras_Herbs_Odo_10);
	};
	if (MIS_Odo_Herbs_Give_Cnt > 1)	{
		Info_AddChoice(DIA_Neoras_Herbs_Odo,CS5("��� (",IntToString(MIS_Odo_Herbs_Give_Cnt), " ��.",")",""),DIA_Neoras_Herbs_Odo_DoGive);
	};
};
//3. ������ ---------------------------------------
func void DIA_Neoras_Herbs_Odo_DoGive()
{
	//��������
	MIS_Odo_Herbs_AllCnt += MIS_Odo_Herbs_Give_Cnt * MIS_Odo_Herbs_Give_Price;
	if (MIS_Odo_Herbs_Give_Plant == Hlp_GetInstanceID(ItPl_Perm_Herb))	{
		MIS_Odo_Herbs_PermCnt += MIS_Odo_Herbs_Give_Cnt;
	};
	//������ ��������
	B_GiveInvItems(other,self,MIS_Odo_Herbs_Give_Plant,MIS_Odo_Herbs_Give_Cnt);
	//�����
	if (MIS_Odo_Herbs_Pay > 0)	{
		B_GiveInvItems(self,other,ItMi_Gold,MIS_Odo_Herbs_Pay * MIS_Odo_Herbs_Give_Cnt * MIS_Odo_Herbs_Give_Price);
	};
	//�����, �������� ������
	DIA_Neoras_Herbs_Odo_Bonus();
	//�����
	if (Npc_HasItems(other, MIS_Odo_Herbs_Give_Plant))	{
		DIA_Neoras_Herbs_Odo_Count();
	}
	else	{
		DIA_Neoras_Herbs_Odo_Menu();
	};
};

func void DIA_Neoras_Herbs_Odo_1()
{
	MIS_Odo_Herbs_Give_Cnt = 1;
	DIA_Neoras_Herbs_Odo_DoGive();
};
func void DIA_Neoras_Herbs_Odo_5()
{
	MIS_Odo_Herbs_Give_Cnt = 5;
	DIA_Neoras_Herbs_Odo_DoGive();
};
func void DIA_Neoras_Herbs_Odo_10()
{
	MIS_Odo_Herbs_Give_Cnt = 10;
	DIA_Neoras_Herbs_Odo_DoGive();
};

func void DIA_Neoras_Herbs_Odo_MR_Perm()
{
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_MR_Perm_01_01");	//������� ������, ������ � ������� ���������!
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_MR_Perm_01_02");	//�� ���������� ���������� �������.
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Perm_Herb);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Perm_Herb);
	MIS_Odo_Herbs_Give_Price = 20;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Str()
{
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_Str_01_01");	//�� ������ �������� ������. ����� ������ ��������.
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Strength_Herb_01);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Strength_Herb_01);
	MIS_Odo_Herbs_Give_Price = 15;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Dex()
{
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_Dex_01_01");	//��������� � ���� �� ���� ���������� ����.
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_Dex_01_02");	//�� ����� ���������� �������� � ���������.
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Dex_Herb_01);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Dex_Herb_01);
	MIS_Odo_Herbs_Give_Price = 15;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Blue()
{
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_Blue_01_01");	//������� - ��� �������! � ���� ����� ������� ��� ������.
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Blueplant);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Blueplant);
	MIS_Odo_Herbs_Give_Price = 8;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Temp()
{
	AI_Output(self,other,"DIA_Neoras_Herbs_Odo_Temp_01_01");	//������� ����� ������ ����� - ��� ���� �� ������� ����������� �����.
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Temp_Herb);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Temp_Herb);
	MIS_Odo_Herbs_Give_Price = 10;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Speed()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Speed_Herb_01);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Speed_Herb_01);
	MIS_Odo_Herbs_Give_Price = 7;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Mana_01()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Mana_Herb_01);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Mana_Herb_01);
	MIS_Odo_Herbs_Give_Price = 2;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Mana_02()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Mana_Herb_02);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Mana_Herb_02);
	MIS_Odo_Herbs_Give_Price = 3;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Mana_03()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Mana_Herb_03);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Mana_Herb_03);
	MIS_Odo_Herbs_Give_Price = 5;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Health_01()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Health_Herb_01);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Health_Herb_01);
	MIS_Odo_Herbs_Give_Price = 2;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Health_02()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Health_Herb_02);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Health_Herb_02);
	MIS_Odo_Herbs_Give_Price = 3;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_Health_03()
{
	MIS_Odo_Herbs_Give_Plant = Hlp_GetInstanceID(ItPl_Health_Herb_03);
	MIS_Odo_Herbs_Give_Cnt = Npc_HasItems(other,ItPl_Health_Herb_03);
	MIS_Odo_Herbs_Give_Price = 5;
	DIA_Neoras_Herbs_Odo_Count();
};
func void DIA_Neoras_Herbs_Odo_GiveAll()
{
	if (Npc_HasItems(other,ItPl_Mana_Herb_01))	{
		DIA_Neoras_Herbs_Odo_Mana_01();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Mana_Herb_02))	{
		DIA_Neoras_Herbs_Odo_Mana_02();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Mana_Herb_03))	{
		DIA_Neoras_Herbs_Odo_Mana_03();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_01))	{
		DIA_Neoras_Herbs_Odo_Health_01();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_02))	{
		DIA_Neoras_Herbs_Odo_Health_02();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Health_Herb_03))	{
		DIA_Neoras_Herbs_Odo_Health_03();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Speed_Herb_01))	{
		DIA_Neoras_Herbs_Odo_Speed();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Temp_Herb))	{
		DIA_Neoras_Herbs_Odo_Temp();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Blueplant))	{
		DIA_Neoras_Herbs_Odo_Blue();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Strength_Herb_01))	{
		DIA_Neoras_Herbs_Odo_Str();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Dex_Herb_01))	{
		DIA_Neoras_Herbs_Odo_Dex();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	if (Npc_HasItems(other,ItPl_Perm_Herb))	{
		DIA_Neoras_Herbs_Odo_MR_Perm();
		DIA_Neoras_Herbs_Odo_DoGive();
	};
	Info_ClearChoices(DIA_Neoras_Herbs_Odo);
};
func void DIA_Neoras_Herbs_Odo_Info()
{
	AI_Output(other,self,"DIA_Neoras_Herbs_Odo_03_00");	//� ������ ��� �����, ������!
	DIA_Neoras_Herbs_Odo_Menu();
};

//��������� ������� ===================================================
instance DIA_Neoras_HerbsPay_Odo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_Neoras_HerbsPay_Odo_Cond;
	information = DIA_Neoras_HerbsPay_Odo_Info;
	description = "���� � �������� ������� �� ���� ������?";
};
func int DIA_Neoras_HerbsPay_Odo_Cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Herbs == LOG_Running) && (MIS_Odo_Herbs_Pay == 0))	{
		return TRUE;
	};
};

func void DIA_Neoras_HerbsPay_Odo_Info()
{
	AI_Output(other,self,"DIA_Neoras_HerbsPay_Odo_03_00");	//���� � �������� ������� �� ���� ������?
	if (MIS_Odo_Herbs_AllCnt == 0)	{
		AI_Output(self,other,"DIA_Neoras_HerbsPay_Odo_01_01");	//��� ������ �� ������, � ��� ������� �������?
		AI_Output(self,other,"DIA_Neoras_HerbsPay_Odo_01_02");	//�� ������, �� �������� ��������� ����� �� ����������� ��������.
		MIS_Odo_Herbs_Pay = 2;
	}
	else	{
		AI_Output(self,other,"DIA_Neoras_HerbsPay_Odo_01_03");	//�� ������ ��� ��������� ��������... ������, �� �� ����� �� ����������.
		AI_Output(self,other,"DIA_Neoras_HerbsPay_Odo_01_04");	//������, � ���� ������� ���� �������.
		MIS_Odo_Herbs_Pay = 3;
	};
	B_LogEntry(TOPIC_Odo_Herbs,TOPIC_Odo_Herbs_Payment2);
};

//�������� ===================================================
instance DIA_Neoras_Teach_Odo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 5;
	condition = DIA_Neoras_Teach_Odo_Cond;
	information = DIA_Neoras_Teach_Odo_Info;
	description = "(��������)";
	permanent = TRUE;
};
func int DIA_Neoras_Teach_Odo_Cond()
{
	if (C_HeroIs_Odo() && (TEACH_Neoras == TRUE))	{
		return TRUE;
	};
};
func void DIA_Neoras_Teach_Odo_Menu()
{
	var int any;	any = FALSE;
	Info_ClearChoices(DIA_Neoras_Teach_Odo);
	Info_AddChoice(DIA_Neoras_Teach_Odo,Dialog_Back,DIA_Neoras_Teach_Odo_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)	{
		Info_AddChoice(DIA_Neoras_Teach_Odo,"�������� �������� (100 ���.)",DIA_Neoras_Teach_Odo_Health_01);
		any = TRUE;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))	{
		Info_AddChoice(DIA_Neoras_Teach_Odo,"�������� �������� (200 ���.)",DIA_Neoras_Teach_Odo_Health_02);
		any = TRUE;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)	{
		Info_AddChoice(DIA_Neoras_Teach_Odo,"�������� ���� (100 ���.)",DIA_Neoras_Teach_Odo_Mana_01);
		any = TRUE;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))	{
		Info_AddChoice(DIA_Neoras_Teach_Odo,"�������� ���� (200 ���.)",DIA_Neoras_Teach_Odo_Mana_02);
		any = TRUE;
	};
	if (!any)	{
		AI_Output(self,other,"DIA_Neoras_TeachNothing_Odo_01_01");	//������ � ������ �� ���� ������ ������� ����.
		AI_Output(self,other,"DIA_Neoras_TeachNothing_Odo_01_02");	//������ ������ ������������� ���� ��� ���, ��� ������ ��������� ������.
		TEACH_Neoras = FALSE;
	};
};
func void DIA_Neoras_Teach_Odo_Info()
{
	AI_Output(other,self,"DIA_Neoras_Teach_Odo_03_00");	//������, � ���� �������!
	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))	{
		AI_Output(self,other,"DIA_Neoras_Teach_Odo_01_01");	//�� ��� ������ ���, ���� � ������ ���� ���� �������.
		return;
	};
		AI_Output(self,other,"DIA_Neoras_Teach_Odo_01_02");	//��� �� ������ ������?
	DIA_Neoras_Teach_Odo_Menu();
};
func void DIA_Neoras_Teach_Odo_Back()
{
		AI_Output(self,other,"DIA_Neoras_Teach_Odo_01_03");	//�����������, ����� ������ ����� � �����.
	Info_ClearChoices(DIA_Neoras_Teach_Odo);
};
func void DIA_Neoras_Teach_Odo_NoMoney()
{
		AI_Output(self,other,"DIA_Neoras_Teach_Odo_01_04");	//������ � �� ��� �����������, ������� �� ������ ��������� �� ����. 
	Info_ClearChoices(DIA_Neoras_Teach_Odo);
};
func void DIA_Neoras_Teach_Odo_Health_01()
{
	if (Npc_HasItems(other,ItMi_Gold) >= 100)	{
		B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
		DIA_Neoras_Teach_Odo_Menu();
	}
	else	{
		DIA_Neoras_Teach_Odo_NoMoney();
	};
};
func void DIA_Neoras_Teach_Odo_Health_02()
{
	if (Npc_HasItems(other,ItMi_Gold) >= 200)	{
		B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
		DIA_Neoras_Teach_Odo_Menu();
	}
	else	{
		DIA_Neoras_Teach_Odo_NoMoney();
	};
};
func void DIA_Neoras_Teach_Odo_Mana_01()
{
	if (Npc_HasItems(other,ItMi_Gold) >= 100)	{
		B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
		DIA_Neoras_Teach_Odo_Menu();
	}
	else	{
		DIA_Neoras_Teach_Odo_NoMoney();
	};
};
func void DIA_Neoras_Teach_Odo_Mana_02()
{
	if (Npc_HasItems(other,ItMi_Gold) >= 200)	{
		B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
		DIA_Neoras_Teach_Odo_Menu();
	}
	else	{
		DIA_Neoras_Teach_Odo_NoMoney();
	};
};

