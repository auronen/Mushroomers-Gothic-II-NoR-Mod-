
instance DIA_Sagitta_EXIT(DIA_Proto_End)
{
	npc = OUT_1203_Sagitta;
};

// ����� ==================================================================
var int DIA_Sagitta_OnHello;
instance DIA_Sagitta_Hello(C_Info)
{
	npc = OUT_1203_Sagitta;			nr = 1;
	condition = DIA_Sagitta_MR_Hello_cond;
	information = DIA_Sagitta_MR_Hello_info;
	important = TRUE;
};
func int DIA_Sagitta_MR_Hello_cond()
{
	if ((Npc_IsInState(self,ZS_Talk) == TRUE) &&
			!Npc_KnowsInfo(other,DIA_Sagitta_Till_CrossCome))	{
		return TRUE;
	};
};
func void DIA_Sagitta_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Sagitta_MR_Hello_17_00");	//����������! ��� � ���� �����?
	Info_ClearChoices(DIA_Sagitta_Hello);
	Info_AddChoice(DIA_Sagitta_Hello,"������",DIA_Sagitta_Healthy);
	if (other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])	{
		if (other.aivar[AIV_Gender] == MALE)	{
			Info_AddChoice(DIA_Sagitta_Hello,"� �����.",DIA_Sagitta_HealMe_Info);
		}
		else	{
			Info_AddChoice(DIA_Sagitta_Hello,"� ������.",DIA_Sagitta_HealMe_Info);
		};
	};
	if ((POISON_Foggy_Timer > 0) || (POISON_DrgTears_Timer > 0))	{
		if (other.aivar[AIV_Gender] == MALE)	{
			Info_AddChoice(DIA_Sagitta_Hello,"� ��������� �������.",DIA_Sagitta_Poisoned_Info);
		}
		else	{
			Info_AddChoice(DIA_Sagitta_Hello,"� ���������� �������.",DIA_Sagitta_Poisoned_Info);
		};
	};
	DIA_Sagitta_OnHello = TRUE;
};

func void DIA_Sagitta_Healthy()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sagitta_Healthy_03_00");	//������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sagitta_Healthy_07_00");	//������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sagitta_Healthy_10_00");	//������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sagitta_Healthy_14_00");	//������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Sagitta_Healthy_16_00");	//������.
	};
	AI_Output(self,other,"DIA_Sagitta_Healthy_17_01");	//�������, ������ �� ��� �����, ������ ���� ���-�� �����.
	DIA_Sagitta_OnHello = FALSE;
	Info_ClearChoices(DIA_Sagitta_Hello);
};
func void DIA_Sagitta_MR_Hello_Injured()
{
};
//-----------------------------------------------
instance DIA_Sagitta_HealMe(C_Info)
{
	npc = OUT_1203_Sagitta;		nr = 50;
	condition = DIA_Sagitta_HealMe_cond;
	information = DIA_Sagitta_HealMe_info;
	description = "� �����.";
	permanent = TRUE;
};
func int DIA_Sagitta_HealMe_cond()
{
	if (other.aivar[AIV_Gender] == FEMALE)	{
		DIA_Sagitta_HealMe.description = "� ������.";
	};
	return TRUE;
};
func void DIA_Sagitta_HealMe_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sagitta_HealMe_03_00");	//� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sagitta_HealMe_07_00");	//� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sagitta_HealMe_10_00");	//� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sagitta_HealMe_14_00");	//� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Sagitta_HealMe_16_00");	//� ������.
	};
	if (DIA_Sagitta_OnHello)	{
		AI_Output(self,other,"DIA_Sagitta_HealMe_17_01");	//�������, �� ��� �����, ������ ����� ���������� �����.
	};
	if (other.attribute[ATR_HITPOINTS] == other.attribute[ATR_HITPOINTS_MAX])	{
		AI_Output(self,other,"DIA_Sagitta_HealMe_17_02");	//�� �� ���� �� �� ���������! ��� �� �����?
	}
	else	if (other.attribute[ATR_HITPOINTS] > other.attribute[ATR_HITPOINTS_MAX] / 2)	{
		AI_Output(self,other,"DIA_Sagitta_HealMe_17_03");	//������, � ����� ���������� ��� ���� ������ ���������.
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	}
	else	{
		AI_Output(self,other,"DIA_Sagitta_HealMe_17_04");	//��� ��������� ����. �������� ��������� ������� �������, ����� �������� ���� � �������.
		AI_StopProcessInfos(self);
		DIA_Sagitta_OnHello = FALSE;
		Wait_AfterDia_M = other.attribute[ATR_HITPOINTS_MAX] - other.attribute[ATR_HITPOINTS] + Hlp_Random(10);	
		Sagitta_BigHeal = TRUE;
		return;
	};
	AI_StopProcessInfos(self);
	if (DIA_Sagitta_OnHello)	{
		DIA_Sagitta_OnHello = FALSE;
		Info_ClearChoices(DIA_Sagitta_Hello);
	};
};

