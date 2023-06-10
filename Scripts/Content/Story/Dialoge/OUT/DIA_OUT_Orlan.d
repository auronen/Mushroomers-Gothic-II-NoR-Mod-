
instance DIA_Orlan_EXIT(DIA_Proto_End)
{
	npc = OUT_1202_Orlan;
};

/////////////////////////////////////// ���� /////////////////////////////////////////////

//===================================================
instance DIA_Orlan_Start_Erol(C_Info)
{
	npc = OUT_1202_Orlan;
	nr = 1;
	condition = DIA_Orlan_Start_Erol_Cond;
	information = DIA_Orlan_Start_Erol_Info;
	important = TRUE;
};
func int DIA_Orlan_Start_Erol_Cond()
{
	if (C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Orlan_Start_Erol_Info()
{
		AI_Output(other,self,"DIA_Orlan_Start_Erol_10_00");	//...����������� � ������ ������� � ���� �����, �� ������ ���, ������, ����� ����. �� ������� ��������, ��!
	AI_Output(self,other,"DIA_Orlan_Start_Erol_05_01");	//��� ���?
		AI_Output(other,self,"DIA_Orlan_Start_Erol_10_02");	//�������, ��� ���, �� �� ������ ������� �� ����� ����� �������� � ������� ������. � ���� ������ �����-�� ���� ����������.
		AI_Output(other,self,"DIA_Orlan_Start_Erol_10_03");	//��� � � �������, ������ �� ��� �� ������� �����, �� �������� �� ����.
		AI_Output(other,self,"DIA_Orlan_Start_Erol_10_04");	//�������� ������ ��� ����� ��������, � ���� ������ � ����, ��� ���� ���� �������.
	//��������
	CreateInvItem(other,ItFo_Addon_Grog);
	B_UseItem(other,ItFo_Addon_Grog);
		AI_Output(other,self,"DIA_Orlan_Start_Erol_10_05");	//������� �� ����! �� ���, �������, ����.
	AI_Output(self,other,"DIA_Orlan_Start_Erol_05_06");	//������. ����������, ��� ��� �� ����.
	START_DIA_Finished = TRUE;
	AI_StopProcessInfos(self);
};


//===================================================
instance DIA_Orlan_MoreGrog_Erol(C_Info)
{
	npc = OUT_1202_Orlan;
	nr = 2;
	condition = DIA_Orlan_MoreGrog_Erol_Cond;
	information = DIA_Orlan_MoreGrog_Erol_Info;
	important = TRUE;
};
func int DIA_Orlan_MoreGrog_Erol_Cond()
{
	if (C_HeroIs_Erol() && Npc_IsInState(self,ZS_Talk)
		&& Npc_KnowsInfo(other,DIA_Orlan_Start_Erol))	{
		return TRUE;
	};
};
func void DIA_Orlan_MoreGrog_Erol_Info()
{
	AI_Output(self,other,"DIA_Orlan_MoreGrog_Erol_05_00");	//��� �����?
	Info_ClearChoices(DIA_Orlan_MoreGrog_Erol);
	Info_AddChoice(DIA_Orlan_MoreGrog_Erol,"���, �� ������.",DIA_Orlan_MoreGrog_Erol_No);
	Info_AddChoice(DIA_Orlan_MoreGrog_Erol,"��, ����� (10 ���.).",DIA_Orlan_MoreGrog_Erol_Yes);
};
func void DIA_Orlan_MoreGrog_Erol_Yes()
{
	AI_Output(other,self,"DIA_Orlan_MoreGrog_Erol_Yes_10_00");	//��, �����.
	if (Npc_HasItems(other,ItMi_Gold) >= Value_Grog)	{
		AI_Output(self,other,"DIA_Orlan_MoreGrog_Erol_Yes_05_01");	//����� �������.
		B_GiveInvItems(other,self,ItMi_Gold,Value_Grog);
	}
	else	{
		AI_Output(self,other,"DIA_Orlan_MoreGrog_Erol_Yes_05_02");	//���? ������� � ���� �������� ����� ��� ��������� ������� � �������?
		AI_Output(self,other,"DIA_Orlan_MoreGrog_Erol_Yes_05_03");	//��� ����� ��������. ����� �������.
		AI_Output(self,other,"DIA_Orlan_MoreGrog_Erol_Yes_05_04");	//�� �����!
		CreateInvItem(self,ItFo_Addon_Grog);
		B_UseItem(self,ItFo_Addon_Grog);
	};
	B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	B_UseItem(other,DIA_Orlan_MoreGrog_Erol);
	Info_ClearChoices(DIA_Orlan_MoreGrog_Erol);
};
func void DIA_Orlan_MoreGrog_Erol_No()
{
	AI_Output(other,self,"DIA_Orlan_MoreGrog_Erol_No_10_00");	//���, �� ������.
	Info_ClearChoices(DIA_Orlan_MoreGrog_Erol);
};
//===================================================
instance DIA_Orlan_Erol_Final(C_Info)
{
	npc = OUT_1202_Orlan;
	nr = 3;
	condition = DIA_Orlan_Erol_Final_Condition;
	information = DIA_Orlan_Erol_Final_Info;
	description = "� ������� ������� �����������.";
};
func int DIA_Orlan_Erol_Final_Condition()
{
	if ((C_HeroIs_Erol()) && (Competition_Result != Competition_Result_NONE))	{
		if (Competition_Result == Competition_Result_LOST)	{
			DIA_Orlan_Erol_Final.description = "�������������, ���� ��������� �� ���� ������� ��������.";
		};
		return TRUE;
	};
};
func void DIA_Orlan_Erol_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
			AI_Output(other,self,"DIA_Orlan_Erol_Final_WON_10_00");	//�����-�� �� ������! � ������� ������� �����������.
		AI_Output(self,other,"DIA_Orlan_Erol_Final_05_WON_01");	//��� ���� ��������.
		B_GiveInvItems(other,self,ItMi_Gold,Value_Grog);
		CreateInvItem(self,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_Orlan_Erol_Final_WON_05_02");	//��� ��� ��� �� ����?
			AI_Output(other,self,"DIA_Orlan_Erol_Final_WON_10_03");	//������ ������� - �����! (�������)
			AI_Output(other,self,"DIA_Orlan_Erol_Final_WON_10_04");	//����������� �������� ��������� ���������������� ���������� �� ������ ��������.
			if (Competition_Bonus > 0)	{
				AI_Output(other,self,"DIA_Orlan_Erol_Final_WON_10_05");	//��, �������������, ��� ������� ����� �����, ��� ������� �� ���� �� ������.
			};
	}
	else	{
			AI_Output(other,self,"DIA_Orlan_Erol_Final_LOST_10_01");	//�������������, ���� ��������� �� ���� ������� ��������. ������, ��� ��...
		AI_Output(self,other,"DIA_Orlan_Erol_Final_LOST_05_02");	//�� �����, ���� ������ �� �������.
	};
	if(Npc_HasItems(other,ItMi_Gold) > 100)	{
			AI_Output(other,self,"DIA_Orlan_Erol_Final_10_01");	//��� ��� �����, � ������� ������������.
	};
};

////////////////////////////////// ��� ////////////////////////////////////////////

// �������� ==========================================
var int DIA_Orlan_Trade_Once;
instance DIA_Orlan_Trade(C_Info)
{
	npc = OUT_1202_Orlan;
	nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Orlan_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "������, ��� � ���� ����.";
};
func void DIA_Orlan_Trade_Info()
{
	if (DIA_Orlan_Trade_Once == FALSE)	{
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Orlan);
		DIA_Orlan_Trade_Once = TRUE;
	};
	B_GiveTradeInv_Orlan(self);
};
// ������ ==========================================
var int DIA_Orlan_Room_Once;
instance DIA_Orlan_Room(C_Info)
{
	npc = OUT_1202_Orlan;
	nr = 51;
	condition = DIA_Orlan_Room_Cond;
	information = DIA_Orlan_Room_Info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};
