/**************************************************************************

					����������� ��������� ������������ ��

  ���� ����������� ���������� ��� ����������� ���������. ��� ����������
������������ ����������� ������� � ��������� �������� ������� � ������������. 
  ��� ��������� ������� ����������
C_GetPetzcounter, B_SetPetzcounter, B_ChangePetzCounter �
B_GrantAbsolution; ��������� �� �������.


�����������:

B_GetPlayerCrime	(slf)

  ���������� ��� ������������ �� (CRIME_x), ������� ����� �������� slf (�).
������� �� AIV_NpcSawPlayerCommit.
  ���� �������� ������ ������������ (����� � �������� ����) - 2 ���.
���� ������ ������, ���������, ��� ������������ �� ����. ����� � ��������
�� ����� ����� ��������. ���� �� ������� ���� ����, ������������ ���������.
  
B_DeletePetzCrime	(slf)

  �������� slf ������� � �� ��������� � ������������, ���������� 
� AIV_NpcSawPlayerCommit. ����������� ������� ������������ ��� ������,
� �������� ����������� slf.
  ��������� ��� ���������� ���������� ��� (��������), ������ slf � �� ������,
� ����� ����� ���������� ������������ �� ����� ���������. �.�. ���� slf �����,
��� �� ��������, ��������, ����� � ��������, ����� ��������� ������ ��������.

B_GrantAbsolution	(location)

  �� �������� �������� ���� ������������ � ������ location.
  ��������� �� ����������, � ��� �������� ������������ ������������.
  �������� ����� ��������� ������������ �� ���� �������, ����� ������ 
�������� (LOC_ALL).

B_GetTotalPetzCounter	(slf)

  ���������� ����� ���������� ������������ �� � ������ slf.
  
B_GetCurrentAbsolutionLevel	(slf)

  ���������� ������ ������ ���������� ������������ �� � ������ slf.
  ������������ � ��������, ����� ������ �����������, ���������������
������������� ���������� ��.

B_AddPetzCrime	(slf,	crime)

  �������� slf �������, ��� �� �������� ������������ crime. ������������� 
������� ������������ ��� ������, � �������� ����������� slf.
 
***************************************************************************/

// �������� ������������ �� ������� =======================================
// 0-��� ������� ������� �� �����������, ��� CRIME_NONE

// ������
func int C_GetPetzcounter(var int location, var int Crime)
{
	if ((Crime > 0) && (Crime < CRIME_COUNT))
	{
		var int cnt;	cnt = 0;
		// ��������� ������
		if (location == LOC_OLDCAMP)		//������ ������
		{
			if (crime == 1)	{return PETZCOUNTER_OldCamp[1];}	else
			if (crime == 2)	{return PETZCOUNTER_OldCamp[2];}	else
			if (crime == 3)	{return PETZCOUNTER_OldCamp[3];}	else
			if (crime == 4)	{return PETZCOUNTER_OldCamp[4];};
		}
		else if (location == LOC_CITY)		//�����
		{
			if (crime == 1)	{return PETZCOUNTER_City[1];}	else
			if (crime == 2)	{return PETZCOUNTER_City[2];}	else
			if (crime == 3)	{return PETZCOUNTER_City[3];}	else
			if (crime == 4)	{return PETZCOUNTER_City[4];};
		}
		else if (location == LOC_MONASTERY)	//���������
		{
			if (crime == 1)	{return PETZCOUNTER_Monastery[1];}	else
			if (crime == 2)	{return PETZCOUNTER_Monastery[2];}	else
			if (crime == 3)	{return PETZCOUNTER_Monastery[3];}	else
			if (crime == 4)	{return PETZCOUNTER_Monastery[4];};
		}
		else if (location == LOC_FARM)		//�����
		{
			if (crime == 1)	{return PETZCOUNTER_Farm[1];}	else
			if (crime == 2)	{return PETZCOUNTER_Farm[2];}	else
			if (crime == 3)	{return PETZCOUNTER_Farm[3];}	else
			if (crime == 4)	{return PETZCOUNTER_Farm[4];};
		}
		else if (location == LOC_BL)		//������ ��������
		{
			if (crime == 1)	{return PETZCOUNTER_BL[1];}	else
			if (crime == 2)	{return PETZCOUNTER_BL[2];}	else
			if (crime == 3)	{return PETZCOUNTER_BL[3];}	else
			if (crime == 4)	{return PETZCOUNTER_BL[4];};
		}
		else if (location == LOC_ALL)		//��� ������, ����� �����������
		{
			return C_GetPetzcounter(LOC_OLDCAMP,Crime) + C_GetPetzcounter(LOC_CITY,Crime)
				+ C_GetPetzcounter(LOC_MONASTERY,Crime) + C_GetPetzcounter(LOC_FARM,Crime);
		};
		// ����� - ��� ������ ������
		return cnt;
	};
	// ����� - ��� ������ ������������
	return 0;	
};

