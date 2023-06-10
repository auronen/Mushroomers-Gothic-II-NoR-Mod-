
instance DIA_Rosi_EXIT(DIA_Proto_End)
{
	npc = BAU_936_Rosi;
};

/////////////////////////////////////// ���� /////////////////////////////////////////////

//===================================================
instance DIA_Rosi_Start_Till(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 1;
	condition = DIA_Rosi_Start_Till_Cond;
	information = DIA_Rosi_Start_Till_Info;
	important = TRUE;
};
func int DIA_Rosi_Start_Till_Cond()
{
	if (C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Rosi_Start_Till_Info()
{
	START_DIA_Finished = TRUE;
	var C_NPC Rosi;		Rosi = Hlp_GetNpc(BAU_936_Rosi);
	var C_NPC Sekob;	Sekob = Hlp_GetNpc(BAU_930_Sekob);
	Npc_ClearAIQueue(Sekob);
	AI_StandUpQuick(Sekob);
	AI_TurnToNpc(Sekob,other);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	Npc_SetTarget(Sekob,hero);
	AI_StartState(Sekob,ZS_Talk,0,"");
	
	TRIA_Invite(Sekob);
	TRIA_Start();
	
	TRIA_Next(Rosi);
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_Rosi_Start_Till_17_00");	//����, ���� ����, �������. 
		AI_SetWalkmode(other, NPC_WALK);
		AI_TurnToNpc(other, self);
		AI_GotoNpc(other,self);
		AI_Output(other,self,"DIA_Rosi_Start_Till_14_01");	//����, ���?
			TRIA_Next(Sekob);
			AI_TurnToNpc(self,other);
			AI_Wait(hero,0.5);
			AI_Output(self,other,"DIA_Rosi_Start_Till_01_03");	//������� ������ ������� � ����� ���������� ������.
	TRIA_Next(Rosi);
	AI_TurnToNpc(self,Sekob);
		AI_Snd_Play3D(self,other,"Geldbeutel");
	AI_Output(self,other,"DIA_Rosi_Start_Till_17_04");	//���, ���. ��� �� �������.
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_Rosi_Start_Till_17_05");	//����, ��������� ������� ����������� ������� �������! �� ����� ������.
	AI_Output(self,other,"DIA_Rosi_Start_Till_17_06");	//������, ��� � ������� ���� ������ �������� ��� �����, ����� ����� ������������. � ���������� ������� �����-�� ����� ������ ����...
			TRIA_Next(Sekob);
			AI_TurnToNpc(self,Sekob);
			AI_Output(self,other,"DIA_Rosi_Start_Till_01_07");	//���, ��������? ����� ������������?.. ������ ����?..
			AI_TurnToNpc(other,self);
			AI_TurnToNpc(self,other);
			AI_Output(self,other,"DIA_Rosi_Start_Till_01_08");	//���, �������. ���� ���� � ���� � ����� ���� � ���. ��� ������ ������ �� ������������.
		AI_Output(other,self,"DIA_Rosi_Start_Till_14_09");	//��...
			AI_Output(self,other,"DIA_Rosi_Start_Till_01_10");	//������� ��! �� ������ ����� ���-������ �� ������ � ��������. �� �� ���� ����������� � �������! �� �� �� ���������.
		B_GiveInvItems(self,other,ItKe_Chest_Till,1);
	
	TRIA_Finish();
	B_StartOtherRoutine(Rosi,"START");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Rosi_MR_Perm_Till(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 2;
	condition = DIA_Rosi_MR_Perm_Till_Cond;
	information = DIA_Rosi_MR_Perm_Till_Info;
	description = "���, � ���� ����.";
	permanent = TRUE;
};
func int DIA_Rosi_MR_Perm_Till_Cond()
{
	if (C_HeroIs_Till())	{
		return TRUE;
	};
};

var int DIA_Rosi_MR_Perm_Till_Day;
var int DIA_Rosi_MR_Perm_Till_Night;
func void DIA_Rosi_MR_Perm_Till_Info()
{
	AI_Output(other,self,"DIA_Rosi_MR_Perm_Till_14_00");	//���, � ���� ����.
	if (Wld_IsTime(6,0,12,0))	{
		AI_Output(self,other,"DIA_Rosi_MR_Perm_Till_17_01");	//� �����, �� ������ ������ ����. ������� �� �����. 
	}
	else if (Wld_IsTime(12,0,22,0))	{
		if (DIA_Rosi_MR_Perm_Till_Day > Wld_GetDay())	{
			AI_Output(self,other,"DIA_Rosi_MR_Perm_Till_17_02");	//���� �������, ����. �� ������� ��� ������. ��� �� �������, ��� �������� � ���� ������?
		}
		else 		{
			AI_Output(self,other,"DIA_Rosi_MR_Perm_Till_17_03");	//���, �����.
			B_GiveInvItems(self,other,ItFo_Stew,1);
			DIA_Rosi_MR_Perm_Till_Day = Wld_GetDay() + 1;
		};
	}
	else	{
		if (DIA_Rosi_MR_Perm_Till_Night > Wld_GetDay_Shifted(6))	{
			AI_Output(self,other,"DIA_Rosi_MR_Perm_Till_17_04");	//��� �����, ������!
		}
		else	{
			AI_Output(self,other,"DIA_Rosi_MR_Perm_Till_17_05");	//����, ������ �������� ����! ���, ����� ����� � ������� � ������ �����! 
			//B_GiveInvItems(self,other,ItFo_Bread,1);
			//B_GiveInvItems(self,other,ItFo_Milk,1);
			ItemTrans_items[0] = ItFo_Bread;
			ItemTrans_amount[0] = 1;
			ItemTrans_items[1] = ItFo_Milk;
			ItemTrans_amount[1] = 1;
			B_ItemsTransaction(self,other);
			DIA_Rosi_MR_Perm_Till_Night = Wld_GetDay_Shifted(6) + 1;
		};
	};
};

/////////////////////////////////////// ����� /////////////////////////////////////////////

//===================================================
instance DIA_Rosi_Start_Elena(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 10;
	condition = DIA_Rosi_Start_Elena_Cond;
	information = DIA_Rosi_Start_Elena_Info;
	important = TRUE;
};
func int DIA_Rosi_Start_Elena_Cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Rosi_Start_Elena_Info()
{
	AI_Output(self,other,"DIA_Rosi_Start_Elena_17_00");	//�����, ���� ���� ������. �� ��� �������, ����������.
};

//===================================================
instance DIA_Rosi_LookGood_Elena(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 11;
	condition = DIA_Rosi_LookGood_Elena_Cond;
	information = DIA_Rosi_LookGood_Elena_Info;
	description = "�� ���� ������ ���������.";
};
func int DIA_Rosi_LookGood_Elena_Cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Rosi_LookGood_Elena_Info()
{
		AI_Output(other,self,"DIA_Rosi_LookGood_Elena_16_00");	//�� ���� ������ ���������.
	AI_Output(self,other,"DIA_Rosi_LookGood_Elena_17_01");	//��, ��� �� ���. �� ��� ����� �������.
};

/////////////////////////////////////// ��������� /////////////////////////////////////////////

//===================================================
instance DIA_Rosi_Start_Others(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 20;
	condition = DIA_Rosi_Start_Others_Cond;
	information = DIA_Rosi_Start_Others_Info;
	important = TRUE;
};
func int DIA_Rosi_Start_Others_Cond()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Elena() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Rosi_Start_Others_Info()
{
	AI_Output(self,other,"DIA_Rosi_Start_Others_17_00");	//���� �� ������? ���� � ���� �����-�� ����, �������� � ����� ����.
};

//===================================================
instance DIA_Rosi_MR_Perm(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 21;
	condition = DIA_Rosi_MR_Perm_Cond;
	information = DIA_Rosi_MR_Perm_Info;
	description = "��� ���� ����?";
	permanent = TRUE;
};
func int DIA_Rosi_MR_Perm_Cond()
{
	if (!C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Rosi_MR_Perm_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Rosi_MR_Perm_Others_03_00");	//��� ���� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rosi_MR_Perm_Others_07_00");	//��� ���� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rosi_MR_Perm_Others_10_00");	//��� ���� ����?
	} else	{							//����/Elena
		AI_Output(other,self,"DIA_Rosi_MR_Perm_Others_16_00");	//��� ���� ����?
	};
	AI_Output(self,other,"DIA_Rosi_MR_Perm_17_01");	//����� ����������...
};

//===================================================
instance DIA_Rosi_MRTrade_Others(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 22;
	condition = DIA_Rosi_MRTrade_Others_Cond;
	information = DIA_Rosi_MRTrade_Others_Info;
	description = "� ���� ����� ���-������ ������?";
};
func int DIA_Rosi_MRTrade_Others_Cond()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Rosi_MRTrade_Others_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Rosi_MRTrade_Others_03_00");	//� ���� ����� ���-������ ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rosi_MRTrade_Others_07_00");	//� ���� ����� ���-������ ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rosi_MRTrade_Others_10_00");	//� ���� ����� ���-������ ������?
	} else	{							//����
		AI_Output(other,self,"DIA_Rosi_MRTrade_Others_16_00");	//� ���� ����� ���-������ ������?
	};
	AI_Output(self,other,"DIA_Rosi_MRTrade_Others_17_01");	//���, ��� �����������, ���� � ������ ���-�� ��� ��� ������.
};

