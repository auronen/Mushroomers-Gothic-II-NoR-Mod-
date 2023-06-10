
instance DIA_Thekla_EXIT(DIA_Proto_End)
{
	npc = BAU_913_Thekla;
};

/////////////////////////////////////// ����� /////////////////////////////////////////////

//===================================================
instance DIA_Thekla_Elena_Help(C_Info)
{
	npc = BAU_913_Thekla;				nr = 1;
	condition = DIA_Thekla_Elena_Help_Cond;
	information = DIA_Thekla_Elena_Help_Info;
	description = "���� � ���� ���-������ ������?";
};
func int DIA_Thekla_Elena_Help_Cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Thekla_Elena_Help_Info()
{
		AI_Output(other,self,"DIA_Thekla_Elena_Help_16_00");	//���� � ���� ���-������ ������?
	AI_Output(self,other,"DIA_Thekla_Elena_Help_17_01");	//������ �������� � �����?
		AI_Output(other,self,"DIA_Thekla_Elena_Help_16_02");	//���... �� ������. � �������� � ������� �������� �����������, ��� ����� ������ ������� ��� ����� ������ ������ �� ����� ������.
	AI_Output(self,other,"DIA_Thekla_Elena_Help_17_03");	//�����, ��������? �����, ���� ������� ���� �� ���� �������� ����.
	AI_Output(self,other,"DIA_Thekla_Elena_Help_17_04");	//����� ����, �� � ��� ������ ���������?
		AI_Output(other,self,"DIA_Thekla_Elena_Help_16_05");	//�� ���� ������ ��������? � ������� ����� �� �������.
	AI_Output(self,other,"DIA_Thekla_Elena_Help_17_06");	//� � � �� ����� � ���� ����-�� �������������������, ��� ����� �������-��������.
	AI_Output(self,other,"DIA_Thekla_Elena_Help_17_07");	//������� ����� ������� ������� ��������. �������, �� ������ ������������ �� ����� ������� ������.
	B_LogEntry_Create(TOPIC_Elena_TheklaSoup,LOG_MISSION,TOPIC_Elena_TheklaSoup_NeedRedMr);
	MIS_Elena_TheklaSoup = LOG_Running;
};

//===================================================
instance DIA_Thekla_Elena_GiveMr(C_Info)
{
	npc = BAU_913_Thekla;				nr = 2;
	condition = DIA_Thekla_Elena_GiveMr_Cond;
	information = DIA_Thekla_Elena_GiveMr_Info;
	description = "� �������� ���� �����.";
};
func int DIA_Thekla_Elena_GiveMr_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Thekla_Elena_Help) && (Npc_HasItems(other,ItMr_Red) >= 10))	{
		return TRUE;
	};
};
func void DIA_Thekla_Elena_GiveMr_Info()
{
		AI_Output(other,self,"DIA_Thekla_Elena_GiveMr_16_00");	//� �������� ���� �����.
	AI_Output(self,other,"DIA_Thekla_Elena_GiveMr_17_01");	//�������! ������ � ��� ����� ������� ������.
	Thekla_MrSoup_Day = Wld_GetDay() + 1;
	B_LogEntry(TOPIC_Elena_TheklaSoup,TOPIC_Elena_TheklaSoup_MrGiven);
};

