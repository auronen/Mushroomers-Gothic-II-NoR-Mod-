/**************************************************************************

							������ AIVAR

  ������ �������, ������������ aivar � ��������� ������� � �.�.
  
***************************************************************************/


// ����� �������� ��������������, ���� ��� ���������� (������ ��������)
func void B_GuardPassageStatusReset(var C_NPC npc)
{
	if (npc.aivar[AIV_Guardpassage_Status] > GP_NONE)
	{
		npc.aivar[AIV_Guardpassage_Status] = GP_NONE;
	};
};

// ���������� �������� �������������� (���� ������ ��������)
func void B_GuardPassageStatusUp(var C_NPC npc)
{
	if (npc.aivar[AIV_Guardpassage_Status] >= GP_NONE)
	{
		npc.aivar[AIV_Guardpassage_Status] += 1;
	};
};
