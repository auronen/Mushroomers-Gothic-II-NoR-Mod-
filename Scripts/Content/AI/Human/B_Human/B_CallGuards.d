/**************************************************************************

							������� ������

  B_CallGuards	()
  �������� self (�) ����� �� ������ ������ ��-�� �������� other (��). 
���������� ������ � ZS_Attack, ������� ������� ������ ������ = ������� 
��������� AIV_ATTACKREASON.
 
  C_WantToCallGuards	(slf) 
  ���������, � ����� �� �������� slf ����� ������. ���������� ������ 
� B_CallGuards.
  
  ������ ����� ��������, ���������, ��������, ��������, ���������, ����
������ ��� �� � ������� � ��.
  ���� C_WantToCallGuards ������� TRUE, ��� ��� �� ������, ��� �������� 
����� ������� ������ (�����������, �� �� ����������� �������). ������ �����
�� ����� ������.
  ���� ������ �������, ���������� �������� ���������� � ���� ��������.
  ���� ��������� ��� ���� ���� "�������!", � ��� ������ "������!".

  
***************************************************************************/

// �������� ������ ������
func int C_WantToCallGuards(var C_Npc slf)
{
	// ������� ������ ����
	// � �� � ������� ��
	if(slf.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		// � � 
		if((slf.guild == GIL_PAL)		// �������
			|| (slf.guild == GIL_MIL)	// ���������
			|| (slf.guild == GIL_VLK)	// ���������
			|| (slf.guild == GIL_SLD)	// �������
			|| (slf.guild == GIL_BAU) || (slf.guild == GIL_BAU2))	// ����������
		{
			return TRUE;
		};
	};
	// � ��������� ������� - �� ���� ����� ������ (��, �����, ����)
	return FALSE;
};

// ========================================================================
func void B_SayAlarm()
{
	if((self.guild == GIL_PAL)		// �������
		|| (self.guild == GIL_MIL)	// ���������
		|| (self.guild == GIL_VLK)	// ���������
		|| (self.guild == GIL_SLD)	// �������
		)
	{
		B_Say_Overlay(self,other,"$ALARM");
	}
	else {
		B_Say_Overlay(self,other,"$HELP");
	};
};
func void B_SayGuards()
{
	if((self.guild == GIL_PAL)		// �������
		|| (self.guild == GIL_MIL)	// ���������
		|| (self.guild == GIL_VLK)	// ���������
		|| (self.guild == GIL_SLD)	// �������
		)
	{
		B_Say_Overlay(self,other,"$GUARDS");
	}
	else {
		B_Say_Overlay(self,other,"$HELP");
	};
};


// ����� ������
func void B_CallGuards()
{
	
	// ���������, ���� �� ��� ����� ������
	if(!C_WantToCallGuards(self))
	{
		return;
	};
	
	// ���� ������� ������ -----v
	
	// ���� � ��� - ��������� �� ������ ��������
	if((self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)		// ����� �����
		|| (self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)		// ��� ����� ���������� �����
		|| (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)	// ��� ����� ������� ����
		|| (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom))	// ��� ����� ������� ��������� �����
	{
		// ������ ����� "�������!"
		B_SayAlarm();
		return; //������ ������ �� ������
	};
	
	// �� �������� ������ -------------------------------------------------
	
	// ��������� ������� ��� ��������
	if((self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
		|| (self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman))
	{ // ��
		// ���� � - ���������, ������� ��� ������� (�.�. ��� ��������)
		if((self.guild == GIL_MIL) || (self.guild == GIL_PAL) || (self.guild == GIL_SLD))
		{
			// ������ ����� "�������!"
			B_SayAlarm();
			// ��� ������ �������� ��� �����
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		}
		else // ��� ������ �������
		// ���� � �� ������
		if(!C_NpcIsToughGuy(self))
		{
			// ������ ����� "������!"
			B_SayGuards();
			// ��� ������ �������� ��� �����
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return; //������ ������ �� ������
	};
	
	// ��������� � �������� ����
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	{
		// ������ ����� "�������!"
		B_SayAlarm();
		// ��� ������ �������� ��� �����
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return; //������ ������ �� ������
	};
	
	// ����� ��� �� ������� (�� ���� � ���-�� ������)
	if((self.aivar[AIV_ATTACKREASON] == AR_Theft) || (self.aivar[AIV_ATTACKREASON] == AR_UseMob))
	{
		// � � �� ������ ������
		if(!C_NpcIsToughGuy(self))
		{
			// ������ ����� "������!"
			B_SayGuards();
			// ��� ������ �������� ��� �����
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return; //������ ������ �� ������
	};
	
	// ������ �������
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		// � � �� ������ ������
		if(!C_NpcIsToughGuy(self))
		{
			// ������ ����� "������!"
			B_SayGuards();
			// ��� ������ �������� ��� �����
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return; //������ ������ �� ������
	};
	
	// ����� ��������� ��������� �����
	if(self.aivar[AIV_ATTACKREASON] == AR_ClearRoom)
	{
		// ���� � - ���������, ������� ��� ������� (�.�. ��� ��������)
		if((self.guild == GIL_MIL) || (self.guild == GIL_PAL) || (self.guild == GIL_SLD))
		{
			// ������ ����� "�������!"
			B_SayAlarm();
			// ��� ������ �������� ��� �����
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		}
		else // ��� ������ �������
		// ���� � �� ������
		if(!C_NpcIsToughGuy(self))
		{
			// ������ ����� "������!"
			B_SayGuards();
			// ��� ������ �������� ��� �����
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return; //������ ������ �� ������
	};
};

