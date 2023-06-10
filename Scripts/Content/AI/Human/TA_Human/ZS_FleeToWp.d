/**************************************************************************

						��������� ��������
  
  �������� ����� � ���������� �����. ������ 5 ���. � ������������ 50%
��������������� � ������������ �� ��������.  
  ����� ���������� - �������.
  ����� ����������� - ���.

***************************************************************************/

func void ZS_FleeToWp()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_RUN);
	if (self.guild < GIL_SEPERATOR_HUM)	{
		Mdl_ApplyOverlayMds(self,"HUMANS_FLEE.MDS");
	};
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_STAND_2_HGUARD");
};

func int ZS_FleeToWp_Loop()
{
	var int random;
	if(Npc_GetStateTime(self) > 5)
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

func void ZS_FleeToWp_End() //����. - int �� void
{
};

