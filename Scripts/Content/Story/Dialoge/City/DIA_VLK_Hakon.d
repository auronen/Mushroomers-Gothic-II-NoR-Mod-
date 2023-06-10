
instance DIA_Hakon_EXIT(DIA_Proto_End)
{
	npc = VLK_407_Hakon;
};

// ����� �������� ==============================================================
instance DIA_Hakon_YourPost(C_INFO)
{
	npc = VLK_407_Hakon;				nr = 10;
	condition = DIA_Hakon_YourPost_cond;
	information = DIA_Hakon_YourPost_info;
	description = "� ������ ���� ����.";
};
func int DIA_Hakon_YourPost_cond()
{
	if (MIS_KhorinisPost_Stage_FromHalvor
		&& (Npc_HasItems(other,ItMi_Nugget) >= 3))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Hakon_YourPost.description = "� �������� ���� ����.";
		};
		return TRUE;
	};
};
func void DIA_Hakon_YourPost_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Hakon_YourPost_03_00");	//� ������ ���� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Hakon_YourPost_07_00");	//� ������ ���� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Hakon_YourPost_10_00");	//� ������ ���� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Hakon_YourPost_14_00");	//� ������ ���� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Hakon_YourPost_16_00");	//� �������� ���� ����.
	};
	B_GiveInvItems(other,self,ItMi_Nugget,3);
	AI_Output(self,other,"DIA_Hakon_YourPost_12_01");	//�������! ��� 150 �������, ��� � ��������������.
	B_GiveGold(self,other,150);
	if (!Npc_IsDead(VLK_412_Harad))	{
		AI_Output(self,other,"DIA_Hakon_YourPost_12_02");	//��, ����� ����, �� ������ ���������� ��� 10 �������?
		AI_Output(self,other,"DIA_Hakon_YourPost_12_03");	//����� ����� ���� �������� ��� ���� ������� ������.
		B_GivePlayerXP(XP_KhorinisPost_HakonDelivered);
		MIS_KhorinisPost_HakonDelivered = TRUE;
		B_LogEntry_HalvorPost(TOPIC_KhorinisPost_HakonDelivered);
		Info_ClearChoices(DIA_Hakon_YourPost);
		Info_AddChoice(DIA_Hakon_YourPost,"���, ��� �������.",DIA_Hakon_YourPost_No);
		Info_AddChoice(DIA_Hakon_YourPost,"������.",DIA_Hakon_YourPost_Yes);
	};
};
//---------------------------------------
func void DIA_Hakon_YourPost_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Hakon_YourPost_No_03_00");	//���, ��� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Hakon_YourPost_No_07_00");	//���, ��� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Hakon_YourPost_No_10_00");	//���, ��� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Hakon_YourPost_No_14_00");	//���, ��� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Hakon_YourPost_No_16_00");	//���, ��� �������.
	};
	AI_Output(self,other,"DIA_Hakon_YourPost_No_12_01");	//�� ���, ��� ���.
	Info_ClearChoices(DIA_Hakon_YourPost);
};
//---------------------------------------
func void DIA_Hakon_YourPost_Yes()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Hakon_YourPost_Yes_03_00");	//������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Hakon_YourPost_Yes_07_00");	//������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Hakon_YourPost_Yes_10_00");	//������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Hakon_YourPost_Yes_14_00");	//������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Hakon_YourPost_Yes_16_00");	//������.
	};
	AI_Output(self,other,"DIA_Hakon_YourPost_Yes_12_01");	//����� ����� ���� � ������. � �� ������������, ���� ����� ������!
	//B_GiveInvItems(self,other,ItMi_Nugget,3);
	//B_GiveGold(self,other,10);
	ItemTrans_items[0] = ItMi_Nugget;
	ItemTrans_amount[0] = 3;
	ItemTrans_items[1] = ItMi_Gold;
	ItemTrans_amount[1] = 10;
	B_ItemsTransaction(self,other);
	//����� ����� ������ �����������
	Info_ClearChoices(DIA_Hakon_YourPost);
	MIS_KhorinisPost_HakonTime = Wld_GetFullTime() + 24*60;
	MIS_KhorinisPost_Stage_FromHakon = TRUE;
	B_LogEntry_HalvorPost(TOPIC_KhorinisPost_HakonPost);
};

