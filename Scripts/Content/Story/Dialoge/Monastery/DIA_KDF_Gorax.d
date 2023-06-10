
instance DIA_Gorax_EXIT(DIA_Proto_End)
{
	npc = KDF_508_Gorax;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

// ==============================================
instance DIA_Gorax_Odo_HasJob(C_INFO)
{

	npc = KDF_508_Gorax;			nr = 1;
	condition = DIA_Gorax_Odo_HasJob_cond;
	information = DIA_Gorax_Odo_HasJob_info;
	description = "�� ������ ���� ������, ������?";
};
func int DIA_Gorax_Odo_HasJob_cond()
{
	if (C_HeroIs_Odo()
		 && (MIS_Odo_Herbs == LOG_SUCCESS))	{
		return TRUE;
	};
};
func void DIA_Gorax_Odo_HasJob_info()
{
		AI_Output(other,self,"DIA_Gorax_Odo_HasJob_03_00");	//�� ������ ���� ������, ������?
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_01");	//��. ������ ������ ��������� � ����� ������������, ������� � ���� �������� ���� ���� �������.
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_02");	//��� �����, ��� �� ��� ����� ����� ������� �� ����� ��������� � ������� ����.
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_03");	//� ����. ������������ ����, � ����� ������� ���������� ���-����� ������.
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_04");	//� ������ �������, �� ��������� � ���� ��� ����� ����.
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_05");	//������ ��������� ����� � ����� ������ �� ���� � ���� ����. �� �� ������ ��������� �������� ����.
	AI_Output(self,other,"DIA_Gorax_Odo_HasJob_14_06");	//����� � ����, ��� ����� ��� ������.
	B_LogEntry_Create(TOPIC_Odo_Straw,LOG_MISSION,TOPIC_Odo_Straw_Start);
	MIS_Odo_Straw = LOG_Running;
	if (Npc_IsDead(BAU_940_Akil))	{
		B_CloseLogOnDeath(BAU_940_Akil);
	};
	if (Npc_IsDead(BAU_950_Lobart))	{
		B_CloseLogOnDeath(BAU_950_Lobart);
	};
	if (Npc_IsDead(BAU_930_Sekob))	{
		B_CloseLogOnDeath(BAU_930_Sekob);
	};
	if (Npc_IsDead(BAU_960_Bengar))	{
		B_CloseLogOnDeath(BAU_960_Bengar);
	};
};

// ==============================================
instance DIA_Gorax_Odo_AboutStraw(C_INFO)
{

	npc = KDF_508_Gorax;			nr = 2;
	condition = DIA_Gorax_Odo_AboutStraw_cond;
	information = DIA_Gorax_Odo_AboutStraw_info;
	description = "�� ������ ����...";
	permanent = TRUE;
};
func int DIA_Gorax_Odo_AboutStraw_cond()
{
	if (C_HeroIs_Odo()
		 && (MIS_Odo_Straw == LOG_Running)
		 && !MIS_Odo_Straw_MoneyGiven)	{
		return TRUE;
	};
};
func void DIA_Gorax_Odo_AboutStraw_Menu()
{
	Info_ClearChoices(DIA_Gorax_Odo_AboutStraw);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"...� ���� ������ ������ �� �����.",DIA_Gorax_Odo_AboutStraw_Back);
	if ((MIS_Odo_Straw_Lobart[0] > 0) && (MIS_Odo_Straw_Lobart[1] > 0) && !MIS_Odo_Straw_Lobart[Straw_Told])	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� �������...",DIA_Gorax_Odo_AboutStraw_Lobart);
	};
	if ((MIS_Odo_Straw_Akil[0] > 0) && (MIS_Odo_Straw_Akil[1] > 0) && !MIS_Odo_Straw_Akil[Straw_Told])	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� �����...",DIA_Gorax_Odo_AboutStraw_Akil);
	};
	if ((MIS_Odo_Straw_Bengar[0] > 0) && (MIS_Odo_Straw_Bengar[1] > 0) && !MIS_Odo_Straw_Bengar[Straw_Told])	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� �������...",DIA_Gorax_Odo_AboutStraw_Bengar);
	};
	if ((MIS_Odo_Straw_Sekob[0] > 0) && (MIS_Odo_Straw_Sekob[1] > 0) && !MIS_Odo_Straw_Sekob[Straw_Told])	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� ������...",DIA_Gorax_Odo_AboutStraw_Sekob);
	};
	if ((MIS_Odo_Straw_Onar[0] > 0) && (MIS_Odo_Straw_Onar[1] > 0) && !MIS_Odo_Straw_Onar[Straw_Told])	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� ��������� �����...",DIA_Gorax_Odo_AboutStraw_Onar);
	};
	if (MIS_Odo_Straw_Cnt == MIS_Odo_Straw_All)	{
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� ������ ��� �����.",DIA_Gorax_Odo_AboutStraw_All);
	};
};