//-----------------------------------------------
instance DIA_Sagitta_Poisoned(C_Info)
{
	npc = OUT_1203_Sagitta;			nr = 51;
	condition = DIA_Sagitta_Poisoned_cond;
	information = DIA_Sagitta_Poisoned_info;
	description = "� ��������� �������.";
	permanent = TRUE;
};
func int DIA_Sagitta_Poisoned_cond()
{
	if ((POISON_Foggy_Timer > 0) || (POISON_DrgTears_Timer > 0))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Sagitta_Poisoned.description = "� ���������� �������.";
		};
		return TRUE;
	};
};
func void DIA_Sagitta_Poisoned_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sagitta_Poisoned_03_00");	//� ��������� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sagitta_Poisoned_07_00");	//� ��������� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sagitta_Poisoned_10_00");	//� ��������� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sagitta_Poisoned_14_00");	//� ��������� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Sagitta_Poisoned_16_00");	//� ���������� �������.
	};
	if (DIA_Sagitta_OnHello)	{
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_01");	//��, �������, �� ��� �����, ������ ����� ���������� �����.
	};
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_02");	//��� ��� ��� �� ����?
	if (POISON_DrgTears_Timer > 0)	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Sagitta_Poisoned_03_03");	//��� ����� ������ �� ����� �����. �� ���� ������ ��� �����!
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Sagitta_Poisoned_07_03");	//��� ����� ������ �� ����� �����. �� ���� ������ ��� �����!
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Sagitta_Poisoned_10_03");	//��������� �����...
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Sagitta_Poisoned_14_03");	//��� ����� ������ �� ����� �����. �� ���� ������ ��� �����!
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Sagitta_Poisoned_16_03");	//��� ����� ������ �� ����� �����. �� ���� ������ ��� �����!
		};
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_04");	//��������� �����! ���, ������, ����� ��� ���!
		B_GiveInvItems(self,other,ItPo_MR_AntiDragTears,1);
		B_UseItem(other,ItPo_MR_AntiDragTears);
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_05");	//� ������ ��� �����, ��� ������ � ���!
	}
	else if (POISON_Foggy_Timer > 0)	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Sagitta_Poisoned_03_06");	//����� ����� ����... ������ �� ���� ����� ��� �����.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Sagitta_Poisoned_07_06");	//��������.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Sagitta_Poisoned_10_06");	//��� ��� ���� ������ �����. � ���� �� ���� ��� ������ ����� �������.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Sagitta_Poisoned_14_06");	//����� ����� ����... ������ �� ���� ����� ��� �����.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Sagitta_Poisoned_16_06");	//����� ����� ����... ���� ��������� ����� ��-�� ����.
		};
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_07");	//���-���, ��������. �� ����������, �� ������ ���������. �����-�� ��� ���.
		B_GiveInvItems(self,other,ItPo_MR_AntiFoggy,1);
		B_UseItem(other,ItPo_MR_AntiFoggy);
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Sagitta_Poisoned_03_08");	//���, �����!
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Sagitta_Poisoned_07_08");	//���, �����!
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Sagitta_Poisoned_10_08");	//���, �����!
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Sagitta_Poisoned_14_08");	//���, �����!
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Sagitta_Poisoned_16_08");	//��, ��� �����!
		};
		AI_Output(self,other,"DIA_Sagitta_Poisoned_17_09");	//���������. ���� ����� ���������� ���������. ����� ����� ���� �������.
	};
	AI_StopProcessInfos(self);
	if (DIA_Sagitta_OnHello)	{
		DIA_Sagitta_OnHello = FALSE;
		Info_ClearChoices(DIA_Sagitta_Hello);
	};
};

