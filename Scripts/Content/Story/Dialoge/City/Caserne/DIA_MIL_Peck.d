
instance DIA_Peck_EXIT(DIA_Proto_End)
{
	npc = MIL_324_Peck;
};

//==============================================
instance DIA_Peck_Start(C_INFO)
{
	nr = 1;
	npc = MIL_324_Peck;
	condition = DIA_NoCond_cond;
	information = DIA_Peck_Start_info;
	description = "��� �� �����������?";
};
func void DIA_Peck_Start_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Peck_Start_03_00");	//��� �� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Peck_Start_07_00");	//��� �� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Peck_Start_10_00");	//��� �� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Peck_Start_14_00");	//��� �� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Peck_Start_16_00");	//��� �� �����������?
	};
	AI_Output(self,other,"DIA_Peck_Start_12_01");	//� ������� �� ��������� ����� � ������� ����������.
	AI_Output(self,other,"DIA_Peck_Start_12_02");	//� ��� ������� ��������� ��������� ����������.
};

//==============================================
instance DIA_Peck_AskTraining(C_INFO)
{
	nr = 2;
	npc = MIL_324_Peck;
	condition = DIA_Peck_AskTraining_cond;
	information = DIA_Peck_AskTraining_info;
	description = "� ���� �� ������ �������������?";
};
func int DIA_Peck_AskTraining_cond()
{
	if (Npc_KnowsInfo(other,DIA_Peck_Start))	{
		return TRUE;
	};
};
func void DIA_Peck_AskTraining_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Peck_AskTraining_03_00");	//� ���� �� ������ �������������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Peck_AskTraining_07_00");	//� ���� �� ������ �������������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Peck_AskTraining_10_00");	//� ���� �� ������ �������������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Peck_AskTraining_14_00");	//� ���� �� ������ �������������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Peck_AskTraining_16_00");	//� ���� �� ������ �������������?
	};
	AI_Output(self,other,"DIA_Peck_AskTraining_12_01");	//������ �� � ���? �� �� �����.
	AI_Output(self,other,"DIA_Peck_AskTraining_12_02");	//������� ������� �� �������� ����� ��������� � ������, ��� ������� �������.
	AI_Output(self,other,"DIA_Peck_AskTraining_12_03");	//�� ��������� ����� � ���������� ����.
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Peck_AskTraining_12_04");	//�� ���� - � �� ���� ������ ������ �� ��, ��� �� �������.
	};
	B_StartOtherRoutine(self,"TRAINING");
	Peck_PayDay = -1;	//����� ���������� � 0-��� ����
	Peck_Training_Running = TRUE;
	B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Peck);
};

//==============================================
instance DIA_Peck_Training(C_INFO)
{
	nr = 3;
	npc = MIL_324_Peck;
	condition = DIA_Peck_Training_cond;
	information = DIA_Peck_Training_info;
	permanent = TRUE;
	description = "������ ����������?";
};
func int DIA_Peck_Training_cond()
{
	if (Npc_KnowsInfo(other,DIA_Peck_AskTraining) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_05") < 1000)
		&& (Peck_PayDay < Wld_GetDay()) && (Peck_WrongTraining < 2))	{
		return TRUE;
	};
};
func void DIA_Peck_Training_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Peck_Training_03_00");	//������ ����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Peck_Training_07_00");	//������ ����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_10_00");	//������ ����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_14_00");	//������ ����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Peck_Training_16_00");	//������ ����������?
	};
	AI_Output(self,other,"DIA_Peck_Training_12_01");	//�������. �� 50 ������� � �� ���� ����� ����.
	Info_ClearChoices(DIA_Peck_Training);
	Info_AddChoice(DIA_Peck_Training,"� ���� ��� ������� ������.",DIA_Peck_Training_NoPay);
	if (C_NpcHasGold(other, 50))	{
		Info_AddChoice(DIA_Peck_Training,"�����. (50 ���.)",DIA_Peck_Training_Pay);
	};
};
func void DIA_Peck_Training_NoPay()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Peck_Training_NoPay_03_00");	//� ���� ��� ������� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Peck_Training_NoPay_07_00");	//� ���� ��� ������� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_NoPay_10_00");	//� ���� ��� ������� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_NoPay_14_00");	//� ���� ��� ������� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Peck_Training_NoPay_16_00");	//� ���� ��� ������� ������.
	};
	AI_Output(self,other,"DIA_Peck_Training_NoPay_12_01");	//����� �������, ����� ��� � ���� �����. � ���� ����� �����.
	Info_ClearChoices(DIA_Peck_Training);
};

