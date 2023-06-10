/**************************************************************************

									���

***************************************************************************/

var int HERO_LastSleepTime;

// ��������� ------------------------------------------------------------

func void PrintSleep(var string msg)
{
	AI_PrintScreen(msg, -1, -1, FONT_Screen, 3);
};

func void PrintPreSleep(var string msg)
{
	AI_PrintScreen(msg, -1, 40, FONT_Screen, 3);
};

// ---------------------------------------------------------------

// ������
func void B_GetUp()
{
	HERO_LastSleepTime = Wld_GetFullTime();
	AI_Wait(hero, 0.5);
	// ������ � �����
	if (HERO_SleepGround == TRUE)
	{
		AI_PlayAniBS(hero, "T_SLEEPGROUND_2_STAND", BS_STAND);
		HERO_SleepGround = FALSE;
	};
	// ���������� ����� � ���������
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
	// ���������� ���������
	//Mdl_ApplyOverlayMDSTimed(self, "HUMANS_SPRINT.MDS", 0);
};

// ---------------------------------------------------------------

// ����� dh ����� dm �����
func void PC_SleepFor(var int dh, var int dm)
{
	HERO_IsSleeping = TRUE;
	
	// ������� �����
	Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
	AI_Wait(hero, 1.2);
	// � �������� ������ ����� ���������
	if ((Hanna_Paid == FALSE))	{
		//if ((Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_SHOP03_IN_06") < 800) || (Npc_GetDistToWP(hero,"NW_CITY_HOTEL_UPSTAIRS_04") < 800))	{
		if (C_HeroIsInNpcsRoom(VLK_414_Hanna))	{
			dh = 1;	dm = Hlp_Random(20);
			Hanna_Paid = -1;
			B_StartOtherRoutine(VLK_494_Attila,"PUNISHMENT");
			AI_Teleport(VLK_494_Attila,Npc_GetNearestWP(hero));
			//Npc_ClearAIQueue(self);
			AI_Snd_Play(hero,"CS_MAM_FI_FL");
			B_Say(hero,hero,"$AARGH_1");
			PrintSleep(PRINT_SleepPain); 
			AI_UseMob(self,"BEDHIGH",-1);
			//AI_PlayAniBS(hero,"T_WOUNDED_2_STAND",BS_STAND);
		};
	};
	B_SetTimePlus(dh,dm);
	// ��������� ������
	AI_StopProcessInfos(hero);
	// ���������� �� �������
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	hero.aivar[AIV_INVINCIBLE] = FALSE;
	// ���������� �������
	Wld_StopEffect("SLOW_TIME");	// ���������
	AI_StopFX(hero,"DEMENTOR_FX");	// ������� ���������
	AI_StopFX(hero,"SLEEP_BLEND");	// ������� �����

	// ����� -----------------------------------------------------
	
	// ���� �������
	if(SC_IsObsessed == TRUE)
	{
		PrintSleep(PRINT_SleepOverObsessed); // ��������� - �� ��������
	}
	// ����� �� ����� �������
	else if ((C_GetPlayerPortalGuild() == GIL_OUTDOOR) && Wld_IsTime(0,0,8,0) && (HERO_SleepGround != SLEEP_FireCamp))	{
		PrintSleep(PRINT_SleepCold); // ��������� - �� ��������, ������
	}
	else if (Hanna_Paid == -1)
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2 + 1;
		AI_StartState(VLK_494_Attila,ZS_ObservePlayer,0,"");
	}
	// ����� - ��������� ����
	else
	{
		// ���� ������� ������ 3 �����
		if (dh * 60 + dm > 180) // ��������
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
			if(hero.aivar[AIV_Gender] == MALE)	{
				PrintSleep(PRINT_SleepOver);
			}
			else	{
				PrintSleep(PRINT_SleepOver_Female);
			};
		}
		else // �� ��������
		{
			if (dh * 60 + dm > 30) // ������ 30 �����
			{
				hero.attribute[ATR_HITPOINTS] += (hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) / 3;
				hero.attribute[ATR_MANA] += (hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) / 3;
			};
			PrintSleep(PRINT_SleepMore);
		};
	};
	// ������
	HERO_IsSleeping = FALSE;
	B_GetUp();
};

// ����� �� ���� t
func void PC_SleepUpTo(var int t)
{
	var int dt;
	dt = C_GetHour();
	if (t > dt)
	{
		PC_SleepFor(t - dt - 1, 60 - C_GetMinute());
	}
	else
	{
		PC_SleepFor(t + 24 - dt - 1, 60 - C_GetMinute());
	};
};

// ===============================================================

instance PC_NoSleep(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_NoSleep_Condition;
	information = PC_NoSleep_Info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int PC_NoSleep_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
	return FALSE;
};

func void PC_NoSleep_Info()
{
	if (HERO_SleepGround == TRUE)
	{
		AI_PlayAniBS(self, "T_SLEEPGROUND_2_STAND", BS_STAND);
		HERO_SleepGround = FALSE;
	};
	b_endproductiondialog();
};

// ---------------------------------------------------------------

instance PC_SleepTime_UpTo(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_UpTo_Condition;
	information = PC_SleepTime_UpTo_Info;
	important = 0;
	permanent = TRUE;
	description = "����� ��...";
};