// ���������� ������ ==================================================================
instance DIA_Sagitta_Recipe(C_Info)
{
	npc = OUT_1203_Sagitta;			nr = 2;
	condition = DIA_Sagitta_Recipe_cond;
	information = DIA_Sagitta_Recipe_info;
	description = "� �� ������ �����-������ ������� � ������� �����?";
};
func int DIA_Sagitta_Recipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Sagitta_Recipe_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Sagitta_Recipe_03_00");	//� �� ������ �����-������ ������� � ������� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Sagitta_Recipe_07_00");	//� �� ������ �����-������ ������� � ������� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Sagitta_Recipe_10_00");	//� �� ������ �����-������ ������� � ������� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sagitta_Recipe_14_00");	//� �� ������ �����-������ ������� � ������� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Sagitta_Recipe_16_00");	//� �� ������ �����-������ ������� � ������� �����?
	};
	AI_Output(self,other,"DIA_Sagitta_Recipe_17_01");	//�������? ���-�� ��������...
	AI_Output(self,other,"DIA_Sagitta_Recipe_17_02");	//���� ����� ������� � ���������� ��������. �������� ���� ����� � ��� ���� ������, ��� ����.
	AI_Output(self,other,"DIA_Sagitta_Recipe_17_03");	//����������� ������� � ������ ������� ����, ���� ��������. ����� ����� �������� �� ���������. ������ �� �����.
	MIS_Cookery_SagittaAsked = TRUE;
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_Sagitta);
};

