/**************************************************************************

						���������� �����������

  �������� self (�) ������������, ��� other (��) ������ ��� ������.
  
  �������:

  B_AssessDamage() ������������ ���������� PERC_ASSESSDAMAGE � ����������
� ��. ��������. �������� ���������� ���������� �����.

  ������� �������: ������� �� ������������.
  
  ������ �� � �������� �� �������� ��������, ���� �� �� ����.
  �� ����� �������� ����� ������� ������ �� ���������.
  ���� � ���� ������ ���� ����� - �� �����������.
  
***************************************************************************/


func void B_AssessDamage()
{
	/* DEBUG INFO
	if (!Hlp_IsValidNpc(other))
	{
		PrintSelf("No damager");
		return;
	};
	//*/
	
	B_OnDamage();
	
	// �������� ���� � �����
	//Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	
	// � ������� ---------------------------------------------------------
	
	//���� � �������, � ������� ��������������� �����������
	if(B_GhostSpecialDamage(other,self))
	{
		return; //������ ������ �� ����
	};
	
	//� �� ������� -----v
	
	// ����� ---------------------------------------------------------------
	
	//���� ����������� ��������, ����� �������� �� ����� ��� ���������
	if((self.aivar[AIV_ArenaFight] == AF_AFTER) && Npc_IsPlayer(other))
	{ 
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE; //��������� ������������ ��������� ��
		//���������� ���������� �� ������
		B_AssessTalk();
		if(self.aivar[AIV_NpcStartedTalk] == TRUE)	{
			return;
		};
	};
	
	//�������� ��������� � �����!
	if((self.aivar[AIV_ArenaFight] == AF_RUNNING) && Npc_IsPlayer(other))
	{ 
		if (Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))	{
			self.aivar[AIV_ArenaFight] = AF_WRONG_WEAPON;
			//���������� ���������� �� ������
			B_AssessTalk();
			if(self.aivar[AIV_NpcStartedTalk] == TRUE)	{
				self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
				return;
			};
		};
	};
	
	// ���� � �� ���� �������
	if HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_NoDamageReaction)
	{
		return;	// ������ �� ������
	};
	
	//�����, ����� ������?
	PrintSelfVsOther("Assess Damage - Want to flee?");
	if (C_WantToFlee(self, other))	{
		if (!Npc_IsInState(self,ZS_Flee))	{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Flee,0,"");
		};
		return;
	};
	
	// � ����� --------------------------------------------------------------
	
	if(Npc_IsInState(self,ZS_Attack)) // � � ������ ������
	{ 		
		/* ������� ��� ������� */
		if(Npc_IsPlayer(other)			//���� ������ �� 
			&& ((self.npcType == NPCTYPE_FRIEND) //� ���� � ���� �� 
				|| (self.aivar[AIV_PARTYMEMBER] == TRUE))) //��� � � �� � ����� �������
		{ 
			return; //������ �� ������
		};
		
		/* �������� ��������� �� �� ������ ����� ������� ��������� */
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET]) //���� ����������� ����� �� ���, ���� � ��� ����� ����
		{ 
			if((self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other)) || (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)))
			{
				//��������� �������
				if (other.guild < GIL_SEPERATOR_HUM)
				{
					// ��� �����
					if (Wld_GetGuildAttitude(self.guild, other.guild) != ATT_HOSTILE)
					{
						// ���� ������� �� �����������
						self.aivar[AIV_ATTACKREASON] = AR_ReactToDamage;
					}
					else
					{
						// ���� �� �����
						self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
					};
					// ��� ������ ����������, ������ ����
					if (Npc_IsPlayer(other))
					{
						// �� ����� �� ���� ������� �������, ��� ������� ����� ��� ���������
						if ((self.aivar[AIV_LastPlayerAR] == AR_NONE)
							|| (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_CANCEL))
						//�.�. �����, ���� �����-�� ����� ������ � ��, �� �� ������
						{
							self.aivar[AIV_LastPlayerAR] = self.aivar[AIV_ATTACKREASON];
						}
						// � ���� ������� ���� - ������������ � ���
						else
						{
							self.aivar[AIV_ATTACKREASON] = self.aivar[AIV_LastPlayerAR];
						};
					};
				}
				else
				{
					// ��� ��������
					self.aivar[AIV_ATTACKREASON] = AR_MonsterVsHuman;
				};
				Npc_SetTarget(self,other);
			}
			//� ��������� ������ (�� ����� �� ��� ������ ���)
			else
			{ 
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID(other); //���������, ��� �� ���� �����
			};
		};
		return; //��������� � �����
	};
	
	// � ��� �� ������ ---v
	
	// ���� � ����������� �� �����
	if(B_AssessEnemy())
	{ 
		return; // �� ������ ������ �� ����
	};

	// ������ �� ����� ---v
	
	//���� �������� �� ����� � ����� �� ��� �������
	if(!Npc_IsPlayer(other) && (other.aivar[AIV_ATTACKREASON] == AR_NONE))
	{ 
		B_Attack(self,other,AR_NONE,0); //���� ������� ��� ������� � ��� ��������
		return; //�����
	};
	
	// ����� �� ��� � ���� ��� ����� ---v
	
	// ���� �� ������� ���
	if(Npc_IsInFightMode(other,FMODE_MELEE)		//���� ��������� ����� � ��� �� ������� 
		|| Npc_IsInFightMode(other,FMODE_FIST) 	//��� � ������� �������� ���
		|| Npc_IsInFightMode(other,FMODE_NONE))	//��� �� ����� � ���
	{ 
		//� �������� - ��� ���� ��
		if((C_NpcGetAttitude(self,other) == ATT_FRIENDLY) || ((self.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(other)))
		{ 
			//� � ��� �� ����������� �� ��������� 
			if(!Npc_IsInState(self,ZS_ReactToDamage))
			{ 
				// ����� ������ �������� � ����������
				Npc_ClearAIQueue(self);		
				B_ClearPerceptions(self);	
				// ������� � ������ ��������
				AI_StartState(self,ZS_ReactToDamage,0,"");	//����������� ������� �� �����������, �� ����� � �����
				return; //�����
			};
		};
	};
	
	// �� ���� ��������� �������
	
	//������� �� ������������ �� �������� �������
	B_Attack(self,other,AR_ReactToDamage,0);	//����������� ����� � ����� �� �����������
};


