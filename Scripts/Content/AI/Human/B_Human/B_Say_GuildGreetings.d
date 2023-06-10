/**************************************************************************

						����������� �������

  B_Say_GuildGreetings		(slf,	oth)
  �������� slf (�) ������������ oth (��) � ������������ � ��������.
���������� ������ ��� oth = ��.
   
  �������� �������� ������� ��� �����.
  � ��������� ������������ ����� ������ ��������� � ������.
  
  �������� �����:
 ����������� �����					 		Story\SVM.d
 ������� B_Say_Overlay						AI\Human\B_Human\B_Say_Overlay.d

***************************************************************************/

func void B_Say_GuildGreetings(var C_Npc slf,var C_Npc oth)
{
	// ���� � ���������, � �� - ��������� ��� �������
	if((slf.guild == GIL_MIL) && ((oth.guild == GIL_MIL) || (oth.guild == GIL_PAL)))
	{
		B_Say_Overlay(slf,oth,"$MILGREETINGS");	// ����������� ����������
		return;
	};
	
	// ���� � �������, � �� - ���������, ������� ��� ��� ����
	if((slf.guild == GIL_PAL) && ((oth.guild == GIL_PAL) || (oth.guild == GIL_MIL) || (oth.guild == GIL_KDF)))
	{
		B_Say_Overlay(slf,oth,"$PALGREETINGS");	// ����������� ���������
		return;
	};
	
	// ���� � ��� ����, � �� - �������, ��������� ��� ��� ����
	if((slf.guild == GIL_KDF) && ((oth.guild == GIL_PAL) || (oth.guild == GIL_NOV) || (oth.guild == GIL_KDF)))
	{
		B_Say_Overlay(slf,oth,"$PALGREETINGS");	// ����������� ����� ����
		return;
	};

	// �� ���� ��������� �������
	
	// ���� ���� �����, � ������������ 10% 
	var int zufall;
	zufall = Hlp_Random(100);
	if(Wld_IsRaining() && (zufall < 10))
	{
		B_Say_Overlay(slf,oth,"$WEATHER");	//�������, ��� ������ �������
		return;
	};
};

