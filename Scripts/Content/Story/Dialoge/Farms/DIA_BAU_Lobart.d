
instance DIA_Lobart_EXIT(DIA_Proto_End)
{
	npc = BAU_950_Lobart;
};

// ��� ==================================================================
instance DIA_Lobart_Odo_Straw(C_INFO)
{
	npc = BAU_950_Lobart;	nr = 20;
	condition = DIA_Lobart_Odo_Straw_cond;
	information = DIA_Lobart_Odo_Straw_info;
	description = "����� � ���� ����?";
};
func int DIA_Lobart_Odo_Straw_cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Lobart_Odo_Straw_info()
{
		AI_Output(other,self,"DIA_Lobart_Odo_Straw_03_00");	//����� � ���� ����?
	AI_Output(self,other,"DIA_Lobart_Odo_Straw_13_01");	//� ������������� ������ ��������� ���� ���� �� 16 �������. 
		AI_Output(other,self,"DIA_Lobart_Odo_Straw_03_02");	//� �������?
	AI_Output(self,other,"DIA_Lobart_Odo_Straw_13_03");	//��� �������� � �����.
	B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Lobart_Price);
	MIS_Odo_Straw_Lobart[Straw_Price] = 1;
};

// ����� ==================================================================
instance DIA_Lobart_Start(C_INFO)
{
	npc = BAU_950_Lobart;	nr = 30;
	condition = DIA_WhenAsked_cond;
	information = DIA_Lobart_Start_info;
	important = TRUE;
};
func void DIA_Lobart_Start_info()
{
	var int x; x = 0;
	if (C_HeroIs_Elena())	{		//�����
		AI_Output(self,other,"DIA_Lobart_Start_Elena_05_00");	//�, �����, � ���� �� �����. ����� �� ��������.
		AI_Output(self,other,"DIA_Lobart_Start_Elena_05_01");	//��� �� ��� �������? ���-�� ���������?
			AI_Output(other,self,"DIA_Lobart_Start_Elena_16_02");	//���, ��� � �������. ������ ����� �������.
	}
	else if (C_HeroIs_Till())	{	//����
		AI_Output(self,other,"DIA_Lobart_Start_Till_05_00");	//� �� ��� ��� �����?
			AI_Output(other,self,"DIA_Lobart_Start_Till_14_01");	//���� ����� ����. ��� ���� - ������������� �����.
		AI_Output(self,other,"DIA_Lobart_Start_Till_05_02");	//��� ������, ����� ����? �-�� �����, ��� �� ��� ���������, � �� ������ ���� ������.
		AI_Output(self,other,"DIA_Lobart_Start_Till_05_03");	//��� �� �����?
			AI_Output(other,self,"DIA_Lobart_Start_Till_14_04");	//������ �������������. ���� ���� �� ������� ��������.
	} 
	else if (C_HeroIs_Erol())	{	//����
		AI_Output(self,other,"DIA_Lobart_Start_Erol_03_00");	//����������, ��������� ����. �� ��� �������������?
			AI_Output(other,self,"DIA_Lobart_Start_Erol_10_01");	//��, �� ���� ��� �� �������.
	} 
	else if (C_HeroIs_Odo() && C_NpcWears(other, ItAr_NOV_L))	{	//���
		AI_Output(self,other,"DIA_Lobart_Start_Odo_03_00");	//����������� ����, ���������! �� ���� �� ������ ������� �������������, ����� ������ - � ���� ������ ���.
			AI_Output(other,self,"DIA_Lobart_Start_Odo_10_01");	//���-���! � ������ ������� �����.
	} 
	else if (C_HeroIs_Sarah())	{	//����
		AI_Output(self,other,"DIA_Lobart_Start_Sarah_03_00");	//����, ����������! �� ������ ���-�� ������?
			AI_Output(other,self,"DIA_Lobart_Start_Sarah_10_01");	//���� ���. � ��� �� ������� �����������.
	} 
	else	{
		AI_Output(self,other,"DIA_Lobart_Start_05_00");	//��� �� ������� �� ���� �����? �� ����� �����, ��� ����� �������.
		if (hero.voice == 3)	{			//������/��� ��� ����
			AI_Output(other,self,"DIA_Lobart_Start_03_00");	//� ������ ������� �����.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Lobart_Start_07_00");	//� ������ ������� �����.
		};
	};
	AI_Output(self,other,"DIA_Lobart_Start_05_10");	//��� ���? ����� �����. �� �� ���� �� ������� ����� �� ���� �����. � ������ ���� �� �������.
	AI_Output(self,other,"DIA_Lobart_Start_05_11");	//������� � ��� ���������� ���� � ���������� ������� ���������.	��������, ��� ��� ��� ���.
	AI_Output(self,other,"DIA_Lobart_Start_05_12");	//� ������ ���� �� ����, � ��������� ������, ������, �������! ��� �������� ����, ������ ����� �������� ������!
	if (!Vino_Found)	{
		AI_Output(self,other,"DIA_Lobart_Start_05_20");	//��� � ���� ����-�� ������... ��� ���� �� ���� ����������.
		IF (other.aivar[AIV_Gender] == FEMALE || C_HeroIs_Erol())	{
			AI_Output(self,other,"DIA_Lobart_Start_05_21");	//����������, ���� ��������� ���, �������, ����� ���������� ��� �� ���.
		}
		else	{
			AI_Output(self,other,"DIA_Lobart_Start_05_21a");	//���� ��������� ����� ��������, �������, ����� ���������� ����� ���� ������� �� ���.
		};
		Vino_Search = TRUE;
		B_LogEntry_Create(TOPIC_LostBau,LOG_MISSION,TOPIC_LostBau_Lobart);
		MIS_LostBau = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Start_05_30");	//����� ������, ���� ��������. � ������, ��� � �� ���� ���� ���������...
		AI_Output(self,other,"DIA_Lobart_Start_05_31");	//�� ���� �� �� ������ ����, � ��� ��� ��������. ������� ����� ������� ��� ������?
		x = 1;	if (x == 1)	{
			B_GivePlayerXP(XP_VinoFound);
		};
	};
};

