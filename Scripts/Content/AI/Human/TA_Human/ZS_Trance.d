/**************************************************************************

								�����
  
  ��� �������� � ������� ������� � ������ �� ��������.

***************************************************************************/

func void ZS_Trance()
{
	self.senses = SENSE_HEAR | SENSE_SEE;
	self.senses_range = PERC_DIST_ACTIVE_MAX;
	Npc_PercEnable(self,PERC_ASSESSMAGIC,		B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,		B_AssessDamage);
	AI_SetWalkMode(self,NPC_WALK);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Trance_Loop()
{
	// ���� ��� �� ����� � �����
	if (self.aivar[AIV_TAPOSITION] != ISINPOS)
	{
		// ���� ��� �� ����� �� �����
		if ((Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX) || (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE))
		{
			// � ���� ��� �� ����
			if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
			{
				// �� ����
				AI_GotoWP(self, self.wp);
				self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
			};
		}	
		else	
		{			
			AI_AlignToWP(self);
			// ������ �� �������������
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
			// ���������, ��� �����
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	// ����� - ��� � ������
	else
	{
		if (Npc_GetStateTime(self) > 0)
		{
			// � ������� ��� � 2 ���.
			if (Hlp_Random(100) < 50)
			{
				// �����������
				Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
			};
			Npc_SetStateTime(self, 0);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Trance_End()
{
	// ����� �� ������
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};