

var int _OnGameStart_Once;
var int _DayS_Once;
var int _DaySAfter_Once;
var int _OnGameStart_View; 
var int _OnGameStart_View_Help; 

//� ������ ���� � NEWWORLD
func void _OnGameStart()
{
	// ������ 1 ���
	if (_OnGameStart_Once == TRUE)	{return;};
	_OnGameStart_Once = TRUE;
	//Wld_PlayEffect("SLEEP_BLEND", hero,hero,0,0,0,FALSE);
	//PrintScreen(PRINT_MushroomsAreSpawned,-1,50,FONT_ScreenSmall,1);
	//PrintScreen(PRINT_PleaseWait,-1,53,FONT_ScreenSmall,1);

	//������� �����
	/* ����
	Spawn_MR_All();
	/*/
	Spawn_MR_Normal(-1);
	Spawn_MR_Sunrise(-1);
	B_SpawnMR_Special();
	Spawn_Food_Start();
	SP_SearchItemsList_Start();
	//*/
	
	//MEM_Debug(ConcatStrings("hero.name = ",hero.name));

	// ������������� ��
	B_Hero_SetTalents();
	B_Hero_Start();
	//Wld_StopEffect("SLEEP_BLEND");
	
	// ������ ��������
	View_Close(_OnGameStart_View_Help);
	View_Delete(_OnGameStart_View_Help);
	_OnGameStart_View_Help = 0;
	View_Close(_OnGameStart_View);
	View_Delete(_OnGameStart_View);
	_OnGameStart_View = 0;
	
	//������ ������� �� �������
	Log_SetTopicStatus(HELP_START_TOPIC,LOG_OBSOLETE);
};


