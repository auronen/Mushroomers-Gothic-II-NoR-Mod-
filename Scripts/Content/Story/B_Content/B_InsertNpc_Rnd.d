
//������������� ������� npc
//p - ����������� ������� � % (0-100)
//��������� TRUE, ���� ����� ���������
func int B_InsertNpc_Rnd(var int NpcInst, var string wp, var int p)
{
	if (Hlp_Random(100) < p)	{
		Wld_InsertNpc(NpcInst,wp);
		return TRUE;
	};
	return FALSE;
};