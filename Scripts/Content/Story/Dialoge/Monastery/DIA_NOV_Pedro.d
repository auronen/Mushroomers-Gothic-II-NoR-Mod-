

instance DIA_Pedro_EXIT(DIA_Proto_End)
{
	npc = NOV_600_Pedro;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Pedro_Start_Odo(C_Info)
{
	npc = NOV_600_Pedro;		nr = 1;
	condition = DIA_Pedro_Start_Odo_Cond;
	information = DIA_Pedro_Start_Odo_Info;
	important = TRUE;
};
func int DIA_Pedro_Start_Odo_Cond()
{
	if (C_HeroIs_Odo()
		&& ((Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG) || DIA_WhenAsked_cond()))	{
		return TRUE;
	};
};
func void DIA_Pedro_Start_Odo_Info()
{
	AI_Output(self,other,"DIA_Pedro_Start_Odo_09_00");	//����������, ����!
	AI_Output(self,other,"DIA_Pedro_Start_Odo_09_01");	//�� ������ ��� ����?
	Info_ClearChoices(DIA_Pedro_Start_Odo);
	Info_AddChoice(DIA_Pedro_Start_Odo,"���, ������.",DIA_Pedro_Start_Odo_NoFood);
	if (Npc_HasItems(other,ItFo_Schafswurst) > 0)	{
		Info_AddChoice(DIA_Pedro_Start_Odo,"���, �� � ���� ������ ���� ���� �������.",DIA_Pedro_Start_Odo_GiveSausage);
	};
};
func void DIA_Pedro_Start_Odo_NoFood()
{
		AI_Output(other,self,"DIA_Pedro_Start_Odo_NoFood_03_00");	//���, ������. ���� ��������� �������� �������� �����.
	AI_Output(self,other,"DIA_Pedro_Start_Odo_NoFood_09_01");	//����� ����. � ��� ������������!
	Info_ClearChoices(DIA_Pedro_Start_Odo);
};
func void DIA_Pedro_Start_Odo_GiveSausage()
{
		AI_Output(other,self,"DIA_Pedro_Start_Odo_GiveSausage_03_00");	//���, ���� ��������� �������� �������� �����. �� � ���� ������ ���� ���� �������.
	AI_Output(self,other,"DIA_Pedro_Start_Odo_GiveSausage_09_01");	//�� ��� ���������! ������� ���� �������. � ������ ������������.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	B_UseItem(self,ItFo_Schafswurst);
	B_GivePlayerXP(XP_Ambient);
	Pedro_NotHungryDay = Wld_GetDay() + 1 + Hlp_Random(3);
	Pedro_FedDay = Wld_GetDay() + 1;
	Info_ClearChoices(DIA_Pedro_Start_Odo);
	Pedro_FedCnt += 1;
};

//===================================================
var int DIA_Pedro_Hungry_Odo_Once;
instance DIA_Pedro_Hungry_Odo(C_Info)
{
	npc = NOV_600_Pedro;		nr = 2;
	condition = DIA_Pedro_Hungry_Odo_Cond;
	information = DIA_Pedro_Hungry_Odo_Info;
	permanent = TRUE;
	description = "������ �� ����� ��������?";
};
func int DIA_Pedro_Hungry_Odo_Cond()
{
	if (C_HeroIs_Odo() && Npc_KnowsInfo(other,DIA_Pedro_Start_Odo))	{
		return TRUE;
	};
};
func void DIA_Pedro_Hungry_Odo_Info()
{
		AI_Output(other,self,"DIA_Pedro_Hungry_Odo_03_00");	//������ �� ����� ��������?
	AI_Output(self,other,"DIA_Pedro_Hungry_Odo_09_01");	//� ������� ���� � ���������, � �� ���� ����������, ����� ����������.
	AI_Output(self,other,"DIA_Pedro_Hungry_Odo_09_02");	//� ������, ���������� ����, ����� �������� ��� ����.
		AI_Output(other,self,"DIA_Pedro_Hungry_Odo_03_03");	//����������.
	if (!DIA_Pedro_Hungry_Odo_Once)	{
		B_LogNote(Topic_Misk, Topic_Misk_PedroHungry);
		DIA_Pedro_Hungry_Odo_Once = TRUE;
	};
};
//===================================================
instance DIA_Pedro_AteToday_Odo(C_Info)
{
	npc = NOV_600_Pedro;		nr = 3;
	condition = DIA_Pedro_AteToday_Odo_Cond;
	information = DIA_Pedro_AteToday_Odo_Info;
	permanent = TRUE;
	description = "�� ������� ������?";
};
func int DIA_Pedro_AteToday_Odo_Cond()
{
	if (C_HeroIs_Odo() && (DIA_Pedro_Hungry_Odo_Once))	{
		return TRUE;
	};
};
func int DIA_Pedro_AteToday_Odo_HasFood()
{
	if (Npc_HasItems(other,ItFo_Bacon))	{return TRUE;};
	if (Npc_HasItems(other,ItFo_Cheese))	{return TRUE;};
	if (Npc_HasItems(other,ItFo_Fish))	{return TRUE;};
	if (Npc_HasItems(other,ItFo_FishSoup))	{return TRUE;};
	if (Npc_HasItems(other,ItFo_Stew))	{return TRUE;};
	if (Npc_HasItems(other,ItFo_Sausage))	{return TRUE;};
	if (Npc_HasItems(other,ItFo_Schafswurst))	{return TRUE;};
	return FALSE;
};
func void DIA_Pedro_AteToday_Odo_Info()
{
	AI_Output(other,self,"DIA_Pedro_AteToday_Odo_03_00");	//�� ������� ������?
	if (Pedro_FedDay == Wld_GetDay() + 1)	{
		AI_Output(self,other,"DIA_Pedro_AteToday_Odo_09_01");	//��, ��������� ����. ��� ��� �������!
	}
	else if (Pedro_NotHungryDay == Wld_GetDay())	{
		AI_Output(self,other,"DIA_Pedro_AteToday_Odo_09_02");	//��, �� ���� ��� ��� ���� ���������.
		AI_Output(self,other,"DIA_Pedro_AteToday_Odo_09_03");	//�������, ��� ���������������.
		Pedro_FedCnt += 1;
	}
	else	{
		AI_Output(self,other,"DIA_Pedro_AteToday_Odo_09_04");	//���, ��� ��� � �� �������� ������.
		Info_ClearChoices(DIA_Pedro_AteToday_Odo);
		Info_AddChoice(DIA_Pedro_AteToday_Odo,"����� ����.",DIA_Pedro_AteToday_Odo_NoFeed);
		if (DIA_Pedro_AteToday_Odo_HasFood())	{
			Info_AddChoice(DIA_Pedro_AteToday_Odo,"����� � ����� ����...",DIA_Pedro_AteToday_Odo_Feed);
		};
	};
};
func void DIA_Pedro_AteToday_Odo_NoFeed()
{
	AI_Output(other,self,"DIA_Pedro_AteToday_Odo_NoFeed_03_00");	//����� ����.
		AI_Output(self,other,"DIA_Pedro_AteToday_Odo_NoFeed_09_01");	//��� ����.
	Info_ClearChoices(DIA_Pedro_AteToday_Odo);
};
func void DIA_Pedro_AteToday_Odo_Feed()
{
	Info_ClearChoices(DIA_Pedro_AteToday_Odo);
	if (Npc_HasItems(other,ItFo_Bread))	{
		Info_AddChoice(DIA_Pedro_AteToday_Odo,"...������.",DIA_Pedro_AteToday_Odo_Bread);
	};
	if (Npc_HasItems(other,ItFo_Cheese))	{
		Info_AddChoice(DIA_Pedro_AteToday_Odo,"...�����.",DIA_Pedro_AteToday_Odo_Cheese);
	};
	if (Npc_HasItems(other,ItFo_Fish))	{
		Info_AddChoice(DIA_Pedro_AteToday_Odo,"...�����.",DIA_Pedro_AteToday_Odo_Fish);
	};
	if (Npc_HasItems(other,ItFo_FishSoup))	{
		Info_AddChoice(DIA_Pedro_AteToday_Odo,"...����.",DIA_Pedro_AteToday_Odo_FishSoup);
	};
	if (Npc_HasItems(other,ItFo_Stew))	{
		Info_AddChoice(DIA_Pedro_AteToday_Odo,"...���������.",DIA_Pedro_AteToday_Odo_Stew);
	};
	if (Npc_HasItems(other,ItFo_Bacon))	{
		Info_AddChoice(DIA_Pedro_AteToday_Odo,"...��������.",DIA_Pedro_AteToday_Odo_Bacon);
	};
	if (Npc_HasItems(other,ItFo_Sausage))	{
		Info_AddChoice(DIA_Pedro_AteToday_Odo,"...��������.",DIA_Pedro_AteToday_Odo_Sausage);
	};
	if (Npc_HasItems(other,ItFo_Schafswurst))	{
		Info_AddChoice(DIA_Pedro_AteToday_Odo,"...�������� ��������.",DIA_Pedro_AteToday_Odo_Schafswurst);
	};
};
func void DIA_Pedro_AteToday_Odo_Thanks()
{
	AI_Output(self,other,"DIA_Pedro_AteToday_Odo_Thanks_09_00");	//�������, ����.
	if (Pedro_FedCnt > 2)	{
		AI_Output(self,other,"DIA_Pedro_AteToday_Odo_Thanks_09_01");	//�� ������ ��������� ����.
	};
	Pedro_FedDay = Wld_GetDay() + 1;
	Info_ClearChoices(DIA_Pedro_AteToday_Odo);
	Pedro_FedCnt += 1;
};
func void DIA_Pedro_AteToday_Odo_Bread()
{
	AI_Output(other,self,"DIA_Pedro_AteToday_Odo_Bread_03_00");	//����� � ����� ���� ������.
	B_GiveInvItems(other,self,ItFo_Bread,1);
	B_GivePlayerXP(XP_Ambient);
	DIA_Pedro_AteToday_Odo_Thanks();
};
func void DIA_Pedro_AteToday_Odo_Cheese()
{
	AI_Output(other,self,"DIA_Pedro_AteToday_Odo_Cheese_03_00");	//����� � ����� ���� �����.
	B_GiveInvItems(other,self,ItFo_Cheese,1);
	B_GivePlayerXP(XP_Ambient);
	DIA_Pedro_AteToday_Odo_Thanks();
};
func void DIA_Pedro_AteToday_Odo_Fish()
{
	AI_Output(other,self,"DIA_Pedro_AteToday_Odo_Fish_03_00");	//����� � ����� ���� �����.
	B_GiveInvItems(other,self,ItFo_Fish,1);
	B_GivePlayerXP(XP_Ambient);
	DIA_Pedro_AteToday_Odo_Thanks();
};
func void DIA_Pedro_AteToday_Odo_FishSoup()
{
	AI_Output(other,self,"DIA_Pedro_AteToday_Odo_FishSoup_03_00");	//����� � ����� ���� ����.
	B_GiveInvItems(other,self,ItFo_FishSoup,1);
	B_GivePlayerXP(XP_Ambient);
	DIA_Pedro_AteToday_Odo_Thanks();
};
func void DIA_Pedro_AteToday_Odo_Stew()
{
	AI_Output(other,self,"DIA_Pedro_AteToday_Odo_Stew_03_00");	//����� � ����� ���� ���������.
	B_GiveInvItems(other,self,ItFo_Stew,1);
	B_GivePlayerXP(XP_Ambient);
	DIA_Pedro_AteToday_Odo_Thanks();
};
func void DIA_Pedro_AteToday_Odo_Bacon()
{
	AI_Output(other,self,"DIA_Pedro_AteToday_Odo_Bacon_03_00");	//����� � ����� ���� ��������.
	B_GiveInvItems(other,self,ItFo_Bacon,1);
	B_GivePlayerXP(XP_Ambient);
	DIA_Pedro_AteToday_Odo_Thanks();
};
func void DIA_Pedro_AteToday_Odo_Sausage()
{
	AI_Output(other,self,"DIA_Pedro_AteToday_Odo_Sausage_03_00");	//����� � ����� ���� ��������.
	B_GiveInvItems(other,self,ItFo_Sausage,1);
	B_GivePlayerXP(XP_Ambient);
	DIA_Pedro_AteToday_Odo_Thanks();
};
func void DIA_Pedro_AteToday_Odo_Schafswurst()
{
	AI_Output(other,self,"DIA_Pedro_AteToday_Odo_Schafswurst_03_00");	//����� � ����� ���� �������� ��������.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	B_GivePlayerXP(2*XP_Ambient);
	DIA_Pedro_AteToday_Odo_Thanks();
};

/////////////////////////////////////// ��������� /////////////////////////////////////////////

//===================================================
instance DIA_Pedro_Start_Others(C_Info)
{
	npc = NOV_600_Pedro;		nr = 10;
	condition = DIA_Pedro_Start_Others_Cond;
	information = DIA_Pedro_Start_Others_Info;
	important = TRUE;
};
func int DIA_Pedro_Start_Others_Cond()
{
	if (!C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Pedro_Start_Others_Info()
{
	AI_Output(self,other,"DIA_Pedro_Start_Others_09_00");	//����������!
	AI_Output(self,other,"DIA_Pedro_Start_Others_09_01");	//� ��������� ����� ������� ������ ���� ����, �������� � ����������.
};
//===================================================
instance DIA_Pedro_MR_Perm_Others(C_Info)
{
	npc = NOV_600_Pedro;		nr = 11;
	condition = DIA_Pedro_MR_Perm_Others_Cond;
	information = DIA_Pedro_MR_Perm_Others_Info;
	permanent = TRUE;
	description = "����� � ���-���� �����?";
};
func int DIA_Pedro_MR_Perm_Others_Cond()
{
	if (!C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Pedro_MR_Perm_Others_Info()
{
	if (hero.voice == 3)	{			//������
		AI_Output(other,self,"DIA_Pedro_MR_Perm_Others_03_00");	//����� � ���-���� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Pedro_MR_Perm_Others_07_00");	//����� � ���-���� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Pedro_MR_Perm_Others_10_00");	//����� � ���-���� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Pedro_MR_Perm_Others_14_00");	//����� � ���-���� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Pedro_MR_Perm_Others_16_00");	//����� � ���-���� �����?
	};
	AI_Output(self,other,"DIA_Pedro_MR_Perm_Others_09_01");	//���.
};

