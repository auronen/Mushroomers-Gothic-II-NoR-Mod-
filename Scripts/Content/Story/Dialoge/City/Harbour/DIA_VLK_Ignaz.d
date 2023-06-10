
instance DIA_Ignaz_EXIT(DIA_Proto_End)
{
	npc = VLK_498_Ignaz;
};

instance DIA_Ignaz_Hello(C_INFO)
{
	nr = 0;
	npc = VLK_498_Ignaz;
	condition = DIA_WhenAsked_cond;
	information = DIA_Ignaz_MR_Hello_info;
	important = TRUE;
};
func void DIA_Ignaz_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Ignaz_MR_Hello_12_00");	//��� ���� �����?
	if (Wld_IsTime(4,30,23,30))		{
		AI_Output(self,other,"DIA_Ignaz_MR_Hello_12_01");	//�� �� ������, � �����!
	}
	else	{
		AI_Output(self,other,"DIA_Ignaz_MR_Hello_12_02");	//�� �� ������, � �������!
	};
};

// ���������� ������ ===================================================
instance DIA_Ignaz_AskRecipe(C_Info)
{
	npc = VLK_498_Ignaz;				nr = 10;
	condition = DIA_Ignaz_AskRecipe_cond;
	information = DIA_Ignaz_AskRecipe_Info;
	description = "� � ���� ��� ������� ��� ����� ������� ������?";
};
func int DIA_Ignaz_AskRecipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Ignaz_AskRecipe_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_03_00");	//� � ���� ��� ������� ��� ����� ������� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_07_00");	//� � ���� ��� ������� ��� ����� ������� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_10_00");	//� � ���� ��� ������� ��� ����� ������� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_14_00");	//� � ���� ��� ������� ��� ����� ������� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_16_00");	//� � ���� ��� ������� ��� ����� ������� ������?
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_01");	//������� ���? �, �� ��� ��� �������.
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_02");	//� ���������� �� ��� ���� �����, �� ��� ����� ��������� ��� ������.
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_03");	//� � ������������� ����������� ���� ��� �����!
	Info_ClearChoices(DIA_Ignaz_AskRecipe);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"��� ��, �������. ��� ��� ���� �����!",DIA_Ignaz_AskRecipe_No);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"����� ���� �����.",DIA_Ignaz_AskRecipe_GiveMe);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"� ��� ���������?",DIA_Ignaz_AskRecipe_IsItSafe);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"� ����� � ���� ������?",DIA_Ignaz_AskRecipe_WhatEffect);
};
func void DIA_Ignaz_AskRecipe_WhatEffect()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_WhatEffect_03_00");	//� ����� � ���� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_WhatEffect_07_00");	//� ����� � ���� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_WhatEffect_10_00");	//� ����� � ���� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_WhatEffect_14_00");	//� ����� � ���� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_WhatEffect_16_00");	//� ����� � ���� ������?
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_WhatEffect_01");	//��� ������ ��������� �������� ����� ����.
};

