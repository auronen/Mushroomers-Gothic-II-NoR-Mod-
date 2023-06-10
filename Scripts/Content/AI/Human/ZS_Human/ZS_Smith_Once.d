/**************************************************************************

  ���� ������ ���� �����. ����� �����, ��� ��� ���������� ���������,
 NPC �������� � �������� ����������.
 
  TEST NEEDED !!!

****************************************************************************/

func void ZS_Smith_Once()
{
	Perception_Set_Minimal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoToMyWP(self);
	self.aivar[AIV_TAPOSITION] = 0;
};

func int ZS_Smith_Once_Loop()
{
	// ��� 1 - ����
	if (self.aivar[AIV_TAPOSITION] == 0)	{
		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSFIRE"))
		{
			AI_UseMob(self,"BSFIRE",1);
			self.aivar[AIV_TAPOSITION] = 1;
		}
		else	{
			Npc_SetStateTime(self,0);
		};
	}
	// ��� 2 - ����������� �� �����
	else	if (self.aivar[AIV_TAPOSITION] == 1)	{
		if (Npc_GetStateTime(self) > 10)	{
			AI_UseMob(self,"BSFIRE",-1);
			self.aivar[AIV_TAPOSITION] = 2;
			Npc_SetStateTime(self,0);
		};
	}
	// ��� 3 - ���� � ����������
	else	if (self.aivar[AIV_TAPOSITION] == 2)	{
		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
		{
			AI_UseMob(self,"BSANVIL",1);
			self.aivar[AIV_TAPOSITION] = 3;
		}
		else	{
			Npc_SetStateTime(self,0);
		};
	}
	// ��� 4 - ����������� �� ����������
	else	if (self.aivar[AIV_TAPOSITION] == 3)	{
		if (Npc_GetStateTime(self) > 10)	{
			AI_UseMob(self,"BSANVIL",-1);
			self.aivar[AIV_TAPOSITION] = 4;
			Npc_SetStateTime(self,0);
		};
	}
	// ��� 5 - ���� � ����� � �����
	else	if (self.aivar[AIV_TAPOSITION] == 4)	{
		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSCOOL"))
		{
			AI_UseMob(self,"BSCOOL",1);
			self.aivar[AIV_TAPOSITION] = 5;
		}
		else	{
			Npc_SetStateTime(self,0);
		};
	}
	// ��� 4 - ����������� �� ����������
	else	if (self.aivar[AIV_TAPOSITION] == 5)	{
		if (Npc_GetStateTime(self) > 10)	{
			AI_UseMob(self,"BSCOOL",-1);
			self.aivar[AIV_TAPOSITION] = 6;
			return LOOP_END;
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Smith_Once_End()
{
	AI_UseMob(self,"BSFIRE",-1);
};


