
instance DIA_Salandril_EXIT(DIA_Proto_End)
{
	npc = VLK_422_Salandril;
};

/////////////////////////////// ���� //////////////////////////////////

instance DIA_Salandril_Sarah_AskSmokingCure(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 1;
	condition = DIA_Salandril_Sarah_AskSmokingCure_cond;
	information = DIA_Salandril_Sarah_AskSmokingCure_info;
	description = "� ���� ��� �����, ������� ������� �� ����������?";
};
func int DIA_Salandril_Sarah_AskSmokingCure_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_SearchPotion)	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_AskSmokingCure_info()
{
		AI_Output(other,self,"DIA_Salandril_Sarah_AskSmokingCure_16_00");	//� ���� ��� �����, ������� ������� �� ����������?
	AI_Output(self,other,"DIA_Salandril_Sarah_AskSmokingCure_13_01");	//���, ��� ���-�� �������� � �������� ������? �������, ��� �� ��� ����.
	AI_Output(self,other,"DIA_Salandril_Sarah_AskSmokingCure_13_02");	//��� ������� ������� ����� ������� ������, ������� ����� �������� �������� ��������� �� ��������� ����.
	AI_Output(self,other,"DIA_Salandril_Sarah_AskSmokingCure_13_03");	//�� ��� ����� ���-����� �����������.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilKnowsPotion);
	MIS_Sarah_BadHabit_SearchPotion = FALSE;	//������ �� ����
};

// ==============================================
instance DIA_Salandril_Sarah_WhatIngredients(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 2;
	condition = DIA_Salandril_Sarah_WhatIngredients_cond;
	information = DIA_Salandril_Sarah_WhatIngredients_info;
	description = "����� ����������� ���� �����?";
};
func int DIA_Salandril_Sarah_WhatIngredients_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && (Npc_KnowsInfo(other,DIA_Salandril_Sarah_AskSmokingCure)))	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_WhatIngredients_info()
{
		AI_Output(other,self,"DIA_Salandril_Sarah_WhatIngredients_16_00");	//����� ����������� ���� �����?
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_01");	//��-������, �������� ����� ������ ��������.
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_02");	//����� ��� ������ �������� �����. ��� ������ ��������� ����� ���� � � ����� �������.
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_03");	//��-������, ��� ����� �������� ������ ���� - ��������� �����.
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_04");	//�� ����� �� ������ ����� ������� � �������� ������� ������.
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_05");	//� ������ - ������� ��������. �� ��������� �� ������ �������� ������, �� ������ �� ������ � � ����.
	AI_Output(self,other,"DIA_Salandril_Sarah_WhatIngredients_13_06");	//� ���������, �� ��������� ������ ��� ������ �� ��������.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilIngredients);
	MIS_Sarah_BadHabit_PotionIngredients = TRUE;	//������ ���� �����������
	_SpawnBySPName("SP_REDMOSS_01_NP",ItPl_RedMoss);
	_SpawnBySPName("SP_REDMOSS_02_NP",ItPl_RedMoss);
	B_CreateTradeItems_Bootlegger(ItPl_SwampHerb,1);
	B_CreateTradeItems_Ignaz(ItPl_SwampHerb,2);
	B_CreateTradeItems_Sagitta(ItPl_SwampHerb,1);
};

// ==============================================
instance DIA_Salandril_Sarah_HowMuchCosts(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 3;
	condition = DIA_Salandril_Sarah_HowMuchCosts_cond;
	information = DIA_Salandril_Sarah_HowMuchCosts_info;
	description = "������� �� ������ �� ���� ���������?";
};
func int DIA_Salandril_Sarah_HowMuchCosts_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && (Npc_KnowsInfo(other,DIA_Salandril_Sarah_AskSmokingCure)))	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_HowMuchCosts_info()
{
		AI_Output(other,self,"DIA_Salandril_Sarah_HowMuchCosts_16_00");	//������� �� ������ �� ���� ���������?
	AI_Output(self,other,"DIA_Salandril_Sarah_HowMuchCosts_13_01");	//������� ������ ������� �����.
		AI_Output(other,self,"DIA_Salandril_Sarah_HowMuchCosts_16_02");	//������� ������?!
	AI_Output(self,other,"DIA_Salandril_Sarah_HowMuchCosts_13_03");	//��� ����� ������� ������. ���� �� ���� ����� - �����.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilPrice);
};

// ==============================================
instance DIA_Salandril_Sarah_GiveIngredients(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 4;
	condition = DIA_Salandril_Sarah_GiveIngredients_cond;
	information = DIA_Salandril_Sarah_GiveIngredients_info;
	description = "� �������� ����������.";
};
func int DIA_Salandril_Sarah_GiveIngredients_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_PotionIngredients
		 && (Npc_HasItems(other,ItPl_SwampHerb) >= 3) && (Npc_HasItems(other,ItMr_DragonTears) >= 1) && (Npc_HasItems(other,ItPl_RedMoss) >= 1))	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_GiveIngredients_info()
{
		AI_Output(other,self,"DIA_Salandril_Sarah_GiveIngredients_16_00");	//� �������� ����������.
	//B_GiveInvItems(other,self,ItPl_SwampHerb,3);
	//B_GiveInvItems(other,self,ItMr_DragonTears,1);
	//B_GiveInvItems(other,self,ItPl_RedMoss,1);
	ItemTrans_items[0] = ItPl_SwampHerb;
	ItemTrans_amount[0] = 3;
	ItemTrans_items[1] = ItMr_DragonTears;
	ItemTrans_amount[1] = 1;
	ItemTrans_items[2] = ItPl_RedMoss;
	ItemTrans_amount[2] = 1;
	B_ItemsTransaction(other,self);
	AI_Output(self,other,"DIA_Salandril_Sarah_GiveIngredients_13_01");	//���������� ��������� � ������������. � �� ��������� ������.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilProduction);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,3);
	MIS_Sarah_BadHabit_PotionIngredientsGiven = TRUE;
};

