/**************************************************************************

								�������

  B_Say		(slf,	oth,	text)
  �������� slf ������� oth ����� text (��� �������� � ����� �������).
������� ����� ����������� �������.
   
  text - �� ��� ����� �����, � ��� ���������������� ����, ��������:
   
  B_Say(self,other,"$NOTNOW");
  
  ��� ���� ��� ������, ���������������� self, ����� ������� �����
�� ���� NotNow � ������ ������� � ��������.

  ����� �������� ����� ����������. ������������ � ������� ���������.
  
  �������� �����:
 ����������� �����					 				Story\SVM.d

***************************************************************************/


func void B_Say(var C_Npc slf,var C_Npc oth,var string text)
{
	// �������
	AI_OutputSVM(slf,oth,text);
};