func void DIA_Peck_Training_Pay()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Peck_Training_Pay_03_00");	//�����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Peck_Training_Pay_07_00");	//�����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_Pay_10_00");	//�����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_Pay_14_00");	//�����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Peck_Training_Pay_16_00");	//�����.
	};
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Peck_Training_Pay_12_01");	//�������! �������� ������.
	Info_ClearChoices(DIA_Peck_Training);
	if (Peck_PayDay == -1)	{
		Info_AddChoice(DIA_Peck_Training,"������, ������? �� ������ �� ������� ��� ������.",DIA_Peck_Training_Weapon);
	};
	Info_AddChoice(DIA_Peck_Training,"������� �������.",DIA_Peck_Training_Wait);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Peck_Training,"� �����!",DIA_Peck_Training_Start);
	}
	else	{
		Info_AddChoice(DIA_Peck_Training,"� ������!",DIA_Peck_Training_Start);
	};
	Peck_PayDay = Wld_GetDay();
};

func void DIA_Peck_Training_Weapon()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Peck_Training_Weapon_03_00");	//������, ������? �� ������ �� ������� ��� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Peck_Training_Weapon_07_00");	//������, ������? �� ������ �� ������� ��� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_Weapon_10_00");	//������, ������? �� ������ �� ������� ��� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_Weapon_14_00");	//������, ������? �� ������ �� ������� ��� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Peck_Training_Weapon_16_00");	//������, ������? �� ������ �� ������� ��� ������.
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Peck_Training_Weapon_12_01");	//� �� ��� �����? ��� � �������� ���� ���� �������, � �� ����� ������� ������?
	}
	else	{
		AI_Output(self,other,"DIA_Peck_Training_Weapon_12_02");	//� �� ��� ������? ��� � ���� ���� ������� ��� �������� ����?
	};
	AI_Output(self,other,"DIA_Peck_Training_Weapon_12_03");	//���� ������ ����-�� ��������� - ������ �� ����.
	AI_Output(self,other,"DIA_Peck_Training_Weapon_12_04");	//�����, �������, ��� ������ �������� - ���� ����. �� ������ ������������� � ������� �����! � ���� �� ������.
};