// ������
func void B_SetPetzcounter(var int location, var int Crime, var int Value)
{
	if ((Crime > 0) && (Crime < CRIME_COUNT))
	{
		// ��������� ������
		if ((location == LOC_OLDCAMP) || (location == LOC_ALL))		//������ ������
		{
			if (crime == 1)	{PETZCOUNTER_OldCamp[1] = value;}	else
			if (crime == 2)	{PETZCOUNTER_OldCamp[2] = value;}	else
			if (crime == 3)	{PETZCOUNTER_OldCamp[3] = value;}	else
			if (crime == 4)	{PETZCOUNTER_OldCamp[4] = value;};
		}
		else if ((location == LOC_CITY) || (location == LOC_ALL))		//�����
		{
			if (crime == 1)	{PETZCOUNTER_City[1] = value;}	else
			if (crime == 2)	{PETZCOUNTER_City[2] = value;}	else
			if (crime == 3)	{PETZCOUNTER_City[3] = value;}	else
			if (crime == 4)	{PETZCOUNTER_City[4] = value;};
		}
		else if ((location == LOC_MONASTERY) || (location == LOC_ALL))	//���������
		{
			if (crime == 1)	{PETZCOUNTER_Monastery[1] = value;}	else
			if (crime == 2)	{PETZCOUNTER_Monastery[2] = value;}	else
			if (crime == 3)	{PETZCOUNTER_Monastery[3] = value;}	else
			if (crime == 4)	{PETZCOUNTER_Monastery[4] = value;};
		}
		else if ((location == LOC_FARM) || (location == LOC_ALL))		//�����
		{
			if (crime == 1)	{PETZCOUNTER_Farm[1] = value;}	else
			if (crime == 2)	{PETZCOUNTER_Farm[2] = value;}	else
			if (crime == 3)	{PETZCOUNTER_Farm[3] = value;}	else
			if (crime == 4)	{PETZCOUNTER_Farm[4] = value;};
		}
		else if ((location == LOC_BL) || (location == LOC_ALL))		//������ ��������
		{
			if (crime == 1)	{PETZCOUNTER_BL[1] = value;}	else
			if (crime == 2)	{PETZCOUNTER_BL[2] = value;}	else
			if (crime == 3)	{PETZCOUNTER_BL[3] = value;}	else
			if (crime == 4)	{PETZCOUNTER_BL[4] = value;};
		};
	};
};

// ��������� �� � ������� ������
func int B_GetCurrentAbsolutionLevel(var C_Npc slf)
{
	if(C_NpcBelongsToOldCamp(slf))		 // � ������ ������
	{
		return ABSOLUTIONLEVEL_OldCamp;
	};
	if(C_NpcBelongsToCity(slf))			// � ������
	{
		return ABSOLUTIONLEVEL_City;
	};
	if(C_NpcBelongsToMonastery(slf))	// � ���������
	{
		return ABSOLUTIONLEVEL_Monastery;
	};
	if(C_NpcBelongsToFarm(slf))			// �� �����
	{
		return ABSOLUTIONLEVEL_Farm;
	};
	if(C_NpcBelongsToBL(slf))			// � ������ ��������
	{
		return ABSOLUTIONLEVEL_BL;
	};
	return 0;
};

// ========================================================

// ����� ���� ��������� ������������ � ������
func void B_ResetPetzcounters(var int location)
{
	B_SetPetzcounter(location, 0, 0);
	B_SetPetzcounter(location, 1, 0);
	B_SetPetzcounter(location, 2, 0);
	B_SetPetzcounter(location, 3, 0);
	B_SetPetzcounter(location, 4, 0);
};

// ������������ ����� ���� ������������ � ������
func int C_SumPetzcounters(var int location)
{
	var int Sum;	sum = 0;
	Sum = C_GetPetzcounter(Location, CRIME_MURDER) * 200 + C_GetPetzcounter(Location, CRIME_THEFT) * 50 
			+ C_GetPetzcounter(Location, CRIME_ATTACK) * 20 + C_GetPetzcounter(Location, CRIME_SHEEPKILLER) * 20; 
	return Sum;
};

// ����������� ============================================================

