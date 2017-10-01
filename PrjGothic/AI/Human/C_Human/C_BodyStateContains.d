/**************************************************************************

						�������� ��������� ����

  ���������, �������� �� �������� slf � ��������� bodystate.
  TRUE - ���������, FALSE - �� ���������.
  
//PB: ���������� �������� ��������� ����. ���������� �� �����������
      ���������� ������� Npc_GetBodyState ��������, ��������� ����� ��������� ���

        if (Npc_GetBodyState(self) == BS_SIT)

      ����� ������, ���� ������������� � BS_SIT ����������� �����
      �����������, �������� BS_MOD_BURNING (����� � �����).

      ������ �� ��������� ���� ������ ��������� ��������� �������:

        if (C_BodyStateContains(self,BS_SIT))"
 
***************************************************************************/




func int C_BodyStateContains(var C_Npc slf,var int bodystate)
{
	/*
	//PB: ���� ����� �� ���� �������!!! � ����� ����, ��� �����!
	//VAM: � ����� ������ ����������� ������� ������� �����������
	//NS: ������� ��������� ���������, ����, �� ��� ������, �� ����� ��������� ��:
	(Npc_GetBodyState(slf) & BS_MAX) == (bodystate & BS_MAX)
	��������� ��������� ���� ���������� ���������������� ��� ��������,
	� ����� BS_FLAG_x ���� ����� �������������� ����������.
	
	��������� � �������:
	(BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS) - ����� � 1
	� ��� ��������, ��� ��������� ������� ��������� ���� � ������ �������� ������, 
	�.�. � ����� 0-6, 15, 16. ��� ��������� ���� - �������, ������� ��� 
	���������� ����������� � ��� ������ ����� (� ����� 7-12) ����������.	
	*/
	if((Npc_GetBodyState(slf) & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS))
		== (bodystate & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS)))
	{
		return TRUE;
	};
	return FALSE;
};