func int PC_SleepTime_UpTo_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};

func void PC_SleepTime_UpTo_Info()
{
	Info_ClearChoices(PC_SleepTime_UpTo);
	Info_AddChoice(PC_SleepTime_UpTo,Dialog_Back,PC_SleepTime_UpTo_Back);
	Info_AddChoice(PC_SleepTime_UpTo,"... ��������.",PC_SleepTime_UpTo_Midnight);
	Info_AddChoice(PC_SleepTime_UpTo,"... ������.",PC_SleepTime_UpTo_Sunset);
	Info_AddChoice(PC_SleepTime_UpTo,"... ������.",PC_SleepTime_UpTo_Evening);
	Info_AddChoice(PC_SleepTime_UpTo,"... �����.",PC_SleepTime_UpTo_Afternoon);
	Info_AddChoice(PC_SleepTime_UpTo,"... �������.",PC_SleepTime_UpTo_Noon);
	Info_AddChoice(PC_SleepTime_UpTo,"... ����.",PC_SleepTime_UpTo_Morning);
	Info_AddChoice(PC_SleepTime_UpTo,"... ��������.",PC_SleepTime_UpTo_Sunrise);
};

func void PC_SleepTime_UpTo_Back()
{
	Info_ClearChoices(PC_SleepTime_UpTo);
};

func void PC_SleepTime_UpTo_Sunrise()
{
	PC_SleepUpTo(6);
	Info_ClearChoices(PC_SleepTime_UpTo);
};

func void PC_SleepTime_UpTo_Morning()
{
	PC_SleepUpTo(8);
	Info_ClearChoices(PC_SleepTime_UpTo);
};

func void PC_SleepTime_UpTo_Noon()
{
	PC_SleepUpTo(12);
	Info_ClearChoices(PC_SleepTime_UpTo);
};

func void PC_SleepTime_UpTo_Afternoon()
{
	PC_SleepUpTo(14);
	Info_ClearChoices(PC_SleepTime_UpTo);
};

func void PC_SleepTime_UpTo_Evening()
{
	PC_SleepUpTo(18);
	Info_ClearChoices(PC_SleepTime_UpTo);
};

func void PC_SleepTime_UpTo_Sunset()
{
	PC_SleepUpTo(20);
	Info_ClearChoices(PC_SleepTime_UpTo);
};

func void PC_SleepTime_UpTo_Midnight()
{
	PC_SleepUpTo(0);
	Info_ClearChoices(PC_SleepTime_UpTo);
};

// ---------------------------------------------------------------

instance PC_SleepTime_4hours(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_SleepTime_4hours_Condition;
	information = PC_SleepTime_4hours_Info;
	important = 0;
	permanent = 1;
	description = "����� 4 ����";
};


func int PC_SleepTime_4hours_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return 1;
	};
};

func void PC_SleepTime_4hours_Info()
{
	PC_SleepFor(4, 0);
};

// ---------------------------------------------------------------

instance PC_SleepTime_6hours(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_SleepTime_6hours_Condition;
	information = PC_SleepTime_6hours_Info;
	important = 0;
	permanent = 1;
	description = "����� 6 �����";
};


func int PC_SleepTime_6hours_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return 1;
	};
};

func void PC_SleepTime_6hours_Info()
{
	PC_SleepFor(6, 0);
};

// ---------------------------------------------------------------

instance PC_SleepTime_8hours(C_Info)
{
	npc = PC_Hero;
	nr = 8;
	condition = PC_SleepTime_8hours_Condition;
	information = PC_SleepTime_8hours_Info;
	important = 0;
	permanent = 1;
	description = "����� 8 �����";
};


func int PC_SleepTime_8hours_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return 1;
	};
};

func void PC_SleepTime_8hours_Info()
{
	PC_SleepFor(8, 0);
};

// ---------------------------------------------------------------

instance PC_SleepTime_12hours(C_Info)
{
	npc = PC_Hero;
	nr = 12;
	condition = PC_SleepTime_12hours_Condition;
	information = PC_SleepTime_12hours_Info;
	important = 0;
	permanent = 1;
	description = "����� 12 �����";
};


func int PC_SleepTime_12hours_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return 1;
	};
};

func void PC_SleepTime_12hours_Info()
{
	PC_SleepFor(12, 0);
};


// ---------------------------------------------------------------

func void sleepabit_s1()
{
	// ������ �������������� ���
	Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
	// ��� ��- ������� ������
	if(Npc_IsPlayer(self))
	{
		PC_NoSleep.npc = Hlp_GetInstanceID(self);
		PC_SleepTime_UpTo.npc = Hlp_GetInstanceID(self);
		PC_SleepTime_4hours.npc = Hlp_GetInstanceID(self);
		PC_SleepTime_6hours.npc = Hlp_GetInstanceID(self);
		PC_SleepTime_8hours.npc = Hlp_GetInstanceID(self);
		PC_SleepTime_12hours.npc = Hlp_GetInstanceID(self);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SleepAbit;
		AI_ProcessInfos(self);
		if(SC_IsObsessed == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
		};
	};
};

func void sleepabit_s0()
{
	// ������
};



