
instance DIA_Nadja_EXIT(DIA_Proto_End)
{
	npc = VLK_435_Nadja;
};

/////////////////////////////// ���� //////////////////////////////////
var int Nadja_Ask_Tries;
//===================================================
instance DIA_Nadja_Sarah_Hello(C_Info)
{
	npc = VLK_435_Nadja;			nr = 1;
	condition = DIA_Nadja_Sarah_MR_Hello_Cond;
	information = DIA_Nadja_Sarah_MR_Hello_Info;
	description = "������!";
};
func int DIA_Nadja_Sarah_MR_Hello_Cond()
{
	if (C_HeroIs_Sarah())	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_MR_Hello_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_MR_Hello_16_00");	//������!
	AI_Output(self,other,"DIA_Nadja_Sarah_MR_Hello_17_01");	//(������) ���� ����? ������ ������������, ��� ������� �� ������ ������?
		AI_Output(other,self,"DIA_Nadja_Sarah_MR_Hello_16_02");	//���, �...
	AI_Output(self,other,"DIA_Nadja_Sarah_MR_Hello_17_03");	//���, ���-���� �������� �������? (����� ������)
	AI_Output(self,other,"DIA_Nadja_Sarah_MR_Hello_17_04");	//� �������, �����, ������. �����, � ���� �������� ����?
		AI_Output(other,self,"DIA_Nadja_Sarah_MR_Hello_16_05");	//���. � �� �����.
	AI_Output(self,other,"DIA_Nadja_Sarah_MR_Hello_17_06");	//�������-�� �����.
	B_GivePlayerXP(XP_Sarah_NadjaHello);
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Nadja);
};

//===================================================
instance DIA_Nadja_Sarah_Voice(C_Info)
{
	npc = VLK_435_Nadja;			nr = 2;
	condition = DIA_Nadja_Sarah_Voice_Cond;
	information = DIA_Nadja_Sarah_Voice_Info;
	description = "��� � ����� �������?";
};
func int DIA_Nadja_Sarah_Voice_Cond()
{
	if (C_HeroIs_Sarah() && Npc_KnowsInfo(other,DIA_Nadja_Sarah_Hello))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_Voice_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_Voice_16_00");	//��� � ����� �������?
	AI_Output(self,other,"DIA_Nadja_Sarah_Voice_17_01");	//� ��� � ���?
		AI_Output(other,self,"DIA_Nadja_Sarah_Voice_16_02");	//�� ��������, ����� �� ������ �������, ��� ������������ ������ ����� ������ ������.
	AI_Output(self,other,"DIA_Nadja_Sarah_Voice_17_03");	//�� �� �������������! �� �����, � ��������� �������.
	AI_Output(self,other,"DIA_Nadja_Sarah_Voice_17_04");	//����� ��������, �����, ��� ����...
	Nadja_Ask_Tries += 1;
};

//===================================================
instance DIA_Nadja_Sarah_LookLikeDeath(C_Info)
{
	npc = VLK_435_Nadja;			nr = 3;
	condition = DIA_Nadja_Sarah_LookLikeDeath_Cond;
	information = DIA_Nadja_Sarah_LookLikeDeath_Info;
	description = "����� ���������.";
};
func int DIA_Nadja_Sarah_LookLikeDeath_Cond()
{
	if (C_HeroIs_Sarah() && Npc_KnowsInfo(other,DIA_Nadja_Sarah_Hello))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_LookLikeDeath_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_LookLikeDeath_16_00");	//����� ���������.
	AI_Output(self,other,"DIA_Nadja_Sarah_LookLikeDeath_17_01");	//� �� ����� ������� � ������� ������.
		AI_Output(other,self,"DIA_Nadja_Sarah_LookLikeDeath_16_02");	//� ��������. ���� � �����, ���, �������, ������ ���� ��� ���������.
		AI_Output(other,self,"DIA_Nadja_Sarah_LookLikeDeath_16_03");	//���, �� ������ �������� �� ����! ����� ��� ������� �� ����� �����, ����� ���������, ����...
	AI_Output(self,other,"DIA_Nadja_Sarah_LookLikeDeath_17_04");	//������, ������. �� ���� ������!
	Nadja_Ask_Tries += 1;
};

