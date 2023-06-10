
func void ZS_Sit_Campfire()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		NS_GoToMyWP(self);
	};
};

func int ZS_Sit_Campfire_loop()
{
	if((Npc_IsOnFP(self,"CAMPFIRE") || !Wld_IsFPAvailable(self,"CAMPFIRE")) && !C_BodyStateContains(self,BS_SIT))
	{
		AI_AlignToFP(self);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	}
	else if(Wld_IsFPAvailable(self,"CAMPFIRE") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_GotoFP(self,"CAMPFIRE");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sit_Campfire_end()
{
	AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
};

