/**************************************************************************

						����������� ����� ��������

  B_Say_AttackEnd	()
  �������� self (�) ������������ ���������� ����� � other (��, ����������). 
  
  � ����������� �������� ������� � �����, �� �� ����������� � ����� ��������� ����.
  ���������� ����������� ������� ��:
   - ������� �����;
   - ���� �� ��� ���;
   - �� ������� ��� ������.
  ��������� ����� ���������� ��������.
  
  �������� �����������: ����� �� ������ ������ �������� ���������� �� �������
��� ������������� ���������/������ (9, 12 - ����).
  
  �������� �����:
 ����������� �����					 				Story\SVM.d
 ������� B_Say										AI\Human\B_Human\B_say.d

***************************************************************************/


func void B_Say_AttackEnd()
{
	var int rnd;
	
	// �� �������� ��������� ------------------------------------------------
	
	// �� �����
	if((self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy) || (self.aivar[AIV_ATTACKREASON] == AR_MonsterMurderedHuman))
	{
		// ���� �� �������
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			// � ���� �� �� ����
			if(!Npc_IsDead(other))
			{
				// � ���� � � ��� �������� 
				if(self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID(other))
				{
					if (other.aivar[AIV_Gender] == MALE)	{
						B_Say(self,other,"$KILLENEMY");	// �������, ��� � ��� ����
					}
					else	{
						B_Say(self,other,"$KILLENEMY_F");	// �������, ��� � �� ����
					};
				}
				else
				{
					if (other.aivar[AIV_Gender] == MALE)	{
						B_Say(self,other,"$GOODKILL");	// �������, ��� �� ������� �� ��������
					}
					else	{
						B_Say(self,other,"$GOODKILL_F");	// �������, ��� ��� �������� �� ��������
					};
				};
			}
			// ���� �� ����
			else 
			{
				if (other.aivar[AIV_Gender] == MALE)	{
					B_Say(self,other,"$ENEMYKILLED");	// �������, ��� �� �������� ������
				}
				else	{
					B_Say(self,other,"$ENEMYKILLED_F");	// �������, ��� ��� ��������� ������
				};
			};
		}
		// ���� �� ������
		else 
		{
			// ���� � � ������� ��
			if(self.aivar[AIV_PARTYMEMBER] == TRUE)
			{
				// � ������������ 85% ����������� �� �����,
				// ����� �������, ����� �� - ������ (��� ��� ����������� ����������)
				rnd = Hlp_Random(100);
				if((rnd >= 15) && (other.guild != GIL_DRAGON))
				{
					return; // �� ��������������
				};
			};
			
			// ���� ��� ���� �� ��
			if(other.aivar[AIV_KilledByPlayer] == FALSE)
			{
				// � ���� ��� ����� - 9 (���� ������ �����)
				if(self.voice == 9)
				{
					// � ������ ������������ ������ ���� �� ���� �� ������ ������ �������
					rnd = Hlp_Random(100);
					if(rnd < 50)
					{
						B_Say(self,other,"$ADDON_MONSTERKILLED");
					}
					else
					{
						B_Say(self,other,"$ADDON_MONSTERKILLED2");
					};
				}
				// ��� ���� ��� ����� - 12 (���� ������ �����)
				else if(self.voice == 12)
				{
					B_Say(self,other,"$ADDON_MONSTERKILLED"); // ������������ ������ ������� (�����)
				}
				else // ��� ���� ��������� �������
				{
					B_Say(self,other,"$MONSTERKILLED"); // ������������ ������ ������� (�������)
				};
			}
			else // ���� ��� (�������) ���� ��
			{
				B_Say(self,other,"$GOODMONSTERKILL");
			};
		};
		return;  // ������ ������� ������������
	};
	
	// �� ���
	if(self.aivar[AIV_ATTACKREASON] == AR_Theft)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$THIEFDOWN");			//�������, ���� ������ �� �������
		}
		else	{
			B_Say(self,other,"$THIEFDOWN_F");			//�������, ���� ������ �� ��������
		};
		return;  // ������ ������� ������������
	};
	
	// �� �������������� ����� �������� (���� � ������)
	if(self.aivar[AIV_ATTACKREASON] == AR_UseMob)
	{
		B_Say(self,other,"$RUMFUMMLERDOWN");	//�������, ���� ������ ���� ��� ����
		return;  // ������ ������� ������������
	};
	
	// �� ���� ����
	if(self.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
	{
		// ���� �� �������
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			B_Say(self,other,"$SHEEPATTACKERDOWN");	//�������, ���� �� ������ ����
		}
		else // ���� �� ������
		{
			B_Say(self,other,"$MONSTERKILLED");		//������������ ������ �������
		};
		return;  // ������ ������� ������������
	};
	
	// ��������
	if(self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	{
		// ���� �� �� �����
		if(!Npc_IsDead(other))
		{
			// � � �������� � ���
			if(self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID(other))
			{
				B_Say(self,other,"$KILLMURDERER");	//�������, ��� ������ ������ �������
			}
			else
			{
				if (other.aivar[AIV_Gender] == MALE)	{
					B_Say(self,other,"$GOODKILL");	// �������, ��� �� ������� �� ��������
				}
				else	{
					B_Say(self,other,"$GOODKILL_F");	// �������, ��� ��� �������� �� ��������
				};
			};
		}
		else // ���� �� �����
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$ENEMYKILLED");	// �������, ��� �� �������� ������
			}
			else	{
				B_Say(self,other,"$ENEMYKILLED_F");	// �������, ��� ��� ��������� ������
			};
		};
		return;  // ������ ������� ������������
	};
	
	// ������ ����� �� ��������
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterVsHuman)
	{
		// ���� ��� ����� 9 ��� 12 (���� ������ �����)
		if((self.voice == 9) || (self.voice == 12))
		{
			B_Say(self,other,"$ADDON_MONSTERKILLED");	//������������, ��� ������ ���� (�����)
		}
		else
		{
			B_Say(self,other,"$MONSTERKILLED");		//������������, ��� ������ ���� (�������)
		};
		return;  // ������ ������� ������������
	};
	
	// ������ ����������� � �������
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
	{
		B_Say(self,other,"$STUPIDBEASTKILLED");		//����������������� ���������� ����������� �������
		return;
	};
	
	// �� ������ �����
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$NEVERHITMEAGAIN");	//�������, ���� ������ ��� �� �����
		}
		else	{
			B_Say(self,other,"$NEVERHITMEAGAIN_F");	//�������, ���� ������ ��� �� ������
		};
		return;
	};
	
	// ������ �������
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		B_Say(self,other,"$YOUBETTERSHOULDHAVELISTENED");	//�������,��� ������ �����������
		return;
	};
	
	// � ��������� ������������ ����� �� ���� (��� ������ ��� ��������)
	if((self.aivar[AIV_ATTACKREASON] == AR_ClearRoom) || (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom))
	{
		// ���� ��� ��������� ���� ��� ������������� �������
		if(C_NpcIsBotheredByPlayerRoomGuild(self) || (C_GetPlayerPortalGuild() == GIL_PUBLIC))
		{
			B_Say(self,other,"$GETUPANDBEGONE");		//������, ���� ������� � ��������
		}
		else
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$NEVERENTERROOMAGAIN");	//�������, ���� ������ ���� �� ��������
			}
			else	{
				B_Say(self,other,"$NEVERENTERROOMAGAIN_F");	//�������, ���� ������ ���� �� ���������
			};
		};
		return;
	};
	
	// �� ����� �� ���������, ������ � ������� ���������
	if(self.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$NEVERENTERROOMAGAIN");	//�������, ���� ������ ���� �� ��������
		}
		else	{
			B_Say(self,other,"$NEVERENTERROOMAGAIN_F");	//�������, ���� ������ ���� �� ���������
		};
		return;
	};
	
	// � ��������, ������� ������������ ���������
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	{
		if (other.aivar[AIV_Gender] == MALE)	{
			B_Say(self,other,"$KILLENEMY");	// �������, ��� � ��� ����
		}
		else	{
			B_Say(self,other,"$KILLENEMY_F");	// �������, ��� � �� ����
		};
		return;
	};
	
	// � ��������, �������  ������������ �����
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
	{
		// ����� �������, ����� �� ������� 
		if((other.guild == GIL_SLD))
		{
		}
		else
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				B_Say(self,other,"$THEREISNOFIGHTINGHERE");	//�������, ��� ����� ����� ���������
			}
			else	{
				B_Say(self,other,"$THEREISNOFIGHTINGHERE_F");	//�������, ��� ����� ����� ���������
			};
		};
		return;
	};
	
	// � ��������, ������� ������ ����
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)
	{
		B_Say(self,other,"$RUMFUMMLERDOWN");	//�������, ���� �� ��������� ����
		return;
	};
};