func void DIA_Gorax_Odo_AboutStraw_info()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_03_00");	//�� ������ ����...
	DIA_Gorax_Odo_AboutStraw_Menu();
};
func void DIA_Gorax_Odo_AboutStraw_Back()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Back_03_00");	//...� ���� ������ ������ �� �����.
	Info_ClearChoices(DIA_Gorax_Odo_AboutStraw);
};
func void DIA_Gorax_Odo_AboutStraw_Onar()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Onar_03_00");	//� ����� ���� �� 17 ������� �� ���.
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Onar_03_01");	//� ��� ��������� ��������.
	MIS_Odo_Straw_Onar[Straw_Told] = 1;
	MIS_Odo_Straw_Cnt += 1;
	B_GivePlayerXP(XP_Odo_Straw_Onar);
	DIA_Gorax_Odo_AboutStraw_Menu();
};
func void DIA_Gorax_Odo_AboutStraw_Sekob()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Sekob_03_00");	//����� ������ �� 19 ������� �� ��� ����.
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Sekob_03_01");	//�� ��� ����������, ������.
	MIS_Odo_Straw_Sekob[Straw_Told] = 1;
	MIS_Odo_Straw_Cnt += 1;
	B_GivePlayerXP(XP_Odo_Straw_Sekob);
	DIA_Gorax_Odo_AboutStraw_Menu();
};
func void DIA_Gorax_Odo_AboutStraw_Bengar()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Bengar_03_00");	//� ������� ��� ���� ����� 16 �������.
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Bengar_03_01");	//���� � ���� ��������, ������ � ��������.
	MIS_Odo_Straw_Bengar[Straw_Told] = 1;
	MIS_Odo_Straw_Cnt += 1;
	B_GivePlayerXP(XP_Odo_Straw_Bengar);
	DIA_Gorax_Odo_AboutStraw_Menu();
};
func void DIA_Gorax_Odo_AboutStraw_Akil()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Akil_03_00");	//���� ���������� ���� ����� �� 15 ������� �� ���.
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Akil_03_01");	//���� � ���� ������� �������.
	MIS_Odo_Straw_Akil[Straw_Told] = 1;
	MIS_Odo_Straw_Cnt += 1;
	B_GivePlayerXP(XP_Odo_Straw_Akil);
	DIA_Gorax_Odo_AboutStraw_Menu();
};
func void DIA_Gorax_Odo_AboutStraw_Lobart()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Lobart_03_00");	//������ ������� ���� �� 16 ������� �� ���.
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_Lobart_03_01");	//���� ��������, �� � �� ����� ������. �������� � ��� ���.
	MIS_Odo_Straw_Lobart[Straw_Told] = 1;
	MIS_Odo_Straw_Cnt += 1;
	B_GivePlayerXP(XP_Odo_Straw_Lobart);
	DIA_Gorax_Odo_AboutStraw_Menu();
};
func void DIA_Gorax_Odo_AboutStraw_All()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_All_03_00");	//� ������ ��� �����.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_All_14_01");	//������. � ��� �� �� ����� ����, ���� �� ��� ��������?
	Info_ClearChoices(DIA_Gorax_Odo_AboutStraw);
	if (MIS_Odo_Straw_Lobart[Straw_Told]) {
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� �������.",DIA_Gorax_Odo_AboutStraw_BuyLobart);
	};
	if (MIS_Odo_Straw_Akil[Straw_Told]) {
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� �����.",DIA_Gorax_Odo_AboutStraw_BuyAkil);
	};
	if (MIS_Odo_Straw_Bengar[Straw_Told]) {
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� �������.",DIA_Gorax_Odo_AboutStraw_BuyBengar);
	};
	if (MIS_Odo_Straw_Sekob[Straw_Told]) {
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� ������.",DIA_Gorax_Odo_AboutStraw_BuySekob);
	};
	if (MIS_Odo_Straw_Onar[Straw_Told]) {
		Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"� �����.",DIA_Gorax_Odo_AboutStraw_BuyOnar);
	};
};
func void DIA_Gorax_Odo_AboutStraw_DoBuyBengar()
{
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_DoBuyBengar_14_01");	//�� ������� ���� � �������.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_DoBuyBengar_14_02");	//����� ��� ����������� 32 ����. � ������ ���...
	Info_ClearChoices(DIA_Gorax_Odo_AboutStraw);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"(����������)",DIA_Gorax_Odo_AboutStraw_None);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"480.",DIA_Gorax_Odo_AboutStraw_480g);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"498.",DIA_Gorax_Odo_AboutStraw_498g);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"512.",DIA_Gorax_Odo_AboutStraw_512g);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"524.",DIA_Gorax_Odo_AboutStraw_524g);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"532.",DIA_Gorax_Odo_AboutStraw_532g);
	Info_AddChoice(DIA_Gorax_Odo_AboutStraw,"544.",DIA_Gorax_Odo_AboutStraw_544g);
};
func void DIA_Gorax_Odo_AboutStraw_BuyLobart()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_BuyLobart_03_00");	//� �������.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuyLobart_14_01");	//��, �� �� ��� ������, ��� ��� �� ����� ������.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuyLobart_14_02");	//���� ��� ��������� ������� ���������.
	DIA_Gorax_Odo_AboutStraw_DoBuyBengar();
};
func void DIA_Gorax_Odo_AboutStraw_BuyAkil()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_BuyAkil_03_00");	//� �����.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuyAkil_14_01");	//��� ����� �������, �� �������. ����� �� ������ ����� � ����.
	DIA_Gorax_Odo_AboutStraw_DoBuyBengar();
};
func void DIA_Gorax_Odo_AboutStraw_BuyBengar()
{
	MIS_Odo_Straw_BengarChoosen = TRUE;
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_BuyBengar_03_00");	//� �������.
	B_GivePlayerXP(XP_Odo_Straw_Right1);
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuyBengar_14_01");	//������� �����! ��� � ��������.
	DIA_Gorax_Odo_AboutStraw_DoBuyBengar();
};
func void DIA_Gorax_Odo_AboutStraw_BuySekob()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_BuySekob_03_00");	//� ������.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuySekob_14_01");	//�������� �����... �� ����� ����������� ������ � ���� ������ � ����� ������� ����.
	DIA_Gorax_Odo_AboutStraw_DoBuyBengar();
};
func void DIA_Gorax_Odo_AboutStraw_BuyOnar()
{
		AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_BuyOnar_03_00");	//� �����.
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_BuyOnar_14_01");	//�� �������� � ���� ���� � ������� ����... �� ������ ���� ����� �������� �����������.
	DIA_Gorax_Odo_AboutStraw_DoBuyBengar();
};
func void DIA_Gorax_Odo_AboutStraw_GiveGold()
{
	MIS_Odo_Straw_MoneyGiven = TRUE;
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_GiveGold_14_01");	//������ ������ � ������, ���� ���� � �������. �� ����������!
	B_GiveGold(self,other,512);
	B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Told);
	Info_ClearChoices(DIA_Gorax_Odo_AboutStraw);
};
func void DIA_Gorax_Odo_AboutStraw_None()
{
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_None_14_01");	//...512 �������.
	DIA_Gorax_Odo_AboutStraw_GiveGold();
};
func void DIA_Gorax_Odo_AboutStraw_Wrong()
{
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_Wrong_14_01");	//���, �� ������. ��� 512 �������.
	DIA_Gorax_Odo_AboutStraw_GiveGold();
};
func void DIA_Gorax_Odo_AboutStraw_Right()
{
	B_GivePlayerXP(XP_Odo_Straw_Right2);
	AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_Right_14_01");	//�����!
	if (MIS_Odo_Straw_BengarChoosen)	{
		AI_Output(self,other,"DIA_Gorax_Odo_AboutStraw_Right_14_02");	//�� ���������� ����������� � ���������� ����������.
	};
	DIA_Gorax_Odo_AboutStraw_GiveGold();
};
func void DIA_Gorax_Odo_AboutStraw_480g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_480g_14_01");	//480.
	DIA_Gorax_Odo_AboutStraw_Wrong();
};
func void DIA_Gorax_Odo_AboutStraw_498g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_498g_14_01");	//498.
	DIA_Gorax_Odo_AboutStraw_Wrong();
};
func void DIA_Gorax_Odo_AboutStraw_512g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_512g_14_01");	//512.
	DIA_Gorax_Odo_AboutStraw_Right();
};
func void DIA_Gorax_Odo_AboutStraw_524g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_524g_14_01");	//524.
	DIA_Gorax_Odo_AboutStraw_Wrong();
};
func void DIA_Gorax_Odo_AboutStraw_532g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_532g_14_01");	//532.
	DIA_Gorax_Odo_AboutStraw_Wrong();
};
func void DIA_Gorax_Odo_AboutStraw_544g()
{
	AI_Output(other,self,"DIA_Gorax_Odo_AboutStraw_544g_14_01");	//544.
	DIA_Gorax_Odo_AboutStraw_Wrong();
};



// �������� ==============================================
instance DIA_Gorax_MRTrade(C_INFO)
{
	nr = 50;
	npc = KDF_508_Gorax;
	condition = DIA_Gorax_MRTrade_cond;
	information = DIA_Gorax_MRTrade_info;
	description = "��� ���-��� �����, ������...";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Gorax_MRTrade_cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Gorax_MRTrade_info()
{
	if (!Gorax_Trade_Once || (Wld_GetFullTime() - self.aivar[AIV_TalkedToPlayer] > 12 * 60 * 60)) { 
			AI_Output(other,self,"DIA_Gorax_MRTrade_03_00");	//��� ���-��� �����, ������...
		AI_Output(self,other,"DIA_Gorax_MRTrade_14_01");	//��� ����� ���� ����, ���� ���.
	};
	if (!Gorax_Trade_Once)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Gorax);
		Gorax_Trade_Once = TRUE;
	};
	B_GiveTradeInv_Gorax(self);
};

