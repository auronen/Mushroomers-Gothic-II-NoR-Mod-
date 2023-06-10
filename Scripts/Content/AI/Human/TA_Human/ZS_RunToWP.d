/**************************************************************************

						������ � ����� ����������
  
  �� ������ � ZS_FleeToWP - ����� ������� ���, � ��� ������������.
������ 5 ���. � ������������ 50% ��������������� � ������������ �� ��������.
  ����� ���������� - �������.
  ����� ����������� - ���.
 
***************************************************************************/

func void ZS_RunToWP()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_RUN);
	B_MM_DeSynchronize();
	NS_GoAndAlignToMyWP(self);
	if (Npc_GetTrueGuild(self) < GIL_SEPERATOR_HUM)	{
		AI_PlayAni(self,"T_STAND_2_HGUARD");
	};
};

func int ZS_RunToWP_Loop()
{
	var int random;
	if((Npc_GetStateTime(self) > 5) && (Npc_GetTrueGuild(self) < GIL_SEPERATOR_HUM))
	{
		random = Hlp_Random(2);
		if(random == 0)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_RunToWP_End()
{
};

