
instance DIA_Wulfgar_EXIT(DIA_Proto_End)
{
	npc = MIL_312_Wulfgar;
};

// ==============================================
instance DIA_Wulfgar_Start(C_INFO)
{
	nr = 1;
	npc = MIL_312_Wulfgar;
	condition = DIA_WhenAsked_cond;
	information = DIA_Wulfgar_Start_info;
	important = TRUE;
};
func void DIA_Wulfgar_Start_info()
{
	AI_Output(self,other,"DIA_Wulfgar_Start_04_00");	//��� ������� ���� � �������?
};
//==============================================
var int DIA_Wulfgar_Training_Once;
instance DIA_Wulfgar_Training(C_INFO)
{
	nr = 2;
	npc = MIL_312_Wulfgar;
	condition = DIA_NoCond_cond;
	information = DIA_Wulfgar_Training_info;
	permanent = TRUE;
	description = "����� ���� ���������!";
};
func void DIA_Wulfgar_Training_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Wulfgar_Training_03_00");	//����� ���� ���������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Wulfgar_Training_07_00");	//����� ���� ���������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Wulfgar_Training_10_00");	//����� ���� ���������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Wulfgar_Training_14_00");	//����� ���� ���������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Wulfgar_Training_16_00");	//����� ���� ���������!
	};
	AI_Output(self,other,"DIA_Wulfgar_Training_04_01");	//� ������ ������ ��������� ����������.
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Wulfgar_Training_04_02");	//� ������ ������.
	};
	if (!DIA_Wulfgar_Training_Once)	{
		B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Wulfgar);
	};
	AI_Output(self,other,"DIA_Wulfgar_Training_04_03");	//�� �� ������ ������� �������� � ������ ������. ������� - ��������.
	AI_Output(self,other,"DIA_Wulfgar_Training_04_04");	//��� ������ �� ���������� � �����-���� �������, ��� ����� �� ��������.
	AI_Output(self,other,"DIA_Wulfgar_Training_04_05");	//������� ��� ��������� ����� �������, �������� ����������� ��������.
	AI_Output(self,other,"DIA_Wulfgar_Training_04_06");	//���� ���������� ����������� ��������� ����������.
	AI_Output(self,other,"DIA_Wulfgar_Training_04_07");	//(� ����������) �� � ��� ���, ���� ����� ������� ���������, ���������� ����� � �����.
	if (!DIA_Wulfgar_Training_Once)	{
		DIA_Wulfgar_Training_Once = TRUE;
		B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Self);
	};
};


