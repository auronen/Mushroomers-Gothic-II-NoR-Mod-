
instance DIA_Borka_EXIT_Male(DIA_Proto_End)
{
	npc = VLK_434_Borka;
	condition = DIA_Borka_EXIT_Male_Cond;
};
func int DIA_Borka_EXIT_Male_Cond()
{
	if (other.aivar[AIV_Gender] == MALE) {
		return TRUE;
	};
};

//����� ������� ������� ��������
const string Borka_Checkpoint = "NW_CITY_HABOUR_PUFF_IN_01";


//////////////////////////////////����////////////////////////////////////////
//���� ������ ���������
//-----------------------------------------
var int DIA_Borka_Hello_Female_Husband_Once;
var int DIA_Borka_Hello_SaraAsked_Once;
var int Borka_Sarah_AgreedToTell;
var int Borka_Sarah_AgreedToPass;


instance DIA_Borka_EXIT_Female(DIA_Proto_End)
{
	npc = VLK_434_Borka;
	condition = DIA_Borka_EXIT_Female_Cond;
	information = DIA_Borka_Hello_Female_GoAway;
	description = "��� �����. (�����)";
};
func int DIA_Borka_EXIT_Female_Cond()
{
	if (other.aivar[AIV_Gender] == FEMALE) {
		return TRUE;
	};
};
func void DIA_Borka_Hello_Female_GoAway()
{
		AI_Output(other,self,"DIA_Borka_Hello_Female_GoAway_16_00");	//��� �����.
	AI_Output(self,other,"DIA_Borka_Hello_Female_GoAway_11_01");	//��� � ���.
	AI_StopProcessInfos(self);
};

//-----------------------------------------
instance DIA_Borka_Hello_Female(C_INFO)
{
	npc = VLK_434_Borka;	nr = 1;
	condition = DIA_Borka_Hello_Female_cond;
	information = DIA_Borka_Hello_Female_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Borka_Hello_Female_cond()
{
	if ((other.aivar[AIV_Gender] == FEMALE)
		 && (self.aivar[AIV_Guardpassage_Status] == GP_NONE)
		 && ((Npc_GetDistToWP(other,Borka_Checkpoint) < 700) || DIA_WhenAsked_cond()))
	{
		return TRUE;
	};
};
func void DIA_Borka_Hello_Female_info()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)	{
		AI_Output(self,other,"DIA_Borka_Hello_Female_11_00");	//����! ����� ���� ��������!
		if (DIA_Borka_Hello_Female_Husband_Once < 2)	{
			AI_Output(self,other,"DIA_Borka_Hello_Female_11_01");	//��� ��� ������ ����!
			DIA_Borka_Hello_Female_Husband_Once = 1;
		};
	}
	else	{
		AI_Output(self,other,"DIA_Borka_Hello_Female_11_02");	//���� ������!
	};
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Borka_Checkpoint);
};
//-----------------------------------------
instance DIA_Borka_LastWarn_Female(C_INFO)
{
	npc = VLK_434_Borka;			nr = 2;
	condition = DIA_Borka_LastWarn_Female_cond;
	information = DIA_Borka_LastWarn_Female_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Borka_LastWarn_Female_cond()
{
	if ((Npc_GetDistToWP(other,Borka_Checkpoint) < other.aivar[AIV_LastDistToWP] - 50)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
		&& (other.aivar[AIV_Gender] == FEMALE))	{
		return TRUE;
	};
};
func void DIA_Borka_LastWarn_Female_info()
{
	AI_Output(self,other,"DIA_Borka_LastWarn_Female_11_00");	//�� ������? � ������ - ���� ���������!
	AI_Output(self,other,"DIA_Borka_LastWarn_Female_11_01");	//��� ���� ���, � ��� �������� ��������� ����.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Borka_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};

//-----------------------------------------
instance DIA_Borka_Attack_Female(C_INFO)
{
	npc = VLK_434_Borka;			nr = 3;
	condition = DIA_Borka_Attack_Female_cond;
	information = DIA_Borka_Attack_Female_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Borka_Attack_Female_cond()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (other.aivar[AIV_Gender] == FEMALE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))	{
		if ((Npc_GetDistToWP(other,Borka_Checkpoint) < other.aivar[AIV_LastDistToWP] - 50) || (Npc_GetDistToWP(other,Borka_Checkpoint) < 200))	{
			return TRUE;
		};
	};
};
func void DIA_Borka_Attack_Female_info()
{
	AI_Output(self,other,"DIA_Borka_Attack_Female_11_00");	//� ������������.
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ClearRoom,1);
};

