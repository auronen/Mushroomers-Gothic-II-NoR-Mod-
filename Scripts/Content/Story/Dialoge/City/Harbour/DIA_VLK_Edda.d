
instance DIA_Edda_EXIT(DIA_Proto_End)
{
	npc = VLK_471_Edda;
};

/////////////////////////////////////// ���� /////////////////////////////////////////////

//===================================================
instance DIA_Edda_Sarah_Hello(C_Info)
{
	npc = VLK_471_Edda;				nr = 1;
	condition = DIA_Edda_Sarah_MR_Hello_cond;
	information = DIA_Edda_Sarah_MR_Hello_Info;
	description = "������, ����!";
};
func int DIA_Edda_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Edda_Sarah_MR_Hello_Info()
{
		AI_Output(other,self,"DIA_Edda_Sarah_MR_Hello_16_00");	//������, ����!
	AI_Output(self,other,"DIA_Edda_Sarah_MR_Hello_17_01");	//����! ��������� � ���� �� ������. ���, ��������� ����� � ������, ��� �� �������� �� ��� �� ������?
		AI_Output(other,self,"DIA_Edda_Sarah_MR_Hello_16_02");	//� ��� ����� �� �������?
	AI_Output(self,other,"DIA_Edda_Sarah_MR_Hello_17_03");	//������ ���� ���������. �� �� �� ������� �������: ����� ���� - ����� � ���.
	Edda_Feed = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_EddaFishSoup);
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Edda);
};

//===================================================
instance DIA_Edda_Sarah_HowAU(C_Info)
{
	npc = VLK_471_Edda;				nr = 2;
	condition = DIA_Edda_Sarah_HowAU_cond;
	information = DIA_Edda_Sarah_HowAU_Info;
	description = "��� ���������?";
};
func int DIA_Edda_Sarah_HowAU_cond()
{
	if (C_HeroIs_Sarah() && Npc_KnowsInfo(other,DIA_Edda_Sarah_Hello))	{
		return TRUE;
	};
};
func void DIA_Edda_Sarah_HowAU_Info()
{
		AI_Output(other,self,"DIA_Edda_Sarah_HowAU_16_00");	//��� ���������?
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_01");	//��� � �������, �������.
		AI_Output(other,self,"DIA_Edda_Sarah_HowAU_16_02");	//�����? ��������� ������������.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_03");	//�� ���... ������� ������� ����... ������. ������, ��� ��� ��� ������.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_04");	//���� ��� � �����, ����� ������, ���� ��������? ��� ��� ���-��...
		AI_Output(other,self,"DIA_Edda_Sarah_HowAU_16_05");	//������ ����! ���� ��� ������ � ����.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_06");	//��-�� � ���� �� ���� �� ������, ��� �� �� ����� ����.
		AI_Output(other,self,"DIA_Edda_Sarah_HowAU_16_07");	//��� ������ ������� ����. � ��� ������������ - ������, ����� � ���� ���������.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_08");	//�� ��, �������! �� ������� �� ������ �����.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_09");	//������, ���� �� ������� �����, ������ ���� ������ �� �������.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_10");	//������ ��� ������ � ������� ����� �������� �������, � ������ �� ���, �� ������ �� �����.
	AI_Output(self,other,"DIA_Edda_Sarah_HowAU_17_11");	//�����, �� � �� ����������?
};

//===================================================
instance DIA_Edda_Sarah_Fishers(C_Info)
{
	npc = VLK_471_Edda;				nr = 3;
	condition = DIA_Edda_Sarah_Fishers_cond;
	information = DIA_Edda_Sarah_Fishers_Info;
	description = "� ���� � �������.";
};
func int DIA_Edda_Sarah_Fishers_cond()
{
	if (C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Edda_Sarah_HowAU)
		 && (VLK_4304_Addon_William.aivar[AIV_TalkedToPlayer] || VLK_4301_Addon_Farim.aivar[AIV_TalkedToPlayer]))	{
		return TRUE;
	};
};
func void DIA_Edda_Sarah_Fishers_Info()
{
		AI_Output(other,self,"DIA_Edda_Sarah_Fishers_16_00");	//� ���� � �������. � ��������� ����� ���� ����� �� �����.
		AI_Output(other,self,"DIA_Edda_Sarah_Fishers_16_01");	//�������, ���� �������� � ���� ����. � ����� ����� ��������. � �����, ���� ������ �� ���������, ���� �� �����.
	AI_Output(self,other,"DIA_Edda_Sarah_Fishers_17_02");	//��������. �� ��� �����, ������� �� �������.
	B_GivePlayerXP(XP_Sarah_EddaAboutFishers);
};

