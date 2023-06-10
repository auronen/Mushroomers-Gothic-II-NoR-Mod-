/**************************************************************************

							�������� � �������
  
  ����� ���������� - �������.
  ����� ����������� - ������.
   
  ���� ���������� ��������� (������) ������� �� ������� ��� �����������.

***************************************************************************/


// ������ =================================================================

func void ZS_Practice_Circle()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	NS_GoAndAlignToMyWP(self);
};

// ���� ===================================================================

func int ZS_Practice_Circle_Loop()
{
	if (Npc_GetStateTime(self) > 0)	// �������� ��� � 1 ���.
	{
		if (Hlp_Random(100) < 30) // � ������� ��� � 3 ���.
		{
			AI_PlayAni(self,"T_PRACTICEMAGIC5"); // �����
			// �����������
			if (self.guild == GIL_DMT) // � ������
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);	// ������� ��������
				Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);	// � �������������
			}
			else if (self.guild == GIL_KDF) // � ����� ����
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);	// ������ ������� ��������
			}
			else if (self.guild == GIL_KDW) // � ����� ����
			{
				if (Hlp_Random(100) < 60)
				{
					Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);	// ������ ����� �����
				}
				else
				{
					Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);	// ��� ����� ��������
				};
			}
			else	// � ���� ���������
			{
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);	// ����� ��������
			};
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

// ���������� =============================================================

func void ZS_Practice_Circle_End()
{
};