//===================================================
instance DIA_Thekla_Elena_MrSoup(C_Info)
{
	npc = BAU_913_Thekla;				nr = 3;
	condition = DIA_Thekla_Elena_MrSoup_Cond;
	information = DIA_Thekla_Elena_MrSoup_Info;
	description = "��� ��� ��� ������?";
};
func int DIA_Thekla_Elena_MrSoup_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Thekla_Elena_GiveMr) && (Wld_GetDay_Shifted(8) >= Thekla_MrSoup_Day))	{
		return TRUE;
	};
};
func void DIA_Thekla_Elena_MrSoup_Info()
{
		AI_Output(other,self,"DIA_Thekla_Elena_MrSoup_16_00");	//��� ��� ��� ������?
	AI_Output(self,other,"DIA_Thekla_Elena_MrSoup_17_01");	//���, �������� �� ��������.
	B_GiveInvItems(self,other,ItFo_MrSoup,1);
	B_LogEntry_Status(TOPIC_Elena_TheklaSoup,LOG_SUCCESS,TOPIC_Elena_TheklaSoup_GotSoup);
	MIS_Elena_TheklaSoup = LOG_SUCCESS;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Thekla_MR_Perm(C_Info)
{
	npc = BAU_913_Thekla;				nr = 20;
	condition = DIA_NoCond_cond;
	information = DIA_Thekla_MR_Perm_Info;
	description = "�������� ����?";
	permanent = TRUE;
};
func void DIA_Thekla_MR_Perm_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thekla_MR_Perm_03_00");	//�������� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thekla_MR_Perm_07_00");	//�������� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thekla_MR_Perm_10_00");	//�������� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thekla_MR_Perm_14_00");	//�������� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thekla_MR_Perm_16_00");	//�������� ����?
	};
	if (C_HeroIs_Elena())	{
		if (Thekla_Feed_Day > Wld_GetDay())	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_01");	//�� ������� ��� �������. ������, � �� �����������!
		}
		else if (Wld_IsTime(22,0,9,0))	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_02");	//������ ������ ���. ������� ����.
		}
		else	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_03");	//�������, ����� �������.
			B_GiveInvItems(self,other,ItFo_Stew,1);
			Thekla_Feed_Day = Wld_GetDay() + 1;
		};
	}
	else if (C_HeroIs_Till())	{
		if (Thekla_Feed_Day > Wld_GetDay())	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_04");	//� ���� ������� ��� �������. ���� �������!
		}
		else if (Wld_IsTime(22,0,9,0))	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_02");	//������ ������ ���. ������� ����.
		}
		else	{
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_05");	//���� ���� ������ �� ������, ��� ��?
			AI_Output(self,other,"DIA_Thekla_MR_Perm_17_06");	//�����, ����� �������.
			B_GiveInvItems(self,other,ItFo_Stew,1);
			Thekla_Feed_Day = Wld_GetDay() + 1;
		};
	}
	else	{
		AI_Output(self,other,"DIA_Thekla_MR_Perm_17_07");	//� ���� �� ���?
	};
};

// ���������� ������ ===================================================
instance DIA_Thekla_AskRecipe(C_Info)
{
	npc = BAU_913_Thekla;				nr = 10;
	condition = DIA_Thekla_AskRecipe_cond;
	information = DIA_Thekla_AskRecipe_Info;
	description = "� � ���� ���� ������ ����� �� ������� ����?";
};
func int DIA_Thekla_AskRecipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Thekla_AskRecipe_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thekla_AskRecipe_03_00");	//� � ���� ���� ������ ����� �� ������� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thekla_AskRecipe_07_00");	//� � ���� ���� ������ ����� �� ������� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thekla_AskRecipe_10_00");	//� � ���� ���� ������ ����� �� ������� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thekla_AskRecipe_14_00");	//� � ���� ���� ������ ����� �� ������� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thekla_AskRecipe_16_00");	//� � ���� ���� ������ ����� �� ������� ����?
	};
	AI_Output(self,other,"DIA_Thekla_AskRecipe_17_01");	//�� ����?! �� ����?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thekla_AskRecipe_03_02");	//���������, ��� ���� �����, �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thekla_AskRecipe_07_02");	//���������, ��� ���� �����, �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thekla_AskRecipe_10_02");	//���������, ��� ���� �����, �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thekla_AskRecipe_14_02");	//���������, ��� ���� �����, �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thekla_AskRecipe_16_02");	//���������, ��� ���� �����, �������.
	};
	AI_Output(self,other,"DIA_Thekla_AskRecipe_17_03");	//�� ���� ������ �� ������... � �� ����� ���������? �������������� �� �����-��...
	AI_Output(self,other,"DIA_Thekla_AskRecipe_17_04");	//������ ���������, ����� � ��� ������ �������� ����� �����.
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_TheklaEatable);
};

