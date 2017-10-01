/**************************************************************************

							������ �� �����
  
  ����� ���������� - �������.
  ����� ����������� - ������.

***************************************************************************/

func void ZS_Sit_Chair()
{
	if (self.guild < GIL_SEPERATOR_HUM)	{
		Perception_Set_Normal();
	}
	else	{
		Perception_Set_Monster_Rtn();
	};
	B_ResetAll(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		NS_GoToMyWP(self);
	};
};

func int ZS_Sit_Chair_Loop()
{
	var int random;
	if(!C_BodyStateContains(self,BS_SIT) && Wld_IsMobAvailable(self,"CHAIR"))
	{
		AI_UseMob(self,"CHAIR",1);
	};
	if(C_BodyStateContains(self,BS_SIT) && (Npc_GetStateTime(self) > 5))
	{
		random = Hlp_Random(10);
		if ((random <= 0))
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_1",BS_SIT);
		};
		if ((random <= 1))
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_2",BS_SIT);
		};
		if(random <= 2)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_3",BS_SIT);
		};
		if ((random <= 3))
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_4",BS_SIT);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sit_Chair_End()
{
	AI_UseMob(self,"CHAIR",-1);
};