//-----------------------------------------
instance DIA_Borka_Female_Husband(C_INFO)
{
	npc = VLK_434_Borka;	nr = 5;
	condition = DIA_Borka_Female_Husband_cond;
	information = DIA_Borka_Female_Husband_info;
	description = "����� ����?";
};
func int DIA_Borka_Female_Husband_cond()
{
	if ((other.aivar[AIV_Gender] == FEMALE) && (DIA_Borka_Hello_Female_Husband_Once > 0))	{
		return TRUE;
	};
};
func void DIA_Borka_Female_Husband_info()
{
		AI_Output(other,self,"DIA_Borka_Hello_Female_Husband_16_00");	//����� ����?
	AI_Output(self,other,"DIA_Borka_Hello_Female_Husband_11_01");	//������, ����, �����, �����... ������ ���! � ������ ���� ����� ������.
	DIA_Borka_Hello_Female_Husband_Once = 2;
};

//-----------------------------------------
instance DIA_Borka_Female_MayILook(C_INFO)
{
	npc = VLK_434_Borka;	nr = 50;
	condition = DIA_Borka_Female_MayILook_cond;
	information = DIA_Borka_Female_MayILook_info;
	description = "� ������ ����� ������� �����!";
	permanent = TRUE;
};
func int DIA_Borka_Female_MayILook_cond()
{
	if (other.aivar[AIV_Gender] == FEMALE && (self.aivar[AIV_Guardpassage_Status] != GP_PASSGATE))	{
		return TRUE;
	};
};
func void DIA_Borka_Female_MayILook_info()
{
		AI_Output(other,self,"DIA_Borka_Hello_Female_MayILook_16_00");	//� ������ ����� ������� �����!
	AI_Output(self,other,"DIA_Borka_Hello_Female_MayILook_11_01");	//� ������ - ������. ��� ����-������, �� ���������� ��������.
	AI_StopProcessInfos(self);
};
	
//////////////////////////////////�����////////////////////////////////////////

//-----------------------------------------
instance DIA_Borka_Elena_Naive(C_INFO)
{
	npc = VLK_434_Borka;	nr = 10;
	condition = DIA_Borka_Elena_Naive_cond;
	information = DIA_Borka_Elena_Naive_info;
	description = "(������) ��� ����� ������ �����?";
};
func int DIA_Borka_Elena_Naive_cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Borka_Elena_Naive_info()
{
		AI_Output(other,self,"DIA_Borka_Hello_Female_Naive_16_00");	//(������) ��� ����� ������ �����?
	AI_Output(self,other,"DIA_Borka_Hello_Female_Naive_11_01");	//���... ��... ����������� ���������... ������ ��� ������. ���... ��... ��� ����������. ����������. ��� ����� ������� �������. ��.
	AI_Output(self,other,"DIA_Borka_Hello_Female_Naive_11_02");	//�� ������ ����� ���! ��� ����� ��� ���-������ ���. 
};

//////////////////////////////////����////////////////////////////////////////
var int Borka_Sarah_Fight;

