
//����� ��������� � ���, ��� ����� ������ (�����.)
func void player_plunder_is_empty()
{
	// ��������� ���������� ����� �� 0 �� 99
	var int rnd;
	rnd = Hlp_Random(100);
	if(rnd < 40)
	{  // � ������������ 40% - ��������� "�� ����� �� ������ ������ ��������..."
		Print(PRINT_NOTHINGTOGET);
		B_Say_Overlay(self,self,"$NOTHINGTOGET");
	}
	else if(rnd < 80)
	{  // � ������������ 40% - ��������� "��� ������ ���..."
		Print(PRINT_NOTHINGTOGET02);
		B_Say_Overlay(self,self,"$NOTHINGTOGET02");
	}
	else
	{  // � ������������ 20% - ��������� "������ �����..."
		Print(PRINT_NOTHINGTOGET03);
		B_Say_Overlay(self,self,"$NOTHINGTOGET03");
	};
};