func int DIA_Orlan_Room_Cond()
{
	if (!C_HeroIs_Erol() && (Orlan_Room_Got == FALSE))	{
		return TRUE;
	};
};

func void DIA_Orlan_Room_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Orlan_Room_03_00");	//� ���� ����� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Orlan_Room_07_00");	//� ���� ����� �������.
	//} else if (hero.voice == 10)	{	//����
	//	AI_Output(other,self,"DIA_Orlan_Room_10_00");	//� ���� ����� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Orlan_Room_14_00");	//� ���� ����� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Orlan_Room_16_00");	//� ���� ����� �������.
	};
	AI_Output(self,other,"DIA_Orlan_Room_05_01");	//50 ������� �� ������.
	if (!DIA_Orlan_Room_Once)	{
		B_LogNote(TOPIC_Sleep,TOPIC_Sleep_OrlanPrice);
		DIA_Orlan_Room_Once = 1;
	};
	Info_ClearChoices(DIA_Orlan_Room);
	Info_AddChoice(DIA_Orlan_Room,"������� ������.",DIA_Orlan_Room_No);
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Orlan_Room,"(��������� 50 ���.).",DIA_Orlan_Room_Yes);
	};
};
func void DIA_Orlan_Room_Yes()
{
	B_GiveInvItems(other,self,ItMi_Gold,50);
	if (other.aivar[AIV_Gender] == MALE)	{
		B_GiveInvItems(self,other,ITKE_ORLAN_HOTELZIMMER,1);
	}
	else	{
		B_GiveInvItems(self,other,ITKE_ORLAN_HOTELZIMMER_02,1);
	};
	AI_Output(self,other,"DIA_Orlan_Room_Yes_05_01");	//��� ����.
	Orlan_Room_Got = TRUE;
	B_LogNote(TOPIC_Sleep,TOPIC_Sleep_Orlan);
	Info_ClearChoices(DIA_Orlan_Room);
};
func void DIA_Orlan_Room_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Orlan_Room_No_03_00");	//������� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Orlan_Room_No_07_00");	//������� ������.
	//} else if (hero.voice == 10)	{	//����
	//	AI_Output(other,self,"DIA_Orlan_Room_No_10_00");	//������� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Orlan_Room_No_14_00");	//������� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Orlan_Room_No_16_00");	//������� ������.
	};
	Info_ClearChoices(DIA_Orlan_Room);
};
