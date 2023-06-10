/**************************************************************************

							�����
  
  ����� ���������� - ����� �����, �����������, ��������. ������
���������� ���������
  ����� ����������� - ������.

***************************************************************************/

// ���� � ������� - ����� ���������� ��� �������, ����� ���� ����� 
func void ZS_GotoBed()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
	AI_StartState(self,ZS_Sleep,0,"");
};

func void B_Wake_BedHigh()
{
	if(C_BodyStateContains(self,BS_LIE))
	{
		AI_UseMob(self,"BEDHIGH",-1);
		AI_UseMob(self,"BEDLOW",-1);
	};
	AI_StartState(self,ZS_ObservePlayer,0,"");
};

func void B_AssessSleepTalk()
{
	if (C_Can_PICKPOCKET_Sleep(self, other))
	{
		B_Start_PICKPOCKET_Sleep(self, other);
		return;
	};
	if (!Npc_IsInState(self,ZS_Sleep_Deep) || (Hlp_Random(100) < 15))	{
		B_Wake_BedHigh();
	}
	else	{
		B_Say(self,other,"$NOTNOW");
	};
};

func void ZS_Sleep()
{
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSound);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessSleepTalk);
	AI_SetWalkMode(self,NPC_WALK);
};

func int ZS_Sleep_Loop()
{
	// ���� � ��� �� ����
	if(!C_BodyStateContains(self,BS_LIE))
	{
		// ���� ���� ������� - ����
		if(Wld_IsMobAvailable(self,"BEDHIGH"))
		{
			AI_UseMob(self,"BEDHIGH",1);
		}
		else if(Wld_IsMobAvailable(self,"BEDLOW"))
		{
			AI_UseMob(self,"BEDLOW",1);
		}
		// ���� ��������� ������� ���, � � ��� �� ����������
		else if((Player_GetOutOfMyBedComment == FALSE) && C_BodyStateContains(hero,BS_LIE) && (Npc_GetDistToNpc(self,hero) <= 500))
		{
			// ����������� � �� � �������� ���
			B_TurnToNpc(self,hero);
			B_Say(self,hero,"$GETOUTOFMYBED");
			Player_GetOutOfMyBedComment = TRUE;
		};
	};
	// ���� �� �������� �����
	if ((HERO_ACTION_Pickpocket == PICKPOCKET_Fail))
	{
		// ���� ��� ���� ��������
		if (HERO_ACTION_Pickpocket_Victim == Hlp_GetInstanceID(self))
		{
			// �������� ������, ������� �� ��
			Npc_ClearAIQueue(self);
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_Theft,0);	// ������� �� �� ��� �� ����
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Sleep_End()
{
	// ���� �� � ������� - �����������������
	if(!Npc_IsInPlayersRoom(self))
	{
		B_Say(self,self,"$AWAKE");
	};
	// ������ � �������
	AI_UseMob(self,"BEDHIGH",-1);
	AI_UseMob(self,"BEDLOW",-1);
};

