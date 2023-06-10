/**************************************************************************

								�������

  ������ self (�) ��������� �������� �� other (��).
  
  ������� ������������, ���� ������� ���������� �� ��������������. ������
����� ������������� ���������� �� ������.
  ���������: ������ ��������� �����, ���� �����������, ��� ������ ��������� 
�������.
  
  ����� ���������� - ������ �����, �����, �����������.
  ����� ����������� - ���.
  
***************************************************************************/

// ����������� ����������������� ������� �������
const int MM_FleeTimeMin = 7;	//���.

func void ZS_MM_Flee()
{
	// �������������
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	B_ValidateOther();
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	self.aivar[AIV_StateTime] = 0;
	// ������������ ���� ������ �� ���������
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
	// ��������� �����
	B_MM_DeSynchronize();
};

// ���� -------------------------------------------------------------------

func int ZS_MM_Flee_Loop()
{
	// ����� ��������
	Npc_GetTarget(self);
	// ���� ��� ��� �� ������� ������� - ���������� �������
	if((Npc_GetDistToNpc(self,other) < PERC_DIST_ACTIVE_MAX) && (Npc_GetHeightToNpc(self,other) < PERC_DIST_HEIGHT))
	{
		// �� ����, ��� ��� � 1 ���.
		if(Npc_GetStateTime(self) > 0)
		{
			// ���� � ���� ��� �������� �����
			self.aivar[AIV_StateTime] += Npc_GetStateTime(self);
			if (self.aivar[AIV_StateTime] > MM_FleeTimeMin)
			{
				// �������� - � �� ���������� �� �������
				if (!C_MM_WantToFlee(self, other) && (Hlp_Random(100) < 20))
				{
					Npc_ClearAIQueue(self);
					return LOOP_END;
				};
			};
			// ���� ��������� ������ - ����� ������������ ���� �� ���������
			Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
			Npc_SetStateTime(self,0);
		};
		// ������
		AI_Flee(self);
		return LOOP_CONTINUE;
	};
	// ���� ������� - ������������
	Npc_ClearAIQueue(self);
	return LOOP_END;
};

func void ZS_MM_Flee_End()
{
};