func void DIA_Ignaz_AskRecipe_IsItSafe()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_IsItSafe_03_00");	//� ��� ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_IsItSafe_07_00");	//� ��� ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_IsItSafe_10_00");	//� ��� ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_IsItSafe_14_00");	//� ��� ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_IsItSafe_16_00");	//� ��� ���������?
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_IsItSafe_01");	//�, �� ��������. � ����� ��� �� ������ ���������� �������� �����������.
};
func void DIA_Ignaz_AskRecipe_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_No_03_00");	//��� ��, �������. ��� ��� ���� �����!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_No_07_00");	//��� ��, �������. ��� ��� ���� �����!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_No_10_00");	//��� ��, �������. ��� ��� ���� �����!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_No_14_00");	//��� ��, �������. ��� ��� ���� �����!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_No_16_00");	//��� ��, �������. ��� ��� ���� �����!
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_14_No_01");	//����� ����. �� ��������� ������ ���� ��������� �����!
	Info_ClearChoices(DIA_Ignaz_AskRecipe);
};
func void DIA_Ignaz_AskRecipe_GiveMe()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_GiveMe_03_00");	//����� ���� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_GiveMe_07_00");	//����� ���� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_GiveMe_10_00");	//����� ���� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_GiveMe_14_00");	//����� ���� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_GiveMe_16_00");	//����� ���� �����.
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_GiveMe_14_01");	//���.
	B_GiveInvItems(self,other,ItPo_MR_IgnazEar,1);
	// ���� �� ������ - ����� ��� �������
	if (other.attribute[ATR_HITPOINTS] > other.attribute[ATR_HITPOINTS_MAX] - 5)	{
		AI_Output(self,other,"DIA_Ignaz_AskRecipe_GiveMe_14_02");	//������ � ���� ��� ���, ������� ����� �� �������� �����... ������ �� ��� ��������.
		//���� �� ������
		if (!Npc_HasEquippedMeleeWeapon(self))	{
			CreateInvItem(self,ItMw_1h_Bau_Axe);
		};
		AI_EquipBestMeleeWeapon(self);
		AI_SetWalkmode(self,NPC_RUN);
		AI_GotoNpc(self,other);
		AI_ReadyMeleeWeapon(self);
		AI_PlayAniBS(self,"T_1HATTACKMOVE",BS_PARADE);
		AI_RemoveWeapon(self);
		other.attribute[ATR_HITPOINTS] -= 15;
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_GiveMe_14_03");	//������ ��� ������, ��� �� �������� ������� ���������!
	Info_ClearChoices(DIA_Ignaz_AskRecipe);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"(����������)",DIA_Ignaz_AskRecipe_NoDrink);
	Info_AddChoice(DIA_Ignaz_AskRecipe,"(������)",DIA_Ignaz_AskRecipe_Drink);
};
func void DIA_Ignaz_AskRecipe_NoDrink()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_NoDrink_03_00");	//������, � ���������. �������� ���-�� �������������...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_NoDrink_07_00");	//������, � ���������. �������� ���-�� �������������...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_NoDrink_10_00");	//������, � ���������. �������� ���-�� �������������...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_NoDrink_14_00");	//������, � ���������. �������� ���-�� �������������...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_NoDrink_16_00");	//������, � ����������. �������� ���-�� �������������...
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_NoDrink_14_01");	//���� ��������� ���������� ���� �� ������� ����.
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_NoDrink_14_02");	//�� ��� �� ������������, ����� ��� �����. � ����� ������� ������������.
	B_GiveInvItems(other,self,ItPo_MR_IgnazEar,1);
	AI_StopProcessInfos(self);
};
func void DIA_Ignaz_AskRecipe_Drink()
{
	B_GivePlayerXP(XP_IgnazEarPotion);
	AI_Output(other,self,"XXX");	//
	B_UseItem(other,ItPo_MR_IgnazEar);
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_00");	//(�����������) ��������! ���� ������������ �� ������!..
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_03_01");	//���, �� � �������... ������ �������������... � ��� ���� �����!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_07_01");	//���, �� � �������... ������ �������������... � ��� ���� �����!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_10_01");	//���, �� � �������... ������ �������������... � ��� ���� �����!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_14_01");	//���, �� � �������... ������ �������������... � ��� ���� �����!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_16_01");	//���, �� � �������... ������ �������������... � ��� ���� �����!
	};
	//���-�� �������� ����������
	AI_PlayAni(other,"T_STUMBLE");
	B_Say(other,self,"$AARGH_1");
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_03_02");	//(������) ����������! ��� �� ���� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_07_02");	//(������) ����������! ��� �� ���� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_10_02");	//(������) ����������! ��� �� ���� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_14_02");	//(������) ����������! ��� �� ���� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_16_02");	//(������) ����������! ��� �� ���� ������?
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_03");	//������-������. ������ �������. ����� �������.
	B_GiveInvItems(self,other,ItFo_Water,1);
	AI_Output(other,self,"XXX");	//
	B_UseItem(other,ItFo_Water);
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_04");	//���������?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_03_05");	//�������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_07_05");	//�������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_10_05");	//�������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_14_05");	//�������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ignaz_AskRecipe_Drink_16_05");	//�������.
	};
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_06");	//����������� �������� ������... �� ���� ���� ����������, ��� ���������!
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_07");	//������, ������� �������� ������� ���� ��� ������ ������� ���������.
	AI_Output(self,other,"DIA_Ignaz_AskRecipe_Drink_14_08");	//�������� ��� ���������� ��� ��������.
	Info_ClearChoices(DIA_Ignaz_AskRecipe);
};


/////////////////////////////// ���� //////////////////////////////////

instance DIA_Ignaz_Sarah_AskSmokingCure(C_INFO)
{
	npc = VLK_498_Ignaz;			nr = 21;
	condition = DIA_Ignaz_Sarah_AskSmokingCure_cond;
	information = DIA_Ignaz_Sarah_AskSmokingCure_info;
	description = "� ���� ���� ��������� �����?";
};
func int DIA_Ignaz_Sarah_AskSmokingCure_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_SearchPotion)	{
		return TRUE;
	};
};
func void DIA_Ignaz_Sarah_AskSmokingCure_info()
{
		AI_Output(other,self,"DIA_Ignaz_Sarah_AskSmokingCure_16_00");	//� ���� ���� ��������� �����, ������� ������� �� �������?
	AI_Output(self,other,"DIA_Ignaz_Sarah_AskSmokingCure_12_01");	//�������� �����? ���� ���������� ������� ������������.
	AI_Output(self,other,"DIA_Ignaz_Sarah_AskSmokingCure_12_02");	//������� �� ����� � �����.
		AI_Output(other,self,"DIA_Ignaz_Sarah_AskSmokingCure_16_03");	//���, ��� �� ��, ��� ��� �����.
};


// �������� ==============================================
//-----------------------------------------
instance DIA_Ignaz_preTrade(C_INFO)
{
	npc = VLK_498_Ignaz;		nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Ignaz_preTrade_info;
	description = "���� � ������ � ���� ���-������?";
	trade = TRUE;
};
func void DIA_Ignaz_preTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Harad_NoTrade_03_00");	//���� � ������ � ���� ���-������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Harad_NoTrade_07_00");	//���� � ������ � ���� ���-������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Harad_NoTrade_10_00");	//���� � ������ � ���� ���-������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Harad_NoTrade_14_00");	//����� ������ � ���� ���-������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Harad_NoTrade_16_00");	//���� � ������ � ���� ���-������?
	};
	AI_Output(self,other,"DIA_Ignaz_preTrade_12_00");	//� ���� ���� ����� � ���-����� ������ ������.
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Ignaz);
	B_GiveTradeInv_Ignaz(self);
};
//-----------------------------------------
instance DIA_Ignaz_Trade(C_INFO)
{
	npc = VLK_498_Ignaz;		nr = 51;
	condition = DIA_Ignaz_Trade_cond;
	information = DIA_Ignaz_Trade_info;
	description = "� ���� ������ ���-���.";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Ignaz_Trade_cond()
{
	if (Npc_KnowsInfo(other, DIA_Ignaz_preTrade))	{
		return TRUE;
	};
};
func void DIA_Ignaz_Trade_info()
{
	B_GiveTradeInv_Ignaz(self);
};
