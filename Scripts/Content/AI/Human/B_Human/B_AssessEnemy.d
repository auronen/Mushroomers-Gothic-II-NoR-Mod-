/**************************************************************************

							���������� �����
 
  �������� self (�) ������� ����� other (��).

  B_AssessEnemy() ���������� TRUE, ���� � ������� � �����, ���� ��� - FALSE.
���������� ��� �������� ���������� PERC_ASSESSENEMY � �� ��. ��������.

  ������� ���������: ������� �� �����.

  ������������: �� ���������� ������ ����� �� ��������

***************************************************************************/

func int B_AssessEnemy()
{
	//���������� ���������� ����������
	var C_Npc pcl;	//��������� ������
	var C_Npc mgo;	//���������� �����
	var C_Npc lar;	//����
	
	/* DEBUG INFO
	var string txt;
	//*/
	
	//�� ��������, ���� ----------------------------------------------------
	
	// �� ��������� (������)
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		/* DEBUG INFO
		txt = "No attack - PC_Levelinspektor.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	// ���� �� ��� ���������
	if(((!Npc_IsPlayer(other)) && (other.guild < GIL_SEPERATOR_HUM) // ���� - �������, �� �� ��
		&& (HasFlags(self.aivar[AIV_Temper] | other.aivar[AIV_Temper], TEMPER_NoFightParker))) // � ���� �� ��� - ��������,
		|| ((other.guild > GIL_SEPERATOR_HUM) && HasFlags(other.aivar[AIV_Temper], TEMPER_NoFightParker))) // ��� ���� - ���������� ������
	{
		/* DEBUG INFO
		txt = "No attack - NoFightParker.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	// ���� �� ��� ��������
	if (HasFlags(self.aivar[AIV_Behaviour] | other.aivar[AIV_Behaviour], BEHAV_Hidden)
		 && (Npc_GetDistToNpc(self,other) > 100))	// �� � ����� �������� ���������� ��� �� �������
	{
		return FALSE;
	};
	
	// �� ���������
	if (HasFlags(other.aivar[AIV_Behaviour], BEHAV_Invisible))
	{
		return FALSE;
	};
	
	// ��� ������ ������������ ������
	if (HasFlags(other.aivar[AIV_IgnoreFlags], IGNORE_Enemy))
	{
		return FALSE;
	};
	
	// �� ������ ��� ������ ��� � ��� ������-���� � ����, � � �� ���� ���� �����
	if(!C_WantToFollowInWater(self, other))
	{
		/* DEBUG INFO
		txt = "No attack - no water, please!";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
		
	// �� ������� ������
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		/* DEBUG INFO
		txt = "No attack - too high.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	/* �� ����������� � ������ �� */
	if(self.aivar[AIV_PARTYMEMBER] == TRUE) // � � ������� � ��, �
	{
		if(Npc_GetDistToNpc(self,other) > 1500) // �� (����) ������ 15�
		{
			return FALSE;
		};
		if(!Npc_CanSeeNpc(self,other)) // � ��� (�����) �� ����
		{
			return FALSE;
		};
	};
	
	// ���� ������ �� ���������
	if(((self.aivar[AIV_EnemyOverride] == TRUE) || (other.aivar[AIV_EnemyOverride] == TRUE)) //��� ��� ��� ��������� �������
		&& (other.guild < GIL_SEPERATOR_HUM)) //� �� �������
	{
		/* DEBUG INFO
		txt = "No attack - EnemyOverride.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	// �� ����� � �� ���� //PB: ���������, �� ������ ������ ������� �� ��-�� ����������
	if(C_NpcGetAttitude(self,other) != ATT_HOSTILE)
	{
		/* DEBUG INFO
		txt = "No attack - no enemy.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	// � ������� ������ //NS: ���� �� �������� �� ��� ����� ���������������!
	if(C_NpcIsGateGuard(self))
	{
		/* DEBUG INFO
		txt = "No attack - I'm gate guard.";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	// �� ��, � � ��� ����
	if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
	{
		/* DEBUG INFO
		txt = "No attack - this is my friend Hero!";
		PrintSelfVsOther(txt);
		//*/
		return FALSE;
	};
	
	//�����, ����� ������?
	//PrintSelfVsOther("Assess Enemy - Want to flee?");
	if (C_WantToFlee(self, other))	{
		if (!Npc_IsInState(self,ZS_Flee))	{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Flee,0,"");
		};
		return TRUE;
	};

	//------------------------------------------------------------------------
	
	/* �������� ������ ��������� � �� */
	
	// �� �� �� ���������� ��������
	if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
	{
		/* DEBUG INFO
		txt = "Guilds are not hostile...";
		PrintSelfVsOther(txt);
		//*/
		//�� � ������ ������ - �� ������� �����
		if((C_NpcGetAttitude(self,other) == ATT_HOSTILE)						// �� �� ��� ������ ���� (������ ��� ��)
			// && Npc_IsPlayer(other) 										// � �� �� (����������������� ���������)			
			&& ((Npc_GetStateTime(self) > 2)								// � � ��� ������ ����� 2���.
				|| Npc_IsInState(self,ZS_ObservePlayer))	 					//��� � �������� �� ��
			&& (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))		// � ���������� ����� ���� ������ ��������
		{ 
			//���������� ������� �� ���� �� ��� �� �������, ��� � �� �����
			B_Attack(self,other,self.aivar[AIV_LastPlayerAR],0); 
			return TRUE;
		}
		// � ��������� ������ - �� �������� ��� ���������
		else
		{
			return FALSE;
		};
	};
	
	/* DEBUG INFO
	txt = "Attack!!!";
	PrintSelfvsOther(txt);
	//*/
	
	// �� ���� ��������� �������
	B_Attack(self,other,AR_GuildEnemy,0); //���������� ������� �� ���� ��� �� ������������� ���������� �������
	return TRUE;
};