//-----------------------------------------
instance DIA_Borka_Sarah_LetMeIn(C_INFO)
{
	npc = VLK_434_Borka;	nr = 29;
	condition = DIA_Borka_Sarah_LetMeIn_cond;
	information = DIA_Borka_Sarah_LetMeIn_info;
	description = "��� ������!";
	permanent = TRUE;
};
func int DIA_Borka_Sarah_LetMeIn_cond()
{
	if (C_HeroIs_Sarah() && (self.aivar[AIV_Guardpassage_Status] != GP_PASSGATE))	{
		return TRUE;
	};
};
func void DIA_Borka_Sarah_LetMeIn_info()
{
		AI_Output(other,self,"DIA_Borka_Hello_Female_Sarah_16_00");	//��� ������! � ���� ������� � ������� �������� ��� �����������!
	AI_Output(self,other,"DIA_Borka_Hello_Female_Sarah_11_01");	//����� �� ������, ��� ���� ��� ������ ������. ����������! 
	AI_StopProcessInfos(self);
};

//-----------------------------------------
instance DIA_Borka_Sarah_AskInsider(C_INFO)
{
	npc = VLK_434_Borka;	nr = 21;
	condition = DIA_Borka_Sarah_AskInsider_cond;
	information = DIA_Borka_Sarah_AskInsider_info;
	description = "��, �� ���� ������ ������, ��� �������� � ���� ���������?";
	permanent = TRUE;
};
func int DIA_Borka_Sarah_AskInsider_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_MoeTalked && !Borka_Sarah_AgreedToTell)
	{
		if (DIA_Borka_Hello_SaraAsked_Once)	{
			DIA_Borka_Sarah_AskInsider.description = "� ��� ��� ���� �������� ����� �� ���� ������.";
		};
		return TRUE;
	};
};
func void DIA_Borka_Sarah_AskInsider_info()
{
	if ((Npc_GetDistToNpc(self, VLK_435_Nadja) < PERC_DIST_DIALOG) || (Npc_GetDistToNpc(other, VLK_435_Nadja) < PERC_DIST_DIALOG))	{
		AI_PrintScreen(PRINT_NadjaTooClose, -1, -1, FONT_Screen, 3);
		return;
	};
	if (!DIA_Borka_Hello_SaraAsked_Once)	{
			AI_Output(other,self,"DIA_Borka_Sarah_AskInsider_16_00");	//��, �� ���� ������ ������, ��� �������� � ���� ���������?
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsider_11_01");	//�������� � �������� �� ������������!
			AI_Output(other,self,"DIA_Borka_Sarah_AskInsider_16_02");	//������ � �� ����� ��������! �����-��, ��� � �������� ��������� ����� �����? ���� � ���-�� ������? ��������?
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsider_11_03");	//��, � ��� �� ���� ����������, ���� �� � ���� ���� ���������...
	}
	else	{
			AI_Output(other,self,"DIA_Borka_Sarah_AskInsider2_16_00");	//� ��� ��� ���� �������� ����� �� ���� ������.
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsider2_11_01");	//� � ��� ��� �������� � ���������.
	};
	Info_ClearChoices(DIA_Borka_Sarah_AskInsider);
	Info_AddChoice(DIA_Borka_Sarah_AskInsider,"� ���� ������ ���. (�����)",DIA_Borka_Sarah_AskInsiderBack);
	Info_AddChoice(DIA_Borka_Sarah_AskInsider,"��� ������ ���� ������?",DIA_Borka_Sarah_AskInsiderFight);
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Borka_Sarah_AskInsider,"100 �������.",DIA_Borka_Sarah_AskInsider100);
	};
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Borka_Sarah_AskInsider,"50 �������.",DIA_Borka_Sarah_AskInsider50);
	};
	if (C_NpcHasGold(other,20))	{
		Info_AddChoice(DIA_Borka_Sarah_AskInsider,"20 �������.",DIA_Borka_Sarah_AskInsider20);
	};
	if (C_NpcHasGold(other,10))	{
		Info_AddChoice(DIA_Borka_Sarah_AskInsider,"10 �������.",DIA_Borka_Sarah_AskInsider10);
	};
	DIA_Borka_Hello_SaraAsked_Once = TRUE;
};
func void DIA_Borka_Sarah_TellInsider()
{
	AI_Output(self,other,"DIA_Borka_Sarah_TellInsider_11_01");	//�����, ������, ��������� �� ����.
	AI_Output(self,other,"DIA_Borka_Sarah_TellInsider_11_02");	//���� � ��� �� ������ ��������� ��-�� ������ �������. � �������� � ��� �� �����. �� ��������� ������� ��� �������� ���������, ��� �� ���� �������������.
	AI_Output(self,other,"DIA_Borka_Sarah_TellInsider_11_03");	//�� ��� ������ ��� �� ����� �����. �� ��� ������. 
	AI_Output(self,other,"DIA_Borka_Sarah_TellInsider_11_04");	//� � ����� ��� ����� �� �����. ��� �� ���� �� �������, ������ ������� ��������.
		AI_Output(other,self,"DIA_Borka_Sarah_TellInsider_16_05");	//��� ��, ��� �����!
};
func void DIA_Borka_Sarah_AskInsiderBack()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsiderBack_16_00");	//� ���� ������ ���.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderBack_11_01");	//����.
	AI_StopProcessInfos(self);
};
func void DIA_Borka_Sarah_AskInsider10()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsider10_16_00");	//10 �������.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsider10_11_01");	//��������, ���.
};
func void DIA_Borka_Sarah_AskInsider20()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsider20_16_00");	//20 �������.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsider20_11_01");	//�����-�� ������ ���������.
};
func void DIA_Borka_Sarah_AskInsider50()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsider50_16_00");	//50 �������.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsider50_11_01");	//��������.
	B_GiveGold(other,self,50);
	Borka_Sarah_AgreedToTell = TRUE;
	Info_ClearChoices(DIA_Borka_Sarah_AskInsider);
	DIA_Borka_Sarah_TellInsider();
};
func void DIA_Borka_Sarah_AskInsider100()
{
		AI_Output(other,self,"DIA_Borka_Sarah_AskInsider100_16_00");	//100 �������.
	AI_Output(self,other,"DIA_Borka_Sarah_AskInsider100_11_01");	//��� ��� ��������!
	B_GiveGold(other,self,100);
	Borka_Sarah_AgreedToTell = TRUE;
	Info_ClearChoices(DIA_Borka_Sarah_AskInsider);
	DIA_Borka_Sarah_TellInsider();
};