//===================================================
instance DIA_Edda_Sarah_HelpNadja(C_Info)
{
	npc = VLK_471_Edda;				nr = 4;
	condition = DIA_Edda_Sarah_HelpNadja_cond;
	information = DIA_Edda_Sarah_HelpNadja_Info;
	description = "��� ����� � ����� ���������� ������ ����.";
};
func int DIA_Edda_Sarah_HelpNadja_cond()
{
	if (C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Edda_Sarah_Hello)
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_VatrasAsked)	{
		return TRUE;
	};
};
func void DIA_Edda_Sarah_HelpNadja_Info()
{
		AI_Output(other,self,"DIA_Edda_Sarah_HelpNadja_16_00");	//��� ����� � ����� ���������� ������ ����.
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_01");	//��? ��� � ���? ��������� ��� �� ��� �� �����������.
		AI_Output(other,self,"DIA_Edda_Sarah_HelpNadja_16_02");	//� ��� ��������.
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_03");	//������ ��������? �� ��� ��� ��� ���������?
		AI_Output(other,self,"DIA_Edda_Sarah_HelpNadja_16_04");	//����� ��������. ������, ��� ������ �� ���� ��� ������ � �����.
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_05");	//���, ������ �������. ������, ������ �� ���������� �����.
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_06");	//� ��� ���, ��� �� ���� �� ��������� ��������, ��� ���� ������ ���� ��������...
		AI_Output(other,self,"DIA_Edda_Sarah_HelpNadja_16_07");	//����, ��� ����� �� ����������! ��� ���� � ������ �������. ���� ��� ������� �� �����, � ����...
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_08");	//���.
		AI_Output(other,self,"DIA_Edda_Sarah_HelpNadja_16_09");	//���? ������?!
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_10");	//� �������� �������� �� ��� ����� ���. ���� ������� � ������, ����������� ������� �� ������� � �������� ���-������ ���������.
	AI_Output(self,other,"DIA_Edda_Sarah_HelpNadja_17_11");	//�� ��� ��������� ���� �� ���� �����. ��� ������ ������ �� �������.
	MIS_Sarah_BadHabit_EddaAsked = TRUE;
	B_GivePlayerXP(XP_Sarah_Nadja_EddaTalked);
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_EddaNoHelp);
};

/////////////////////////////////////// ������ /////////////////////////////////////////////

//===================================================
instance DIA_Edda_Rupert_Hello(C_Info)
{
	npc = VLK_471_Edda;				nr = 10;
	condition = DIA_Edda_Rupert_MR_Hello_cond;
	information = DIA_Edda_Rupert_MR_Hello_Info;
	important = TRUE;
};
func int DIA_Edda_Rupert_MR_Hello_cond()
{
	if (C_HeroIs_Rupert() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Edda_Rupert_MR_Hello_Info()
{
	AI_Output(self,other,"DIA_Edda_Rupert_MR_Hello_17_00");	//���, ����� ��� ����� � �������?
	AI_Output(self,other,"DIA_Edda_Rupert_MR_Hello_17_01");	//�� ������ ������� - ��� � ����� �� ����.
	Edda_Feed = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_EddaFishSoup);
};

/////////////////////////////////////// ��������� /////////////////////////////////////////////

//===================================================
instance DIA_Edda_Tasty(C_Info)
{
	npc = VLK_471_Edda;				nr = 20;
	condition = DIA_Edda_Tasty_cond;
	information = DIA_Edda_Tasty_Info;
	description = "��� ������ ������!";
};
func int DIA_Edda_Tasty_cond()
{
	if (!C_HeroIs_Rupert() && !C_HeroIs_Sarah()
		 && !Npc_KnowsInfo(other,DIA_Edda_Stink))	{
		return TRUE;
	};
};
func void DIA_Edda_Tasty_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Edda_Tasty_03_00");	//��� ������ ������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Edda_Tasty_07_00");	//��� ������ ������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Edda_Tasty_10_00");	//��� ������ ������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Edda_Tasty_14_00");	//��� ������ ������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Edda_Tasty_16_00");	//��� ������ ������!
	};
	AI_Output(self,other,"DIA_Edda_Tasty_17_01");	//�������. ������� ��� ������ ������ ������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Edda_Tasty_03_02");	//� ����� ��� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Edda_Tasty_07_02");	//� ����� ��� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Edda_Tasty_10_02");	//� ����� ��� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Edda_Tasty_14_02");	//� ����� ��� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Edda_Tasty_16_02");	//� ����� ��� �����������?
	};
	AI_Output(self,other,"DIA_Edda_Tasty_17_03");	//� ���� �� ��� ����, ��� �� ����� ��� � ���� ������������. �� � �� ���� ������ ��� ��� ����.
	AI_Output(self,other,"DIA_Edda_Tasty_17_04");	//������� ������� �������: ��������� ���� - ��������� ���.
	Edda_Feed = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_EddaFishSoup);
};