//===================================================
instance DIA_Nadja_Sarah_WhatHappened(C_Info)
{
	npc = VLK_435_Nadja;			nr = 4;
	condition = DIA_Nadja_Sarah_WhatHappened_Cond;
	information = DIA_Nadja_Sarah_WhatHappened_Info;
	description = "�� ��� � ����� ��������?";
	permanent = TRUE;
};
func int DIA_Nadja_Sarah_WhatHappened_Cond()
{
	if (C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Nadja_Sarah_Voice) && Npc_KnowsInfo(other,DIA_Nadja_Sarah_LookLikeDeath)
		 && !Npc_KnowsInfo(other,DIA_Nadja_Sarah_TellAsIs)
		 && !MIS_Sarah_BadHabit_NadjaAgreed)	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_WhatHappened_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_WhatHappened_16_00");	//�� ��� � ����� ��������?
	AI_Output(self,other,"DIA_Nadja_Sarah_WhatHappened_17_01");	//� �� ������� - �� ���� ����. �� ���� � ��� �����!
	Nadja_Ask_Tries += 1;
};
//===================================================
instance DIA_Nadja_Sarah_TellAsIs(C_Info)
{
	npc = VLK_435_Nadja;			nr = 5;
	condition = DIA_Nadja_Sarah_TellAsIs_Cond;
	information = DIA_Nadja_Sarah_TellAsIs_Info;
	description = "���������� ������ ��� �����, ����� ����� ������!";
};
func int DIA_Nadja_Sarah_TellAsIs_Cond()
{
	if (C_HeroIs_Sarah() && (Nadja_Ask_Tries >= 3) && Kardif_RumorsTold[1])	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_TellAsIs_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_TellAsIs_16_00");	//����� ����� - ���������� ������ ��� �����, ����� ����� ������!
	AI_Output(self,other,"DIA_Nadja_Sarah_TellAsIs_17_03");	//� ���� ����� ����? �������� �� ����!
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_NadjaNotListen);
};
//===================================================
instance DIA_Nadja_Sarah_ItsMe(C_Info)
{
	npc = VLK_435_Nadja;			nr = 6;
	condition = DIA_Nadja_Sarah_ItsMe_Cond;
	information = DIA_Nadja_Sarah_ItsMe_Info;
	description = "��, ��� �� �, ����, ���� ������� �������.";
	permanent = TRUE;
};
func int DIA_Nadja_Sarah_ItsMe_Cond()
{
	if (C_HeroIs_Sarah()
		 && Npc_KnowsInfo(other,DIA_Nadja_Sarah_TellAsIs) 
		 && !MIS_Sarah_BadHabit_NadjaAgreed)	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_ItsMe_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_ItsMe_16_00");	//��, ��� �� �, ����, ���� ������� �������.
		AI_Output(other,self,"DIA_Nadja_Sarah_ItsMe_16_01");	//�������, ��� �� ������ ������ �������	��� ��� ������?
		AI_Output(other,self,"DIA_Nadja_Sarah_ItsMe_16_02");	//�����, ��������, ��� � ����� ����������.
	AI_Output(self,other,"DIA_Nadja_Sarah_ItsMe_17_03");	//��� ����, �� ������. �� � �� �� ���� ����� ������� � �������.
};

