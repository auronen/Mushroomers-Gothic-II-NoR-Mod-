/**************************************************************************

int C_NpcBelongsTox	(slf)
  ���������, ����������� �� slf � ������ x: TRUE - �����������,
FALSE - �� �����������. ������� �� ������� � ���� slf.

int C_GetNpcLocation	(slf)
  ���������� ������ ������, � ������� ����������� slf: LOC_x.
 
***************************************************************************/

// ������ ������ ==========================================================

func int C_NpcBelongsToOldCamp(var C_Npc slf)
{
	// ���� ��� �������� ��� �������� �� ������� ������
	if((slf.npcType == NPCTYPE_OCMAIN) || (slf.npcType == NPCTYPE_OCAMBIENT))
	{
		// � ��� ���������, ��������� ��� �������
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE; // �� �����������
		};
	};
	// ����� �� �����������
	return FALSE;
};

// ����� ===================================================================

func int C_NpcBelongsToCity(var C_Npc slf)
{
	// ���� �� �� ������� ������
	if(!C_NpcBelongsToOldCamp(slf))
	{
		// � ��� ���������, ��������� ��� �������
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE; // �� �����������
		};
	};
	// ����� �� �����������
	return FALSE;
};

// ��������� ================================================================

func int C_NpcBelongsToMonastery(var C_Npc slf)
{
	// ���� ��� ��� ���� ��� ���������
	if((slf.guild == GIL_KDF) || (slf.guild == GIL_NOV))
	{
		if (!HasFlags(slf.aivar[AIV_StoryFlags], STORY_OutOfCamp))	{	//�� ������� ���������
			return TRUE; // �� �����������
		};
	};
	// ����� �� �����������
	return FALSE;
};

// ����� =====================================================================

func int C_NpcBelongsToFarm(var C_Npc slf)
{
	// ���� ��� ���������� ��� �������
	if((slf.guild == GIL_BAU) || (slf.guild == GIL_SLD))
	{
		return TRUE; // �� �����������
	};
	// ����� �� �����������
	return FALSE;
};

// ������ �������� ===========================================================

func int C_NpcBelongsToBL(var C_Npc slf)
{
	// ���� ��� �������� ��� �������� �� ������ ��������
	if((slf.npcType == NPCTYPE_BL_AMBIENT) || (slf.npcType == NPCTYPE_BL_MAIN))
	{
		return TRUE; // �� �����������
	};
	// ����� �� �����������
	return FALSE;
};

// ������ ������ ===========================================================

func int C_GetNpcLocation (var C_Npc slf)
{
	// �������� �������������� � ������� ������
	if (C_NpcBelongsToOldCamp(slf))
	{
		return LOC_OLDCAMP;
	}
	else if (C_NpcBelongsToCity(slf))
	{
		return LOC_CITY;
	}
	else if (C_NpcBelongsToMonastery(slf))
	{
		return LOC_MONASTERY;
	}
	else if (C_NpcBelongsToFarm(slf))
	{
		return LOC_FARM;
	}
	else if (C_NpcBelongsToBL(slf))
	{
		return LOC_BL;
	};
	// ����� - �� � ������
	return LOC_NONE;	
};
