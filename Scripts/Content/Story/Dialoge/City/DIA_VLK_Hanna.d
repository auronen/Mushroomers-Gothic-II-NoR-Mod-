
instance DIA_Hanna_EXIT(DIA_Proto_End)
{
	npc = VLK_414_Hanna;
};

/////////////////////////////////////// ���� /////////////////////////////////////////////

//===================================================
instance DIA_Hanna_Start_Sarah(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Start_Sarah_Cond;
	information = DIA_Hanna_Start_Sarah_Info;
	important = TRUE;
};
func int DIA_Hanna_Start_Sarah_Cond()
{
	if (C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Hanna_Start_Sarah_Info()
{
	START_DIA_Finished = TRUE;
		AI_Output(other,self,"DIA_Hanna_Start_Sarah_16_00");	//��� ����� �� ������� �������� ����� �� �����. ��� �������, � � ��������.
	AI_Output(self,other,"DIA_Hanna_Start_Sarah_17_01");	//�� ������� ����. �� ����������. �� ����� ����, ���� ����� ���������?
		AI_Output(other,self,"DIA_Hanna_Start_Sarah_16_02");	//� ��� ��?
	AI_Output(self,other,"DIA_Hanna_Start_Sarah_17_03");	//������� ��� ������� �����������?
		AI_Output(other,self,"DIA_Hanna_Start_Sarah_16_04");	//�� ����� ������? �� ������? ��� ������ ������ ����� �� �������!
	AI_Output(self,other,"DIA_Hanna_Start_Sarah_17_05");	//�� �� ������ ����� ��������� ����, ��� �������� ��� ����� � ������� ���� ������. � ���������� ������ ����!
		AI_Output(other,self,"DIA_Hanna_Start_Sarah_16_06");	//� �� �������� �� ����... �� ������� ���������� ������ ����� ��������, �� � ����������� ������� �� ����������� �����.
	AI_Output(self,other,"DIA_Hanna_Start_Sarah_17_07");	//�������, � ����, ��� �� ������� �� ������ ��������� ������. ����� �� ���� �� ����������. 
	AI_Output(self,other,"DIA_Hanna_Start_Sarah_17_08");	//���� ����� ���� ������ ������� ��������� � ����. ����� ��� ����� � �������� ����� ������.
		AI_Output(other,self,"DIA_Hanna_Start_Sarah_16_09");	//��������, �� �����. ������, ������� �� ��� � ���. 
	Hanna_Paid = TRUE;
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_PortalRoom;
	AI_StopProcessInfos(self);
};
//========================================================
instance DIA_Hanna_Sarah_Final(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = DIA_Hanna_Sarah_Final_Condition;
	information = DIA_Hanna_Sarah_Final_Info;
	important = TRUE;
};
func int DIA_Hanna_Sarah_Final_Condition()
{
	if ((C_HeroIs_Sarah()) && (Competition_Result != Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Hanna_Sarah_Final_Info()
{
	AI_Output(self,other,"DIA_Hanna_Sarah_Final_17_01");	//� ��� � �����!
	if (Competition_Result == Competition_Result_WON)	{
		AI_Output(self,other,"DIA_Hanna_Sarah_Final_WON_17_02");	//���������� � �������! � � ���� ������.
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_WON_16_03");	//�������. ��� ���� ������� ������.
		if (MIS_Sarah_OldFriends == LOG_SUCCESS)	{
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_WON_16_04");	//� ���������� �� ������ ������� �������� � �������� ��������.
		};
		AI_Output(self,other,"DIA_Hanna_Sarah_Final_WON_17_05");	//��� ��� ��� �� ����?
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_WON_16_06");	//����������� �������� ���������� ������. ��� �������� ������ ��������� ���������.
		AI_Output(self,other,"DIA_Hanna_Sarah_Final_WON_17_07");	//��, ���� ��� ����� �� �������� ��������.
	}
	else	{
		AI_Output(self,other,"DIA_Hanna_Sarah_Final_LOST_17_01");	//����������.
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_LOST_16_02");	//�� ������. ��� ���� ������� ��������.
		if (MIS_Sarah_OldFriends == LOG_SUCCESS)	{
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_WON_16_04");	//� ���������� �� ������ ������� �������� � �������� ��������.
		};
	};
	if(Npc_HasItems(other,ItMi_Gold) > 100)	{
			AI_Output(other,self,"DIA_Hanna_Sarah_Final_16_01");	//� ��� ������� ����������� ������.
	};
};

/////////////////////////////////////// ������ /////////////////////////////////////////////

//===================================================
instance DIA_Hanna_Start_Rupert(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 10;
	condition = DIA_Hanna_Start_Rupert_Cond;
	information = DIA_Hanna_Start_Rupert_Info;
	important = TRUE;
};
func int DIA_Hanna_Start_Rupert_Cond()
{
	if (C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Hanna_Start_Rupert_Info()
{
	AI_Output(self,other,"DIA_Hanna_MR_Hello_Rupert_17_00");	//�, ��� ��, ������ �����-���-�����.
	AI_Output(self,other,"DIA_Hanna_MR_Hello_Rupert_17_01");	//�� ��� ��� ������ ��� 40 �������. � ���� ������ ����� ��������, ����� ������.
	B_LogEntry(TOPIC_Rupert_Debts,TOPIC_Rupert_Debts_Hanna_Sum);
};
//-----------------------------------------------
instance DIA_Hanna_Pay_Rupert(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 11;
	condition = DIA_Hanna_Pay_Rupert_Cond;
	information = DIA_Hanna_Pay_Rupert_Info;
	description = "� ���� ������� ���� (40 ���.).";
	permanent = TRUE;
};
func int DIA_Hanna_Pay_Rupert_Cond()
{
	if (C_HeroIs_Rupert() && Npc_KnowsInfo(other,DIA_Hanna_Start_Rupert)
		&& (MIS_Rupert_Debts_Paid[Creditor_Hanna] == FALSE))	{
		return TRUE;
	};
};
func void DIA_Hanna_Pay_Rupert_Info()
{
	AI_Output(other,self,"DIA_Hanna_Pay_Rupert_03_00");	//� ���� ������� ����.
	if (B_GiveGold(other,self,40))	{
		AI_Output(self,other,"DIA_Hanna_Pay_Rupert_17_01");	//�������� �� ���, �? ����� ���������� � �������.
		B_RupertPayDebt(Creditor_Hanna);
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Pay_Rupert_17_02");	//���� �� �����, �� ������ ��� 40 �������.
	};
};

/////////////////////////////////////// ��������� /////////////////////////////////////////////

//===================================================
instance DIA_Hanna_MR_Hello_Others(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 50;
	condition = DIA_Hanna_MR_Hello_Others_Cond;
	information = DIA_Hanna_MR_Hello_Others_Info;
	important = TRUE;
};
func int DIA_Hanna_MR_Hello_Others_Cond()
{
	if (!C_HeroIs_Sarah() && !C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Hanna_MR_Hello_Others_Info()
{
	AI_Output(self,other,"DIA_Hanna_MR_Hello_Others_17_00");	//����� ����������! ����� ����� �������� ������ �������!
};

//-----------------------------------------------
instance DIA_Hanna_HowMuchCost(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 51;
	condition = DIA_Hanna_HowMuchCost_Cond;
	information = DIA_Hanna_HowMuchCost_Info;
	description = "������� ����� ������?";
};
func int DIA_Hanna_HowMuchCost_Cond()
{
	if (!C_HeroIs_Sarah() && !C_HeroIs_Rupert() && Npc_KnowsInfo(other,DIA_Hanna_MR_Hello_Others))	{
		return TRUE;
	};
};
func void DIA_Hanna_HowMuchCost_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Hanna_HowMuchCost_03_00");	//������� ����� ������?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Hanna_HowMuchCost_07_00");	//������� ����� ������?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Hanna_HowMuchCost_10_00");	//������� ����� ������?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Hanna_HowMuchCost_14_00");	//������� ����� ������?
	} else	{
		AI_Output(other,self,"DIA_Hanna_HowMuchCost_16_00");	//������� ����� ������?
	};
	AI_Output(self,other,"DIA_Hanna_HowMuchCost_17_01");	//20 ������� � ������ - � ����� ������� �� ������ ����� ����� � ����� ������������.
	B_LogNote(Topic_Sleep,TOPIC_Sleep_CityHotelPrice);
};

//-----------------------------------------------
instance DIA_Hanna_Pay(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 52;
	condition = DIA_Hanna_Pay_Cond;
	information = DIA_Hanna_Pay_Info;
	description = "� ���� ������������ �� ����. (20 ���.)";
	permanent = TRUE;
};
func int DIA_Hanna_Pay_Cond()
{
	if (Hanna_Paid == FALSE)	{
		if (C_HeroIs_Rupert() && MIS_Rupert_Debts_Paid[Creditor_Hanna])	{
			return TRUE;
		};
		if (!C_HeroIs_Sarah() && Npc_KnowsInfo(other,DIA_Hanna_HowMuchCost))	{
			return TRUE;
		};
	};
};
func void DIA_Hanna_Pay_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Hanna_Pay_03_00");	//� ���� ������������ �� ����.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Hanna_Pay_07_00");	//� ���� ������������ �� ����.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Hanna_Pay_10_00");	//� ���� ������������ �� ����.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Hanna_Pay_14_00");	//� ���� ������������ �� ����.
	} else	{
		AI_Output(other,self,"DIA_Hanna_Pay_16_00");	//� ���� ������������ �� ����.
	};
	if (B_GiveGold(other,self,20))	{
		AI_Output(self,other,"DIA_Hanna_Pay_17_01");	//�������� ���� ��� ����.
		self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_PortalRoom;
		Hanna_Paid = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Pay_17_02");	//������ ������. 20 ������� �� ������.
	};
};

//-----------------------------------------------
VAR INT DIA_Hanna_Perm_Num;
instance DIA_Hanna_Perm(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 53;
	condition = DIA_Hanna_MR_Perm_Cond;
	information = DIA_Hanna_MR_Perm_Info;
	description = "����� �������?";
	permanent = TRUE;
};
func int DIA_Hanna_MR_Perm_Cond()
{
	return TRUE;
};
func void DIA_Hanna_MR_Perm_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_03_00");	//����� �������?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_07_00");	//����� �������?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_10_00");	//����� �������?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_14_00");	//����� �������?
	} else	{
		AI_Output(other,self,"DIA_Hanna_MR_Perm_16_00");	//����� �������?
	};
	if (DIA_Hanna_Perm_Num == 0)	{
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_01");	//��� ��������� ������� ������� �����������. �� �������� ����������� � ��� �������.
	}
	else if (DIA_Hanna_Perm_Num == 1)	{
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_02");	//���� ���������� �� ��������, ������� � ������ ��������� ���������.
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_03");	//�� ������� ����� ������ ���������� ����� � ��������� ��������� ������.
	}
	else	{
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_04");	//���� ������ ����� � ���������� �� �������� �������� ������ �����-�� ����� ������ ������.
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_05");	//�� ��� �� ������ ������� � ��������� ��������� �� ����� � ������.
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_06");	//������, ��� ��������� ��������� ����� ��������� ����� �� ������, ����� ���, �� �������� �������.
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_07");	//�� ���� ����� ��������� �� ����� ����, �� ����� ��������� � ���� �� ��������, ������� ����. ������ ���� �������, � ���� �����.
		AI_Output(self,other,"DIA_Hanna_MR_Perm_17_08");	//��������� �������� ����, �� ������ �� ��� �� ���������. ��� ��� � �� �����.
	};
	DIA_Hanna_Perm_Num = (DIA_Hanna_Perm_Num + 1) % 3;
};