//===================================================
instance DIA_Nadja_Sarah_MoeTalked(C_Info)
{
	npc = VLK_435_Nadja;			nr = 7;
	condition = DIA_Nadja_Sarah_MoeTalked_Cond;
	information = DIA_Nadja_Sarah_MoeTalked_Info;
	important = TRUE;
};
func int DIA_Nadja_Sarah_MoeTalked_Cond()
{
	if (C_HeroIs_Sarah()
		&& MIS_Sarah_BadHabit_MoeTalked)	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_MoeTalked_Info()
{
	AI_Output(self,other,"DIA_Nadja_Sarah_MoeTalked_17_01");	//��� ��  ��������� ���� �������, ������� ����� ������ ����� �������� �������?
		AI_Output(other,self,"DIA_Nadja_Sarah_MoeTalked_16_02");	//��, � ���� ���� ������!
	AI_Output(self,other,"DIA_Nadja_Sarah_MoeTalked_17_03");	//�����, �� ������� �� ���� �������.
		AI_Output(other,self,"DIA_Nadja_Sarah_MoeTalked_16_04");	//� ���� �� �����?
	AI_Output(self,other,"DIA_Nadja_Sarah_MoeTalked_17_05");	//(� ���������) � ������, � ���� ��?
};

//===================================================
instance DIA_Nadja_Sarah_ItWorked(C_Info)
{
	npc = VLK_435_Nadja;			nr = 8;
	condition = DIA_Nadja_Sarah_ItWorked_Cond;
	information = DIA_Nadja_Sarah_ItWorked_Info;
	important = TRUE;
};
func int DIA_Nadja_Sarah_ItWorked_Cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit_NadjaTalkTime > 0)
		 && (Wld_GetFullTime() >= MIS_Sarah_BadHabit_NadjaTalkTime))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_ItWorked_Info()
{
	B_GivePlayerXP(XP_Sarah_Nadja_ItWorked);
	AI_Output(self,other,"DIA_Nadja_Sarah_ItWorked_17_01");	//��, ��, �������! ��������-���� ������?
		AI_Output(other,self,"DIA_Nadja_Sarah_ItWorked_16_02");	//�� � ���?
	AI_Output(self,other,"DIA_Nadja_Sarah_ItWorked_17_03");	//������ �������, ��� � ����� ����� � �� ���������, ��� ���������� ��� ������ ����?
	AI_Output(self,other,"DIA_Nadja_Sarah_ItWorked_17_04");	//�� � � ������ �� �������� �� ��������. ���� �����, � ���... (������ ������)
	AI_Output(self,other,"DIA_Nadja_Sarah_ItWorked_17_05");	//������ �������!!! � �� ������� �� �������� � ������ ��������!
	AI_Output(self,other,"DIA_Nadja_Sarah_ItWorked_17_06");	//�������, ��� � ����� ���� ���������! ������� �� ����, ������� � ����������.
		AI_Output(other,self,"DIA_Nadja_Sarah_ItWorked_16_07");	//� ��������� ���������, ��� ���� ������.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_ItWorked);
	MIS_Sarah_BadHabit_NadjaAgreed = TRUE;
	MIS_Sarah_BadHabit_SearchPotion = TRUE;
};