// ������� ����� � �� ������������
func int B_GetTotalPetzCounter(var C_Npc slf)
{
	var int Location;	Location = C_GetNpcLocation(slf);
	var int sum;
	sum = C_GetPetzcounter(Location, CRIME_MURDER) * 500 + C_GetPetzcounter(Location, CRIME_THEFT) * 100 
			+ C_GetPetzcounter(Location, CRIME_ATTACK) * 40 + C_GetPetzcounter(Location, CRIME_SHEEPKILLER) * 50;
	return sum;
};


// ����� ����� ������ ������������ � ���� �������
func int B_GetGreatestPetzCrime(var C_Npc slf)
{
	var int loc;	loc = C_GetNpcLocation(slf);
	if (C_GetPetzcounter(loc,4) > 0)	{return 4;}	else
	if (C_GetPetzcounter(loc,3) > 0)	{return 3;}	else
	if (C_GetPetzcounter(loc,2) > 0)	{return 2;}	else
	if (C_GetPetzcounter(loc,1) > 0)	{return 1;};
	return 0;
};

// ��������� ������������ ��
func int B_GetPlayerCrime(var C_Npc slf)
{
	// �������, ��� ������������ �� ����, ���� -----------------------------
	
	// �� ����������� � ������ ������������ (��������� ����������)
	if(slf.aivar[AIV_CrimeAbsolutionLevel] < B_GetCurrentAbsolutionLevel(slf))
	{
		//PB: ��� NPC, �� �� ������/���������/� ����� 
		// B_GetCurrentAbsolutionLevel ������ ���������� 0 � ��������� ����� �����
		//NS: ��� ������� ������ � ������ ������� ���������� ���� �������� 
		return CRIME_NONE;
	};
	
	// ���������� ����������� ������������
	if(slf.aivar[AIV_NpcSawPlayerCommit] <= CRIME_ATTACK)
	{
		// � ������ ������ 2 ����
		if(slf.aivar[AIV_NpcSawPlayerCommitDay] < (Wld_GetDay() - 2))
		{
			return CRIME_NONE;
		};
	};
	
	
	// �� ���� ��������� ������� -------------------------------------------
	
	// ��������� ��������� ������������, ����������� ��
	return slf.aivar[AIV_NpcSawPlayerCommit];
};

//��������� ������������ ������ ������, ���� �����
func int B_GetKnownPlayerCrime(var C_Npc slf)
{
	var int crime;	crime = B_GetPlayerCrime(slf);
	if (B_GetGreatestPetzCrime(slf) > crime)	{
		if (C_NpcBelongsToFarm(slf) || C_NpcBelongsToMonastery(slf) || (slf.guild == GIL_MIL)
			&& !HasFlags(slf.aivar[AIV_StoryFlags],STORY_OutOfCamp))	{
			crime = B_GetGreatestPetzCrime(slf);
		};
	};
	return crime;
};

// �������� �� ���
func void B_GrantAbsolution(var int location)
{
	// ���� �������� �������� ��� ������� ������ ��� ���� �������
	if((location == LOC_OLDCAMP) || (location == LOC_ALL))
	{
		// �������� ���������
		ABSOLUTIONLEVEL_OldCamp = ABSOLUTIONLEVEL_OldCamp + 1;
		// �������� �������� ������������
		B_ResetPetzcounters(LOC_OLDCAMP);
	};
	// ���������� ��� ������
	if((location == LOC_CITY) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_City = ABSOLUTIONLEVEL_City + 1;
		B_ResetPetzcounters(LOC_CITY);
	};
	// ���������� ��� ���������
	if((location == LOC_MONASTERY) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_Monastery = ABSOLUTIONLEVEL_Monastery + 1;
		B_ResetPetzcounters(LOC_MONASTERY);
	};
	// ���������� ��� �����
	if((location == LOC_FARM) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_Farm = ABSOLUTIONLEVEL_Farm + 1;
		B_ResetPetzcounters(LOC_FARM);
	};
	// ���������� ��� ������ �������� (����� �����������)
	if(location == LOC_BL)
	{
		ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
		B_ResetPetzcounters(LOC_BL);
	};
};




