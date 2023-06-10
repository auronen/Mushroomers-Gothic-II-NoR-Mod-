

instance DIA_Rupert_EXIT(DIA_Proto_End)
{
	npc = CMP_Rupert;
};

// ===============================================
instance DIA_Rupert_MR_Hello(C_INFO)
{
	npc = CMP_Rupert;		nr = 1;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Rupert_MR_Hello_info;
	description = "�� ���� ���������� � �������� ������?";
};
func void DIA_Rupert_MR_Hello_info()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_MR_Hello_03_00");	//�� ���� ���������� � �������� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_MR_Hello_07_00");	//�� ���� ���������� � �������� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_MR_Hello_10_00");	//�� ���� ���������� � �������� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_MR_Hello_14_00");	//�� ���� ���������� � �������� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_MR_Hello_16_00");	//�� ���� ���������� � �������� ������?
	};
	AI_Output(self,other,"DIA_Rupert_MR_Hello_03_01");	//��. ��� ������� ����� ������.
};
// ===============================================
instance DIA_Rupert_Advice(C_INFO)
{
	npc = CMP_Rupert;		nr = 2;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Rupert_Advice_info;
	description = "�����, �������� ���� �� �������?";
};
func void DIA_Rupert_Advice_info()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_Advice_03_00");	//�����, �������� ���� �� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_Advice_07_00");	//�����, �������� ���� �� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_Advice_10_00");	//�����, �������� ���� �� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_Advice_14_00");	//�����, �������� ���� �� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_Advice_16_00");	//�����, �������� ���� �� �������?
	};
	AI_Output(self,other,"DIA_Rupert_Advice_03_01");	//����� �� ���� ������.
};
// ===============================================
instance DIA_Rupert_Debt(C_INFO)
{
	npc = CMP_Rupert;		nr = 3;
	condition = DIA_Rupert_Debt_cond;
	information = DIA_Rupert_Debt_info;
	description = "�������, ��������� ����� ���� ������ � ����.";
};
func int DIA_Rupert_Debt_cond()
{
	if (Npc_KnowsInfo(other,DIA_Rupert_MR_Hello))	{
		return TRUE;
	};
};
func void DIA_Rupert_Debt_info()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_Debt_03_00");	//�������, ��������� ����� ���� ������ � ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_Debt_07_00");	//�������, ��������� ����� ���� ������ � ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_Debt_10_00");	//�������, ��������� ����� ���� ������ � ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_Debt_14_00");	//�������, ��������� ����� ���� ������ � ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_Debt_16_00");	//�������, ��������� ����� ���� ������ � ����.
	};
	AI_Output(self,other,"DIA_Rupert_Debt_03_01");	//��, ���-�� � � ��������. ��� ���� ��� ����� - ������� �� ���������� � ������������!
};
// ===============================================
instance DIA_Rupert_PreTrade(C_INFO)
{
	npc = CMP_Rupert;		nr = 4;
	condition = DIA_WhileCompetition_cond;
	information = DIA_Rupert_PreTrade_info;
	description = "������ ��� ���� �����.";
};
func void DIA_Rupert_PreTrade_info()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_PreTrade_03_00");	//������ ��� ���� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_PreTrade_07_00");	//������ ��� ���� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_PreTrade_10_00");	//������ ��� ���� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_PreTrade_14_00");	//������ ��� ���� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_PreTrade_16_00");	//������ ��� ���� �����.
	};
	AI_Output(self,other,"DIA_Rupert_PreTrade_03_01");	//��, �����, �� � ���� �������� �� ������, ��� � �����������.
	Rupert_Trade = TRUE;
	B_LogNote(TOPIC_Trader, TOPIC_Trader_Rupert);
};

// ===============================================
var int DIA_Rupert_MRTrade_MR;
var int DIA_Rupert_MRTrade_Cnt;
var int DIA_Rupert_MRTrade_Price;
var int DIA_Rupert_MRTrade_AllSum;
var string DIA_Rupert_MRTrade_MenuText;

func int DIA_Rupert_MRTrade_CheckMR(var string mrName, var int mrInst, var int mrIndex)
{
	var int cnt; cnt = Npc_HasItems(self, mrInst);
	if (cnt > 0)	{
		var int price; price = MEM_ReadStatArr(MR_Price, mrIndex);
		DIA_Rupert_MRTrade_AllSum += price * cnt;
		DIA_Rupert_MRTrade_MenuText = CS5(mrName, " (", IntToString(price)," ���.)", "");
		return TRUE;
	};
	return FALSE;
};