//===================================================
instance DIA_Nadja_Sarah_GivePotion(C_Info)
{
	npc = VLK_435_Nadja;			nr = 9;
	condition = DIA_Nadja_Sarah_GivePotion_Cond;
	information = DIA_Nadja_Sarah_GivePotion_Info;
	description = "� ���� ���� �����, ������� ������� ����.";
};
func int DIA_Nadja_Sarah_GivePotion_Cond()
{
	if (C_HeroIs_Sarah() && (MIS_Sarah_BadHabit == LOG_Running)
		&& MIS_Sarah_BadHabit_NadjaAgreed && (Npc_HasItems(other,ItMi_AntismokingPotion)))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_GivePotion_Info()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_16_00");	//� ���� ���� �����, ������� ������� ����.
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_16_01");	//�� �� �����, ���� ��� ������ ��� �������!
	AI_Output(self,other,"DIA_Nadja_Sarah_GivePotion_17_02");	//��� �� �� ���� ������?
	Info_ClearChoices(DIA_Nadja_Sarah_GivePotion);
	Info_AddChoice(DIA_Nadja_Sarah_GivePotion,"1500 �������.",DIA_Nadja_Sarah_GivePotion_Gold);
	Info_AddChoice(DIA_Nadja_Sarah_GivePotion,"���������� ���� ��������� ����.",DIA_Nadja_Sarah_GivePotion_Thanks);
};
func void DIA_Nadja_Sarah_GivePotion_DoGive()
{
	B_GiveInvItems(other,self,ItMi_AntismokingPotion,1);
	MIS_Sarah_BadHabit_GivePotionDay = Wld_GetDay_Shifted(4) + 1;
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_DoGive_16_00");	//��� �� �������� � ����. ������ �� ����, ��� ������� ���� ������.
	AI_Output(self,other,"DIA_Nadja_Sarah_GivePotion_DoGive_17_01");	//������.
	Info_ClearChoices(DIA_Nadja_Sarah_GivePotion);
};
func void DIA_Nadja_Sarah_GivePotion_Thanks()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_Thanks_16_00");	//���������� ���� ��������� ����.
	B_GivePlayerXP(XP_Sarah_Nadja_PotionFree);
	AI_Output(self,other,"DIA_Nadja_Sarah_GivePotion_Thanks_17_01");	//� �� ������ �� ����������, �������.
	AI_Output(self,other,"DIA_Nadja_Sarah_GivePotion_Thanks_17_02");	//����������, ��� ��� ���� �����. � �������, ��� ������� ���.
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_Thanks_16_03");	//�� ��������. �����.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_PotionGotThanks);
	MIS_Sarah_BadHabit_NadjaPrize = MIS_Sarah_BadHabit_NadjaPrize_Thanks;
	DIA_Nadja_Sarah_GivePotion_DoGive();
};
func void DIA_Nadja_Sarah_GivePotion_Gold()
{
		AI_Output(other,self,"DIA_Nadja_Sarah_GivePotiond_Gold_16_00");	//1500 �������.
	B_GivePlayerXP(XP_Sarah_Nadja_Potion);
	AI_Output(self,other,"DIA_Nadja_Sarah_GivePotion_Gold_17_01");	//� �� ������ ����������. ��� ��� ��� ����������.
	B_GiveGold(self,other,1500);
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_PotionGotGold);
	MIS_Sarah_BadHabit_NadjaPrize = MIS_Sarah_BadHabit_NadjaPrize_Gold;
	DIA_Nadja_Sarah_GivePotion_DoGive();
};

