
//����� �� ������ �� ������� �����
//������� ����., ���� ������
func int CanUse_Thief_Isle()
{
	if (Npc_IsPlayer(self))	{
		PrintScreen("�� ���������.",-1,20,FONT_ScreenSmall,2);
	};
	return FALSE;
};