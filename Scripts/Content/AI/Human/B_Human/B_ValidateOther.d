/**************************************************************************

							�������� OTHER

  B_ValidateOther	()
  ���������, ���������� �� other, ��� ������������� ��������������
� ���������� self �� other.

  ���������� �� ����� ��� � ������� - ��� �������� ���� ���� �� �����������.
  
//NS: ������ �� �������!!!
   
***************************************************************************/

func void B_ValidateOther()
{
	// ���� other �� ���������� (���� ���� ���������)
	if(!Hlp_IsValidNpc(other))
	{
		// �������� � other ��������� ���� self
		other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		// ����� ���������� �� ����
		Npc_SetTarget(self,other);
		// ���������, ��� ���� ���� ���������
		self.aivar[AIV_LOADGAME] = TRUE;
	}
	// ���� other ���������� (���� �� ���������)
	else
	{
		// ���������� �� other
		Npc_GetTarget(self);
		// ���������, ��� ���� �� ���� ���������
		self.aivar[AIV_LOADGAME] = FALSE;
	};
	// � ����� ������ ��������� ����
	self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
};

