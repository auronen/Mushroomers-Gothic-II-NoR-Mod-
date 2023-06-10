/**************************************************************************

  int C_NpcHasAmbientNews	(slf)
  ���� �� � slf ������� �� ���������� ����: TRUE - ����, FALSE - ���.
 
***************************************************************************/

func int C_NpcHasAmbientNews(var C_Npc slf)
{
	// ��� ��������, ���� --------------------------------------------------
	
	// ���� ���������� ������ �� ��������������� ������
	if(HasFlags(slf.aivar[AIV_Temper], TEMPER_NewsOverride))
	{
		return FALSE;
	};
	
	// �� �� �������� ������������
	if(B_GetPlayerCrime(slf) == CRIME_NONE)
	{
		return FALSE;
	};
	
	// 
	return TRUE;
};


