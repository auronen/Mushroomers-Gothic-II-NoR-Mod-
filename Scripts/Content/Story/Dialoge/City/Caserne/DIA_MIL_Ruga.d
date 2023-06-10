
instance DIA_Ruga_EXIT(DIA_Proto_End)
{
	npc = Mil_317_Ruga;
};

//==============================================
instance DIA_Ruga_WhatAUDoing(C_INFO)
{
	nr = 1;
	npc = Mil_317_Ruga;
	condition = DIA_NoCond_cond;
	information = DIA_Ruga_WhatAUDoing_info;
	permanent = TRUE;
	description = "��� �� �����������?";
};
func void DIA_Ruga_WhatAUDoing_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ruga_WhatAUDoing_03_00");	//��� �� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ruga_WhatAUDoing_07_00");	//��� �� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ruga_WhatAUDoing_10_00");	//��� �� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ruga_WhatAUDoing_14_00");	//��� �� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ruga_WhatAUDoing_16_00");	//��� �� �����������?
	};
	AI_Output(self,other,"DIA_Ruga_WhatAUDoing_14_01");	//��� ���������� �������� �� ��������.
	AI_Output(self,other,"DIA_Ruga_WhatAUDoing_14_02");	//�� �������� ������ ���� �� ������� ����������, ��� ��� ������� ����� ������� � �������� ��� ����.
};

//==============================================
var int DIA_Ruga_Training_Once;
instance DIA_Ruga_Training(C_INFO)
{
	nr = 2;
	npc = Mil_317_Ruga;
	condition = DIA_Ruga_Training_cond;
	information = DIA_Ruga_Training_info;
	permanent = TRUE;
	description = "� ���� ��������������� � �����?";
};
func int DIA_Ruga_Training_cond()
{
	return TRUE;
};
func void DIA_Ruga_Training_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Ruga_Training_03_00");	//� ���� ��������������� � �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Ruga_Training_07_00");	//� ���� ��������������� � �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Ruga_Training_10_00");	//� ���� ��������������� � �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Ruga_Training_14_00");	//����� ��������������� � �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Ruga_Training_16_00");	//� ���� ��������������� � �����?
	};
	AI_Output(self,other,"DIA_Ruga_Training_14_01");	//�� ������ ��������������� � ��� ����.
	AI_Output(self,other,"DIA_Ruga_Training_14_02");	//��� ������ ������ �� ������, � ���� �� ���� ������ ��������.
	AI_Output(self,other,"DIA_Ruga_Training_14_03");	//��� �� ������ ������ ������ ����������, ��� ��������?
	if (!DIA_Ruga_Training_Once)	{
		DIA_Ruga_Training_Once = TRUE;
		B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Ruga);
	};
};