// �������� ������������
func void B_AddPetzCrime(var C_Npc slf,var int crime)
{  //��������� ������� �� ��������������� ������������ � ������ ���������
	
	if(C_NpcBelongsToOldCamp(slf)) //���� �������� �� ������� ������
	{
		if (crime == 1)	{PETZCOUNTER_OldCamp[1] +=1;}	else
		if (crime == 2)	{PETZCOUNTER_OldCamp[2] +=1;}	else
		if (crime == 3)	{PETZCOUNTER_OldCamp[3] +=1;}	else
		if (crime == 4)	{PETZCOUNTER_OldCamp[4] +=1;};
	};
	if(C_NpcBelongsToCity(slf)) //���������� ��� ������
	{
		if (crime == 1)	{PETZCOUNTER_City[1] +=1;}	else
		if (crime == 2)	{PETZCOUNTER_City[2] +=1;}	else
		if (crime == 3)	{PETZCOUNTER_City[3] +=1;}	else
		if (crime == 4)	{PETZCOUNTER_City[4] +=1;};
	};
	if(C_NpcBelongsToMonastery(slf)) //���������� ��� ���������
	{
		if (crime == 1)	{PETZCOUNTER_Monastery[1] +=1;}	else
		if (crime == 2)	{PETZCOUNTER_Monastery[2] +=1;}	else
		if (crime == 3)	{PETZCOUNTER_Monastery[3] +=1;}	else
		if (crime == 4)	{PETZCOUNTER_Monastery[4] +=1;};
	};
	if(C_NpcBelongsToFarm(slf)) //���������� ��� ����� �����
	{
		if (crime == 1)	{PETZCOUNTER_Farm[1] +=1;}	else
		if (crime == 2)	{PETZCOUNTER_Farm[2] +=1;}	else
		if (crime == 3)	{PETZCOUNTER_Farm[3] +=1;}	else
		if (crime == 4)	{PETZCOUNTER_Farm[4] +=1;};
	};
	if(C_NpcBelongsToBL(slf)) //���������� ��� ������ ��������, ������ ��� ����
	{
	//	if (crime == 1)	{PETZCOUNTER_BL[1] +=1;}	else
		if (crime == 2)	{PETZCOUNTER_BL[2] +=1;}	else
		if (crime == 3)	{PETZCOUNTER_BL[3] +=1;}	else
		if (crime == 4)	{PETZCOUNTER_BL[4] +=1;};
	};
};


// ����� � �� ���������
func void B_DeletePetzCrime(var C_Npc slf)
{
	var int crime;	crime = B_GetPlayerCrime(slf);
	if (Crime == CRIME_None) 	{return;};
	if(C_NpcBelongsToOldCamp(slf)) //���� �������� �� ������� ������
	{
		if (crime == 1)	{PETZCOUNTER_OldCamp[1] -=1;}	else
		if (crime == 2)	{PETZCOUNTER_OldCamp[2] -=1;}	else
		if (crime == 3)	{PETZCOUNTER_OldCamp[3] -=1;}	else
		if (crime == 4)	{PETZCOUNTER_OldCamp[4] -=1;};
	};
	if(C_NpcBelongsToCity(slf)) //���������� ��� ������
	{
		if (crime == 1)	{PETZCOUNTER_City[1] -=1;}	else
		if (crime == 2)	{PETZCOUNTER_City[2] -=1;}	else
		if (crime == 3)	{PETZCOUNTER_City[3] -=1;}	else
		if (crime == 4)	{PETZCOUNTER_City[4] -=1;};
	};
	if(C_NpcBelongsToMonastery(slf)) //���������� ��� ���������
	{
		if (crime == 1)	{PETZCOUNTER_Monastery[1] -=1;}	else
		if (crime == 2)	{PETZCOUNTER_Monastery[2] -=1;}	else
		if (crime == 3)	{PETZCOUNTER_Monastery[3] -=1;}	else
		if (crime == 4)	{PETZCOUNTER_Monastery[4] -=1;};
	};
	if(C_NpcBelongsToFarm(slf)) //���������� ��� ����� �����
	{
		if (crime == 1)	{PETZCOUNTER_Farm[1] -=1;}	else
		if (crime == 2)	{PETZCOUNTER_Farm[2] -=1;}	else
		if (crime == 3)	{PETZCOUNTER_Farm[3] -=1;}	else
		if (crime == 4)	{PETZCOUNTER_Farm[4] -=1;};
	};
	if(C_NpcBelongsToBL(slf)) //���������� ��� ������ ��������, ������ ��� ����
	{
		//if (crime == 1)	{PETZCOUNTER_BL[1] -=1;}	else
		if (crime == 2)	{PETZCOUNTER_BL[2] -=1;}	else
		if (crime == 3)	{PETZCOUNTER_BL[3] -=1;}	else
		if (crime == 4)	{PETZCOUNTER_BL[4] -=1;};
	};
};



