

instance DIA_Niclas_EXIT(DIA_Proto_End)
{
	npc = OUT_1220_Niclas;
};

///////////////////////////// ��� ///////////////////////////////
//-----------------------------------------
instance DIA_Niclas_WhoAU(C_INFO)
{
	npc = OUT_1220_Niclas;			nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Niclas_WhoAU_info;
	description = "�� ���?";
};
func void DIA_Niclas_WhoAU_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Niclas_WhoAU_03_00");	//�� ���?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Niclas_WhoAU_07_00");	//�� ���?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Niclas_WhoAU_10_00");	//�� ���?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Niclas_WhoAU_14_00");	//�� ���?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Niclas_WhoAU_16_00");	//�� ���?
	};
	AI_Output(self,other,"DIA_Niclas_WhoAU_03_01");	//���������, �������, ������� - ������� ��� ������. ���� ����� ������.
};

//-----------------------------------------
instance DIA_Niclas_IsItYOurHouse(C_INFO)
{
	npc = OUT_1220_Niclas;			nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Niclas_IsItYOurHouse_info;
	description = "�� ��� ������?";
};
func void DIA_Niclas_IsItYOurHouse_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Niclas_IsItYOurHouse_03_00");	//�� ��� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Niclas_IsItYOurHouse_07_00");	//�� ��� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Niclas_IsItYOurHouse_10_00");	//�� ��� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Niclas_IsItYOurHouse_14_00");	//�� ��� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Niclas_IsItYOurHouse_16_00");	//�� ��� ������?
	};
	AI_Output(self,other,"DIA_Niclas_IsItYOurHouse_03_01");	//��, ��� ������ - ��� ���. �� ������� ��������, �� ����� ����� � ����.
};

//-----------------------------------------
instance DIA_Niclas_AboutMushrooms(C_INFO)
{
	npc = OUT_1220_Niclas;			nr = 3;
	condition = DIA_Niclas_AboutMushrooms_cond;
	information = DIA_Niclas_AboutMushrooms_info;
	description = "� � ������ �� ������������?";
};
func int DIA_Niclas_AboutMushrooms_cond()
{
	if (Npc_KnowsInfo(other,DIA_Niclas_WhoAU))	{
		return TRUE;
	};
};
func void DIA_Niclas_AboutMushrooms_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Niclas_AboutMushrooms_03_00");	//� � ������ �� ������������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Niclas_AboutMushrooms_07_00");	//� � ������ �� ������������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Niclas_AboutMushrooms_10_00");	//� � ������ �� ������������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Niclas_AboutMushrooms_14_00");	//� � ������ �� ������������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Niclas_AboutMushrooms_16_00");	//� � ������ �� ������������?
	};
	AI_Output(self,other,"DIA_Niclas_AboutMushrooms_03_01");	//�������.
	AI_Output(self,other,"DIA_Niclas_AboutMushrooms_03_02");	//� ������� ������ ����� ��������� ��������� ����� - �������, �������, ���������, ���������.
	AI_Output(self,other,"DIA_Niclas_AboutMushrooms_03_03");	//�� � ���� ����� ����� ����� �������� ������. ��������� � �� �����-�� �� ������.
	AI_Output(self,other,"DIA_Niclas_AboutMushrooms_03_04");	//��������, ����� �� ���� � ������� ������� ��������� ��������� ���������� ��������. � ��������� ��� ������ ��������.
};