func void DIA_Borka_Sarah_AskInsider_DoFight()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Borka_Sarah_Fight = TRUE;
};
func void DIA_Borka_Sarah_AskInsiderFight()
{
	AI_Output(other,self,"DIA_Borka_Sarah_AskInsiderFight_16_00");	//��� ������ ���� ������?
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)	{
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderFight_11_01");	//��� ���, ����� �����? ��, ��������!
		Info_ClearChoices(DIA_Borka_Sarah_AskInsider);
		Info_AddChoice(DIA_Borka_Sarah_AskInsider,"���, ����? ���� ��� �������� ������ ������.",DIA_Borka_Sarah_AskInsiderFight2);
		Info_AddChoice(DIA_Borka_Sarah_AskInsider,"��-��, �����, �� ��������.",DIA_Borka_Sarah_AskInsiderNoFight);
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)	{
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderFight2_11_02");	//�������, � ��� ����� ������? �������� ��� ���� �����!
		DIA_Borka_Sarah_AskInsider_DoFight();
	}
	else	{
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderFight2_11_03");	//�������, � ���� ��� ��� ����� ��-�������? �� �����, ���������!
		DIA_Borka_Sarah_AskInsider_DoFight();
	};
};
func void DIA_Borka_Sarah_AskInsiderNoFight()
{
	AI_Output(other,self,"DIA_Borka_Sarah_AskInsiderNoFight_16_00");	//��-��, �����, �� ��������.
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderNoFight_11_01");	//�� �� ���� �� ����.
	Info_ClearChoices(DIA_Borka_Sarah_AskInsider);
};
func void DIA_Borka_Sarah_AskInsiderFight2()
{
	AI_Output(other,self,"DIA_Borka_Sarah_AskInsiderFight2_16_00");	//���, ����? ���� ��� �������� ������ ������.
		AI_Output(self,other,"DIA_Borka_Sarah_AskInsiderFight2_11_01");	//���?! �� ��... �� �������� ��� ���� �����! � � ������ �� ���� ����� ��������!
	DIA_Borka_Sarah_AskInsider_DoFight();
};