var int HERO_LastWalkMode;
var int CYCLE_TRIGGER_Time;
func void CYCLE_TRIGGER_FUNC()
{
	if (DoExitGame)	{
		ExitSession();
		return;
	};
//	PrintScreen("CYCLE_TRIGGER",-1,1,FONT_ScreenSmall,1);
	Wld_SendTrigger("CYCLE_TRIGGER");
	var int rnd;
	var oCNpc hr;
	//DEBUG -----------------
	
	//1h master
	if (Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2)	{
		if (Npc_HasReadiedMeleeWeapon(hero))	{
			hr = Hlp_GetNpc(hero);
			var oCAniCtrl_Human human_ai;	human_ai = _^(hr.human_ai);
			//if ((MEM_KeyState(MEM_GetKey("keySlow")) == KEY_PRESSED) || (MEM_KeyState(MEM_GetSecondaryKey("keySlow")) == KEY_PRESSED))	{
			if ((HERO_LastWalkMode != human_ai.walkmode) && (human_ai.walkmode == NPC_WALK))	{
				HERO_LastWalkMode = human_ai.walkmode;
				if (!HERO_1hst2_OverlayOn)	{
					Mdl_ApplyOverlayMds(hero,"HUMANS_1HST1.MDS");
					Mdl_RemoveOverlayMDS(hero,"HUMANS_1HST2.MDS");
					HERO_1hst2_OverlayOn = TRUE;
				}
				else	{
					Mdl_ApplyOverlayMds(hero,"HUMANS_1HST2.MDS");
					Mdl_RemoveOverlayMDS(hero,"HUMANS_1HST1.MDS");
					HERO_1hst2_OverlayOn = FALSE;
				};
			}
			else	{
				HERO_LastWalkMode = human_ai.walkmode;
			};
		}
		else	{
			HERO_LastWalkMode = human_ai.walkmode;
		};
	};
	
	// ����� ���������� �� ��������/���������� ���������
	_B_ItemsTransaction_Timer();

	// ��������� ������� --------------------------
	if (CurrentLevel == MR_START_ZEN)	{
		PrintScreen(PRINT_ChoosePlayer,-1,2,FONT_Screen,2);
		if (!B_ShowHelp_HeroChoice_Once)	{
			B_ShowHelp_HeroChoice();
		};
		return;
	};
	
	// ��������� ----------------------------------
	
	if (_OnGameStart_Once == FALSE)	{
		_OnGameStart();
	};
	
	
	// ����� ���� ===============================================
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_GameOver_Lost)	{
		Print_Ext(-1,2,"����� ����.",FONT_Screen,COL_Red,1);
	};
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_GameOver_Won)	{
		Print_Ext(-1,2,"������!",FONT_Screen,COL_Green,1);
	};

	
	//��������� ������������
	if (BloodwinSnow_KillPlayer > 0) {
		BloodwinSnow_KillPlayer -= 1;
		if (BloodwinSnow_KillPlayer == 10) {
			PrintScreen("���� �� ����� � ���� ����.....",-1,35,FONT_Screen,2);
		};
		if (BloodwinSnow_KillPlayer == 8) {
			PrintScreen("���� �� ����� � ���� ����.... ",-1,35,FONT_Screen,2);
		}
		else if (BloodwinSnow_KillPlayer == 6) {
			PrintScreen("���� �� ����� � ���� ����...  ",-1,35,FONT_Screen,2);
		}
		else if (BloodwinSnow_KillPlayer == 4) {
			PrintScreen("���� �� ����� � ���� ����..   ",-1,35,FONT_Screen,2);
		}
		else if (BloodwinSnow_KillPlayer == 2) {
			PrintScreen("���� �� ����� � ���� ����.    ",-1,35,FONT_Screen,2);
		}
		else if (BloodwinSnow_KillPlayer == 0) {
			PrintScreen("���� �� ����� � ���� ����     ",-1,35,FONT_Screen,2);
			DoExitGame = TRUE;
		};
	};
	
	// �� ���� - ����� ============================================
	if (Npc_IsDead(hero))	{
		return;
	};

	// ����� ============================================
	var int CYCLE_TRIGGER_TimeNew;	CYCLE_TRIGGER_TimeNew = Wld_GetFullTime();
	var int CYCLE_TRIGGER_Period;	CYCLE_TRIGGER_Period = CYCLE_TRIGGER_TimeNew - CYCLE_TRIGGER_Time;
	
	//������� ������
	if (CYCLE_TRIGGER_Period > 0)	{
		//MEM_Debug(ConcatStrings("Cycles CYCLE_TRIGGER_TimeNew = ", IntToString(CYCLE_TRIGGER_TimeNew)));
		B_CalcWorkingHoursAll(CYCLE_TRIGGER_Period);	//���� ��� �� ���� ��������� ���� �����������, ������� ��� �������� �����
		SP_SearchItemsList_Cycle(CYCLE_TRIGGER_Period);	//�������
		Spawn_MR_Normal(CYCLE_TRIGGER_Period);	//����� �������
		Spawn_MR_Sunrise(CYCLE_TRIGGER_Period);	//����� ��������
		Spawn_MR_NightSparcles();	//����� ������ ����
	};
	
	//������ ������ ����� �������, ���� �������� (10 �����)
	if (C_BodyStateContains(hero,BS_SWIM) || C_BodyStateContains(hero,BS_DIVE))	{
		if ((PATRONGOD == PATRONGOD_Adanos) && (Hlp_Random(3) == 0))	{	//������ �������� � ����
			if (CYCLE_TRIGGER_Period > 0)	{
				Hero_SwimTime += (CYCLE_TRIGGER_Period) / 3 + 1;
			};
		}
		else	{
			Hero_SwimTime += CYCLE_TRIGGER_Period;
		};
		// ������ �� ����� => �� ������
		if (Hero_SwimTime > 10 + hero.protection[PROT_MAGIC])	{
			PrintScreen(PRINT_Freezing,-1,4,FONT_Screen,1);
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-5);
			if (hero.attribute[ATR_HITPOINTS] <= 0)	{
				hero.attribute[ATR_HITPOINTS] = 0;
				//����� ����� ��������� � ����
				Npc_ClearAIQueue(hero);
				AI_PlayAniBS(hero,"T_DIVE_2_DROWNED",BS_DIVE);
				//AI_StandUpQuick(hero);
			};
		}
		else	{
			PrintScreen(PRINT_ColdWater,-1,4,FONT_Screen,1);
		};
		// -------------------- ���� ��������� � ���� ------------------------------------
		hr = Hlp_GetNpc(hero);
		//vob � ������ ?
		if (hr.focus_vob)	{
			// ���� ��� �������
			if (Hlp_Is_oCItem(hr.focus_vob))	{
				//������ ������ ��������?
				if (MEM_KeyPressed(MEM_GetKey("keyAction")) || MEM_KeyPressed(MEM_GetSecondaryKey("keyAction")))	{
					//�������
					var C_ITEM itm;	itm = _^(hr.focus_vob);
					//AI_TakeItem(hero,itm);
					CreateInvItem(hero,Hlp_GetInstanceID(itm));
					Vob_RemoveFromWorld(hr.focus_vob);
					hr.focus_vob = 0;
				};
			};
		};
	}
	else	{
		if (Hero_SwimTime > 0)	{ 
			Hero_SwimTime -= 3;
		};
	};
	
	//� ��� ������ �����
	if (CYCLE_TRIGGER_Period > 0)	{
		if ((hero.guild < GIL_SEPERATOR_HUM) && (C_GetPlayerPortalGuild() == GIL_OUTDOOR)	//�� ������ �������� �� �����
			 && !Npc_HasEquippedArmor(hero) && (Hlp_Random(100) < 20))	{
			PrintScreen(PRINT_ColdNoArmor,-1,15,FONT_Screen,3);
			if (Npc_GetInvItemBySlot(hero,INV_ARMOR,0) > 0) //���� �����?
			{
				AI_EquipBestArmor(hero);
			};
		};
	};
	
	// ����������� �������� ������ ���� (�� ��������� ����������!)
	B_HeroRegenFromMana(CYCLE_TRIGGER_Period);
	
	//�� ���� �������� �������, �.�. �� ��� � ������ ������
	if (HERO_DelayedFarOverlay && !Npc_IsInFightMode(hero,FMODE_FAR))	{
		HERO_DelayedFarOverlay = FALSE;
		B_SetSkillOverlay(hero);
	};

	//���������� ����������
	if (POISON_Foggy_Timer > CYCLE_TRIGGER_TimeNew)	{
		// HP �� ����� �������� �� ���������
		if (hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX] / 2)	{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX] / 2;
		};
		rnd = Hlp_Random(250);
		if (rnd == 0)	{
			Wld_PlayEffect("POISON_FOG_SLOW",hero,hero,0,0,0,FALSE);
		}
		else if (rnd == 1)	{
			Wld_PlayEffect("POISON_FOG_NOISE",hero,hero,0,0,0,FALSE);
		};
	};
	
	//���������� ����������� �������
	if (POISON_DrgTears_Timer > 0)	{
		if (CYCLE_TRIGGER_Time < CYCLE_TRIGGER_TimeNew)	{
			POISON_DrgTears_Timer += CYCLE_TRIGGER_Time - CYCLE_TRIGGER_TimeNew;
			var int dHP;	dHP = (CYCLE_TRIGGER_Time - CYCLE_TRIGGER_TimeNew) * (hero.attribute[ATR_HITPOINTS] / 50);
			if ((dHP >= hero.attribute[ATR_HITPOINTS]) && hero.aivar[AIV_INVINCIBLE])	{
				hero.attribute[ATR_HITPOINTS] = 1;
			}
			else	{
				Npc_ChangeAttribute(hero, ATR_HITPOINTS, dHP);
			};
		};
		Wld_PlayEffect("POISON_DRGTEARS",hero,hero,0,0,0,FALSE);
		POISON_DrgTears_EffectOn = TRUE;
	}
	else
	{
		if (POISON_DrgTears_EffectOn == TRUE)	{
			Wld_StopEffect("POISON_DRGTEARS");
			POISON_DrgTears_EffectOn = FALSE;
		};
	};

	//���������� ���������
	if ((POISON_Trident_STR > 0) || (POISON_Trident_DEX > 0))	{
		POISON_Trident_Timer += CYCLE_TRIGGER_Period;
		var int d;	d = POISON_Trident_Timer / POISON_Trident_Step;
		if (d > 0)	{
			//��������������� ��������� ����
			if (d > POISON_Trident_STR)
			{
				Npc_ChangeAttribute(hero,ATR_STRENGTH,POISON_Trident_STR);
				POISON_Trident_STR = 0;
			}
			else	{
				Npc_ChangeAttribute(hero,ATR_STRENGTH,d);
				POISON_Trident_STR -= d;
			};
			//��������������� ��������
			if (d > POISON_Trident_DEX)
			{
				Npc_ChangeAttribute(hero,ATR_DEXTERITY,POISON_Trident_DEX);
				POISON_Trident_DEX = 0;
			}
			else	{
				Npc_ChangeAttribute(hero,ATR_DEXTERITY,d);
				POISON_Trident_DEX -= d;
			};
			POISON_Trident_Timer -= d * POISON_Trident_Step;
		};
	}
	else	{
		POISON_Trident_Timer = 0;
	};
	
	//������ ������ ����
	if (TIMER_NightSparkles_Enabled == TRUE)	{
		if (TIMER_NightSparkles > 0)	{
			if (CYCLE_TRIGGER_Time < CYCLE_TRIGGER_TimeNew)	{
				TIMER_NightSparkles += CYCLE_TRIGGER_Time - CYCLE_TRIGGER_TimeNew;
			};
			Wld_PlayEffect("SPELLFX_HEALTHPOTION",hero,hero,0,0,0,FALSE);
		}
		else
		{
			self.protection[PROT_FIRE] -= ProtFire_Mr_NightSparkles;
			Wld_StopEffect("SPELLFX_HEALTHPOTION");
			TIMER_NightSparkles_Enabled = FALSE;
		};
	};
	
	//�������
	if (TIMER_AntiFoggy_Enabled == TRUE)	{
		if (TIMER_AntiFoggy > 0)	{
			if (CYCLE_TRIGGER_Time < CYCLE_TRIGGER_TimeNew)	{
				TIMER_AntiFoggy += CYCLE_TRIGGER_Time - CYCLE_TRIGGER_TimeNew;
//				Wld_PlayEffect("SCREEN_SWEAT",hero,hero,0,0,0,FALSE);
			};
		}
		else
		{
			Wld_StopEffect("SCREEN_SWEAT");
			TIMER_AntiFoggy_Enabled = FALSE;
			TIMER_AntiFoggy = 0;
		};
	};
	

	// �������� ===================================
	
	//���������� �����������
	var int day;	day = Wld_GetDay();
	if ((_DayS_Once == FALSE) && (day == Competition_LastDay))
	{
		if (Hlp_IsValidNpc(CMP_Elena))	{B_StartOtherRoutine(CMP_Elena, "DAYS");	B_CompetitorGiveMrmsToConstantino(CMP_Elena);};
		if (Hlp_IsValidNpc(CMP_Erol))	{B_StartOtherRoutine(CMP_Erol, "DAYS");	B_CompetitorGiveMrmsToConstantino(CMP_Erol);};
		if (Hlp_IsValidNpc(CMP_Odo))	{B_StartOtherRoutine(CMP_Odo, "DAYS");	B_CompetitorGiveMrmsToConstantino(CMP_Odo);};
		if (Hlp_IsValidNpc(CMP_Rupert))	{B_StartOtherRoutine(CMP_Rupert, "DAYS");	B_CompetitorGiveMrmsToConstantino(CMP_Rupert);};
		if (Hlp_IsValidNpc(CMP_Sarah))	{B_StartOtherRoutine(CMP_Sarah, "DAYS");	B_CompetitorGiveMrmsToConstantino(CMP_Sarah);};
		if (Hlp_IsValidNpc(CMP_Talbin))	{B_StartOtherRoutine(CMP_Talbin, "DAYS");	B_CompetitorGiveMrmsToConstantino(CMP_Talbin);};
		if (Hlp_IsValidNpc(CMP_Till))	{B_StartOtherRoutine(CMP_Till, "DAYS");	B_CompetitorGiveMrmsToConstantino(CMP_Till);};
		if (Hlp_IsValidNpc(Mil_336_Rick))		{Npc_ExchangeRoutine(Mil_336_Rick, "START");};
		if (Hlp_IsValidNpc(Mil_335_Rumbold))	{Npc_ExchangeRoutine(Mil_335_Rumbold, "START");};
		if (Hlp_IsValidNpc(Bau_903_Bodo))		{Npc_ExchangeRoutine(Bau_903_Bodo, "START");};
		if (Hlp_IsValidNpc(BAU_935_Bronko))		{Npc_ExchangeRoutine(BAU_935_Bronko, "AFTER");};
		if (Hlp_IsValidNpc(OUT_1240_Patric))	{Npc_ExchangeRoutine(OUT_1240_Patric, "AFTER");};
		if (Hlp_IsValidNpc(OUT_1200_Engrom))	{Npc_ExchangeRoutine(OUT_1200_Engrom, "DAYS");	B_CompetitorGiveMrmsToConstantino(CMP_Till);};
		_DayS_Once = TRUE;
	};
	if ((_DaySAfter_Once == FALSE) && (day > Competition_LastDay))
	{
		if (Hlp_IsValidNpc(CMP_Elena))	{B_StartOtherRoutine(CMP_Elena, "AFTER");};
		if (Hlp_IsValidNpc(CMP_Erol))	{B_StartOtherRoutine(CMP_Erol, "AFTER");};
		if (Hlp_IsValidNpc(CMP_Odo))	{B_StartOtherRoutine(CMP_Odo, "AFTER");};
		if (Hlp_IsValidNpc(CMP_Rupert))	{B_StartOtherRoutine(CMP_Rupert, "AFTER");};
		if (Hlp_IsValidNpc(CMP_Sarah))	{B_StartOtherRoutine(CMP_Sarah, "AFTER");};
		if (Hlp_IsValidNpc(CMP_Talbin))	{B_StartOtherRoutine(CMP_Talbin, "AFTER");};
		if (Hlp_IsValidNpc(CMP_Till))	{B_StartOtherRoutine(CMP_Till, "AFTER");};
		if (Hlp_IsValidNpc(OUT_1200_Engrom))	{B_StartOtherRoutine(OUT_1200_Engrom, "AFTER");};
		_DaySAfter_Once = TRUE;
	};
	//���������� ����� ����� �� ��������� �����������
	if (_DayS_Once == FALSE)	{
		if (Hlp_IsValidNpc(CMP_Elena))	{
			if (Wld_GetFullTime() >= (GiveMrmsDay_Elena * 24 + 19) * 60 + 45)	{
				B_CompetitorGiveMrmsToConstantino(CMP_Elena);
				GiveMrmsDay_Elena = Wld_GetDay() + 1;
				MEM_Debug("Elena gave MRs from inventory");
			};
		};
		if (Hlp_IsValidNpc(CMP_Erol))	{
			if (Wld_GetFullTime() >= (GiveMrmsDay_Erol * 24 + 20) * 60 + 35)	{
				B_CompetitorGiveMrmsToConstantino(CMP_Erol);
				GiveMrmsDay_Erol = Wld_GetDay() + 1;
				MEM_Debug("Erol gave MRs from inventory");
			};
		};
		if (Hlp_IsValidNpc(CMP_Odo))	{
			if (Wld_GetFullTime() >= (GiveMrmsDay_Odo * 24 + 19) * 60 + 15)	{
				B_CompetitorGiveMrmsToConstantino(CMP_Odo);
				GiveMrmsDay_Odo = Wld_GetDay() + 1;
				MEM_Debug("Odo gave MRs from inventory");
			};
		};
		if (Hlp_IsValidNpc(CMP_Rupert))	{
			if (Wld_GetFullTime() >= (GiveMrmsDay_Rupert * 24 + 18) * 60 + 15)	{
				B_CompetitorGiveMrmsToConstantino(CMP_Rupert);
				GiveMrmsDay_Rupert = Wld_GetDay() + 1;
				MEM_Debug("Rupert gave MRs from inventory");
			};
		};
		if (Hlp_IsValidNpc(CMP_Sarah))	{
			if (Wld_GetFullTime() >= (GiveMrmsDay_Sarah * 24 + 19) * 60 + 25)	{
				B_CompetitorGiveMrmsToConstantino(CMP_Sarah);
				GiveMrmsDay_Sarah = Wld_GetDay() + 1;
				MEM_Debug("Sarah gave MRs from inventory");
			};
		};
		if (Hlp_IsValidNpc(CMP_Talbin))	{
			if (Wld_GetFullTime() >= (GiveMrmsDay_Talbin * 24 + 19) * 60 + 55)	{
				B_CompetitorGiveMrmsToConstantino(CMP_Talbin);
				GiveMrmsDay_Talbin = Wld_GetDay() + 1;
				MEM_Debug("Talbin gave MRs from inventory");
			};
		};
		if (Hlp_IsValidNpc(CMP_Till))	{
			if (Wld_GetFullTime() >= (GiveMrmsDay_Till * 24 + 18) * 60 + 45)	{
				B_CompetitorGiveMrmsToConstantino(CMP_Till);
				GiveMrmsDay_Till = Wld_GetDay() + 1;
				MEM_Debug("Till gave MRs from inventory");
			};
		};
	};
	
	if ((day > Competition_LastDay) || ((day == Competition_LastDay) && Wld_IsTime(8,0,0,0))
		&& (Competition_Result == Competition_Result_NONE)
	)	{
		B_LogEntry_Weekend();
	};
	
	// ����� �� ������ ------------------------------
	//������ �����
	if ((Fishers_Rain_Started == 0) && (Fishers_Rain_Day > 0))	{
		if ((Wld_GetDay() >= Fishers_Rain_Day) && Wld_IsTime(13,15,0,0))	{
			MEM_InitGlobalInst();
			MEM_SkyController.rainFX_timeStartRain = fracf(0,24); //� 12 ����� ��� (� 13.15 ����� ������ �������)
			MEM_SkyController.rainFX_timeStopRain = fracf(21,24); //�� 9 ����
			MEM_SkyController.rainFX_renderLightning = TRUE;	//� ��������
			Fishers_Rain_Started = 1;
			PrintScreen(PRINT_Fishers_Rain1,-1,15,FONT_ScreenSmall,5);
			PrintScreen(PRINT_Fishers_Rain2,-1,18,FONT_ScreenSmall,5);
			B_LogNote(TOPIC_Misk, TOPIC_Misk_Farim);
		}
		else if (Wld_GetDay() < Fishers_Rain_Day)	{	//�� ����� ����� �� �����
			MEM_SkyController.rainFX_timeStartRain = 0;
			MEM_SkyController.rainFX_timeStopRain = 0;
			MEM_SkyController.rainFX_renderLightning = FALSE;
		};
	};
	
	// ������� ������ ����� ------------------------------
	//��������� ����������
	if ((MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Ready) && (MIS_GrimbaldOrcs == LOG_Running))
	{
		if (C_GrimbaldOrcs_FarAway())
		{
			MIS_GrimbaldOrcs_GetBow = MIS_GrimbaldOrcs_GetBow_Go;
			B_StartOtherRoutine(OUT_1210_Grimbald,"GETBOW");
			Npc_ClearAIQueue(OUT_1210_Grimbald);
			AI_SetWalkmode(OUT_1210_Grimbald,NPC_RUN);
			AI_GotoWP(OUT_1210_Grimbald,"NW_XARDAS_GOBBO_01");
			MIS_GrimbaldOrcs_Timer = Wld_GetFullTime() + 6;
			PrintScreen(PRINT_Grimbald_FarAway,-1,15,FONT_Screen,5);
//			MEM_Debug("MIS_GrimbaldOrcs_GetBow_Go");
		};
	};
	//���������!
	if ((MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Go) && (MIS_GrimbaldOrcs == LOG_Running))
	{
		if (C_GrimbaldOrcs_FarAway())
		{
			//���������� ���������� ����� 4 ������ �� 6
			if (MIS_GrimbaldOrcs_Timer - 2 == Wld_GetFullTime())
			{
				B_StartOtherRoutine(OUT_1210_Grimbald,"RETURN");
				Npc_ClearAIQueue(OUT_1210_Grimbald);
				AI_SetWalkmode(OUT_1210_Grimbald,NPC_RUN);
				AI_GotoWP(OUT_1210_Grimbald,"NW_XARDAS_STAIRS_04");
				//Wld_RemoveItem(ItRw_Bow_Grimbald);
				CreateInvItem(OUT_1210_Grimbald,ItRw_Bow_Grimbald);
				AI_EquipBestRangedWeapon(OUT_1210_Grimbald);
				//MEM_Debug("MIS_GrimbaldOrcs_GetBow Grimbald Returns");
			};
		}
		else	{
			//UNFINISHED - ���� ���������
			PrintScreen("���� ������������!",-1,15,FONT_Screen,4);
			PrintScreen("���� ������ �� ������",-1,20,FONT_Screen,4);
			MIS_GrimbaldOrcs_Timer = Wld_GetFullTime() + 5;
		};
		if (C_GrimbaldOrcs_FarAway() && MIS_GrimbaldOrcs_Timer == Wld_GetFullTime())
		{
			PrintScreen(PRINT_Grimbald_Returned,-1,15,FONT_Screen,5);
			MIS_GrimbaldOrcs_GetBow = MIS_GrimbaldOrcs_GetBow_Return;
		};
	};
	
	// ���� ------------------------------------------------------
	//�� ������ ��������
	if (!Vino_Smelled && Hlp_IsValidNpc(BAU_952_Vino))	{
		var C_NPC Vino;	Vino = Hlp_GetNpc(BAU_952_Vino);
		if (Npc_GetDistToWP(hero,Vino.wp) < 1500)	{
			AI_PrintScreen(PRINT_DrunkSmell,-1, 25, FONT_Screen,2);
			if (Npc_CanSeeNpc(hero,Vino))	{
				Vino_Smelled = TRUE;
			};
		};
	};
	//����������
	if ((Vino_Sleep_Day > 0) && (Vino_Sleep_Day <= Wld_GetFullTime()))	
	{
		B_StartOtherRoutine(BAU_952_Vino,"START");
		Vino_Sleep_Day = 0;
	};

	// � ����� ��� �� ������? -------------------------------------------------
	if ((Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_PATH_29") < 700) ||
			(Npc_GetDistToWP(hero,"NW_CITY_MAINSTREET_01") < 700))
	{
		HERO_WalkFromCity = TRUE;
	}
	else if ((Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_PATH_29") > 2500) &&
			(Npc_GetDistToWP(hero,"NW_CITY_MAINSTREET_01") > 2500))
	{
		HERO_WalkFromCity = FALSE;
	};
	
	// ������ - ���� ������ ---------------------------------------------------
	if (C_HeroIs_Rupert() && 
		(MIS_Rupert_Debts_Lehmar_Day < Wld_GetDay()) && !MIS_Rupert_Debts_Paid[Creditor_Lehmar])
	{
		if (!Hlp_IsValidNpc(VLK_4941_Thug))
		{
			Wld_InsertNpc(VLK_4941_Thug,"NW_CITY_HABOUR_POOR_AREA_PATH_19");
		};
	};
	// ����� ������ ---------------------
	if (C_HeroIs_Rupert() && (Rupert_Binge == -1) && (InfoManager_HasFinished()))	{
		B_StartOtherRoutine(VLK_425_Regis,"START");
		Rupert_Binge = -2;
		PrintScreen("??:??",-1,-1,FONT_Screen,5);
		AI_ProcessInfos(hero);
	};
	
	// ���� - ��������� �������� ----------------------------------------------
	if (MIS_Till_Pet == LOG_Running)	{
		//������� ������� � �������
		if (!MIS_Till_Pet_RunAway
				&& (Wld_GetFullTime() > (2*24+16) * 60) && InfoManager_HasFinished())	{
			B_StartOtherRoutine(Molerat_Cross,"TOSAGITTA");
			B_StartOtherRoutine(OUT_1203_Sagitta,"TOCROSS");
			MIS_Till_Pet_Follow = FALSE;
			MIS_Till_Pet_Search = FALSE;
			MIS_Till_Pet_RunAway = TRUE;
			MIS_Till_Pet_BirthPlace = MIS_Till_Pet_BirthPlace_Sagitta;
			//����� �� ����?
			if ((Npc_GetDistToPlayer(Molerat_Cross) < PERC_DIST_ACTIVE_MAX)
				|| Npc_CanSeeNpc(hero, Molerat_Cross))	{
				// ����� ����?
				if (Npc_GetDistToWP(hero,"NW_FARM4_WOOD_MONSTER_MORE_02") < PERC_DIST_INTERMEDIAT)	{
					B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_Lost2);
					MIS_Till_Pet_KnowLost = TRUE;
				}
				else	{
					B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_RunAway);
				};
			}
			// ��� - ���� ���������
			else	{
				B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_CheckOut);
			};
			Npc_ClearAIQueue(Molerat_Cross);
			if ((Npc_GetDistToPlayer(Molerat_Cross) < PERC_DIST_DIALOG) || Npc_CanSeeNpc(hero, Molerat_Cross))	{
				AI_StartState(Molerat_Cross,ZS_MM_RunToWP,0,"NW_SAGITTA_CAVE_CROSS");
			}
			else	{
				AI_Teleport(Molerat_Cross,"NW_SAGITTA_CAVE_CROSS");
			};
		}
		// ���� �����, ��� �������� ��� ����
		else if (!MIS_Till_Pet_KnowLost && !MIS_Till_Pet_Found && MIS_Till_Pet_RunAway)	{
			if (Npc_GetDistToWP(hero,"NW_FARM4_WOOD_MONSTER_MORE_02") < PERC_DIST_INTERMEDIAT)	{
				MIS_Till_Pet_KnowLost = TRUE;
				B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_Lost);
			};
		}
		// �������� �������
		else if (!MIS_Till_Pet_ChildBorn)	{
			if (Npc_GetDistToWP(Molerat_Cross,"NW_BIGFARM_FOREST_CROSS") < PERC_DIST_INTERMEDIAT && MIS_Till_Pet_BirthPlace != MIS_Till_Pet_BirthPlace_Cave)	{
				B_StartOtherRoutine(Molerat_Cross,"GIVEBIRTH");
				MIS_Till_Pet_Follow = FALSE;
				MIS_Till_Pet_BirthPlace = MIS_Till_Pet_BirthPlace_Cave;
				B_LogEntry(TOPIC_Till_Pet,TOPIC_Till_Pet_Transferred);
			};
			if (Wld_GetFullTime() > (5 * 24+4) * 60)	{
				if (MIS_Till_Pet_BirthPlace == MIS_Till_Pet_BirthPlace_Sagitta)	{
					Wld_InsertNpc(Molerat_Cub,"NW_SAGITTA_CAVE_CROSS");
					Wld_InsertNpc(Molerat_Cub,"NW_SAGITTA_CAVE_CROSS");
					Wld_InsertNpc(Molerat_Cub,"NW_SAGITTA_CAVE_CROSS");
				}
				else	{
					Wld_InsertNpc(Molerat_Cub,"NW_BIGFARM_FOREST_CROSS");
					Wld_InsertNpc(Molerat_Cub,"NW_BIGFARM_FOREST_CROSS");
					Wld_InsertNpc(Molerat_Cub,"NW_BIGFARM_FOREST_CROSS");
				};
				MIS_Till_Pet_ChildBorn = TRUE;
			}
			else if ((Wld_GetFullTime() > 5 * 24 * 60) && MIS_Till_Pet_Follow)	{
				B_StartOtherRoutine(Molerat_Cross,"TOSAGITTA");
			};
		};
	};
	
	// ���� -----------------------------------------------------------------------
	if (C_HeroIs_Erol())	{
		//����� ������?
		if (!MIS_Erol_Plates_AmulFound)	{
			if (Npc_HasItems(hero,ItAm_MR_WispDetector_Lake))	{
				B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulFound);
				MIS_Erol_Plates_AmulFound = TRUE;
			};
		};
		//����� ������� ��������?
		if (!MIS_Erol_Plates_GoldFound)	{
			if (Npc_HasItems(hero,ItWr_Stoneplate_Gold))	{
				B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_GoldFound);
				MIS_Erol_Plates_GoldFound = TRUE;
			};
		};
		//����� ���������� ��������?
		if (!MIS_Erol_Plates_SilverFound)	{
			if (Npc_HasItems(hero,ItWr_Stoneplate_Silver))	{
				if (!MIS_Erol_Plates_SilverPieceFound)	{
					B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_SilverFound);
				}
				else	{
					B_LogEntry(TOPIC_Erol_Plates,ConcatStrings(TOPIC_Erol_Plates_SilverFound, TOPIC_Erol_Plates_SilverFound_Broken));
				};
				MIS_Erol_Plates_SilverFound = TRUE;
			};
		};
		//����� ���������� �������?
		if (!MIS_Erol_Plates_SilverPieceFound)	{
			if (Npc_HasItems(hero,ItWr_Stoneplate_SilverPiece))	{
				if (MIS_Erol_Plates_SilverFound)	{
					B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_SilverPieceFound);
				}
				else	{
					B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_SilverPieceFound_First);
				};
				MIS_Erol_Plates_SilverPieceFound = TRUE;
			};
		};
	};
	
	// ����� -----------------------------------------------------------------------
	if (C_HeroIs_Elena())	{
		//������� �����?
		if (!MIS_Elena_Present_FurGot)	{
			if (Npc_HasItems(hero,ItAt_ShadowFur))	{
				B_GivePlayerXP(XP_Elena_ShadowFurFound);
				B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_ShadowfurGot);
				MIS_Elena_Present_FurGot = TRUE;
			};
		};
	};
	
	// ������ -----------------------------------------------------------------------
	if (C_HeroIs_Talbin())	{
		//������� ������� ������
		if (!MIS_Talbin_Hunt_KeilerGot)	{
			if (Npc_HasItems(hero,ItAt_KeilerJawRaw) || Npc_HasItems(hero,ItAt_KeilerHogJawRaw))	{
				B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_Keils);
				MIS_Talbin_Hunt_KeilerGot = TRUE;
			};
		};
		//����� ����
		EVT_WhiteWolf_Check();
	};
	
	// ��� -----------------------------------------------------------------------
	EVT_Odo_StrawQuality();
	
	// �� ������� ------------------------------------------------------------------
	if (MIS_FellanGoHome == LOG_Running)	{
		if (!MIS_FellanGoHome_BrokenHammerGot_Once && Npc_HasItems(hero,ItMi_FellanHammer_Broken)) 	{
			MIS_FellanGoHome_BrokenHammerGot_Once = TRUE;
			B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerBroken);
		};
	};

	// ���� - ������� �������� ----------------------------------------------
	//���� ���� � ����� ���������
	if (MIS_Sarah_BadHabit_LuciaTalkTime > 0 && Wld_GetFullTime() > MIS_Sarah_BadHabit_LuciaTalkTime && MIS_Sarah_BadHabit_NadjaTalkTime == 0)
	{
		//������� ������
		B_StartOtherRoutine(VLK_435_Nadja,"NOSMOKING");
		//��������� �� ��������� ���� ����� 9:00
		MIS_Sarah_BadHabit_NadjaTalkTime = ((MIS_Sarah_BadHabit_LuciaTalkTime / 60 / 24 + 1) * 24 + 9) * 60;
	};
	
	//SnowStudio -----------------------------------------------------------------
	EVT_SnowStudio_Portrait();
	
	// ��������� ����������
	B_GiveAchievement_ByTime();
		
	CYCLE_TRIGGER_Time = CYCLE_TRIGGER_Time + CYCLE_TRIGGER_Period;
};