// ==================================================================
instance DIA_Lobart_FoundVino(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_FoundVino_cond;
	information = DIA_Lobart_FoundVino_info;
	description = "���� ��������.";
};
func int DIA_Lobart_FoundVino_cond()
{
	if ((Vino_Search == TRUE) && Vino_Found)	{	return TRUE;	};
};
func void DIA_Lobart_FoundVino_info()
{
	var int x; x = 0;
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Lobart_FoundVino_03_00");	//���� ��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Lobart_FoundVino_07_00");	//���� ��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Lobart_FoundVino_10_00");	//���� ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Lobart_FoundVino_14_00");	//���� ��������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Lobart_FoundVino_16_00");	//���� ��������.
	};
	AI_Output(self,other,"DIA_Lobart_FoundVino_05_01");	//��, � �����... � ��� ���� �� ��������!
	AI_Output(self,other,"DIA_Lobart_FoundVino_05_02");	//��������� � ����� �����! � �� ��� ��� ����� ���������!
	x = 1;	if (x == 1)	{
		B_GivePlayerXP(XP_VinoFound);
	};
	B_LogEntry(TOPIC_LostBau,TOPIC_LostBau_Told);
};


// �������� ===================================================
instance DIA_Lobart_PreTrade(C_INFO)
{
	npc = BAU_950_Lobart;
	nr = 50;
	condition = DIA_Lobart_PreTrade_cond;
	information = DIA_Lobart_PreTrade_info;
	description = "���� � ������ � ���� ��������?";
};
func int DIA_Lobart_PreTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Lobart_Start))	{	return TRUE;	};
};
func void DIA_Lobart_PreTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Lobart_PreTrade_03_00");	//���� � ������ � ���� ��������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Lobart_PreTrade_07_00");	//���� � ������ � ���� ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Lobart_PreTrade_10_00");	//���� � ������ � ���� ��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Lobart_PreTrade_14_00");	//���� � ������ � ���� ��������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Lobart_PreTrade_16_00");	//���� � ������ � ���� ��������?
	};
	AI_Output(self,other,"DIA_Lobart_PreTrade_05_01");	//�������. �� ������ �� ������, � �� ��������� ���������� �� �� ������ �������.
	B_LogNote(Topic_Trader,TOPIC_Trader_Lobart);
};
//===================================================
instance DIA_Lobart_MRTrade(C_INFO)
{
	npc = BAU_950_Lobart;
	nr = 51;
	condition = DIA_Lobart_MRTrade_cond;
	information = DIA_Lobart_MRTrade_info;
	description = "(������ ��������)";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Lobart_MRTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Lobart_PreTrade))	{	return TRUE;	};
};
func void DIA_Lobart_MRTrade_info()
{
	B_GiveTradeInv_Lobart(self);
	B_Trade_BuyOnly();
	/*Info_ClearChoices(DIA_Lobart_MRTrade);
	Info_AddChoice(DIA_Lobart_MRTrade,Dialog_Back,DIA_Lobart_MRTrade_Back);
	Info_AddChoice(DIA_Lobart_MRTrade,B_GetPriceString("���",Value_Cheese),DIA_Lobart_MRTrade_Cheese);
	Info_AddChoice(DIA_Lobart_MRTrade,B_GetPriceString("�������",Value_Sausage),DIA_Lobart_MRTrade_Sausage);
	Info_AddChoice(DIA_Lobart_MRTrade,B_GetPriceString("������",Value_Milk),DIA_Lobart_MRTrade_Milk);
	Info_AddChoice(DIA_Lobart_MRTrade,B_GetPriceString("����",Value_Bread),DIA_Lobart_MRTrade_Bread);
	*/
};
func void DIA_Lobart_MRTrade_Back()
{
	Info_ClearChoices(DIA_Lobart_MRTrade);
};
func void DIA_Lobart_MRTrade_NoGold()
{
	AI_Output(self,other,"DIA_Lobart_MRTrade_05_00");	//� ���� ������������ ������.
};
func void DIA_Lobart_MRTrade_Bread()
{
	if (B_GiveGold(other,self, Value_Bread))	{
		B_GiveInvItems(self,other,ItFo_Bread,1);
	}
	else	{
		DIA_Lobart_MRTrade_NoGold();
	};
	Info_ClearChoices(DIA_Lobart_MRTrade);
};
func void DIA_Lobart_MRTrade_Milk()
{
	if (B_GiveGold(other,self, Value_Milk))	{
		B_GiveInvItems(self,other,ItFo_Milk,1);
	}
	else	{
		DIA_Lobart_MRTrade_NoGold();
	};
	Info_ClearChoices(DIA_Lobart_MRTrade);
};
func void DIA_Lobart_MRTrade_Sausage()
{
	if (B_GiveGold(other,self, Value_Sausage))	{
		B_GiveInvItems(self,other,ItFo_Sausage,1);
	}
	else	{
		DIA_Lobart_MRTrade_NoGold();
	};
	Info_ClearChoices(DIA_Lobart_MRTrade);
};
func void DIA_Lobart_MRTrade_Cheese()
{
	if (B_GiveGold(other,self, Value_Cheese))	{
		B_GiveInvItems(self,other,ItFo_Cheese,1);
	}
	else	{
		DIA_Lobart_MRTrade_NoGold();
	};
	Info_ClearChoices(DIA_Lobart_MRTrade);
};

//*/