//===================================================
instance DIA_Edda_Stink(C_Info)
{
	npc = VLK_471_Edda;				nr = 21;
	condition = DIA_Edda_Stink_cond;
	information = DIA_Edda_Stink_Info;
	description = "��� �� ����?";
};
func int DIA_Edda_Stink_cond()
{
	if (!C_HeroIs_Rupert() && !C_HeroIs_Sarah()
		 && !Npc_KnowsInfo(other,DIA_Edda_Tasty))	{
		return TRUE;
	};
};
func void DIA_Edda_Stink_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Edda_Stink_03_00");	//��� �� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Edda_Stink_07_00");	//��� �� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Edda_Stink_10_00");	//��� �� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Edda_Stink_14_00");	//��� �� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Edda_Stink_16_00");	//��� �� ����?
	};
	AI_Output(self,other,"DIA_Edda_Stink_17_01");	//��� ������ ���� � ��������� ���.
	AI_Output(self,other,"DIA_Edda_Stink_17_02");	//�� �������� - ������.
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Edda_StinkSorry(C_Info)
{
	npc = VLK_471_Edda;				nr = 22;
	condition = DIA_Edda_StinkSorry_cond;
	information = DIA_Edda_StinkSorry_Info;
	description = "������, �...";
};
func int DIA_Edda_StinkSorry_cond()
{
	if (!C_HeroIs_Rupert() && !C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Edda_Stink))	{
		return TRUE;
	};
};
func void DIA_Edda_StinkSorry_Info()
{
	Info_ClearChoices(DIA_Edda_StinkSorry);
	Info_AddChoice(DIA_Edda_StinkSorry,"...������ �� ����� ����.",DIA_Edda_StinkSorry_DontLikeFish);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Edda_StinkSorry,"...������ ������ ��, ��� �����.",DIA_Edda_StinkSorry_BadSoup);
		Info_AddChoice(DIA_Edda_StinkSorry,"...������, �� �������.",DIA_Edda_StinkSorry_DidntThink);
	}	else	{
		Info_AddChoice(DIA_Edda_StinkSorry,"...������ ������� ��, ��� �����.",DIA_Edda_StinkSorry_BadSoup);
		Info_AddChoice(DIA_Edda_StinkSorry,"...�������, �� �������.",DIA_Edda_StinkSorry_DidntThink);
	};
};
func void DIA_Edda_StinkSorry_DidntThink()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Edda_StinkSorry_DidntThink_03_00");	//������, � ������, �� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Edda_StinkSorry_DidntThink_07_00");	//������, � ������, �� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Edda_StinkSorry_DidntThink_10_00");	//������, � ������, �� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Edda_StinkSorry_DidntThink_14_00");	//������, � ������, �� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Edda_StinkSorry_DidntThink_16_00");	//������, � �������, �� �������.
	};
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Edda_StinkSorry_DidntThink_17_01");	//��� ����� � ������ ���, ������ ��� �������� ���.
	Info_ClearChoices(DIA_Edda_StinkSorry);
};
func void DIA_Edda_StinkSorry_BadSoup()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_03_00");	//������, � ������ ������ ��, ��� �����.
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_03_01");	//� �� ����� ���� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_07_00");	//������, � ������ ������ ��, ��� �����.
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_07_01");	//� �� ����� ���� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_10_00");	//������, � ������ ������ ��, ��� �����.
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_10_01");	//� �� ����� ���� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_14_00");	//������, � ������ ������ ��, ��� �����.
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_14_01");	//� �� ����� ���� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_16_00");	//������, � ������ ������� ��, ��� �����.
		AI_Output(other,self,"DIA_Edda_StinkSorry_BadSoup_16_01");	//� �� ������ ���� �������.
	};
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Edda_StinkSorry_BadSoup_17_02");	//� ��� �������: �� �������� - ������.
	Info_ClearChoices(DIA_Edda_StinkSorry);
};
func void DIA_Edda_StinkSorry_DontLikeFish()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Edda_StinkSorry_DontLikeFish_03_00");	//������, � ������ �� ����� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Edda_StinkSorry_DontLikeFish_07_00");	//������, � ������ �� ����� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Edda_StinkSorry_DontLikeFish_10_00");	//������, � ������ �� ����� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Edda_StinkSorry_DontLikeFish_14_00");	//������, � ������ �� ����� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Edda_StinkSorry_DontLikeFish_16_00");	//������, � ������ �� ����� ����.
	};
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Edda_StinkSorry_DontLikeFish_17_01");	//�� �� ������, �� �������� � ��� ���� ������� �����������.
	AI_Output(self,other,"DIA_Edda_StinkSorry_DontLikeFish_17_02");	//��� ��� ��������� ������� �������� �����, ��� �� �����?
	Info_ClearChoices(DIA_Edda_StinkSorry);
};