// ==============================================================
instance DIA_Hakon_Delivered(C_INFO)
{
	npc = VLK_407_Hakon;				nr = 11;
	condition = DIA_Hakon_Delivered_cond;
	information = DIA_Hakon_Delivered_info;
	important = TRUE;
};
func int DIA_Hakon_Delivered_cond()
{
	if (MIS_KhorinisPost_Stage_FromHakon
		&& !MIS_KhorinisPost_HaradDelivered
		&& (Wld_GetFullTime() > MIS_KhorinisPost_HakonTime))	{
		return TRUE;
	};
};
func void DIA_Hakon_Delivered_info()
{
	AI_Output(self,other,"DIA_Hakon_Delivered_12_00");	//��! ������ ���� ��� ��� �� � ������?
	AI_Output(self,other,"DIA_Hakon_Delivered_12_01");	//� �� ��� 10 ��� ��� �����!
	AI_Output(self,other,"DIA_Hakon_Delivered_12_02");	//���������� ����� ��� ���� � ������, ��� � ������ ����������, ��� �� ��������� ���� ��������!
	B_GivePlayerXP(XP_KhorinisPost_HakonAnti);
	MIS_KhorinisPost_Stage_FromHakon = FALSE;
	B_LogEntry_KhorinisPost_SuccessAll(TOPIC_KhorinisPost_HaradBack);
	Info_ClearChoices(DIA_Hakon_Delivered);
	Info_AddChoice(DIA_Hakon_Delivered,"� ���� �� ���...",DIA_Hakon_Delivered_No);
	if ((Npc_HasItems(other,ItMi_Nugget) >= 3) && C_NpcHasGold(other,10))	{
		Info_AddChoice(DIA_Hakon_Delivered,"������.",DIA_Hakon_Delivered_Yes);
	};
};
func void DIA_Hakon_Delivered_Yes()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Hakon_Delivered_Yes_03_00");	//������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Hakon_Delivered_Yes_07_00");	//������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Hakon_Delivered_Yes_10_00");	//������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Hakon_Delivered_Yes_14_00");	//������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Hakon_Delivered_Yes_16_00");	//������.
	};
	B_GiveInvItems(other,self,ItMi_Nugget,3);
	B_GiveGold(other,self,10);
	AI_Output(self,other,"DIA_Hakon_Delivered_Yes_12_01");	//(���� ��� ���) �� �� ���� ������ ����������...
	AI_StopProcessInfos(self);
};
func void DIA_Hakon_Delivered_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Hakon_Delivered_No_03_00");	//� ���� �� ���...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Hakon_Delivered_No_07_00");	//� ���� �� ���...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Hakon_Delivered_No_10_00");	//� ���� �� ���...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Hakon_Delivered_No_14_00");	//� ���� �� ���...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Hakon_Delivered_No_16_00");	//� ���� �� ���...
	};
	AI_Output(self,other,"DIA_Hakon_Delivered_No_12_01");	//�� ��� �� ������?.. ������!!!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,0);
};



// �������� ==============================================

instance DIA_Hakon_Hello(C_INFO)
{
	nr = 1;
	npc = VLK_407_Hakon;
	condition = DIA_WhenAsked_cond;
	information = DIA_Hakon_MR_MR_Hello_info;
	important = TRUE;
};
func void DIA_Hakon_MR_MR_Hello_info()
{
	if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Hakon_MR_MR_Hello_12_00");	//��������� ����! �� ������� �� ����-������ ������?
		AI_Output(other,self,"DIA_Hakon_MR_MR_Hello_10_01");	//� � ���� ���� �� ���� �������?
		AI_Output(self,other,"DIA_Hakon_MR_MR_Hello_12_02");	//������ ����.
	}
	else
	if (C_HeroIs_Sarah())	{
		AI_Output(self,other,"DIA_Hakon_MR_MR_Hello_12_03");	//����! �������� ��� ���������?
	}
	else
	if (C_HeroIs_Rupert())	{
		AI_Output(self,other,"DIA_Hakon_MR_MR_Hello_12_04");	//������ ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_MR_MR_Hello_12_05");	//������ �� ����� ���� � �������!
	};
};
//-----------------------------------------
var int DIA_Hakon_MRTrade_Once;
instance DIA_Hakon_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_407_Hakon;
	condition = DIA_Hakon_MRTrade_cond;
	information = DIA_Hakon_MRTrade_info;
	description = "������ ���� ������.";
	trade = TRUE;
	permanent = TRUE;
};

func int DIA_Hakon_MRTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Hakon_Hello))	{
		return TRUE;
	};
};

func void DIA_Hakon_MRTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Hakon_MRTrade_03_00");	//������ ���� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Hakon_MRTrade_07_00");	//������ ���� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Hakon_MRTrade_10_00");	//������ ���� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Hakon_MRTrade_14_00");	//������ ���� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Hakon_MRTrade_16_00");	//������ ���� ������.
	};
	if (!DIA_Hakon_MRTrade_Once)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Hakon);
		DIA_Hakon_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Hakon(self);
};
