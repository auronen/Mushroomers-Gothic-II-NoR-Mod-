
var int VictimCount;
var int VictimLevel;
var int ThiefLevel;
const int ThiefXP = 50;

// ���� �� ���� �� �����
func void B_GiveThiefXP()
{
	// ������� ����� ������ �� ������� � �� �������
	VictimCount = VictimCount + 1;
	// ������������ ���������� �� �� ����� ����� � ��������� ��������� (�������� � 2)
	if(VictimLevel == 0)
	{
		VictimLevel = 2;
	};
	// ���� �� ����� ������ ������
	if(VictimCount >= VictimLevel)
	{
		// �������� ��������� �������
		ThiefLevel = ThiefLevel + 1;
		// ��������� ����� ������
		VictimLevel = VictimCount + ThiefLevel;
	};
	// ���� ����
	// � ������ ����, ������� ��� �������� ����������� ���������
	var int TheftCnt;
	TheftCnt = self.aivar[AIV_PlayerHasPickedMyPocket] & ~PICKPOCKET_Once;
	if (TheftCnt > 0)
	{
		B_GivePlayerXP((ThiefXP + (ThiefLevel * 10)) / TheftCnt);
	}
	else
	{
		B_GivePlayerXP(ThiefXP + (ThiefLevel * 10));
	};
};

// ������� ��������� ������� ��
func void B_ResetThiefLevel()
{
	// ���� ����� ����� ���� ���������� ������
	if(VictimCount > ThiefLevel)
	{
		// ������� ����� �����
		VictimCount = VictimCount - 1;
	};
};

