
instance DIA_Moe_EXIT(DIA_Proto_End)
{
	npc = VLK_432_Moe;
};

//�� ������� �� ����� ��������
func void _DIA_Moe_GoOut()
{
	AI_GotoWP(hero,"NW_CITY_PATH_HABOUR_02");
};

//����� ������� ������� ��������
func int DIA_Moe_AllCond()
{
	if ((Npc_GetDistToWP(other,"NW_CITY_HABOUR_TAVERN01_ENTRY") < 500)
		&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
		&& (self.aivar[AIV_Guardpassage_Status] != GP_PASSGATE))	{
		return TRUE;
	};
};

//////////////////////////////////����////////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Sarah(C_INFO)
{
	npc = VLK_432_Moe;			nr = 1;
	condition = DIA_Moe_Hello_Sarah_cond;
	information = DIA_Moe_Hello_Sarah_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Sarah_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Sarah_info()
{
	AI_Output(self,other,"DIA_Moe_Hello_Sarah_01_00");	//����! ������� ���, ������� ���...
	AI_Output(self,other,"DIA_Moe_Hello_Sarah_01_01");	//(���������) ���, ����������� �� ���?
		AI_Output(other,self,"DIA_Moe_Hello_Sarah_16_02");	//��� �� ����� � ������! � ����, � ������, ����������� ����.
	AI_Output(self,other,"DIA_Moe_Hello_Sarah_01_03");	//� ������ � ���� ����� ����� �� ������. 
		AI_Output(other,self,"DIA_Moe_Hello_Sarah_16_04");	//������ ������ � ���� ����� �� ������ �����.
	AI_Output(self,other,"DIA_Moe_Hello_Sarah_01_05");	//����� �������! (����������) �����, �������, �� ������, �� ������ ����.
	B_GivePlayerXP(XP_Moe_Respect);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Moe);
};
//-----------------------------------------
instance DIA_Moe_Sarah_AboutNadja(C_INFO)
{
	npc = VLK_432_Moe;			nr = 2;
	condition = DIA_Moe_Sarah_AboutNadja_cond;
	information = DIA_Moe_Sarah_AboutNadja_info;
	description = "��, ��, �������� ����.";
};
func int DIA_Moe_Sarah_AboutNadja_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_EddaAsked)	{
		return TRUE;
	};
};
func void DIA_Moe_Sarah_AboutNadja_info()
{
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_00");	//��, ��, �������� ����.
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_01");	//���� ����?
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_02");	//������� ����?
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_03");	//�������� ���. ������ ���� ������ ���� ��... �������� ������.
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_04");	//� ���� �� ������. ���� ��� �� ������ ������, ��� ��� ��� ����� ����������.
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_05");	//� � ��� ������?
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_06");	//�������� � ���. � ��� ��� ������ �� ���������.
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_07");	//� � ���� ��������� �������. �� � �� � ��� ���������.
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_08");	//� ���� �������.
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_09");	//������ - ��� ������. �� ��� ���� ���-���� ������. �� � ��������? 
		AI_Output(other,self,"DIA_Moe_Sarah_AboutNadja_16_10");	//�� ��.
	AI_Output(self,other,"DIA_Moe_Sarah_AboutNadja_01_11");	//������� ��� ���� ��������� ������ ����. ��� �����, ������� ��� ������ ���������, �� �� ��� �� �������.
	MIS_Sarah_BadHabit_MoeAsked = TRUE;
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_MoeWillTalk);
};
//-----------------------------------------
instance DIA_Moe_Sarah_WhereRum(C_INFO)
{
	npc = VLK_432_Moe;			nr = 3;
	condition = DIA_Moe_Sarah_WhereRum_cond;
	information = DIA_Moe_Sarah_WhereRum_info;
	description = "� ��� ��� ����� ���?";
};
func int DIA_Moe_Sarah_WhereRum_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_MoeAsked
		 && !Npc_HasItems(other,ItFo_Addon_Rum) && !MIS_Sarah_BadHabit_MoeTalked)	{
		return TRUE;
	};
};
func void DIA_Moe_Sarah_WhereRum_info()
{
		AI_Output(other,self,"DIA_Moe_Sarah_WhereRum_16_00");	//� ��� ��� ����� ���?
	AI_Output(self,other,"DIA_Moe_Sarah_WhereRum_01_01");	//��, ��� �� ��� ��������? �� � ����� ����, ��� �� ������-�� ��������� � �����.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_Bootleggers);

};
//-----------------------------------------
instance DIA_Moe_Sarah_GiveRum(C_INFO)
{
	npc = VLK_432_Moe;			nr = 4;
	condition = DIA_Moe_Sarah_GiveRum_cond;
	information = DIA_Moe_Sarah_GiveRum_info;
	description = "��� ���� ���.";
};
func int DIA_Moe_Sarah_GiveRum_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_MoeAsked
		 && Npc_HasItems(other,ItFo_Addon_Rum) && !MIS_Sarah_BadHabit_MoeTalked)	{
		return TRUE;
	};
};
func void DIA_Moe_Sarah_GiveRum_info()
{
		AI_Output(other,self,"DIA_Moe_Sarah_GiveRum_16_00");	//��� ���� ���.
	B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
	AI_Output(self,other,"DIA_Moe_Sarah_GiveRum_01_01");	//�������! � � ���� �����, ��� ��� ��� �������� � �����.
	AI_Output(self,other,"DIA_Moe_Sarah_GiveRum_01_02");	//����� ����, �� ������� ��� ��� �������. ��� �����.
	AI_Output(self,other,"DIA_Moe_Sarah_GiveRum_01_03");	//�� �� �� �������. ����� ��� ����. �������� �� ��������� ����� ����, ��� �� � ��� ������ ������ �� �����.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_MoeFailed);
	B_GivePlayerXP(XP_Sarah_Nadja_MoeTalked);
	MIS_Sarah_BadHabit_MoeTalked = TRUE;
};


