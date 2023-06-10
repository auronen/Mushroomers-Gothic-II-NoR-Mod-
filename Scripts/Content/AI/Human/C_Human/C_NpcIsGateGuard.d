/**************************************************************************

  ����� �� slf ������ ����� (�������): 
    TRUE - �������� ����������, FALSE - ���.
 
***************************************************************************/

func int C_NpcIsGateGuard(var C_Npc slf)
{
	// ���� � ��������� ������ �������
	if(Npc_IsInState(slf,ZS_Guard_Passage))
	{
		return TRUE;		// ��������
	};
	// ��� ���� ���������� AIV_Guardpassage_Status
	if(slf.aivar[AIV_Guardpassage_Status] != GP_NONE)
	{
		return TRUE;		// ��������
	};
	// �����
	return FALSE;		// �� ��������
};