//===================================================
instance DIA_Edda_StinkSorryPerm(C_Info)
{
	npc = VLK_471_Edda;				nr = 23;
	condition = DIA_Edda_StinkSorryPerm_cond;
	information = DIA_Edda_StinkSorryPerm_Info;
	description = "��� ��� ������.";
};
func int DIA_Edda_StinkSorryPerm_cond()
{
	if (!C_HeroIs_Rupert() && !C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Edda_StinkSorry))	{
		return TRUE;
	};
};
func void DIA_Edda_StinkSorryPerm_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Edda_StinkSorryPerm_03_00");	//��� ��� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Edda_StinkSorryPerm_07_00");	//��� ��� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Edda_StinkSorryPerm_10_00");	//��� ��� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Edda_StinkSorryPerm_14_00");	//��� ��� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Edda_StinkSorryPerm_16_00");	//��� ��� ������.
	};
	AI_Output(self,other,"DIA_Edda_StinkSorryPerm_17_01");	//�������. � ������ �� ����� ��� ��������.
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Edda_FishSoup(C_Info)
{
	npc = VLK_471_Edda;				nr = 50;
	condition = DIA_Edda_FishSoup_cond;
	information = DIA_Edda_FishSoup_Info;
	description = "����� ��� ����� ���.";
	permanent = TRUE;
};
func int DIA_Edda_FishSoup_cond()
{
	if (Edda_Feed)	{
		return TRUE;
	};
};
func void DIA_Edda_FishSoup_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Edda_FishSoup_03_00");	//����� ��� ����� ���.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Edda_FishSoup_07_00");	//����� ��� ����� ���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Edda_FishSoup_10_00");	//����� ��� ����� ���.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Edda_FishSoup_14_00");	//����� ��� ����� ���.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Edda_FishSoup_16_00");	//����� ��� ����� ���.
	};
	if (!Wld_IsTime(22,0,6,0))	{
		if (Npc_HasItems(other,ItFo_Fish))	{
			B_GiveInvItems(other, self, ItFo_Fish,1);
			AI_Output(self,other,"DIA_Edda_FishSoup_17_01");	//����� �������.
			B_GiveInvItems(self,other,ItFo_FishSoup,1);
		}
		else	{
			AI_Output(self,other,"DIA_Edda_FishSoup_17_02");	//������� ������� ����. ��� ���� - ��� ���.
		};
	}
	else	{
		AI_Output(self,other,"DIA_Edda_FishSoup_17_03");	//������� �����.
	};
};

