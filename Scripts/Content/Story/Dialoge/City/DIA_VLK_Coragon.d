
instance DIA_Coragon_EXIT(DIA_Proto_End)
{
	npc = VLK_420_Coragon;
};

// �������� ==============================================

instance DIA_Coragon_Beer_Rupert(C_INFO)
{
	nr = 50;
	npc = VLK_420_Coragon;
	condition = DIA_Coragon_Beer_Rupert_cond;
	information = DIA_Coragon_Beer_Rupert_info;
	important = TRUE;
};
func int DIA_Coragon_Beer_Rupert_cond()
{
	if (C_HeroIs_Rupert() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
	
};
func void DIA_Coragon_Beer_Rupert_info()
{
	AI_Output(self,other,"DIA_Coragon_Beer_Rupert_09_00");	//��� ������ ������ ����?
	Info_ClearChoices(DIA_Coragon_Beer_Rupert);
	Info_AddChoice(DIA_Coragon_Beer_Rupert,"� ������?",DIA_Coragon_Beer_Rupert_No);
	if (C_NpcHasGold(other,Value_Beer))	{
		Info_AddChoice(DIA_Coragon_Beer_Rupert,C_BuildPriceString("����� �������� ",Value_Beer),DIA_Coragon_Beer_Rupert_Yes);
	};
};
func void DIA_Coragon_Beer_Rupert_No()
{
	AI_Output(other,self,"DIA_Coragon_Beer_Rupert_No_03_00");	//� ������?
	AI_Output(self,other,"DIA_Coragon_Beer_Rupert_No_09_01");	//� ������ ������ ����.
	Info_ClearChoices(DIA_Coragon_Beer_Rupert);
};
func void DIA_Coragon_Beer_Rupert_Yes()
{
	AI_Output(other,self,"DIA_Coragon_Beer_Rupert_Yes_03_00");	//����� ��������.
	B_GiveInvItems(other,self,ItMi_Gold,Value_Beer);
	AI_Output(self,other,"DIA_Coragon_Beer_Rupert_Yes_09_01");	//�, �� ������� ��� �������. �����.
	B_GiveInvItems(self,other,ItFo_Beer,1);
	Info_ClearChoices(DIA_Coragon_Beer_Rupert);
};
//-----------------------------------------
var int DIA_Coragon_MRTrade_Once;
instance DIA_Coragon_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_420_Coragon;
	condition = DIA_NoCond_cond;
	information = DIA_Coragon_MRTrade_info;
	description = "��� � ���� ������� ����?";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Coragon_MRTrade_info()
{
	if (!DIA_Coragon_MRTrade_Once)	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Coragon_MRTrade_03_00");	//��� � ���� ������� ����?
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Coragon_MRTrade_07_00");	//��� � ���� ������� ����?
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Coragon_MRTrade_10_00");	//��� � ���� ������� ����?
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Coragon_MRTrade_14_00");	//��� � ���� ������� ����?
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Coragon_MRTrade_16_00");	//��� � ���� ������� ����?
		};
		AI_Output(self,other,"DIA_Coragon_MRTrade_09_01");	//��� ����� ������.
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Coragon);
		DIA_Coragon_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Coragon(self);
};