instance DIA_Rupert_MRTrade(C_INFO)
{
	npc = CMP_Rupert;		nr = 4;
	condition = DIA_Rupert_MRTrade_cond;
	information = DIA_Rupert_MRTrade_info;
	description = "(������ �����)";
	permanent = TRUE;
};
func int DIA_Rupert_MRTrade_cond()
{
	if (Rupert_Trade && DIA_WhileCompetition_cond())	{
		return TRUE;
	};
};
func void DIA_Rupert_MRTrade_info()
{
	DIA_Rupert_MRTrade_MR = 0;
	DIA_Rupert_MRTrade_Cnt = 0;
	DIA_Rupert_MRTrade_Price = 0;
	Info_ClearChoices(DIA_Rupert_MRTrade);
	Info_AddChoice(DIA_Rupert_MRTrade,Dialog_Back,DIA_Rupert_MRTrade_Back);
	var int HasMrms;	HasMrms = FALSE;
	DIA_Rupert_MRTrade_AllSum = 0;
	if (DIA_Rupert_MRTrade_CheckMR("������", ItMr_Red, MR_Red)) {
		HasMrms = TRUE;
		Info_AddChoice(DIA_Rupert_MRTrade, DIA_Rupert_MRTrade_MenuText, DIA_Rupert_MRTrade_Red);
	};
	if (DIA_Rupert_MRTrade_CheckMR("��������", ItMr_Piny, MR_Piny)) {
		HasMrms = TRUE;
		Info_AddChoice(DIA_Rupert_MRTrade, DIA_Rupert_MRTrade_MenuText, DIA_Rupert_MRTrade_Piny);
	};	
	if (DIA_Rupert_MRTrade_CheckMR("�������", ItMr_Stone, MR_Stone)) {
		HasMrms = TRUE;
		Info_AddChoice(DIA_Rupert_MRTrade, DIA_Rupert_MRTrade_MenuText, DIA_Rupert_MRTrade_Stone);
	};	
	if (DIA_Rupert_MRTrade_CheckMR("������", ItMr_BrownOiler, MR_BrownOiler)) {
		HasMrms = TRUE;
		Info_AddChoice(DIA_Rupert_MRTrade, DIA_Rupert_MRTrade_MenuText, DIA_Rupert_MRTrade_BrownOiler);
	};	
	if (DIA_Rupert_MRTrade_CheckMR("�������", ItMr_Sunrise, MR_Sunrise)) {
		HasMrms = TRUE;
		Info_AddChoice(DIA_Rupert_MRTrade, DIA_Rupert_MRTrade_MenuText, DIA_Rupert_MRTrade_Sunrise);
	};	
	if (DIA_Rupert_MRTrade_CheckMR("����������", ItMr_Governor, MR_Governor)) {
		HasMrms = TRUE;
		Info_AddChoice(DIA_Rupert_MRTrade, DIA_Rupert_MRTrade_MenuText, DIA_Rupert_MRTrade_Governor);
	};	
	if (DIA_Rupert_MRTrade_CheckMR("��������", ItMr_Trident, MR_Trident)) {
		HasMrms = TRUE;
		Info_AddChoice(DIA_Rupert_MRTrade, DIA_Rupert_MRTrade_MenuText, DIA_Rupert_MRTrade_Trident);
	};	
	if (DIA_Rupert_MRTrade_CheckMR("���� ��������", ItPl_Mushroom_02, MR_02)) {
		HasMrms = TRUE;
		Info_AddChoice(DIA_Rupert_MRTrade, DIA_Rupert_MRTrade_MenuText, DIA_Rupert_MRTrade_MR02);
	};	
	if (DIA_Rupert_MRTrade_CheckMR("������ ����", ItPl_Mushroom_01, MR_01)) {
		HasMrms = TRUE;
		Info_AddChoice(DIA_Rupert_MRTrade, DIA_Rupert_MRTrade_MenuText, DIA_Rupert_MRTrade_MR01);
	};	
	if (!HasMrms)	{
		AI_Output(self,other,"DIA_Rupert_MRTrade_No_03_01");	//� ���� ������ ������ ��� ������ �� �������.
		Info_ClearChoices(DIA_Rupert_MRTrade);
	}
	else	{
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("��� ����� (����� ",IntToString(DIA_Rupert_MRTrade_AllSum)," ���.)"),DIA_Rupert_MRTrade_All);
	};
};
//-----------------------------
func void DIA_Rupert_MRTrade_MenuCnt()
{
	Info_ClearChoices(DIA_Rupert_MRTrade);
	Info_AddChoice(DIA_Rupert_MRTrade,Dialog_Back,DIA_Rupert_MRTrade_info);
	Info_AddChoice(DIA_Rupert_MRTrade,"1 ��.",DIA_Rupert_MRTrade_Cnt1);
	if (DIA_Rupert_MRTrade_Cnt >= 5)	{
		Info_AddChoice(DIA_Rupert_MRTrade,"5 ��.",DIA_Rupert_MRTrade_Cnt5);
	};
	if (DIA_Rupert_MRTrade_Cnt > 1)	{
		Info_AddChoice(DIA_Rupert_MRTrade,CS3("��� (",IntToString(DIA_Rupert_MRTrade_Cnt)," ��.)"),DIA_Rupert_MRTrade_DoTrade);
	};
};
//-----------------------------
func void DIA_Rupert_MRTrade_Back()
{
	Info_ClearChoices(DIA_Rupert_MRTrade);
};
//-----------------------------
func void DIA_Rupert_MRTrade_DoTrade()
{
	if (B_GiveGold(other,self,DIA_Rupert_MRTrade_Cnt * DIA_Rupert_MRTrade_Price))	{
		AI_Output(self,other,"DIA_Rupert_MRTrade_03_01");	//����� - ����, � ������ - ���.
		B_GiveInvItems(self,other,DIA_Rupert_MRTrade_MR,DIA_Rupert_MRTrade_Cnt);
	}
	else	{
		AI_Output(self,other,"DIA_Rupert_MRTrade_03_02");	//� ������ ����� ������ �� ������.
	};
	DIA_Rupert_MRTrade_info();
};
//-----------------------------
func void DIA_Rupert_MRTrade_Red()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Red);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Red);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Red);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Piny()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Piny);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Piny);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Piny);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Stone()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Stone);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Stone);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Stone);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_BrownOiler()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_BrownOiler);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_BrownOiler);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_BrownOiler);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Sunrise()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Sunrise);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Sunrise);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Sunrise);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Governor()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Governor);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Governor);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Governor);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_Trident()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItMr_Trident);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItMr_Trident);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_Trident);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_MR02()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItPl_Mushroom_02);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItPl_Mushroom_02);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_02);
	DIA_Rupert_MRTrade_MenuCnt();
};
func void DIA_Rupert_MRTrade_MR01()
{
	DIA_Rupert_MRTrade_MR = Hlp_GetInstanceID(ItPl_Mushroom_01);
	DIA_Rupert_MRTrade_Cnt = Npc_HasItems(self,ItPl_Mushroom_01);
	DIA_Rupert_MRTrade_Price = MEM_ReadStatArr(MR_Price,MR_01);
	DIA_Rupert_MRTrade_MenuCnt();
};
//-----------------------------
func void DIA_Rupert_MRTrade_Cnt1()
{
	DIA_Rupert_MRTrade_Cnt = 1;
	DIA_Rupert_MRTrade_DoTrade();
};
func void DIA_Rupert_MRTrade_Cnt5()
{
	DIA_Rupert_MRTrade_Cnt = 5;
	DIA_Rupert_MRTrade_DoTrade();
};
//-----------------------------
func void DIA_Rupert_MRTrade_All()
{
	if (B_GiveGold(other,self,DIA_Rupert_MRTrade_AllSum))	{
		AI_Output(self,other,"DIA_Rupert_MRTrade_03_01");	//����� - ����, � ������ - ���.
		B_GiveInvItems(self,other,ItPl_Mushroom_01,Npc_HasItems(self,ItPl_Mushroom_01));
		B_GiveInvItems(self,other,ItPl_Mushroom_02,Npc_HasItems(self,ItPl_Mushroom_02));
		B_GiveInvItems(self,other,ItMr_Red,Npc_HasItems(self,ItMr_Red));
		B_GiveInvItems(self,other,ItMr_Piny,Npc_HasItems(self,ItMr_Piny));
		B_GiveInvItems(self,other,ItMr_Stone,Npc_HasItems(self,ItMr_Stone));
		B_GiveInvItems(self,other,ItMr_Sunrise,Npc_HasItems(self,ItMr_Sunrise));
		B_GiveInvItems(self,other,ItMr_BrownOiler,Npc_HasItems(self,ItMr_BrownOiler));
		B_GiveInvItems(self,other,ItMr_Governor,Npc_HasItems(self,ItMr_Governor));
		B_GiveInvItems(self,other,ItMr_Trident,Npc_HasItems(self,ItMr_Trident));
		
	}
	else	{
		AI_Output(self,other,"DIA_Rupert_MRTrade_03_02");	//� ������ ����� ������ �� ������.
	};
	Info_ClearChoices(DIA_Rupert_MRTrade);
};
// ����� ��������� �������� ===============================
instance DIA_Rupert_After_HeroWon(C_INFO)
{
	npc = CMP_Rupert;		nr = 10;
	condition = DIA_Rupert_After_HeroWon_cond;
	information = DIA_Rupert_After_HeroWon_info;
	important = TRUE;
};
func int DIA_Rupert_After_HeroWon_cond()
{
	if (!DIA_WhileCompetition_cond()
		&& (Competition_Result == Competition_Result_WON))
	{
		return TRUE;
	};
};
func void DIA_Rupert_After_HeroWon_info()
{
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_03_01");	//��� ������, ��� �� ������ ����������� ������ ���� ���� ���������?
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"������.",DIA_Rupert_After_HeroWon_False);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"�� ���������, � �������� �����!",DIA_Rupert_After_HeroWon_GoodBook);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"������.",DIA_Rupert_After_HeroWon_True);
};
func void DIA_Rupert_After_HeroWon_True()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_True_03_00");	//������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_True_07_00");	//������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_True_10_00");	//������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_True_14_00");	//������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_True_16_00");	//������.
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_True_10_01");	//��, ���� ��� ����� �� ���������� �� ������ ��������.
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};
func void DIA_Rupert_After_HeroWon_GoodBook()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_GoodBook_03_00");	//�� ���������, � �������� �����!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_GoodBook_07_00");	//�� ���������, � �������� �����!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_GoodBook_10_00");	//�� ���������, � �������� �����!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_GoodBook_14_00");	//�� ���������, � �������� �����!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_GoodBook_16_00");	//�� ���������, � �������� �����!
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_GoodBook_10_01");	//��, ���� ������.
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};
func void DIA_Rupert_After_HeroWon_False()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_False_03_00");	//������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_False_07_00");	//������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_False_10_00");	//������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_False_14_00");	//������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_False_16_00");	//������.
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_False_10_01");	//��� � ����! ��� ��� ��� �� ����� ���� �� ����?
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"����. ��� � ������ ���� �����.",DIA_Rupert_After_HeroWon_Joke);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"������� � ������.",DIA_Rupert_After_HeroWon_Song);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"���� �� ������� ������!",DIA_Rupert_After_HeroWon_Gold);
	Info_AddChoice(DIA_Rupert_After_HeroWon,"����� ��� ��������� ��������.",DIA_Rupert_After_HeroWon_Elixier);
};
func void DIA_Rupert_After_HeroWon_Elixier()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Elixier_03_00");	//����� ��� ��������� ��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Elixier_07_00");	//����� ��� ��������� ��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Elixier_10_00");	//����� ��� ��������� ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Elixier_14_00");	//����� ��� ��������� ��������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Elixier_16_00");	//����� ��� ��������� ��������.
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_Elixier_10_01");	//��� ���������.
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};
func void DIA_Rupert_After_HeroWon_Gold()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_03_00");	//���� �� ������� ������!
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_03_01");	//(��������������� �������) ������, ����� �� ����� ���� ����������� ������� �������?
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_03_02");	//�� ����� ������������ ������! ������� ���������� ��� ����� � ������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_07_00");	//���� �� ������� ������!
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_07_01");	//(��������������� �������) ������, ����� �� ����� ���� ����������� ������� �������?
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_07_02");	//�� ����� ������������ ������! ������� ���������� ��� ����� � ������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_10_00");	//���� �� ������� ������!
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_10_01");	//(��������������� �������) ������, ����� �� ����� ���� ����������� ������� �������?
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_10_02");	//�� ����� ������������ ������! ������� ���������� ��� ����� � ������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_14_00");	//���� �� ������� ������!
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_14_01");	//(��������������� �������) ������, ����� �� ����� ���� ����������� ������� �������?
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_14_02");	//�� ����� ������������ ������! ������� ���������� ��� ����� � ������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_16_00");	//���� �� ������� ������!
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_16_01");	//(��������������� �������) ������, ����� �� ����� ���� ����������� ������� �������?
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Gold_16_02");	//�� ����� ������������ ������! ������� ���������� ��� ����� � ������!
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_Gold_10_03");	//� � ��� ����� - ������ � ���� ������� �����, ����� ��� ���� �������?
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_Gold_10_04");	//��� �� �� ������� ����� �������...
	Rupert_LiedGold = TRUE;
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};
func void DIA_Rupert_After_HeroWon_Song()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_03_00");	//������� � ������.
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_03_01");	//������, � ����������� �������� �������� �����. ������ �� ����� ���������� ���� �� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_07_00");	//������� � ������.
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_07_01");	//������, � ����������� �������� �������� �����. ������ �� ����� ���������� ���� �� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_10_00");	//������� � ������.
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_10_01");	//������, � ����������� �������� �������� �����. ������ �� ����� ���������� ���� �� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_14_00");	//������� � ������.
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_14_01");	//������, � ����������� �������� �������� �����. ������ �� ����� ���������� ���� �� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_16_00");	//������� � ������.
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Song_16_01");	//������, � ����������� �������� �������� �����. ������ �� ����� ���������� ���� �� �����.
	};
	AI_Output(self,other,"DIA_Rupert_After_HeroWon_Song_10_02");	//������� �� �� �������.
	Rupert_LiedSong = True;
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};
func void DIA_Rupert_After_HeroWon_Joke()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Joke_03_00");	//����. ��� � ������ ���� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Joke_07_00");	//����. ��� � ������ ���� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Joke_10_00");	//����. ��� � ������ ���� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Joke_14_00");	//����. ��� � ������ ���� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_After_HeroWon_Joke_16_00");	//����. ��� � ������ ���� �����.
	};
	Info_ClearChoices(DIA_Rupert_After_HeroWon);
};

