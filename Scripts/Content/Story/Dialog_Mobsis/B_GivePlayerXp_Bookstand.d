
// ���� �� ���� �� ��������� ������
// ���������� TRUE, ���� ����� ���� ������� ���������
func int B_GivePlayerXP_Bookstand(var int XPGiven)
{
	// ���� ��� ������
	if(XPGiven == TRUE)
	{
		return TRUE; 	// ������ �� ����
	};
	
	// �����
	B_GivePlayerXP(XP_Bookstand);	// ���� ����
	B_GiveAchievement_Archivist();
	return TRUE; 	// ���������
};