// ���� ================================================================
instance DIA_Sagitta_Till_CrossCome(C_Info)
{
	npc = OUT_1203_Sagitta;					nr = 10;
	condition = DIA_Sagitta_Till_CrossCome_cond;
	information = DIA_Sagitta_Till_CrossCome_info;
	important = TRUE;
};
func int DIA_Sagitta_Till_CrossCome_cond()
{
	if ((MIS_Till_Pet == LOG_Running)
			&& HasFlags(MIS_Till_Pet_BirthPlace,MIS_Till_Pet_BirthPlace_Sagitta)
			&& (Npc_GetDistToPlayer(Molerat_Cross) < PERC_DIST_INTERMEDIAT))	{
		return TRUE;
	};
};
func void DIA_Sagitta_Till_CrossCome_info()
{
	B_GivePlayerXP(XP_Till_SagittaFound);
	AI_TurnToNpc(other, Molerat_Cross);
		AI_Output(other,self,"DIA_Sagitta_Till_CrossCome_14_00");	//�������! ��� �� ���! �� ���� ������?
	AI_TurnToNpc(other, self);
		AI_Output(other,self,"DIA_Sagitta_Till_CrossCome_14_01");	//��� �� ��� ������? �� �������?
	AI_Output(self,other,"DIA_Sagitta_Till_CrossCome_17_02");	//��, ��-������, �� ��, � ���. ��� �������.
		AI_Output(other,self,"DIA_Sagitta_Till_CrossCome_14_03");	//(���������) �������?
	AI_Output(self,other,"DIA_Sagitta_Till_CrossCome_17_04");	//��. � ��-������, � ��� ��� � �������. ������ ����� � ��� ����� ��������� � ��� ���� �����, ��� ����� �������� �������� ���������.
	AI_Output(self,other,"DIA_Sagitta_Till_CrossCome_17_05");	//������, ��� ������ � ��� ������ �� ������������.
	B_StartOtherRoutine(self, "START");
	MIS_Till_Pet_Found = TRUE;
	MIS_Till_Pet_KnowLost = TRUE;
	B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_Female);
};
// ----------------------------------------------------------
instance DIA_Sagitta_Till_CrossWhatToDo(C_Info)
{
	npc = OUT_1203_Sagitta;				nr = 11;
	condition = DIA_Sagitta_Till_CrossWhatToDo_cond;
	information = DIA_Sagitta_Till_CrossWhatToDo_info;
	description = "� ��� ��� � ��� ������?";
};
func int DIA_Sagitta_Till_CrossWhatToDo_cond()
{
	if ((MIS_Till_Pet == LOG_Running)
			&& HasFlags(MIS_Till_Pet_BirthPlace,MIS_Till_Pet_BirthPlace_Sagitta)
			&& (Npc_KnowsInfo(other,DIA_Sagitta_Till_CrossCome)))	{
		return TRUE;
	};
};
func void DIA_Sagitta_Till_CrossWhatToDo_info()
{
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_14_00");	//� ��� ��� � ��� ������?
	AI_Output(self,other,"DIA_Sagitta_Till_CrossWhatToDo_17_01");	//�� ������� �������� �� � ����. ��� ��� ���������� � ��������.
	Info_ClearChoices(DIA_Sagitta_Till_CrossWhatToDo);
	Info_AddChoice(DIA_Sagitta_Till_CrossWhatToDo,"� ���!",DIA_Sagitta_Till_CrossWhatToDo_How);
	Info_AddChoice(DIA_Sagitta_Till_CrossWhatToDo,"����� ����� ��� ��������� � ����.",DIA_Sagitta_Till_CrossWhatToDo_Stay);
};
func void DIA_Sagitta_Till_CrossWhatToDo_Stay()
{
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_Stay_14_00");	//����� ����� ��� ��������� � ����. �� ����� � ��� ������������.
	AI_Output(self,other,"DIA_Sagitta_Till_CrossWhatToDo_Stay_17_01");	//������. ������� ��������� �� ����� ��������� ����.
	Info_ClearChoices(DIA_Sagitta_Till_CrossWhatToDo);
	B_LogEntry_Status(TOPIC_Till_Pet,LOG_SUCCESS,TOPIC_Till_Pet_SagittaStay);
};
func void DIA_Sagitta_Till_CrossWhatToDo_How()
{
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_How_14_00");	//� ���! �� ��� ������� ������������, � � �������� ���������!
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_How_14_01");	//������ �����, ��� ������. ������� ������ �� �����, ��� ������� ������������. ������ ����.
	AI_Output(self,other,"DIA_Sagitta_Till_CrossWhatToDo_How_17_02");	//� �����-��, ���� ������ ������ �� ���� - ������� ��� ������� ����.
	AI_Output(self,other,"DIA_Sagitta_Till_CrossWhatToDo_How_17_03");	//������ ����� ����� �� ���������� �����, �����-������ ������ ����� ������.
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_How_14_04");	//���-�� ��������... ������ �������� ����� ���� ����� ������.
		AI_Output(other,self,"DIA_Sagitta_Till_CrossWhatToDo_How_14_05");	//������ ��� ������� ����������.
	AI_Output(self,other,"DIA_Sagitta_Till_CrossWhatToDo_How_17_06");	//����� ���� ����� �� ������ ��������.
	Info_ClearChoices(DIA_Sagitta_Till_CrossWhatToDo);
	Info_AddChoice(DIA_Sagitta_Till_CrossWhatToDo,"� ��� � ��������� � ������ ��������?",DIA_Sagitta_Till_Gobbo_Cant);
	Info_AddChoice(DIA_Sagitta_Till_CrossWhatToDo,"� � ���� ���������.",DIA_Sagitta_Till_Gobbo_OK);
	B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_BirthPlace);
};
func void DIA_Sagitta_Till_Gobbo_OK()
{
		AI_Output(other,self,"DIA_Sagitta_Till_Gobbo_OK_14_00");	//� � ���� ���������.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_OK_17_01");	//����� �����.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_OK_17_02");	//������ ���������� - ������� ����� �� �����. ����� ��������� ���� ���������.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_OK_17_03");	//� ��� - ������� ������ �� ���.
	Info_ClearChoices(DIA_Sagitta_Till_CrossWhatToDo);
	Wld_InsertItem(ItMi_Straw,"SP_STRAW_TILL");
};
func void DIA_Sagitta_Till_Gobbo_Cant()
{
	B_Spawn_BurnTea();
		AI_Output(other,self,"DIA_Sagitta_Till_Gobbo_Cant_14_00");	//� ��� � ��������� � ������ ��������?
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_Cant_17_01");	//��� � ����, � ���� ������.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_Cant_17_02");	//���� ���� ������, �������. ������� ��� ���� ������ ��� ������. � ���� �� ���� ����� � ���������� ���� ������, ��� ��� ��� ������� ���� ���� �� ����.
		AI_Output(other,self,"DIA_Sagitta_Till_Gobbo_Cant_14_03");	//�� ���� ��� ���� �����?
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_Cant_17_04");	//���� ��, �� � ���� ��� �� ��� �����. �������� ������� - �����.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_Cant_17_05");	//�� ������ ������ � ����� ������. �� ����� ������� ��������� � ����. ��� ����� ����� ���� ���� � ������, ��� � ������� ���� � ������.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_Cant_17_06");	//��� ������ ����� ���� �� ��� ������. ��� ���������, �� ����� �����, ����-���������.
	Info_ClearChoices(DIA_Sagitta_Till_CrossWhatToDo);
	B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_BurnTea);
	MIS_Till_Pet_SearchBurnTea = TRUE;
	Wld_InsertItem(ItMi_Straw,"SP_STRAW_TILL");
};
// ----------------------------------------------------------
var int DIA_Sagitta_Till_Valley_Once;
instance DIA_Sagitta_Till_Valley(C_Info)
{
	npc = OUT_1203_Sagitta;				nr = 12;
	condition = DIA_Sagitta_Till_Valley_cond;
	information = DIA_Sagitta_Till_Valley_info;
	description = "��� ��� ��� ������ � ��������?";
	permanent = TRUE;
};
func int DIA_Sagitta_Till_Valley_cond()
{
	if ((MIS_Till_Pet == LOG_Running)
			&& MIS_Till_Pet_SearchBurnTea)	{
		return TRUE;
	};
};
func void DIA_Sagitta_Till_Valley_info()
{
		AI_Output(other,self,"DIA_Sagitta_Till_Valley_14_00");	//��� ��� ��� ������ � ��������?
	if (DIA_Sagitta_Till_Valley_Once)	{
		AI_Output(self,other,"DIA_Sagitta_Till_Valley_17_01");	//(��������) �������� ��� ���. ������ �����������.
	};
	DIA_Sagitta_Till_Valley_Once = TRUE;
	AI_Output(self,other,"DIA_Sagitta_Till_Valley_17_02");	//����� � ����� �������. �� ��� � ���� ���� ������.
	AI_Output(self,other,"DIA_Sagitta_Till_Valley_17_03");	//��� ������ ������� ���� � ������� �����.
	AI_Output(self,other,"DIA_Sagitta_Till_Valley_17_04");	//�� ������ ����� ���� ���� � ������.
	AI_Output(self,other,"DIA_Sagitta_Till_Valley_17_05");	//�������� ������ �������� - �������� � �� ����� ������.
};
// ----------------------------------------------------------
instance DIA_Sagitta_Till_BurnTea(C_Info)
{
	npc = OUT_1203_Sagitta;			nr = 13;
	condition = DIA_Sagitta_Till_BurnTea_cond;
	information = DIA_Sagitta_Till_BurnTea_info;
	description = "� ������ �������.";
};
func int DIA_Sagitta_Till_BurnTea_cond()
{
	if ((MIS_Till_Pet == LOG_Running)
			&& MIS_Till_Pet_SearchBurnTea
			&& (Npc_HasItems(other,ItPl_BurnTea) >= 3))	{
		return TRUE;
	};
};
func void DIA_Sagitta_Till_BurnTea_info()
{
	var int x; x = 0;
	MIS_Till_Pet_SearchBurnTea = FALSE;
		AI_Output(other,self,"DIA_Sagitta_Till_BurnTea_14_00");	//� ������ �������.
	B_GiveInvItems(other,self,ItPl_BurnTea,3);
	AI_Output(self,other,"DIA_Sagitta_Till_BurnTea_17_01");	//������, ������ � ���������� �����. ������� �������.
	if (Npc_GetDistToWP(self,"NW_SAGITTA_CAVE_IN_03") < PERC_DIST_INTERMEDIAT)	{
		AI_UseMob(self,"LAB",1);
		AI_Wait(self,1);
		AI_UseMob(self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_TurnToNpc(self,other);
	};
	AI_Output(self,other,"DIA_Sagitta_Till_BurnTea_17_02");	//���, �����.
	B_GiveInvItems(self,other,ItPo_MR_AntiGobbo,1);
	B_GivePlayerXP(XP_Till_BurnteaGot);
		AI_Output(other,self,"DIA_Sagitta_Till_BurnTea_14_03");	//�������.
	AI_Output(self,other,"DIA_Sagitta_Till_BurnTea_17_04");	//���������� �������� ������, � ������� � ��� ��� ����� �� �������.
	AI_Output(self,other,"DIA_Sagitta_Till_Gobbo_OK_17_03");	//� ��� - ������� ������ �� ���.
	B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_BurnTeaGot);	
};