// ===============================================
instance DIA_Rupert_After_Won(C_INFO)
{
	npc = CMP_Rupert;		nr = 11;
	condition = DIA_Rupert_After_Won_cond;
	information = DIA_Rupert_After_Won_info;
	description = "��� �� ��� ���������� ��������?";
};
func int DIA_Rupert_After_Won_cond()
{
	if (!DIA_WhileCompetition_cond())
	{
		if ((C_CountResults() == Competition_Result_LOST) && Competition_Winner == Hlp_GetInstanceID(self))	{
			return TRUE;
		};
	};
};
func void DIA_Rupert_After_Won_info()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_After_Won_03_00");	//��� �� ��� ���������� ��������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_After_Won_07_00");	//��� �� ��� ���������� ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_Won_10_00");	//��� �� ��� ���������� ��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_Won_14_00");	//��� �� ��� ���������� ��������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_After_Won_16_00");	//��� �� ��� ���������� ��������?
	};
	AI_Output(self,other,"DIA_Rupert_After_Won_03_01");	//���! ��� �� ���� ������ �� ������.
};

// ===============================================
instance DIA_Rupert_After_Perm(C_INFO)
{
	npc = CMP_Rupert;		nr = 12;
	condition = DIA_Rupert_After_Perm_cond;
	information = DIA_Rupert_After_Perm_info;
	description = "��� ������ ���������?";
	permanent = TRUE;
};
func int DIA_Rupert_After_Perm_cond()
{
	if (!DIA_WhileCompetition_cond() && Npc_KnowsInfo(other,DIA_Rupert_MR_Hello))
	{
		return TRUE;
	};
};
func void DIA_Rupert_After_Perm_info()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Rupert_After_Perm_03_00");	//��� ������ ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rupert_After_Perm_07_00");	//��� ������ ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_Perm_10_00");	//��� ������ ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rupert_After_Perm_14_00");	//��� ������ ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rupert_After_Perm_16_00");	//��� ������ ���������?
	};
	if (MR_Counter_Rupert < 3000)	{
		AI_Output(self,other,"DIA_Rupert_After_Perm_03_01");	//���������� ����� ������.
		if (MR_Counter_Rupert < 1000)	{
			AI_Output(self,other,"DIA_Rupert_After_Perm_03_02");	//(������) ���� ���������� ���������� �����.
		};
	}
	else	{
		AI_Output(self,other,"DIA_Rupert_After_Perm_03_03");	//������ � ���� ����� �����, ����� � �������� �� ����!
	};
};