///////////////////////////////////�����//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Elena(C_INFO)
{
	nr = 10;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Elena_cond;
	information = DIA_Moe_Hello_Elena_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Elena_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Elena_info()
{
	AI_Output(self,other,"DIA_Moe_Hello_Elena_01_00");	//��!
		AI_Output(other,self,"DIA_Moe_Hello_Elena_16_01");	//���? � ���� ��� �� ������� ������?
	AI_Output(self,other,"DIA_Moe_Hello_Elena_01_02");	//�������, �� ������ ���� ������������ - ������ ��� ������. � ����� ��� ����������, ���������� ����� �������, ��� ��.
	AI_Output(self,other,"DIA_Moe_Hello_Elena_01_03");	//���� ����� ��������, ���� ����.
	B_GivePlayerXP(XP_Moe_Respect);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
};

///////////////////////////////////������//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Talbin(C_INFO)
{
	nr = 20;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Talbin_cond;
	information = DIA_Moe_Hello_Talbin_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Talbin_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Talbin_info()
{
	AI_Output(self,other,"DIA_Moe_Hello_Talbin_01_01");	//�� ��������� ������� ������. �������.
	B_GivePlayerXP(XP_Moe_Respect);
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
};

///////////////////////////////////���//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Odo(C_INFO)
{
	nr = 30;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Odo_cond;
	information = DIA_Moe_Hello_Odo_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Odo_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Odo_info()
{
	if (!C_NpcWears(other, ItAr_NOV_L))	{
		AI_Output(self,other,"DIA_Moe_Hello_Odo_01_01");	//� �� ��� ���? �� ����� ���� ����� ������.
			AI_Output(other,self,"DIA_Moe_Hello_Odo_03_02");	//� ��������� �� ��������� ������.
	};
	AI_Output(self,other,"DIA_Moe_Hello_Odo_01_03");	//��� ���� ��� �����? ��� �� ��������, � ������� �� � ��� �� ����������.
	Info_ClearChoices(DIA_Moe_Hello_Odo);
	Info_AddChoice(DIA_Moe_Hello_Odo,"� ������ �������� ����.",DIA_Moe_Hello_Odo_PassBy);
	Info_AddChoice(DIA_Moe_Hello_Odo,"� ������ ���� ��������� ������.",DIA_Moe_Hello_Odo_GetIn);
};	
func void DIA_Moe_Hello_Odo_PassBy()
{
		AI_Output(other,self,"DIA_Moe_Hello_Odo_PassBy_03_01");	//� ������ �������� ����.
	AI_Output(self,other,"DIA_Moe_Hello_Odo_PassBy_01_01");	//��� � ���, ���� ���.
	_DIA_Moe_GoOut();
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Odo_GetIn()
{
		AI_Output(other,self,"DIA_Moe_Hello_Odo_GetIn_03_01");	//� ������ ���� ��������� ������.
	AI_Output(self,other,"DIA_Moe_Hello_Odo_01_GetIn_01");	//�������. ���� � ����� ����� 50 �������.
	Info_ClearChoices(DIA_Moe_Hello_Odo);
	Info_AddChoice(DIA_Moe_Hello_Odo,"� �� ���� ��������� �������.",DIA_Moe_Hello_Odo_NoPay);
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Moe_Hello_Odo,"���, ������.",DIA_Moe_Hello_Odo_Pay);
	};
};
func void DIA_Moe_Hello_Odo_Pay()
{
	B_GiveGold(other,self,50);
		AI_Output(other,self,"DIA_Moe_Hello_Odo_Pay_03_01");	//���, ������.
	AI_Output(self,other,"DIA_Moe_Hello_Odo_Pay_01_01");	//���������, ���� ������� ��������������������.
	B_GivePlayerXP(XP_Moe_Respect);
	Moe_Sign = TRUE;
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Odo_NoPay()
{	
		AI_Output(other,self,"DIA_Moe_Hello_Odo_NoPay_03_01");	//� �� ���� ��������� �������.
	AI_Output(self,other,"DIA_Moe_Hello_Odo_NoPay_01_01");	//����� �������. ����� � �� ���� �������� ����.
	_DIA_Moe_GoOut();
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Moe_Odo_AskPay(C_INFO)
{
	nr = 31;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Odo_AskPay_cond;
	information = DIA_Moe_Odo_AskPay_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Moe_Odo_AskPay_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Odo()
		&& Npc_KnowsInfo(other,DIA_Moe_Hello_Odo))	{
		return TRUE;
	};
};
func void DIA_Moe_Odo_AskPay_info()
{
	AI_Output(self,other,"DIA_Moe_Odo_AskPay_01_00");	//���� ������ ����� - ����� 50 �������.
	Info_ClearChoices(DIA_Moe_Odo_AskPay);
	Info_AddChoice(DIA_Moe_Odo_AskPay,"� �� ���� ��������� �������.",DIA_Moe_Hello_Odo_NoPay);
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Moe_Odo_AskPay,"���, ������.",DIA_Moe_Hello_Odo_Pay);
	};
};

///////////////////////////////////����//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Erol(C_INFO)
{
	nr = 40;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Erol_cond;
	information = DIA_Moe_Hello_Erol_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Erol_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Erol_info()
{
	AI_Output(self,other,"DIA_Moe_Hello_Erol_01_00");	//� �� ��� �����? ��������, ������ ������� ����� �� �������� ��������, � ����� ����� � ��� �������� �������� �����.
	Info_ClearChoices(DIA_Moe_Hello_Erol);
	Info_AddChoice(DIA_Moe_Hello_Erol,"� �� ������ ���� ����������?",DIA_Moe_Hello_Erol_StopMe);
	Info_AddChoice(DIA_Moe_Hello_Erol,"������ ���������, ����� � � �����?",DIA_Moe_Hello_Erol_Fight);
	Info_AddChoice(DIA_Moe_Hello_Erol,"� �� ��������� ���� � ���� �����.",DIA_Moe_Hello_Erol_WontGo);
	Info_AddChoice(DIA_Moe_Hello_Erol,"���� ����������. � �� ��� � �����.",DIA_Moe_Hello_Erol_PassBy);
};
func void DIA_Moe_Hello_Erol_PassBy()
{
		AI_Output(other,self,"DIA_Moe_Hello_Erol_PassBy_10_00");	//���� ����������. � �� ��� � �����.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_PassBy_01_01");	//� ����� ���-���� �������? ���� ����� ����� 100 �������.
	Info_ClearChoices(DIA_Moe_Hello_Erol);
	Info_AddChoice(DIA_Moe_Hello_Erol,"� �� ��������� ���� �������.",DIA_Moe_Hello_Erol_NoPay);
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Moe_Hello_Erol,"50 ������� � �� ������� ������.",DIA_Moe_Hello_Erol_Pay50);
	};
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Moe_Hello_Erol,"��������. ��� ������. (100 ���.)",DIA_Moe_Hello_Erol_Pay100);
	};
};
func void DIA_Moe_Hello_Erol_Pay100()
{
	B_GiveGold(other,self,100);
		AI_Output(other,self,"DIA_Moe_Hello_Erol_Pay100_10_00");	//��������. ��� ������.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_Pay100_01_01");	//����� ����������. (������ �������)
	Moe_Sign = TRUE;
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Erol_Pay50()
{
	B_GiveGold(other,self,50);
		AI_Output(other,self,"DIA_Moe_Hello_Erol_Pay50_10_00");	//50 ������� � �� ������� ������.
		AI_Output(other,self,"DIA_Moe_Hello_Erol_Pay50_10_01");	//������ ����������� ����� ���������, �� � �� ������, ��� ���� ������� ��������� �����.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_Pay50_01_02");	//� ����, �� ������ �� ������. �������.
	B_GivePlayerXP(XP_Moe_Respect);
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Erol_NoPay()
{
		AI_Output(other,self,"DIA_Moe_Hello_Erol_NoPay_10_00");	//� �� ��������� ���� �������.
		AI_Output(other,self,"DIA_Moe_Hello_Erol_NoPay_10_01");	//���� � ������, �� � ����� � ���� �����.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_NoPay_01_02");	//������? ����� ���������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
func void DIA_Moe_Hello_Erol_WontGo()
{
		AI_Output(other,self,"DIA_Moe_Hello_Erol_WontGo_10_00");	//� �� ��������� ���� � ���� �����, ���� ���� �� ��� ��������� �� ���.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_WontGo_01_01");	//��� ���? ������, ����� � ���� ������� �������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};
func void DIA_Moe_Hello_Erol_Fight()
{
			AI_Output(other,self,"DIA_Moe_Hello_Erol_Fight_10_00");	//������ ���������, ����� � � �����?
		AI_Output(self,other,"DIA_Moe_Hello_Erol_Fight_01_01");	//��, ��� �� ��� ������� ������... ���������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
func void DIA_Moe_Hello_Erol_StopMe()
{
		AI_Output(other,self,"DIA_Moe_Hello_Erol_StopMe_10_00");	//� �� ������ ���� ����������?
	AI_Output(self,other,"DIA_Moe_Hello_Erol_StopMe_01_01");	//(���������� �������) ���, �������.
	B_GivePlayerXP(XP_Moe_Respect);
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Moe_Erol_FightAfter(C_INFO)
{
	nr = 41;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Erol_FightAfter_cond;
	information = DIA_Moe_Erol_FightAfter_info;
	important = TRUE;
};
func int DIA_Moe_Erol_FightAfter_cond()
{
	if (C_HeroIs_Erol() && Npc_KnowsInfo(other,DIA_Moe_Hello_Erol)
		&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))	{
		return TRUE;
	};
};
func void DIA_Moe_Erol_FightAfter_info()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Moe_Erol_FightAfter_01_00");	//���, ��� ������... �� � ���� � ����!
		AI_Output(self,other,"DIA_Moe_Erol_FightAfter_01_01");	//������, �� ���-���� ��������� ����� �����. ������.
		B_GivePlayerXP(XP_Moe_Respect);
	}
	else	{
		AI_Output(self,other,"DIA_Moe_Erol_FightAfter_01_02");	//��� ������, �� ������ ����������� �� ����.
	};
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_DIST_CANCEL)	{
		self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	};
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Moe_Erol_AskPay(C_INFO)
{
	nr = 42;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Erol_AskPay_cond;
	information = DIA_Moe_Erol_AskPay_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Moe_Erol_AskPay_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Erol()
		&& Npc_KnowsInfo(other,DIA_Moe_Hello_Erol)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))	{
		return TRUE;
	};
};
func void DIA_Moe_Erol_AskPay_info()
{
	AI_Output(self,other,"DIA_Moe_Erol_AskPay_01_00");	//���� ������ ����� - ����� 100 �������.
	Info_ClearChoices(DIA_Moe_Erol_AskPay);
	Info_AddChoice(DIA_Moe_Erol_AskPay,"� �� ��������� ���� �������.",DIA_Moe_Hello_Erol_NoPay2);
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Moe_Erol_AskPay,"��������. ��� ������. (100 ���.)",DIA_Moe_Hello_Erol_Pay100);
	};
};

