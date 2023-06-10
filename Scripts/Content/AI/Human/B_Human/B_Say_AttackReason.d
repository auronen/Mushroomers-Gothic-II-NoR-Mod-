/**************************************************************************

						����������� ������� ��������

  B_Say_AttackEnd	()
  �������� self (�) ������������ ������ ����� � other (��). 
  
  ���������� ����������� ������� ��:
   - ������� �����;
   - ��������� ����� ���������;
   - ������ ���������;
   - �� ������� ��� ������.
  ��������� ����� ���������� ��������.
  � ��������� ������� ����� ���������� ���������� � ������ �����
(���� �� �� ��������� �������, ���� �� ������, ���� �� ������,
�������� �� ��������). ����� ���������� PERC_ASSESSFIGHTSOUND.
  
  �������� �����������: ����� �� ������ �������� ���������� �� �������
��� ������������� 9 ������ (�����). ������ ����������� ��� ��, �����������
�������� ��� �������.
  
  �������� �����:
 ����������� �����					 	Story\SVM.d
 ������� B_Say_Overlay					AI\Human\B_Human\B_Say_Overlay.d
 
 //NS: �����, � ������� ����� ������ return ����� � ������

***************************************************************************/

func void B_Say_AttackReason()
{
	// ���������� ���������� ��������� �����
	var int rnd;
	
	// �� �������� ��������� ------------------------------------------------
	
	// �� �� �� ���������� ��������, �� �� ��� ������ ����
	if((Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE) && (C_NpcGetAttitude(self,other) == ATT_HOSTILE))
	{
		// ����� �������, ����� � ��������� ��� �����
		if(self.aivar[AIV_ATTACKREASON] == AR_KILL)
		{
			return;
		};
		if(self.aivar[AIV_ArenaFight] == AF_NONE)
		{
			return;
		};
		B_Say_Overlay(self,other,"$IGETYOUSTILL");	//�������, ��� � ��� ������
		return;
	};
	
	// �� �� ��������� �������
	if(self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
	{
		//���� � � ������� ������
		if(self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			// �� ����������� �������� ���� � ������������ 15%
			rnd = Hlp_Random(100);
			if(rnd >= 15)
			{
				return;
			};
		};
		// ���� �� �������
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			// �������, ��� �� ������ �������
			B_Say_Overlay(self,other,"$DIEENEMY");
		}
		// ���� �� ������
		else
		{
			// ���� � ���� 9 �����
			if(self.voice == 9)
			{
				// � ������ ������������ ������ ���� �� ���� ��� ��������
				rnd = Hlp_Random(30);
				if(rnd < 10)
				{
					B_Say_Overlay(self,other,"$DIEMONSTER");		//(�������)
				}
				else if(rnd < 20)
				{
					B_Say_Overlay(self,other,"$ADDON_DIEMONSTER");	//(�����)
				}
				else
				{
					B_Say_Overlay(self,other,"$ADDON_DIEMONSTER2");	//(����� 2)
				};
			}
			//���� �� 9 �����
			else
			{
				B_Say_Overlay(self,other,"$DIEMONSTER");		// ����� ��� ������� (�������)
			};
			
		};
		
		// ���������� ������, ��� ����� �������� (��� ����� �����������)
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	
	// �� ���
	if(self.aivar[AIV_ATTACKREASON] == AR_Theft)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say_Overlay(self,other,"$DIRTYTHIEF");	//�������, ��� �� ������� ������
		}
		else	{
			B_Say_Overlay(self,other,"$DIRTYTHIEF_F");	//�������, ��� ��� �������
		};
		return;
	};
	
	// �� ���� �������, ���� �� ���������
	if(self.aivar[AIV_ATTACKREASON] == AR_UseMob)
	{
		B_Say_Overlay(self,other,"$HANDSOFF");		//������� "���� �����!"
		return;
	};
	
	// �� ���� ����
	if(self.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
	{
		// ���� �� �������
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say_Overlay(self,other,"$SHEEPKILLER");		//�������, ��� �� ������� ����
			}
			else	{
				B_Say_Overlay(self,other,"$SHEEPKILLER_F");		//�������, ��� ��� ������� ����
			};
		}
		// ���� �� ������
		else
		{
			B_Say_Overlay(self,other,"$SHEEPKILLERMONSTER");//�������, ��� �� - ������, ��������� ����
		};
		return;
	};
	
	// �� ������
	if(self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	{
		B_Say_Overlay(self,other,"$YOUMURDERER");			//�������, ��� �� ������
		// ���������� ������, ��� ����� ��������
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	
	// �� ������, ������� ��������
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterMurderedHuman)
	{
		return;												// ��� ������������
	};
	
	// �� ������, �������� �� ��������
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterVsHuman)
	{
		B_Say_Overlay(self,other,"$DIEMONSTER");			//������� "����, ������!"
		// ���������� ������, ��� ����� ��������
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	
	// �� ������, �������������� � �������
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
	{
		B_Say_Overlay(self,other,"$DIESTUPIDBEAST");		//����������������� ���������� ����������� �������
		return;
	};
	
	// �� ������ �����
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
	{
		// ���� �� ������
		if(other.guild > GIL_SEPERATOR_HUM)
		{
			B_Say_Overlay(self,other,"$YOUASKEDFORIT");		//�������, ��� �� ��� ����������
			return;
		}
		// ���� �� �������
		else
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say_Overlay(self,other,"$YOUDAREHITME");		//��������, ��� �� ������ �� ���� ���� �������
			}
			else	{
				B_Say_Overlay(self,other,"$YOUDAREHITME_F");		//��������, ��� ��� ������� �� ���� ���� �������
			};
			return;
		};
	};
	
	// �� ������� ��� �������
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say_Overlay(self,other,"$YOUASKEDFORIT");			//�������, ��� �� ��� ����������
		}
		else	{
			B_Say_Overlay(self,other,"$YOUASKEDFORIT_F");			//�������, ��� �� ��� ����������
		};
		return;
	};
	
	// � ��������� ��������� ��� �� ����� ����
	if(self.aivar[AIV_ATTACKREASON] == AR_ClearRoom)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say_Overlay(self,other,"$THENIBEATYOUOUTOFHERE");	//�������, ���� ��������
		}
		else	{
			B_Say_Overlay(self,other,"$THENIBEATYOUOUTOFHERE_F");	//�������, ���� ���������
		};
		return;
	};
	
	// �� ����� �� ��������� � ������������ ��������
	if(self.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)
	{
		B_Say_Overlay(self,other,"$WHATDIDYOUDOINTHERE");	//��������, ��� �� ��� �����
		return;
	};
	
	// � ��������, ������������ �����
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
	{
		B_Say_Overlay(self,other,"$WILLYOUSTOPFIGHTING");	//�������, ���� ��������� �������
		return;
	};
	
	// � ��������, ��������� ��� ������ ����
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)
	{
		return;												// ��� ������������
	};
	
	// � ��������, ��������� ��� ������� ��������� �� �����������
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom)
	{
		return;												// ��� ������������
	};
};