/////////////////////////////// ���� //////////////////////////////////

instance DIA_Sagitta_Sarah_AskSmokingCure(C_INFO)
{
	npc = OUT_1203_Sagitta;			nr = 20;
	condition = DIA_Sagitta_Sarah_AskSmokingCure_cond;
	information = DIA_Sagitta_Sarah_AskSmokingCure_info;
	description = "�� ����� �� �������� ���� �������� ����������?";
};
func int DIA_Sagitta_Sarah_AskSmokingCure_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_SearchPotion)	{
		return TRUE;
	};
};
func void DIA_Sagitta_Sarah_AskSmokingCure_info()
{
		AI_Output(other,self,"DIA_Sagitta_Sarah_AskSmokingCure_16_00");	//�����, �� ����� �� �������� ���� �������� ����������?
	AI_Output(self,other,"DIA_Sagitta_Sarah_AskSmokingCure_17_01");	//��, �����, �� ���� ������� � ���� ����� ����������...
		AI_Output(other,self,"DIA_Sagitta_Sarah_AskSmokingCure_16_02");	//���, ��� ������ �����.
	AI_Output(self,other,"DIA_Sagitta_Sarah_AskSmokingCure_17_03");	//����� �������� � ���������� ���������-����������.
};

/////////////////////////////// ��� //////////////////////////////////