func void DIA_Peck_Training_Wait()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Peck_Training_Wait_03_00");	//������� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Peck_Training_Wait_07_00");	//������� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_Wait_10_00");	//������� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_Wait_14_00");	//������� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Peck_Training_Wait_16_00");	//������� �������.
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Peck_Training_Wait_12_01");	//�������, ����� ������ �����.
	}
	else	{
		AI_Output(self,other,"DIA_Peck_Training_Wait_12_02");	//������ �����, ����� ������ ������.
	};
	AI_StopProcessInfos(self);
};
func void DIA_Peck_Training_Start()
{
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Peck_Training_Start_03_00");	//� �����!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Peck_Training_Start_07_00");	//� �����!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_Start_10_00");	//� �����!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Peck_Training_Start_14_00");	//� �����!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Peck_Training_Start_16_00");	//� ������!
	};
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	//AI_Output(self,other,"DIA_Peck_Training_Start_12_01");	//������.
	AI_WaitTillEnd(self,other);
	self.wp = "NW_CITY_HABOUR_KASERN_05";
	self.npcType = NPCTYPE_FRIEND;
	self.fight_tactic = FAI_HUMAN_NORMAL;
	self.aivar[AIV_OriginalFightTactic] = FAI_HUMAN_NORMAL;
	AI_StopProcessInfos(self);
	//����� � B_OnTalkEnd
	B_Attack(self,other,AR_NONE,1);
};
//---------------------------------------------------
instance DIA_Peck_TrainingMore(C_INFO)
{
	nr = 4;
	npc = MIL_324_Peck;
	condition = DIA_Peck_TrainingMore_cond;
	information = DIA_Peck_Training_Start;
	permanent = TRUE;
	description = "� �����! (������ ���)";
};
func int DIA_Peck_TrainingMore_cond()
{
	if ((Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_05") < 1000)
		&& (Peck_PayDay == Wld_GetDay()) && (Peck_WrongTraining < 2))	{
			if (other.aivar[AIV_Gender] == FEMALE)	{
				DIA_Peck_TrainingMore.description = "� ������! (������ ���)";
			};
		return TRUE;
	};
};

//========================================
instance DIA_Peck_TrainingAfter(C_INFO)
{
	nr = 5;
	npc = MIL_324_Peck;
	condition = DIA_Peck_TrainingAfter_cond;
	information = DIA_Peck_TrainingAfter_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Peck_TrainingAfter_cond()
{
	if((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (Peck_Training_Running == TRUE))
	{
		if(self.aivar[AIV_ArenaFight] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	};
};
func void  DIA_Peck_TrainingAfter_Info()
{
	if ((self.aivar[AIV_ArenaFight] == AF_NONE) || (self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE))	{
		if (Peck_WrongTraining == 0)	{
			AI_Output(self,other,"DIA_Peck_TrainingAfter_Wrong_12_00");	//��, ��� �� ������!
			AI_Output(self,other,"DIA_Peck_TrainingAfter_Wrong_12_01");	//���� ������ ������ ��� - ������� ����� ��� �� ����.
			AI_Output(self,other,"DIA_Peck_TrainingAfter_Wrong_12_02");	//��� ���� ����� ������� - � ���� ���������� ����������.
			Peck_WrongTraining = 1;
		}
		else	{
			AI_Output(self,other,"DIA_Peck_TrainingAfter_Wrong_12_03");	//� ���� ������������. ������ � � ����� ����� ��� �� ����.
			Peck_WrongTraining = 2;
			Peck_Training_Running = FALSE;
			self.npcType = npctype_main;
			B_StartOtherRoutine(self,"START");
			Npc_SetRefuseTalk(self,30);
			AI_StopProcessInfos(self);
			B_LogNote(TOPIC_Teacher,TOPIC_Teacher_PeckStop);
		};			
	}
	else	if (self.aivar[AIV_ArenaFight] == AF_WRONG_WEAPON)	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Peck_TrainingAfter_Wrong_12_04");	//�� ���, ������? �� ���� ����� �������?
		}
		else	{
			AI_Output(self,other,"DIA_Peck_TrainingAfter_Wrong_12_05");	//�� ������ ����? ��� �� ����� �����!
		};
		AI_Output(self,other,"DIA_Peck_TrainingAfter_Wrong_12_06");	//� ���������� ����������� ���� � ������� ���! ������ ���������� - ��� � ���� �� ����������!
		AI_Output(self,other,"DIA_Peck_TrainingAfter_Wrong_12_07");	//� � �� ����� ������ ����� � ����� ���.
		Peck_WrongTraining = 2;
		Peck_Training_Running = FALSE;
		self.npcType = npctype_main;
		B_StartOtherRoutine(self,"START");
		Npc_SetRefuseTalk(self,30);
		AI_StopProcessInfos(self);
		B_LogNote(TOPIC_Teacher,TOPIC_Teacher_PeckStop);
	}
	else	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Peck_TrainingAfter_Cancel_12_00");	//��, ��� ���������? ������ �� �� ����������?
		}
		else	{
			AI_Output(self,other,"DIA_Peck_TrainingAfter_Cancel_12_01");	//������ �� �� ����������? ��� ���������?
		};
		AI_Output(self,other,"DIA_Peck_TrainingAfter_Cancel_12_02");	//���� �������� ������ � ������, �����.
	}
	else	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)	{
		AI_Output(self,other,"DIA_Peck_TrainingAfter_Won_12_00");	//�� � �������? ���, ������ ��� �����.
		B_GiveInvItems(self,other,ItPo_Health_01,1);
		AI_Output(self,other,"DIA_Peck_TrainingAfter_Won_12_01");	//�� �������������, ����������� ��, ��� ������������, ����� �������� ������� ��� ����� �������������.
		AI_Output(self,other,"DIA_Peck_TrainingAfter_Won_12_02");	//����, ����� ������������� ����� �����, ���� ���-���� ����������.
	}
	else	{//if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)	{
		AI_Output(self,other,"DIA_Peck_TrainingAfter_Lost_12_00");	//���� ������� ������� ����! �� ��� �� ������, ��� ���� ������ �� ����� ����������.
		AI_Output(self,other,"DIA_Peck_TrainingAfter_Lost_12_01");	//� ������ � ����� �������. � � ���� ���������� �����, ������� � ������� �����������.
		self.attribute[ATR_STRENGTH] += 5;
		self.attribute[ATR_HITPOINTS] += 10;
		self.attribute[ATR_HITPOINTS_MAX] += 10;
		self.level += 1;
	};
//	Peck_Training_Running = FALSE;
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	self.aivar[AIV_LastFightComment] = TRUE;
	self.aivar[AIV_ArenaFight] = AF_NONE;
	self.fight_tactic = FAI_HUMAN_STRONG;
	self.aivar[AIV_OriginalFightTactic] = FAI_HUMAN_STRONG;
	self.aivar[AIV_VictoryXPGiven] = FALSE;
};
//============================================
instance DIA_Peck_FuckOff(C_INFO)
{
	nr = 10;
	npc = MIL_324_Peck;
	condition = DIA_Peck_FuckOff_cond;
	information = DIA_Peck_FuckOff_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Peck_FuckOff_cond()
{
	if ((Peck_WrongTraining == 2) && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Peck_FuckOff_info()
{
	AI_Output(self,other,"DIA_Peck_TrainingAfter_FuckOff_12_00");	//������ �� ����!
	AI_StopProcessInfos(self);
};

