
instance DIA_Sekob_EXIT(DIA_Proto_End)
{
	npc = BAU_930_Sekob;
};

/////////////////////////////////////// ���� /////////////////////////////////////////////

//===================================================
instance DIA_Sekob_MR_Perm_Till(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 1;
	condition = DIA_Sekob_MR_Perm_Till_Cond;
	information = DIA_Sekob_MR_Perm_Till_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Sekob_MR_Perm_Till_Cond()
{
	if (C_HeroIs_Till() && Npc_IsInState(self,ZS_Talk) && (Competition_Result == Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Sekob_MR_Perm_Till_Info()
{
	if (Wld_IsTime(5,0,22,0))	{
		AI_Output(self,other,"DIA_Sekob_MR_Perm_Till_01_00");	//�� ��� ��� �������, �������? ���� �� �������!
	}
	else	{
		AI_Output(self,other,"DIA_Sekob_MR_Perm_Till_01_01");	//�� ��� ������� ������� ����? ������ �����, � ����� � ���.
	};
	AI_StopProcessInfos(self);
};
//===================================================
instance DIA_Sekob_Till_Final(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 2;
	condition = DIA_Sekob_Till_Final_Condition;
	information = DIA_Sekob_Till_Final_Info;
	description = "� ������� ������� �����������!";
};
func int DIA_Sekob_Till_Final_Condition()
{
	if ((C_HeroIs_Till()) && (Competition_Result != Competition_Result_NONE))	{
		if (Competition_Result == Competition_Result_LOST)	{
			DIA_Sekob_Till_Final.description = "�... � �������� �������...";
		};
		return TRUE;
	};
};
func void DIA_Sekob_Till_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
		AI_Output(other,self,"DIA_Sekob_Till_Final_WON_14_00");	//� ������� ������� �����������!
			AI_Output(self,other,"DIA_Sekob_Till_Final_WON_01_01");	//�� ���� �� ���-�� �� ��������! ��� ��� �� ����, ����� ��� ����.
		AI_Output(other,self,"DIA_Sekob_Till_Final_WON_14_02");	//��� ����� ��� �����. ����������� �� ���� �������� ��� ����.
			AI_Output(self,other,"DIA_Sekob_Till_Final_WON_01_03");	//���?! ������? � ��� ���?!
			AI_Output(self,other,"DIA_Sekob_Till_Final_WON_01_04");	//���� ����� �� ������ �������� ��� ����?
			AI_Output(self,other,"DIA_Sekob_Till_Final_WON_01_05");	//����, ����� ����� ������. ���� ������� ������� ��...
	}
	else	{
		AI_Output(other,self,"DIA_Sekob_Till_Final_LOST_14_00");	//�... � �������� �������...
			AI_Output(self,other,"DIA_Sekob_Till_Final_LOST_01_01");	//� ��� � ����, ��� ���� ������ ������ ��������! 
	};
	AI_Output(self,other,"DIA_Sekob_Till_Final_14_00");	//���� ������ �������� ���� �� �������� ����?
	var int amount;	amount = Npc_HasItems(other, ItMi_Gold);
	if(amount > 0)	{
		AI_Output(other,self,"DIA_Sekob_Till_Final_14_01");	//��, ��� ������...
		B_GiveGold(other,self,amount);
		if(amount > 100)	{
			AI_Output(self,other,"DIA_Sekob_Till_Final_03_02");	//(��������) �������... �����, ��� ������� ����.
		}
		else	{
			AI_Output(self,other,"DIA_Sekob_Till_Final_03_03");	//(�����������) ������ ��� ����? ��� �� ��������� ��� ������?
			AI_Output(self,other,"DIA_Sekob_Till_Final_03_04");	//�������! ���� � ���� ����!
		};
	}
	else	{
			AI_Output(other,self,"DIA_Sekob_Till_Final_14_05");	//� ���� ��� �����.
		AI_Output(self,other,"DIA_Sekob_Till_Final_03_06");	//(���������) ���� �� ����� ��� ������?! �� ��� ���, ���������?
		AI_Output(self,other,"DIA_Sekob_Till_Final_03_07");	//����� ���, ��������!
	};
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Sekob_PermAfter_Till(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 3;
	condition = DIA_Sekob_PermAfter_Till_Cond;
	information = DIA_Sekob_PermAfter_Till_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Sekob_PermAfter_Till_Cond()
{
	if (C_HeroIs_Till() && Npc_IsInState(self,ZS_Talk)
		 && Npc_KnowsInfo(other,DIA_Sekob_Till_Final) && (Competition_Result != Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Sekob_PermAfter_Till_Info()
{
	if (Wld_IsTime(5,0,22,0))	{
		AI_Output(self,other,"DIA_Sekob_PermAfter_Till_01_00");	//� ����� �� ��� ���������? ���� � ���� �����.
	}
	else	{
		AI_Output(self,other,"DIA_Sekob_PermAfter_Till_01_01");	//���� ���� �� ������, �������? ��� ������, � ���������� ���������� ������ ���������!
	};
	AI_StopProcessInfos(self);
};


/////////////////////////////////////// ����� /////////////////////////////////////////////

//===================================================
instance DIA_Sekob_Start_Elena(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 10;
	condition = DIA_Sekob_Start_Elena_Cond;
	information = DIA_Sekob_Start_Elena_Info;
	important = TRUE;
};
func int DIA_Sekob_Start_Elena_Cond()
{
	if (C_HeroIs_Elena() && Npc_IsInState(self,ZS_Talk))	{
		return TRUE;
	};
};
func void DIA_Sekob_Start_Elena_Info()
{
	AI_Output(self,other,"DIA_Sekob_Start_Elena_01_00");	//�����! ����� ����������! ��� �������� ���������?
		AI_Output(other,self,"DIA_Sekob_Start_Elena_16_01");	//�������, ������. � � ���?
	AI_Output(self,other,"DIA_Sekob_Start_Elena_01_02");	//����� �����, ����� �����... ��� ������� ���� � ��� �������� ���?
		AI_Output(other,self,"DIA_Sekob_Start_Elena_16_03");	//� ������� �����.
	AI_Output(self,other,"DIA_Sekob_Start_Elena_01_04");	//��� �� ���������� � ������� ��������? ��� ���� ���� ����� �������� �������.
	AI_Output(self,other,"DIA_Sekob_Start_Elena_01_05");	//�� ���� �� �������� �����...
	AI_StopProcessInfos(self);
};
//===================================================
instance DIA_Sekob_Perm_Elena(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 11;
	condition = DIA_Sekob_Perm_Elena_Cond;
	information = DIA_Sekob_Perm_Elena_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Sekob_Perm_Elena_Cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond() && Npc_KnowsInfo(other,DIA_Sekob_Start_Elena))	{
		return TRUE;
	};
};
func void DIA_Sekob_Perm_Elena_Info()
{
	AI_Output(self,other,"DIA_Sekob_Start_Elena_01_05");	//�� ���� �� �������� �����...
	AI_StopProcessInfos(self);
};
/////////////////////////////////////// ��� /////////////////////////////////////////////

// ==================================================================
instance DIA_Sekob_Odo_Straw(C_INFO)
{
	npc = BAU_930_Sekob;	nr = 20;
	condition = DIA_Sekob_Odo_Straw_cond;
	information = DIA_Sekob_Odo_Straw_info;
	description = "������� ����� ���� ����?";
};
func int DIA_Sekob_Odo_Straw_cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Sekob_Odo_Straw_info()
{
		AI_Output(other,self,"DIA_Sekob_Odo_Straw_03_00");	//������� ����� ���� ����?
	AI_Output(self,other,"DIA_Sekob_Odo_Straw_13_01");	//19 ������� �� ���. 
	B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Sekob_Price);
	MIS_Odo_Straw_Sekob[Straw_Price] = 1;
};

/////////////////////////////////////// ��������� /////////////////////////////////////////////

//===================================================
var int DIA_Sekob_MR_Perm_Others_once;
instance DIA_Sekob_MR_Perm_Others(C_Info)
{
	npc = BAU_930_Sekob;	nr = 50;
	condition = DIA_Sekob_MR_Perm_Others_Cond;
	information = DIA_Sekob_MR_Perm_Others_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Sekob_MR_Perm_Others_Cond()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Elena()
		 && Npc_IsInState(self,ZS_Talk) && !DIA_Sekob_Odo_Straw_cond())	{
		return TRUE;
	};
};
func void DIA_Sekob_MR_Perm_Others_Info()
{
	if (DIA_Sekob_MR_Perm_Others_once == FALSE)	{
		AI_Output(self,other,"DIA_Sekob_MR_Perm_Others_01_00");	//��� �� ������� � ���� ����? � �� ���� ������. ��������!
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Sekob_MR_Perm_Others_03_01");	//��...
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Sekob_MR_Perm_Others_07_01");	//��...
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Sekob_MR_Perm_Others_10_01");	//��...
		} else	{							//����
			AI_Output(other,self,"DIA_Sekob_MR_Perm_Others_16_01");	//��...
		};
		DIA_Sekob_MR_Perm_Others_once = TRUE;
	};
	AI_Output(self,other,"DIA_Sekob_MR_Perm_Others_01_02");	//� ������ - ����������!
	AI_StopProcessInfos(self);
};