//===================================================
instance DIA_Rosi_Husband_Others(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 23;
	condition = DIA_Rosi_Husband_Others_Cond;
	information = DIA_Rosi_Husband_Others_Info;
	description = "���� ��� ������ ����� ������������?";
};
func int DIA_Rosi_Husband_Others_Cond()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Elena() && DIA_Sekob_MR_Perm_Others_once)	{
		return TRUE;
	};
};
func void DIA_Rosi_Husband_Others_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Rosi_Husband_Others_03_00");	//���� ��� ������ ����� ������������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rosi_Husband_Others_07_00");	//���� ��� ������ ����� ������������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rosi_Husband_Others_10_00");	//���� ��� ������ ����� ������������?
	} else	{							//����
		AI_Output(other,self,"DIA_Rosi_Husband_Others_16_00");	//���� ��� ������ ����� ������������?
	};
	AI_Output(self,other,"DIA_Rosi_Husband_Others_17_01");	//����� ������. ���� ������ �� �� ������� ��� �� ����������.
	AI_Output(self,other,"DIA_Rosi_Husband_Others_17_02");	//�� ���� �������, ��� � ��������� � ���.
};


// ���������� ������ ===================================================
instance DIA_Rosi_AskRecipe(C_Info)
{
	npc = BAU_936_Rosi;				nr = 5;
	condition = DIA_Rosi_AskRecipe_cond;
	information = DIA_Rosi_AskRecipe_Info;
	description = "� �� ������ �������� �����, �����, ������� �� ������� ����?";
};
func int DIA_Rosi_AskRecipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Rosi_AskRecipe_Info()
{
	if (C_HeroIs_Till())	{			//����
		AI_Output(other,self,"DIA_Rosi_AskRecipe_Till_03_00");	//���, � �� ������ �������� �����, �����, ������� �� ������� ����?
	}	else if (hero.voice == 3)	{	//���/������
		AI_Output(other,self,"DIA_Rosi_AskRecipe_03_00");	//� �� ������ �������� �����, �����, ������� �� ������� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rosi_AskRecipe_07_00");	//� �� ������ �������� �����, �����, ������� �� ������� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rosi_AskRecipe_10_00");	//� �� ������ �������� �����, �����, ������� �� ������� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Rosi_AskRecipe_16_00");	//� �� ������ �������� �����, �����, ������� �� ������� ����?
	};
	AI_Output(self,other,"DIA_Rosi_AskRecipe_17_01");	//��, ����� �������! �� � �� �� � ���� �� �����, �� �� ��� � ���.
};