//-----------------------------------------
instance DIA_Borka_Sarah_FightEnd(C_INFO)
{
	npc = VLK_434_Borka;			nr = 0;
	condition = DIA_Borka_Sarah_FightEnd_cond;
	information = DIA_Borka_Sarah_FightEnd_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Borka_Sarah_FightEnd_cond()
{
	if (C_HeroIs_Sarah()
		 && Borka_Sarah_Fight && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))	{
		return TRUE;
	};
};
func void DIA_Borka_Sarah_FightEnd_info()
{
	Borka_Sarah_Fight = FALSE;
	self.aivar[AIV_LastFightComment] = TRUE;
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)	{
			AI_Output(other,self,"DIA_Borka_Sarah_FightEnd_16_01");	//�� ���, ����������� ���������?
		AI_Output(self,other,"DIA_Borka_Sarah_FightEnd_11_02");	//������!
			AI_Output(other,self,"DIA_Borka_Sarah_FightEnd_16_03");	//� ������� ��� ���� ����. � ���� ������ �� �����, ��� ���� �������� ��������.
		AI_Output(self,other,"DIA_Borka_Sarah_FightEnd_11_04");	//(������� ������)
		Borka_Sarah_AgreedToTell = TRUE;
		DIA_Borka_Sarah_TellInsider();
	}
	else	{
		AI_Output(self,other,"DIA_Borka_Sarah_FightEnd_11_05");	//�� ���, ����, �����������?
		AI_Output(self,other,"DIA_Borka_Sarah_FightEnd_11_06");	//� ������, ���� � ���� ��� ���� ������, �� ����� ������������ ��������� ���������.
	};
};