//===================================================
instance DIA_Nadja_Sarah_BloodyCough(C_Info)
{
	npc = VLK_435_Nadja;			nr = 10;
	condition = DIA_Nadja_Sarah_BloodyCough_Cond;
	information = DIA_Nadja_Sarah_BloodyCough_Info;
	important = TRUE;
};
func int DIA_Nadja_Sarah_BloodyCough_Cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit_GivePotionDay > 0) && (MIS_Sarah_BadHabit_GivePotionDay <= Wld_GetDay_Shifted(7)))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_BloodyCough_Info()
{
	AI_Output(self,other,"DIA_Nadja_Sarah_BloodyCough_17_01");	//��� �� ����� �� ��� ���������?
		AI_Output(other,self,"DIA_Nadja_Sarah_BloodyCough_16_02");	//��� �����? �� ��������?
	AI_Output(self,other,"DIA_Nadja_Sarah_BloodyCough_17_03");	//��-���... � ������� � � ������ ������ �� ����, �� ��� ����� ������� ����!
	AI_Output(self,other,"DIA_Nadja_Sarah_BloodyCough_17_04");	//� ��������� ������, � ������! � ��� �����-�� ������ ������.
		AI_Output(other,self,"DIA_Nadja_Sarah_BloodyCough_16_05");	//� �������� � ���������, ������� ���������� �����.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_BloodyCough);
	MIS_Sarah_BadHabit_KnowBloodyCough = TRUE;
};
//===================================================
instance DIA_Nadja_Sarah_GiveSalve(C_Info)
{
	npc = VLK_435_Nadja;			nr = 11;
	condition = DIA_Nadja_Sarah_GiveSalve_Cond;
	information = DIA_Nadja_Sarah_GiveSalve_Info;
	description = "��� ���� ����.";
};
func int DIA_Nadja_Sarah_GiveSalve_Cond()
{
	if (C_HeroIs_Sarah()
		&& MIS_Sarah_BadHabit_KnowBloodyCough && Npc_HasItems(other,ItMi_BuildUpSalve))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_GiveSalve_Info()
{
	B_GivePlayerXP(XP_Sarah_Nadja_Salve);
	AI_Output(other,self,"DIA_Nadja_Sarah_GiveSalve_16_00");	//��� ���� ����. ��� �������� ������������, �� ���� ��� ����� �������� ���������� ������ ������.
	B_GiveInvItems(other,self,ItMi_BuildUpSalve,1);
		AI_Output(self,other,"DIA_Nadja_Sarah_GiveSalve_17_01");	//������� � �� ���.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_SalveGiven);
	MIS_Sarah_BadHabit_SalveGivenDay = Wld_GetDay_Shifted(8);
};

//===================================================
instance DIA_Nadja_Sarah_HowAreU(C_Info)
{
	npc = VLK_435_Nadja;			nr = 12;
	condition = DIA_Nadja_Sarah_HowAreU_Cond;
	information = DIA_Nadja_Sarah_HowAreU_Info;
	description = "��, ��� ��?";
	permanent = TRUE;
};
func int DIA_Nadja_Sarah_HowAreU_Cond()
{
	if (C_HeroIs_Sarah()
		&& (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_NadjaAgreed)	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_HowAreU_Info()
{
	AI_Output(other,self,"DIA_Nadja_Sarah_HowAreU_16_00");	//��, ��� ��?
	if (MIS_Sarah_BadHabit_NadjaPrize == 0)	{	//���� �� ����� �����
		AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_01");	//���� �� �� ������� ���������, �, ��������, ����� ��������.
	}
	//����� ����� + 1 ���� � �����
	else	if (MIS_Sarah_BadHabit_SalveGivenDay == 0 || MIS_Sarah_BadHabit_SalveGivenDay + 1 < Wld_GetDay_Shifted(8))	{
		AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_02");	//����� �� ���������.
	}
	//���� �������������
	else	{
		AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_03");	//�������, ���������. �� ������� ����, ��� ��� �� ������� ���������� �� ��������� ����.
		AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_04");	//�� ��� ��������� �� ������� �������. ���� �������� ������, �� �� ��� ������ �����.
		AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_05");	//��� � ������ ���� ���������? ��� ���� ������������, ��� ��������� ��� ��������� �� ����� � ���� �������.
			AI_Output(other,self,"DIA_Nadja_Sarah_HowAreU_16_06");	//������, �� �� ���� ������ ����. ���� �� �� ������� �� ������, �������� ���� �� �����!
		//���� �� ������� ������ �� �����
		if (MIS_Sarah_BadHabit_NadjaPrize == MIS_Sarah_BadHabit_NadjaPrize_Thanks)	{
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_07");	//�����, �� �����. � ����, ��� �� ������ ��� ������ � ������ �� ������� ������.
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_08");	//������, ���� ���-�� �� ������, ���� �� � ������� � ����.
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_09");	//� ���� ���� ���-����� ����������, ������� ������� ��� ������.
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_10");	//������ ���-������ ������ ���. �� ������ � ���� ������ ����.
			B_LogEntry_Status(TOPIC_Sarah_BadHabit,LOG_SUCCESS,TOPIC_Sarah_BadHabit_SuccessFriendly);
		}
		else	{	//����� - ��� ���������� ���� ������ ���
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_11");	//�� ����� �� � �� ����� ������! ����� �� �� ������, ����� ��� ������ � ���������� ��������.
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_12");	//� ������ �� �������� ���� ������������ �� �� ������!
				AI_Output(other,self,"DIA_Nadja_Sarah_HowAreU_16_13");	//� ���� ������...
			AI_Output(self,other,"DIA_Nadja_Sarah_HowAreU_17_14");	//� ���� �� ����� ����� �������. ������� � ���� ����.
			B_LogEntry_Status(TOPIC_Sarah_BadHabit,LOG_SUCCESS,TOPIC_Sarah_BadHabit_SuccessAngry);
			B_GivePlayerXP(XP_Sarah_BadHabit_Success);
		};
		MIS_Sarah_BadHabit = LOG_SUCCESS;
		AI_StopProcessInfos(self);
	};
};
//===================================================
instance DIA_Nadja_Sarah_LiveMeAlone(C_Info)
{
	npc = VLK_435_Nadja;			nr = 13;
	condition = DIA_Nadja_Sarah_LiveMeAlone_Cond;
	information = DIA_Nadja_Sarah_LiveMeAlone_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Nadja_Sarah_LiveMeAlone_Cond()
{
	if (C_HeroIs_Sarah() && DIA_WhenAsked_cond()
		&& (MIS_Sarah_BadHabit == LOG_SUCCESS))	{
		return TRUE;
	};
};

func void DIA_Nadja_Sarah_LiveMeAlone_Info()
{
	AI_Output(self,other,"DIA_Nadja_Sarah_LiveMeAlone_16_01");	//������ ����.
	AI_StopProcessInfos(self);
};



/////////////////////////////// ��������� //////////////////////////////////
//===================================================
instance DIA_Nadja_GiveJoint(C_Info)
{
	npc = VLK_435_Nadja;			nr = 50;
	condition = DIA_Nadja_GiveJoint_Cond;
	information = DIA_Nadja_GiveJoint_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Nadja_GiveJoint_Cond()
{
	if (!C_HeroIs_Sarah() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};

func void DIA_Nadja_GiveJoint_Info()
{
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_17_00m");	//(������) ������, ���������! �� �������� ������� ��� �������?
	}
	else	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_17_00f");	//(������) ��, �������! �� �������� �������?
	};
	Info_ClearChoices(DIA_Nadja_GiveJoint);
	Info_AddChoice(DIA_Nadja_GiveJoint,"���.",DIA_Nadja_GiveJoint_No);
	if (Npc_HasItems(other,ItMi_Joint))	{
		Info_AddChoice(DIA_Nadja_GiveJoint,"�����.",DIA_Nadja_GiveJoint_Yes);
	};
};
func void DIA_Nadja_GiveJoint_Yes()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Nadja_GiveJoint_Yes_03_02");	//�����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Nadja_GiveJoint_Yes_07_02");	//�����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Nadja_GiveJoint_Yes_10_02");	//�����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Nadja_GiveJoint_Yes_14_02");	//�����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Nadja_GiveJoint_Yes_16_02");	//�����.
	};
	B_GiveInvItems(other,self,ItMi_Joint,1);
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_Yes_17_03m");	//���, �������! �� ������ � ���, �� ������...
	}
	else	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_Yes_17_03f");	//��, �������! 
	};
	Info_ClearChoices(DIA_Nadja_GiveJoint);
	AI_StopProcessInfos(self);
};
func void DIA_Nadja_GiveJoint_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Nadja_GiveJoint_No_03_02");	//���.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Nadja_GiveJoint_No_07_02");	//���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Nadja_GiveJoint_No_10_02");	//���.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Nadja_GiveJoint_No_14_02");	//���.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Nadja_GiveJoint_No_16_02");	//���.
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_No_17_03m");	//�� ������, ���� �����...
	}
	else	{
		AI_Output(self,other,"DIA_Nadja_GiveJoint_No_17_03f");	//�� � ������ ���� ���!
	};
	Info_ClearChoices(DIA_Nadja_GiveJoint);
	AI_StopProcessInfos(self);
};