//-----------------------------------------
instance DIA_Niclas_preTrade(C_INFO)
{
	npc = OUT_1220_Niclas;			nr = 4;
	condition = DIA_Niclas_preTrade_cond;
	information = DIA_Niclas_preTrade_info;
	description = "�� ���-������ �������� ��� ���������?";
};
func int DIA_Niclas_preTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Niclas_WhoAU))	{
		return TRUE;
	};
};
func void DIA_Niclas_preTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Niclas_preTrade_03_00");	//�� ���-������ �������� ��� ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Niclas_preTrade_07_00");	//�� ���-������ �������� ��� ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Niclas_preTrade_10_00");	//�� ���-������ �������� ��� ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Niclas_preTrade_14_00");	//�� ���-������ �������� ��� ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Niclas_preTrade_16_00");	//�� ���-������ �������� ��� ���������?
	};
	AI_Output(self,other,"DIA_Niclas_preTrade_03_01");	//� ���� ��� ������, �� �� ����� ����������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Niclas_preTrade_03_02");	//���� ���������� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Niclas_preTrade_07_02");	//���� ���������� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Niclas_preTrade_10_02");	//���� ���������� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Niclas_preTrade_14_02");	//���� ���������� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Niclas_preTrade_16_02");	//���� ���������� �����.
	};
	AI_Output(self,other,"DIA_Niclas_preTrade_03_03");	//����� � ����� �������� �� �� ����� ������ ���.
	AI_Output(self,other,"DIA_Niclas_preTrade_03_04");	//����� ���� - ��� � ���� ����������.
	B_LogNote(TOPIC_Trader, TOPIC_Trader_Niclas);
};
//-----------------------------------------
var int Niclas_Exchange_Day;
var int Niclas_Exchange_MR;
const int Niclas_MR_Max = 7;
const int Niclas_MRs[Niclas_MR_Max] = {
	MR_Red,
	MR_01,
	MR_Piny,
	MR_BrownOiler,
	MR_Governor,
	MR_Keil,
	MR_NightSparkles
};
const int Niclas_MRs_Chance[Niclas_MR_Max] = {
	90,	//MR_Red,
	70,	//MR_01,
	50,	//MR_Piny,
	60,	//MR_BrownOiler,
	40,	//MR_Governor,
	80,	//MR_Keil,
	5	//MR_NightSparkles
};
const int Niclas_MRs_Cnt[Niclas_MR_Max] = {
	5,	//MR_Red,
	3,	//MR_01,
	4,	//MR_Piny,
	4,	//MR_BrownOiler,
	2,	//MR_Governor,
	3,	//MR_Keil,
	1	//MR_NightSparkles
};
instance DIA_Niclas_Exchange(C_INFO)
{
	npc = OUT_1220_Niclas;			nr = 5;
	condition = DIA_Niclas_Exchange_cond;
	information = DIA_Niclas_Exchange_info;
	description = "����� ��������.";
	permanent = TRUE;
};
func int DIA_Niclas_Exchange_cond()
{
	if (Npc_KnowsInfo(other,DIA_Niclas_preTrade))	{
		return TRUE;
	};
};
func void DIA_Niclas_Exchange_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Niclas_Exchange_03_00");	//����� ��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Niclas_Exchange_07_00");	//����� ��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Niclas_Exchange_10_00");	//����� ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Niclas_Exchange_14_00");	//����� ��������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Niclas_Exchange_16_00");	//����� ��������.
	};
	if (Niclas_Exchange_Day > Wld_GetDay_Shifted(8))	{
		AI_Output(self,other,"DIA_Niclas_Exchange_03_01");	//������� � ���� ������ ��� ������ ��� ������. ������� ������, � ������ ���.
		Info_ClearChoices(DIA_Niclas_Exchange);
	}
	else	{
		AI_Output(self,other,"DIA_Niclas_Exchange_03_02");	//� ������ ������� ������. � ��� ���� � ����?
		Info_ClearChoices(DIA_Niclas_Exchange);
		Info_AddChoice(DIA_Niclas_Exchange,"������.",DIA_Niclas_Exchange_Nothing);
		if (Npc_HasItems(other,ItFo_Apple))	{
			Info_AddChoice(DIA_Niclas_Exchange,"������",DIA_Niclas_Exchange_Apple);
		};
		if (Npc_HasItems(other,ItFo_Bacon))	{
			Info_AddChoice(DIA_Niclas_Exchange,"�����",DIA_Niclas_Exchange_Bacon);
		};
		if (Npc_HasItems(other,ItFo_SmellyFish))	{
			Info_AddChoice(DIA_Niclas_Exchange,"�������",DIA_Niclas_Exchange_SmellyFish);
		};
		if (Npc_HasItems(other,ItFo_FishSoup))	{
			Info_AddChoice(DIA_Niclas_Exchange,"���",DIA_Niclas_Exchange_FishSoup);
		};
		if (Npc_HasItems(other,ItFo_Fish))	{
			Info_AddChoice(DIA_Niclas_Exchange,"����",DIA_Niclas_Exchange_Fish);
		};
		if (Npc_HasItems(other,ItFo_Honey))	{
			Info_AddChoice(DIA_Niclas_Exchange,"���",DIA_Niclas_Exchange_Honey);
		};
		if (Npc_HasItems(other,ItFo_Milk))	{
			Info_AddChoice(DIA_Niclas_Exchange,"������",DIA_Niclas_Exchange_Milk);
		};
		if (Npc_HasItems(other,ItFo_Sausage))	{
			Info_AddChoice(DIA_Niclas_Exchange,"�������",DIA_Niclas_Exchange_Sausage);
		};
		if (Npc_HasItems(other,ItFo_Schafswurst))	{
			Info_AddChoice(DIA_Niclas_Exchange,"������� �������",DIA_Niclas_Exchange_Schafswurst);
		};
		if (Npc_HasItems(other,ItFo_Stew))	{
			Info_AddChoice(DIA_Niclas_Exchange,"��������",DIA_Niclas_Exchange_Stew);
		};
		if (Npc_HasItems(other,ItFo_Cheese_OldShepherd))	{
			Info_AddChoice(DIA_Niclas_Exchange,"��� ������� �������",DIA_Niclas_Exchange_Cheese_OldShepherd);
		};
		if (Npc_HasItems(other,ItFo_Cheese))	{
			Info_AddChoice(DIA_Niclas_Exchange,"���",DIA_Niclas_Exchange_Cheese);
		};
		if (Npc_HasItems(other,ItFo_Bread))	{
			Info_AddChoice(DIA_Niclas_Exchange,"����",DIA_Niclas_Exchange_Bread);
		};
	};
};
func void DIA_Niclas_Exchange_Nothing()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Niclas_Exchange_Nothing_03_00");	//������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Niclas_Exchange_Nothing_07_00");	//������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Niclas_Exchange_Nothing_10_00");	//������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Niclas_Exchange_Nothing_14_00");	//������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Niclas_Exchange_Nothing_16_00");	//������.
	};
	AI_Output(self,other,"DIA_Niclas_Exchange_Nothing_03_01");	//������ ���������. ������ ���.
	Info_ClearChoices(DIA_Niclas_Exchange);
};