instance DIA_Sagitta_Odo_HasPermHerb(C_INFO)
{
	npc = OUT_1203_Sagitta;			nr = 30;
	condition = DIA_Sagitta_Odo_HasPermHerb_cond;
	information = DIA_Sagitta_Odo_HasPermHerb_info;
	description = "� ���� �������� ��� �������� ������?";
};
func int DIA_Sagitta_Odo_HasPermHerb_cond()
{
	if (C_HeroIs_Odo()
		 && (MIS_Odo_Herbs == LOG_Running) && (MIS_Odo_Herbs_PermCnt < 3))	{
		return TRUE;
	};
};
func void DIA_Sagitta_Odo_HasPermHerb_info()
{
		AI_Output(other,self,"DIA_Sagitta_Odo_HasPermHerb_03_00");	//� ���� �������� ��� �������� ������?
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_01");	//�������. ��� �� ���������, ������ ��� ���� �� �����.
		AI_Output(other,self,"DIA_Sagitta_Odo_HasPermHerb_03_02");	//������ ��� ���� �� ����, �?
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_03");	//(� ���������) ����� ����� ������ ������ ��������� ������ �� ����� ������?
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_04");	//������� �� ������, � ���������� �����.
		AI_Output(other,self,"DIA_Sagitta_Odo_HasPermHerb_03_05");	//���� �� �� ������?
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_06");	//���� ������������ ���� �������� ������ �� ��������� ��������.
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_07");	//�� �������, �� � �� ������, �� ������� �������, � �� ����������.
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_08");	//� �������, ������ �������� ���� ��� ������� � �� ������������ � �����, �� ������ �� ������ �����, �� �������.
		AI_Output(other,self,"DIA_Sagitta_Odo_HasPermHerb_03_09");	//��� ���� ����� ���� ����?
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_10");	//���. � ���� ������, ��� ��� ���������� �����.
	AI_Output(self,other,"DIA_Sagitta_Odo_HasPermHerb_17_11");	//� ��� ��� ������? ������ ��������, ����� ��� �����-�� �������?
	B_LogEntry_Create(TOPIC_Odo_Wine, LOG_MISSION,TOPIC_Odo_Wine_PermSagitta);
	MIS_Odo_Wine = LOG_Running;
	MIS_Odo_Wine_SecretAsk = TRUE;
};
//------------------------------------------------------
instance DIA_Sagitta_Odo_WhyWine(C_INFO)
{
	npc = OUT_1203_Sagitta;			nr = 31;
	condition = DIA_Sagitta_Odo_WhyWine_cond;
	information = DIA_Sagitta_Odo_WhyWine_info;
	description = "����� ���� ������ ������ ����?";
};
func int DIA_Sagitta_Odo_WhyWine_cond()
{
	if (C_HeroIs_Odo()
		 && (MIS_Odo_Herbs == LOG_Running) && MIS_Odo_Wine_SecretAsk)	{
		return TRUE;
	};
};
func void DIA_Sagitta_Odo_WhyWine_info()
{
		AI_Output(other,self,"DIA_Sagitta_Odo_WhyWine_03_00");	//����� ���� ������ ������ ����?
		AI_Output(other,self,"DIA_Sagitta_Odo_WhyWine_03_01");	//� ����� �� ��������, � �� �������.
	AI_Output(self,other,"DIA_Sagitta_Odo_WhyWine_17_02");	//��, � � ��������, � �������, � ������� - ����� ����������. � ������ ����� - � ���������� �������.
	AI_Output(self,other,"DIA_Sagitta_Odo_WhyWine_17_03");	//� ������ ���� ������ ��, ���� ��� �� ����, � �������� ������ � ���, ��� � ��� �� �������.
};
//------------------------------------------------------
instance DIA_Sagitta_Odo_TellWine(C_INFO)
{
	npc = OUT_1203_Sagitta;			nr = 32;
	condition = DIA_Sagitta_Odo_TellWine_cond;
	information = DIA_Sagitta_Odo_TellWine_info;
	description = "� �������� ���� ������ ������ ����.";
};
func int DIA_Sagitta_Odo_TellWine_cond()
{
	if (C_HeroIs_Odo() && MIS_Odo_Wine_SecretGot)	{
		return TRUE;
	};
};
func void DIA_Sagitta_Odo_TellWine_info()
{
		AI_Output(other,self,"DIA_Sagitta_Odo_TellWine_03_00");	//� �������� ���� ������ ������ ����.
		AI_Output(other,self,"DIA_Sagitta_Odo_TellWine_03_01");	//����� �������� ���� ����� ����� ��������� ��������� ������ �������. ���� �� ���� ����� ������� � ������� ����.
	AI_Output(self,other,"DIA_Sagitta_Odo_TellWine_17_02");	//����! �������� ������, ��� ��� ���� � �����������...
	AI_Output(self,other,"DIA_Sagitta_Odo_TellWine_17_03");	//���� �� ������ ������ �� ����� ����� ���� ����� �������. � ��������.
	AI_Output(self,other,"DIA_Sagitta_Odo_TellWine_17_04");	//��� ���� ������� ������, ��� � � �������.
	B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
	B_LogEntry_Status(TOPIC_Odo_Wine, LOG_SUCCESS, TOPIC_Odo_Wine_Success);
	MIS_Odo_Wine = LOG_SUCCESS;
};