//-----------------------------------------
instance DIA_Borka_Sarah_LetMeInToLucia(C_INFO)
{
	npc = VLK_434_Borka;			nr = 23;
	condition = DIA_Borka_Sarah_LetMeInToLucia_cond;
	information = DIA_Borka_Sarah_LetMeInToLucia_info;
	description = "�������� ����, � � ��� ��������.";
	permanent = TRUE;
};
func int DIA_Borka_Sarah_LetMeInToLucia_cond()
{
	if (C_HeroIs_Sarah()
		 && Borka_Sarah_AgreedToTell
		 && !Borka_Sarah_AgreedToPass)	{
		return TRUE;
	};
};
func void DIA_Borka_Sarah_LetMeInToLucia_info()
{
	if ((Npc_GetDistToNpc(self, VLK_435_Nadja) < PERC_DIST_DIALOG) || (Npc_GetDistToNpc(other, VLK_435_Nadja) < PERC_DIST_DIALOG))	{
		AI_PrintScreen(PRINT_NadjaTooClose, -1, -1, FONT_Screen, 3);
		return;
	};
		AI_Output(other,self,"DIA_Borka_Sarah_LetMeInToLucia_16_00");	//�������� ����, � � ��� ��������.
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_KnowLucia);
	AI_Output(self,other,"DIA_Borka_Sarah_TellInsider_11_06");	//�� ��� �� ��������������! ������ ������ �������, ���� � ����� ����!
	Info_ClearChoices(DIA_Borka_Sarah_LetMeInToLucia);
	Info_AddChoice(DIA_Borka_Sarah_LetMeInToLucia,"�����, ���-���� �����������?",DIA_Borka_Sarah_LetMeInToLucia_AddNone);
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Borka_Sarah_LetMeInToLucia,"��� ������ ��� 50 �������?",DIA_Borka_Sarah_LetMeInToLucia_AddGold50);
	};
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Borka_Sarah_LetMeInToLucia,"100 ������� ���� �������?",DIA_Borka_Sarah_LetMeInToLucia_AddGold100);
	};
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) {
		Info_AddChoice(DIA_Borka_Sarah_LetMeInToLucia,"���� ��� ��� ��������?",DIA_Borka_Sarah_LetMeInToLucia_AddHit);
	};
};
func void DIA_Borka_Sarah_Passgate()
{
	AI_Output(self,other,"DIA_Borka_Sarah_Passgate_11_01");	//������, � ���� ����� ��� ����� ��������... �������� ������ � � �� ��� ���� ����������.
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	Borka_Sarah_AgreedToPass = TRUE;
	AI_StopProcessInfos(self);
};
func void DIA_Borka_Sarah_LetMeInToLucia_AddHit()
{
		AI_Output(other,self,"DIA_Borka_Sarah_TellInsider_AddHit_16_00");	//���� ��� ��� ��������? ����� ����� �� ������ � �������.
	DIA_Borka_Sarah_Passgate();
};
func void DIA_Borka_Sarah_LetMeInToLucia_AddGold50()
{
		AI_Output(other,self,"DIA_Borka_Sarah_TellInsider_AddGold50_16_00");	//��� ������ ��� 50 �������?
	AI_Output(self,other,"DIA_Borka_Sarah_AddGold50_11_01");	//����.
};
func void DIA_Borka_Sarah_LetMeInToLucia_AddGold100()
{
		AI_Output(other,self,"DIA_Borka_Sarah_TellInsider_AddGold100_16_00");	//100 ������� ���� �������?
	B_GiveGold(other,self,100);
	DIA_Borka_Sarah_Passgate();
};
func void DIA_Borka_Sarah_LetMeInToLucia_AddNone()
{
		AI_Output(other,self,"DIA_Borka_Sarah_TellInsider_AddNone_16_00");	//�����, ���-���� �����������?
	AI_Output(self,other,"DIA_Borka_Sarah_AddNone_11_01");	//����������� - ���� � ���� ����� ���������� ������.
	Info_ClearChoices(DIA_Borka_Sarah_LetMeInToLucia);
};





//////////////////////////////////������////////////////////////////////////////
//-----------------------------------------
var int DIA_Borka_Hello_Male_Once;
instance DIA_Borka_Hello_Male(C_INFO)
{
	npc = VLK_434_Borka;	nr = 30;
	condition = DIA_Borka_Hello_Male_cond;
	information = DIA_Borka_Hello_Male_info;
	important = TRUE;
};
func int DIA_Borka_Hello_Male_cond()
{
	if ((other.aivar[AIV_Gender] == MALE)
		 && ((Npc_GetDistToWP(other,Borka_Checkpoint) < 600) && !DIA_Borka_Hello_Male_Once || DIA_WhenAsked_cond()))	{
		return TRUE;
	};
};
func void DIA_Borka_Hello_Male_info()
{
	if (!DIA_Borka_Hello_Male_Once)	{
		AI_Output(self,other,"DIA_Borka_Hello_Male_11_00");	//����� ����������! 
		DIA_Borka_Hello_Male_Once = TRUE;
	};
	AI_Output(self,other,"DIA_Borka_Hello_Male_11_01");	//������� ������, ����� �������� ����� ��� ����� �������� ������.
	self.aivar[AIV_Guardpassage_Status] = GP_PASSGATE;
	AI_StopProcessInfos(self);
};

