
// ������� ����� ���������� �� mobsi
//�������� ���� �� ��� ������

//����� MuttonCount ������ ����
func void Cook_Meat_DoCook(var int MuttonCount)
{
	//�� 1 ����� 2 ������ �������� ������� +- 5 �����
	var int time;	time = 2 * MuttonCount;
	if (MuttonCount > 10)	{
		time += Hlp_Random(5);
	};
	//�����
	Npc_RemoveInvItems(self,ItFoMuttonRaw,MuttonCount);
	CreateInvItems(self,ItFoMutton,MuttonCount);
	//����
	//AI_PrintScreen(PRINT_SomeTimeLater,-1,25,FONT_Screen,3);
	AI_Wait(self, 1.2);
	B_SetTimePlus(0, time);
	//������
};