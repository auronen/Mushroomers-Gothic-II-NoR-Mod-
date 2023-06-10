

instance DIA_Ulf_EXIT(DIA_Proto_End)
{
	npc = NOV_602_Ulf;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Ulf_Start_Odo(C_Info)
{
	npc = NOV_602_Ulf;		nr = 1;
	condition = DIA_Ulf_Start_Odo_Cond;
	information = DIA_Ulf_Start_Odo_Info;
	important = TRUE;
};
func int DIA_Ulf_Start_Odo_Cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Ulf_Start_Odo_Info()
{
	START_DIA_Finished = TRUE;
	AI_UseItemToState(other,ItMi_Broom,1);
	AI_GotoNpc(self,other);
	AI_WaitTillEnd(other,self);
	AI_UseItemToState(other,ItMi_Broom,-1);
		AI_Output(other,self,"DIA_Ulf_Start_Odo_03_00");	//����������, ���� ����! ��� ������ � ������?
	AI_Output(self,other,"DIA_Ulf_Start_Odo_03_01");	//�� ��� ��� ������... ���� �� ����������, ���� ���� �� ����������, ��� ��� ��� � �������! 
		AI_Output(other,self,"DIA_Ulf_Start_Odo_03_02");	//�������.
	AI_Output(self,other,"DIA_Ulf_Start_Odo_03_03");	//�, ��������! ��������� �������, �������, ��� ����� �����������, ������� ������� �� ����� ������.
	AI_Output(self,other,"DIA_Ulf_Start_Odo_03_04");	//������, ��� � ������� ��������� ������ ����� ������� ����, ��� �������� ��� �����. � � ����� ������ �����-�� ���� ����������.
		AI_Output(other,self,"DIA_Ulf_Start_Odo_03_05");	//�� �� ����� ����� �� �������?
	AI_Output(self,other,"DIA_VLK_Start_Odo_03_06");	//���, ��� ��� �����������.
		AI_Output(other,self,"DIA_Ulf_Start_Odo_03_07");	//� � ������� ���������� � ������... ����, ��� ��� ������ �������� ���������. ������ ������ �� �� ��� �� �������� ���.
	AI_Output(self,other,"DIA_Ulf_Start_Odo_03_08");	//� �� �������� � �������� ��������. �� ��� ����� ��������, ��� ��� �� ������� ������������ ��� �����. �����, ��� � ����� �����?
		AI_Output(other,self,"DIA_Ulf_Start_Odo_03_09");	//������� �� ����! � ���������� ����� � �������.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"START");
};

//===================================================
instance DIA_Ulf_MR_Perm_Odo(C_Info)
{
	npc = NOV_602_Ulf;		nr = 2;
	condition = DIA_Ulf_Start_Odo_Cond;
	information = DIA_Ulf_MR_Perm_Odo_Info;
	permanent = TRUE;
	description = "��� � ���� ����?";
};
func void DIA_Ulf_MR_Perm_Odo_Info()
{
		AI_Output(other,self,"DIA_Ulf_MR_Perm_Odo_03_00");	//��� � ���� ����?
	AI_Output(self,other,"DIA_Ulf_MR_Perm_Odo_03_01");	//������ ������ ������� ��� ��������� �� ��������.
	AI_Output(self,other,"DIA_Ulf_MR_Perm_Odo_03_02");	//��� ��� � ���� ���� ������, ����� �� ������� �� ����� �� ������ ������.
	AI_Output(self,other,"DIA_Ulf_MR_Perm_Odo_03_03");	//(��������������) ����� ��������!

};
//===================================================
instance DIA_Ulf_Thanks_Odo(C_Info)
{
	npc = NOV_602_Ulf;		nr = 3;
	condition = DIA_Ulf_Thanks_Odo_Cond;
	information = DIA_Ulf_Thanks_Odo_Info;
	description = "��� ��� �������!";
};
func int DIA_Ulf_Thanks_Odo_Cond()
{
	if (C_HeroIs_Odo() && Npc_KnowsInfo(other,DIA_Parlan_Start_Odo))	{
		return TRUE;
	};
};
func void DIA_Ulf_Thanks_Odo_Info()
{
		AI_Output(other,self,"DIA_Ulf_Thanks_Odo_03_00");	//��� ��� ������� ����!
		AI_Output(other,self,"DIA_Ulf_Thanks_Odo_03_01");	//������ ������ ������������� �������� ��� ����������� �� ������ ����.
	AI_Output(self,other,"DIA_Ulf_Thanks_Odo_03_02");	//�������, ����������.
	AI_Output(self,other,"DIA_Ulf_Thanks_Odo_03_03");	//�� � �� �� ��������� �� ����� ������������ ������������� (�����������).
		AI_Output(other,self,"DIA_Ulf_Thanks_Odo_03_04");	//��! ���� �� �� �����?
	AI_Output(self,other,"DIA_Ulf_Thanks_Odo_03_05");	//���-�� ��������... ����! ����! ������, ������, �����������... ��� � �� ���� ������.
		AI_Output(other,self,"DIA_Ulf_Thanks_Odo_03_06");	//������, � ���-������ ��������.
	B_LogNote(TOPIC_Misk,TOPIC_Misk_UlfBeer);
	Ulf_WannaBeer = TRUE;
};
//===================================================
instance DIA_Ulf_Beer_Odo(C_Info)
{
	npc = NOV_602_Ulf;		nr = 4;
	condition = DIA_Ulf_Beer_Odo_Cond;
	information = DIA_Ulf_Beer_Odo_Info;
	description = "��� ���� ����!";
};
func int DIA_Ulf_Beer_Odo_Cond()
{
	if (C_HeroIs_Odo() && Ulf_WannaBeer && (Npc_HasItems(other,ItFo_Beer) > 0))	{
		return TRUE;
	};
};
func void DIA_Ulf_Beer_Odo_Info()
{
		AI_Output(other,self,"DIA_Ulf_Beer_Odo_03_00");	//��� ���� ����!
	B_GiveInvItems(other,self,ItFo_Beer,1);
	CreateInvItems(self,ItFo_Beer,1);
	B_UseItem(self,ItFo_Beer);
	AI_Output(self,other,"DIA_Ulf_Beer_Odo_03_01");	//(������) ���, ��� ���, ����������...
	AI_Output(self,other,"DIA_Ulf_Beer_Odo_03_02");	//���� ������������� �������� ����� ������ ����� ��������.
	B_GivePlayerXP(XP_Ambient);
};
//===================================================
instance DIA_Ulf_Beer_MR_Perm_Odo(C_Info)
{
	npc = NOV_602_Ulf;		nr = 5;
	condition = DIA_Ulf_Beer_MR_Perm_Odo_Cond;
	information = DIA_Ulf_Beer_MR_Perm_Odo_Info;
	permanent = TRUE;
	description = "������ ��� ����?";
};
func int DIA_Ulf_Beer_MR_Perm_Odo_Cond()
{
	if (C_HeroIs_Odo() && Npc_KnowsInfo(other,DIA_Ulf_Beer_Odo) && (Npc_HasItems(other,ItFo_Beer) > 0))	{
		return TRUE;
	};
};
func void DIA_Ulf_Beer_MR_Perm_Odo_Info()
{
		AI_Output(other,self,"DIA_Ulf_Beer_MR_Perm_Odo_03_00");	//������ ��� ����?
	if (Ulf_Beer_Count < Wld_GetDay() * 3 + 5)	{
		AI_Output(self,other,"DIA_Ulf_Beer_MR_Perm_Odo_03_01");	//��� �� ������? �����!
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
		B_GivePlayerXP(XP_Ambient);
		Ulf_Beer_Count += 1;
	}
	else	{
		AI_Output(self,other,"DIA_Ulf_Beer_MR_Perm_Odo_03_02");	//������, � ���� ��� ������ �� �����, ��! ����� ����, ������, ��,...
		AI_StopProcessInfos(self);
	};
};
//===================================================
instance DIA_Ulf_Odo_Final(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 10;
	condition = DIA_Ulf_Odo_Final_Condition;
	information = DIA_Ulf_Odo_Final_Info;
	description = "�������������, � ������� ������� �����������.";
};
func int DIA_Ulf_Odo_Final_Condition()
{
	if ((C_HeroIs_Odo()) && (Competition_Result != Competition_Result_NONE))	{
		if (Competition_Result == Competition_Result_LOST)	{
			DIA_Ulf_Odo_Final.description = "��, �� ������� ��� �������� � ������� ��������...";
		};
		return TRUE;
	};
};
func void DIA_Ulf_Odo_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
			AI_Output(other,self,"DIA_Ulf_Odo_Final_WON_03_00");	//�������������, � ������� ������� �����������.
		AI_Output(self,other,"DIA_Ulf_Odo_Final_03_WON_01");	//�������. � ��� ��� �� ����?
			AI_Output(other,self,"DIA_Ulf_Odo_Final_WON_03_02");	//����� � ������. ����������� �� ��� �������.
		AI_Output(self,other,"DIA_Ulf_Odo_Final_WON_03_03");	//������ ������?
			AI_Output(other,self,"DIA_Ulf_Odo_Final_WON_03_04");	//���������� ��������� ���������. � �������� ������.
	}
	else	{
			AI_Output(other,self,"DIA_Ulf_Odo_Final_LOST_03_01");	//��, �� ������� ��� �������� � ������� ��������...
		AI_Output(self,other,"DIA_Ulf_Odo_Final_LOST_03_02");	//�� �����, ��� � ����� ������ �����, ��� ���� ���� ����� �����.
			AI_Output(other,self,"DIA_Ulf_Odo_Final_LOST_03_03");	//�����.
	};
	if(Npc_HasItems(other,ItMi_Gold) > 100)	{
			AI_Output(other,self,"DIA_Ulf_Odo_Final_03_01");	//���� �� ������� ������ �� ��������� �����.
		AI_Output(self,other,"DIA_Ulf_Odo_Final_03_02");	//��, ���� ������.
	}
	else	{
			AI_Output(other,self,"DIA_Ulf_Odo_Final_03_03");	//�� � � �� ����� ��������.
	};
};