// ==============================================
instance DIA_Salandril_Sarah_BuyPotion(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 5;
	condition = DIA_Salandril_Sarah_BuyPotion_cond;
	information = DIA_Salandril_Sarah_BuyPotion_info;
	description = "��� ������ �� ���������. (1500 ���.)";
	permanent = TRUE;
};
func int DIA_Salandril_Sarah_BuyPotion_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other,DIA_Salandril_Sarah_HowMuchCosts) && MIS_Sarah_BadHabit_PotionIngredientsGiven
		 && !MIS_Sarah_BadHabit_PotionGot)	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_BuyPotion_info()
{
	AI_Output(other,self,"DIA_Salandril_Sarah_BuyPotion_16_00");	//��� ������ �� ���������.
	if (B_GiveGold(other,self,1500))	{
		AI_Output(self,other,"DIA_Salandril_Sarah_BuyPotion_13_01");	//� ��� ���� �������.
		B_GiveInvItems(self,other,ItMi_AntismokingPotion,1);
	AI_Output(other,self,"DIA_Salandril_Sarah_BuyPotion_16_02");	//����� ��������� ���������?
		AI_Output(self,other,"DIA_Salandril_Sarah_BuyPotion_13_03");	//��������� � ���, �� ����� �������! ��������� �� ������ ������ � ����, �� ������.
		AI_Output(self,other,"DIA_Salandril_Sarah_BuyPotion_13_04");	//����� ����� ������ ������������.
		B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_GotPotion);
		MIS_Sarah_BadHabit_PotionGot = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Salandril_Sarah_BuyPotion_13_05");	//���? ��� ����� 1500 �������, � �� ������� ������!
	};
};

// ==============================================
instance DIA_Salandril_Sarah_BloodyCough(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 6;
	condition = DIA_Salandril_Sarah_BloodyCough_cond;
	information = DIA_Salandril_Sarah_BloodyCough_info;
	description = "�� ������ ��������� ��� ������� ������ ������� ������!";
};
func int DIA_Salandril_Sarah_BloodyCough_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_KnowBloodyCough)	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_BloodyCough_info()
{
		AI_Output(other,self,"DIA_Salandril_Sarah_BloodyCough_16_00");	//�� ������ ��������� ��� ������� ������ ������� ������!
		AI_Output(other,self,"DIA_Salandril_Sarah_BloodyCough_16_01");	//��� �� � ��� ������, ��������?!
	AI_Output(self,other,"DIA_Salandril_Sarah_BloodyCough_13_02");	//�� ����� �� ����! ��� ��������� ����� - � ������ ������� ����������� ���.
	AI_Output(self,other,"DIA_Salandril_Sarah_BloodyCough_13_03");	//�� ��� ����, ��� ��� �������� ��������� ���� ������, � ������ ����������� � �� ������ � �����.
	AI_Output(self,other,"DIA_Salandril_Sarah_BloodyCough_13_04");	//�� � ���� ������� ���� ��� ����, ������� ������� �� ������������. ����� 100 �������.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilSalve);
};

// ==============================================
instance DIA_Salandril_Sarah_BuySalve(C_INFO)
{
	npc = VLK_422_Salandril;			nr = 7;
	condition = DIA_Salandril_Sarah_BuySalve_cond;
	information = DIA_Salandril_Sarah_BuySalve_info;
	description = "� ������ ��� ����. (100 ���.)";
	permanent = TRUE;
};
func int DIA_Salandril_Sarah_BuySalve_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other,DIA_Salandril_Sarah_BloodyCough)
		 && !Npc_HasItems(other,ItMi_BuildUpSalve))	{
		return TRUE;
	};
};
func void DIA_Salandril_Sarah_BuySalve_info()
{
	AI_Output(other,self,"DIA_Salandril_Sarah_BuySalve_16_00");	//� ������ ��� ����.
	if (C_NpcHasGold(other,100))	{
		B_GiveGold(other,self,100);
		AI_Output(self,other,"DIA_Salandril_Sarah_BuySalve_13_01");	//�����. ��� �������� ������������, �� �� ����, ������������� �� ������ �����-������.
		AI_Output(self,other,"DIA_Salandril_Sarah_BuySalve_13_02");	//�� ������ ������, ���� ������� ������ ������.
		B_GiveInvItems(self,other,ItMi_BuildUpSalve,1);
		B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalandrilSalveGot);
	}
	else	{
		AI_Output(self,other,"DIA_Salandril_Sarah_BuySalve_13_03");	//���� ����� 100 �������.
	};
};


/////////////////////////////// ��� //////////////////////////////////
// �������� ==============================================
var int DIA_Salandril_MRTrade_Once;
instance DIA_Salandril_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_422_Salandril;
	condition = DIA_NoCond_cond;
	information = DIA_Salandril_MRTrade_info;
	description = "������ ��� ���� ������.";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Salandril_MRTrade_info()
{
	if (!DIA_Salandril_MRTrade_Once)	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Salandril_MRTrade_03_00");	//������ ��� ���� ������.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Salandril_MRTrade_07_00");	//������ ��� ���� ������.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Salandril_MRTrade_10_00");	//������ ��� ���� ������.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Salandril_MRTrade_14_00");	//������ ��� ���� ������.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Salandril_MRTrade_16_00");	//������ ��� ���� ������.
		};
		AI_Output(self,other,"DIA_Salandril_MRTrade_13_01");	//����������! � ���� ������� ��� ������ ����� � ����� � ���� ������.
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Salandril);
		DIA_Salandril_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Salandril(self);
};