func void DIA_Moe_Hello_Erol_NoPay2()
{
		AI_Output(other,self,"DIA_Moe_Hello_Erol_NoPay_10_00");	//� �� ��������� ���� �������.
	AI_Output(self,other,"DIA_Moe_Hello_Erol_NoPay2_01_02");	//������ �� ��� � �� �����, ����� ��� �������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


///////////////////////////////////������//////////////////////////////////////
var int Moe_Rupert_GiveBottle;
var int DIA_Moe_Hello_Rupert_Once;
//-----------------------------------------
instance DIA_Moe_Hello_Rupert(C_INFO)
{
	nr = 50;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Rupert_cond;
	information = DIA_Moe_Hello_Rupert_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Moe_Hello_Rupert_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Rupert()
		&& (MIS_Rupert_Debts_Paid[Creditor_Kardif] == FALSE))	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Rupert_info()
{
	if (!DIA_Moe_Hello_Rupert_Once)	{
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_01_00");	//� � �� �����, ��� �� ��� ������ �� ���������.
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_01_01");	//������ ������ ���������, ��� �� ������ ��� 60 �������. � � �� ����� ����, ���� �� �� �������� ����.
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Kardif_Sum);
		DIA_Moe_Hello_Rupert_Once = TRUE;
	}
	else	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)	{
			AI_Output(self,other,"DIA_Moe_Rupert_AskPay_01_01");	//�������, ������� ��� �� ���� �������.
			AI_Output(self,other,"DIA_Moe_Rupert_AskPay_01_02");	//��� �� �������� ������ ����� ����� ��������.
		};
		AI_Output(self,other,"DIA_Moe_Rupert_AskPay_01_00");	//�� ��� ��� ������ 60 �������.
	};
	Info_ClearChoices(DIA_Moe_Hello_Rupert);
	Info_AddChoice(DIA_Moe_Hello_Rupert,"� ���� ��� �����.",DIA_Moe_Hello_Rupert_NoPay);
	if (C_NpcHasGold(other,60))	{
		Info_AddChoice(DIA_Moe_Hello_Rupert,"��� ������. (60 ���.)",DIA_Moe_Hello_Rupert_Pay);
	};
};
func void DIA_Moe_Hello_Rupert_Pay()
{
	B_GiveGold(other,self,60);
	B_RupertPayDebt(Creditor_Kardif);
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
		AI_Output(other,self,"DIA_Moe_Hello_Rupert_Pay_03_00");	//��� ������.
	AI_Output(self,other,"DIA_Moe_Hello_Rupert_Pay_01_01");	//����������. �� ��� �������. �� �������� ���� ����������?
		AI_Output(other,self,"DIA_Moe_Hello_Rupert_Pay_03_02");	//� �� �� �������, ��� ������� ���-������ ������� ���� ���������� �� ������?
	AI_Output(self,other,"DIA_Moe_Hello_Rupert_Pay_01_03");	//��� ���������, ��� ������. ��� ��������?
	Moe_Rupert_GiveBottle = 1;
	Info_ClearChoices(DIA_Moe_Hello_Rupert);
	Info_AddChoice(DIA_Moe_Hello_Rupert,"����������.",DIA_Moe_Hello_Rupert_NoBottle);
	if (Npc_HasItems(other,ItFo_Booze))	{
		Info_AddChoice(DIA_Moe_Hello_Rupert,"���, ����� �������.",DIA_Moe_Hello_Rupert_GiveBottle);
	}
	else	{
		Info_AddChoice(DIA_Moe_Hello_Rupert,"�����, ����� ��� � ���� �����.",DIA_Moe_Hello_Rupert_BottleLater);
	};
};
func void DIA_Moe_Hello_Rupert_GiveBottle()
{
	B_GiveInvItems(other,self,ItFo_Booze,1);
	Moe_Rupert_GiveBottle = 2;
		AI_Output(other,self,"DIA_Moe_Hello_Rupert_GiveBottle_03_00");	//���, ����� �������.
	AI_Output(self,other,"DIA_Moe_Hello_Rupert_GiveBottle_01_01");	//��� �������.
	if (!MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_GiveBottle_01_02");	//�� ��� � ��� ���� ����� - ���� ������ ������������ � �������, ������� ��� ��� �� ���������� ����.
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_GiveBottle_01_03");	//�� ���� �� ������� ����� ����.
		B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Lehmar_Alt);
		B_GivePlayerXP(XP_Moe_Respect);
		MIS_Rupert_Debts_Lehmar_Sword = MIS_Rupert_Debts_Lehmar_SwordKnown;
	};
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Rupert_BottleLater()
{
	AI_Output(other,self,"DIA_Moe_Hello_Rupert_BottleLater_03_00");	//�����, ����� ��� � ���� �����.
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_BottleLater_01_01");	//��� ���� ������? ������.
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Rupert_NoBottle()
{
	AI_Output(other,self,"DIA_Moe_Hello_Rupert_NoBottle_03_00");	//����������.
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_NoBottle_01_01");	//� ���� ��� ��������.
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Rupert_NoPay()
{
	AI_Output(other,self,"DIA_Moe_Hello_Rupert_NoPay_03_00");	//� ���� ��� �����.
	if (!C_NpcHasGold(other,100))	{
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_NoPay_01_01");	//����� ��� � ������� ��.
		_DIA_Moe_GoOut();
		AI_StopProcessInfos(self);
	}
	else	{
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_NoPay_01_02");	//�� ������� �������� ����! � ���� ������ ������� ������!
		AI_Output(self,other,"DIA_Moe_Hello_Rupert_NoPay_01_03");	//� ���� �� �� ������ ��� ��������, �� � ������ ��� ���!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};
//-----------------------------------------
instance DIA_Moe_Rupert_GiveBottle(C_INFO)
{
	nr = 51;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Rupert_GiveBottle_cond;
	information = DIA_Moe_Hello_Rupert_GiveBottle;
	description = "���, ����� �������.";
};
func int DIA_Moe_Rupert_GiveBottle_cond()
{
	if (C_HeroIs_Rupert()
		&& (Moe_Rupert_GiveBottle == 1) && (Npc_HasItems(other,ItFo_Booze)))	{
		return TRUE;
	};
};

///////////////////////////////////����//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_Hello_Till(C_INFO)
{
	nr = 60;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Hello_Till_cond;
	information = DIA_Moe_Hello_Till_info;
	important = TRUE;
};
func int DIA_Moe_Hello_Till_cond()
{
	if (DIA_Moe_AllCond() && C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Moe_Hello_Till_info()
{
	AI_Output(self,other,"DIA_Moe_Hello_Till_01_00");	//��� ��� � ��� ���? �����, ����� �� �������� ������. ��� � ����� �������, ������� � ���.
	Info_ClearChoices(DIA_Moe_Hello_Till);
	Info_AddChoice(DIA_Moe_Hello_Till,"���� � ������� ����, �� ���� ��������?",DIA_Moe_Hello_Till_WannaPay);
	Info_AddChoice(DIA_Moe_Hello_Till,"� �� �����! � � ��� � �����.",DIA_Moe_Hello_Till_NotKid);
	Info_AddChoice(DIA_Moe_Hello_Till,"��� �����.",DIA_Moe_Hello_Till_PassBy);
};
func void DIA_Moe_Hello_Till_PassBy()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_PassBy_14_00");	//��� �����.
	AI_Output(self,other,"DIA_Moe_Hello_Till_PassBy_01_01");	//�� ��� ������. ������� �����-�� ��� ���� ������, � �� � ���� �� ���-������ �������. (����������)
	Info_ClearChoices(DIA_Moe_Hello_Till);
	Info_AddChoice(DIA_Moe_Hello_Till,"������ � ���� �� �����!",DIA_Moe_Hello_Till_WontPay);
	Info_AddChoice(DIA_Moe_Hello_Till,"������ ���, ������ �� ��� ����!",DIA_Moe_Hello_Till_GetAllGold);
	Info_AddChoice(DIA_Moe_Hello_Till,"� ���� ������ ���.",DIA_Moe_Hello_Till_NoGold);
};
func void DIA_Moe_Hello_Till_NoGoldTrue()
{
	AI_Output(self,other,"DIA_Moe_Hello_Till_NoGoldTrue_01_00");	//��, �� �� �����. �����, ���. ���� ������ ����, ������� � ����.
	B_GivePlayerXP(XP_Moe_Respect);
};
func void DIA_Moe_Hello_Till_NoGoldFalse()
{
	AI_Output(self,other,"DIA_Moe_Hello_Till_NoGoldFalse_01_00");	//� ��� ���? ���� �� �����, ��� ����� ��������?
	AI_Output(self,other,"DIA_Moe_Hello_Till_NoGoldFalse_01_01");	//�����, ���. � ������� ������.
};
func void DIA_Moe_Hello_Till_NoGold()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_NoGold_14_00");	//� ���� ������ ���.
	AI_Output(self,other,"DIA_Moe_Hello_Till_NoGold_01_01");	//�����-�� ��������... ����������� �������!
	if (C_NpcHasGold(other,10))	{
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
		DIA_Moe_Hello_Till_NoGoldFalse();
	}
	else	{
		DIA_Moe_Hello_Till_NoGoldTrue();
	};
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Till_GetAllGold()
{
	var int sum;	sum = Npc_HasItems(other,ItMi_Gold);
		AI_Output(other,self,"DIA_Moe_Hello_Till_GetAllGold_14_00");	//������ ���, ������ �� ��� ����!
	AI_Output(self,other,"DIA_Moe_Hello_Till_GetAllGold_01_01");	//������. ����������� �� ����.
	if (sum > 10)	{
		B_GiveInvItems(other,self,ItMi_Gold,sum);
		if (sum > 20)	{
			AI_Output(self,other,"DIA_Moe_Hello_Till_GetAllGold_01_02");	//���, ������ 10 ����� �� �����������������.
			B_GiveInvItems(self,other,ItMi_Gold,10);
		};
	}
	else	{
		DIA_Moe_Hello_Till_NoGoldTrue();
	};
	AI_StopProcessInfos(self);
	Info_ClearChoices(DIA_Moe_Hello_Till);
};
func void DIA_Moe_Hello_Till_WontPay()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_WontPay_14_00");	//������ � ���� �� �����!
	AI_Output(self,other,"DIA_Moe_Hello_Till_WontPay_01_01");	//�, ��� �� ����������. ����� ���������, ��� �� �� �� ������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
func void DIA_Moe_Hello_Till_NotKid()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_NotKid_14_00");	//� �� �����! � � ��� � �����.
	AI_Output(self,other,"DIA_Moe_Hello_Till_NotKid_01_01");	//��� ���? ����� ������ ���, ����� �� ��������.
	AI_Output(self,other,"DIA_Moe_Hello_Till_NotKid_01_02");	//�������� ������, ���� �������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
func void DIA_Moe_Hello_Till_WannaPay()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_WannaPay_14_00");	//���� � ������� ����, �� ���� ��������?
	AI_Output(self,other,"DIA_Moe_Hello_Till_WannaPay_01_01");	//��� �� � ��� �����������? ��� ������ ����� �������?
	Info_ClearChoices(DIA_Moe_Hello_Till);
	Info_AddChoice(DIA_Moe_Hello_Till,"��� ������� �����.",DIA_Moe_Hello_Till_WannaPayTooMuch);
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Moe_Hello_Till,"�����. (100 ���.)",DIA_Moe_Hello_Till_WannaPayGive);
	};
};
func void DIA_Moe_Hello_Till_WannaPayGive()
{
	B_GiveGold(other,self,100);
		AI_Output(other,self,"DIA_Moe_Hello_Till_WannaPayGive_14_00");	//�����.
	Moe_Sign = TRUE;
	AI_Output(self,other,"DIA_Moe_Hello_Till_WannaPayGive_01_01");	//����� ���������� � �����, �����.
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
func void DIA_Moe_Hello_Till_WannaPayTooMuch()
{
		AI_Output(other,self,"DIA_Moe_Hello_Till_WannaPayTooMuch_14_00");	//��� ������� �����.
	AI_Output(self,other,"DIA_Moe_Hello_Till_WannaPayTooMuch_01_01");	//����� �������. ����� ����� ���. ��� � ���� ����.
	if (C_NpcHasGold(other,10))	{
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
		AI_Output(self,other,"DIA_Moe_Hello_Till_WannaPayTooMuch_01_02");	//���, �� ��� �� �����... �������.
	}
	else	{
		AI_Output(self,other,"DIA_Moe_Hello_Till_WannaPayTooMuch_01_03");	//�� � ���� �� ������ ���. ������, �� ����� ����� ������ ������� �� ����. ������� ��� ������ ���� �����.
		B_GivePlayerXP(XP_Moe_Respect);
	};
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};
//-----------------------------------------
instance DIA_Moe_Till_FightAfter(C_INFO)
{
	nr = 61;
	npc = VLK_432_Moe;
	condition = DIA_Moe_Till_FightAfter_cond;
	information = DIA_Moe_Till_FightAfter_info;
	important = TRUE;
};
func int DIA_Moe_Till_FightAfter_cond()
{
	if (C_HeroIs_Till() && Npc_KnowsInfo(other,DIA_Moe_Hello_Till)
		&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))	{
		return TRUE;
	};
};
func void DIA_Moe_Till_FightAfter_info()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Moe_Till_FightAfter_01_00");	//���� ������ �������.
	}
	else	{
		AI_Output(self,other,"DIA_Moe_Till_FightAfter_01_01");	//�������, ���� ���� ����� ���� �� ������.
	};
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	AI_StopProcessInfos(self);
};

///////////////////////////////////���//////////////////////////////////////
//-----------------------------------------
instance DIA_Moe_News(C_INFO)
{
	nr = 100;
	npc = VLK_432_Moe;
	condition = DIA_Moe_News_cond;
	information = DIA_Moe_News_info;
	permanent = TRUE;
	description = "����� �������?";
};
func int DIA_Moe_News_cond()
{
	return TRUE;
};
func void DIA_Moe_News_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Moe_News_03_00");	//����� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Moe_News_07_00");	//����� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Moe_News_10_00");	//����� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Moe_News_14_00");	//����� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Moe_News_16_00");	//����� �������?
	};
	if (!C_HeroIs_Sarah())	{
		AI_Output(self,other,"DIA_Moe_News_01_01");	//������, ��� �� ���� ��������������.
	}
	else	{
		AI_Output(self,other,"DIA_Moe_News_01_02");	//����� �������� � ��������.
	};
};