// ===================================================
instance DIA_Thekla_TellEatable(C_Info)
{
	npc = BAU_913_Thekla;				nr = 11;
	condition = DIA_Thekla_TellEatable_cond;
	information = DIA_Thekla_TellEatable_Info;
	description = "������� ����������� ������, ��� �����-��� ����� ����.";
};
func int DIA_Thekla_TellEatable_cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && MIS_Cookery_ConstantinoAsked && Npc_KnowsInfo(other,DIA_Thekla_AskRecipe))	{
		return TRUE;
	};
};
func void DIA_Thekla_TellEatable_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thekla_TellEatable_03_00");	//������� ����������� ������, ��� �����-��� ����� ����.
		AI_Output(other,self,"DIA_Thekla_TellEatable_03_01");	//�� �� ���� ���������� � �������� ���� ��� ���� �� ��� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thekla_TellEatable_07_00");	//������� ����������� ������, ��� �����-��� ����� ����.
		AI_Output(other,self,"DIA_Thekla_TellEatable_07_01");	//�� �� ���� ���������� � �������� ���� ��� ���� �� ��� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thekla_TellEatable_10_00");	//������� ����������� ������, ��� �����-��� ����� ����.
		AI_Output(other,self,"DIA_Thekla_TellEatable_10_01");	//�� �� ���� ���������� � �������� ���� ��� ���� �� ��� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thekla_TellEatable_14_00");	//������� ����������� ������, ��� �����-��� ����� ����.
		AI_Output(other,self,"DIA_Thekla_TellEatable_14_01");	//�� �� ���� ���������� � �������� ���� ��� ���� �� ��� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thekla_TellEatable_16_00");	//������� ����������� ������, ��� �����-��� ����� ����.
		AI_Output(other,self,"DIA_Thekla_TellEatable_16_02");	//�� �� ���� ���������� � �������� ���� ��� ���� �� ��� ����.
	};
	AI_Output(self,other,"DIA_Thekla_TellEatable_17_03");	//��, �����-�� �������! �����, ����� ����... ���. ����� 3 ��� ����� ������.
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_TheklaNeed3);
};
// ===================================================
instance DIA_Thekla_TryCook(C_Info)
{
	npc = BAU_913_Thekla;				nr = 12;
	condition = DIA_Thekla_TryCook_cond;
	information = DIA_Thekla_TryCook_Info;
	description = "������ �����. (������ 3 ������� ����)";
	permanent = TRUE;
};
func int DIA_Thekla_TryCook_cond()
{
	if ((MIS_Cookery == LOG_Running) && Npc_KnowsInfo(other,DIA_Thekla_TellEatable) && Npc_HasItems(other,ItMr_LadysEar)
		 && MIS_Cookery_ConstantinoAsked && (MIS_Cookery_TheklaTime == 0))	{
		return TRUE;
	};
};
func void DIA_Thekla_TryCook_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thekla_TryCook_03_00");	//������ �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thekla_TryCook_07_00");	//������ �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thekla_TryCook_10_00");	//������ �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thekla_TryCook_14_00");	//������ �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thekla_TryCook_16_00");	//������ �����.
	};
	if (Npc_HasItems(other,ItMr_LadysEar) >= 3)	{
		B_GiveInvItems(other,self,ItMr_LadysEar,3);
		AI_Output(self,other,"DIA_Thekla_TryCook_17_01");	//������� ������ ����� �������, �������� ���-������ ����������.
		B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_TheklaTry);
		MIS_Cookery_TheklaTime = ((Wld_GetDay() + 1) * 24 + 12) * 60;
	}
	else	{
		AI_Output(self,other,"DIA_Thekla_TryCook_17_02");	//��� ����� ��� �����.
	};
};
// ===================================================
instance DIA_Thekla_EarsReady(C_Info)
{
	npc = BAU_913_Thekla;				nr = 13;
	condition = DIA_Thekla_EarsReady_cond;
	information = DIA_Thekla_EarsReady_Info;
	description = "�� ���, ��� ������?";
};
func int DIA_Thekla_EarsReady_cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && (MIS_Cookery_TheklaTime > 0) && (MIS_Cookery_TheklaTime < Wld_GetFullTime()))	{
		return TRUE;
	};
};
func void DIA_Thekla_EarsReady_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thekla_EarsReady_03_00");	//�� ���, ��� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thekla_EarsReady_07_00");	//�� ���, ��� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thekla_EarsReady_10_00");	//�� ���, ��� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thekla_EarsReady_14_00");	//�� ���, ��� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thekla_EarsReady_16_00");	//�� ����, ��� ������?
	};
	AI_Output(self,other,"DIA_Thekla_EarsReady_17_01");	//������. (���������) ����, ����� � ���������� ��������, �� ����������.
	AI_Output(self,other,"DIA_Thekla_EarsReady_17_02");	//� �� ���� ������ ����������. ���, � ������ ��������.
	B_GiveInvItems(self,other,ItWr_EarRecipe_Thekla,1);
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thekla_EarsReady_03_03");	//�������. � ����������� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thekla_EarsReady_07_03");	//�������. � ����������� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thekla_EarsReady_10_03");	//�������. � ����������� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thekla_EarsReady_14_03");	//�������. � ����������� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thekla_EarsReady_16_03");	//�������. � ����������� �����?
	};
	AI_Output(self,other,"DIA_Thekla_EarsReady_17_04");	//�������. �����, ��������� ������ ���� �����.
	B_GiveInvItems(self,other,ItFo_FriedEars,1);
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_TheklaReady);
};