func void DIA_Niclas_Exchange_GiveMR()
{
	var int i;	i = 0;
	var int Rnd;
	var int RndMax; RndMax = 0;
	var int i_Max; i_Max = 0;
	while(i < Niclas_MR_Max);
		Rnd = C_Random(MEM_ReadStatArr(Niclas_MRs_Chance,i)) + 1;
		if (Rnd > RndMax)	{
			RndMax = Rnd;
			i_Max = i;
		};
		i += 1;
	end;
	Rnd = C_Random(MEM_ReadStatArr(Niclas_MRs_Cnt,i_Max)) + 1;
	i_Max = MEM_ReadStatArr(Niclas_MRs,i_Max);
	if (i_Max == MR_01)	{
		B_GiveInvItems(self,other,ItPl_Mushroom_01,Rnd);
	}
	else if (i_Max == MR_BrownOiler)	{
		B_GiveInvItems(self,other,ItMr_BrownOiler,Rnd);
	}
	else if (i_Max == MR_Governor)	{
		B_GiveInvItems(self,other,ItMr_Governor,Rnd);
	}
	else if (i_Max == MR_Keil)	{
		B_GiveInvItems(self,other,ItMr_KeilSmall,Rnd);
	}
	else if (i_Max == MR_NightSparkles)	{
		B_GiveInvItems(self,other,ItMr_NightSparkles,Rnd);
	}
	else if (i_Max == MR_Piny)	{
		B_GiveInvItems(self,other,ItMr_Piny,Rnd);
	}
	else if (i_Max == MR_Red)	{
		B_GiveInvItems(self,other,ItMr_Red,Rnd);
	};
	Info_ClearChoices(DIA_Niclas_Exchange);
	Niclas_Exchange_Day = Wld_GetDay() + 1;
};

func void DIA_Niclas_Exchange_Apple()
{
	B_GiveInvItems(other,self,ItFo_Apple,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_Bacon()
{
	B_GiveInvItems(other,self,ItFo_Bacon,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_Bread()
{
	B_GiveInvItems(other,self,ItFo_Bread,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_Cheese()
{
	B_GiveInvItems(other,self,ItFo_Cheese,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_Cheese_OldShepherd()
{
	B_GiveInvItems(other,self,ItFo_Cheese_OldShepherd,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_Fish()
{
	B_GiveInvItems(other,self,ItFo_Fish,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_FishSoup()
{
	B_GiveInvItems(other,self,ItFo_FishSoup,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_Honey()
{
	B_GiveInvItems(other,self,ItFo_Honey,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_Milk()
{
	B_GiveInvItems(other,self,ItFo_Milk,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_Sausage()
{
	B_GiveInvItems(other,self,ItFo_Sausage,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_Schafswurst()
{
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_SmellyFish()
{
	B_GiveInvItems(other,self,ItFo_SmellyFish,1);
	DIA_Niclas_Exchange_GiveMR();
};
func void DIA_Niclas_Exchange_Stew()
{
	B_GiveInvItems(other,self,ItFo_Stew,1);
	DIA_Niclas_Exchange_GiveMR();
};

