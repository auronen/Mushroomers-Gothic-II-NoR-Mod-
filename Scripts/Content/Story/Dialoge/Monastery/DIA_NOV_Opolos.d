

instance DIA_Opolos_EXIT(DIA_Proto_End)
{
	npc = NOV_605_Opolos;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Opolos_Sheep_Odo(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 0;
	condition = DIA_Opolos_Sheep_Odo_Cond;
	information = DIA_Opolos_Sheep_Odo_Info;
	permanent = TRUE;
	description = "��� ���� ����?";
};
func int DIA_Opolos_Sheep_Odo_Cond()
{
	if (C_HeroIs_Odo() && (MonasterySheep_Dead_Cnt < 4))	{
		return TRUE;
	};
};
func void DIA_Opolos_Sheep_Odo_Info()
{
	AI_Output(other,self,"DIA_Opolos_Sheep_Odo_03_00");	//��� ���� ����?
	if (MonasterySheep_Dead_Cnt > 0)	{
		AI_Output(self,other,"DIA_Opolos_Sheep_Odo_12_01");	//(�������) ��, ��� ��������, � �������...
	}
	else {
		AI_Output(self,other,"DIA_Opolos_Sheep_Odo_12_02");	//(�����) � ������ ��� ������!
	};
};

//===================================================
instance DIA_Opolos_Bored_Odo(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 1;
	condition = DIA_Opolos_Bored_Odo_Cond;
	information = DIA_Opolos_Bored_Odo_Info;
	permanent = TRUE;
	description = "���� �� ������� ������� �� ����?";
};
func int DIA_Opolos_Bored_Odo_Cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Opolos_Bored_Odo_Info()
{
	AI_Output(other,self,"DIA_Opolos_Bored_Odo_03_00");	//���� �� ������� ������� �� ����?
	if (MonasterySheep_Dead_Cnt == 4)	{
		AI_Output(self,other,"DIA_Opolos_Bored_Odo_12_01");	//������, ����� ���� �� �����, � ���� ������ �� ���...
	}
	else {
		AI_Output(self,other,"DIA_Opolos_Bored_Odo_12_02");	//������ ������� ��� ��� ������ � � � ��� ���������!
		AI_Output(self,other,"DIA_Opolos_Bored_Odo_12_03");	//�� �����-������ ��� �������� ������ �������, ��� ������� �������, ��� ���� ������� ��� ���������...
		AI_Output(self,other,"DIA_Opolos_Bored_Odo_12_04");	//�� ��� ���� ������, ��� ������� ������ ������.
	};
};

