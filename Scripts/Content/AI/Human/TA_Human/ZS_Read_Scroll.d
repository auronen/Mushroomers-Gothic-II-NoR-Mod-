/**************************************************************************

							������ ������
  
  ������ ������ ������.
  �� ������������ � �������� ����������� ��������, NPC ����� �������!

***************************************************************************/

func void ZS_Read_Scroll()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	CreateInvItem(self, Fakescroll);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Read_Scroll_loop()
{
	// ���� ��� �� ������
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
		else	//�����	
		{
			// ��������������
			AI_AlignToWP(self);
			// � ������
			AI_UseItemToState(self,Fakescroll,1);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Read_Scroll_end()
{
	AI_UseItemToState(self,Fakescroll,-1);
	Npc_RemoveInvItems(self,Fakescroll,Npc_HasItems(self,Fakescroll));
};

