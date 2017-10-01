
instance DIA_BAU_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_1_EXIT_Condition;
	information = DIA_BAU_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_BAU_1_HowAU(C_Info)
{
	nr = 101;
	condition = DIA_BAU_1_HowAU_Condition;
	information = DIA_BAU_1_HowAU_Info;
	permanent = TRUE;
	description = "��� ����?";
};

func int DIA_BAU_1_HowAU_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_HowAU_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_BAU_HowAU_03_00");	//��� ����?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_BAU_HowAU_07_00");	//��� ����?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_BAU_HowAU_10_00");	//��� ����?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_BAU_HowAU_14_00");	//��� ����?
	} else	{
		AI_Output(other,self,"DIA_BAU_HowAU_16_00");	//��� ����?
	};
	var int rnd;	rnd = Hlp_Random(3);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_BAU_HowAU_01_01");	//���� ����������. ������ � ���� ���� �������.
	} else if (rnd == 1)	{
		AI_Output(self,other,"DIA_BAU_HowAU_01_02");	//������ ������, ����� ��������� ������������.
	} else	{
		AI_Output(self,other,"DIA_BAU_HowAU_01_03");	//����� ����, � ���, ���, ����� ������, � �������.
	};
};

instance DIA_BAU_1_News(C_Info)
{
	nr = 102;
	condition = DIA_BAU_1_News_Condition;
	information = DIA_BAU_1_News_Info;
	permanent = TRUE;
	description = "��� ������?";
};

func int DIA_BAU_1_News_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_News_Info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_BAU_News_03_00");	//��� ������?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_BAU_News_07_00");	//��� ������?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_BAU_News_10_00");	//��� ������?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_BAU_News_14_00");	//��� ������?
	} else	{
		AI_Output(other,self,"DIA_BAU_News_16_00");	//��� ������?
	};
	var int rnd;	rnd = Hlp_Random(2);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_BAU_News_01_01");	//�� ������...
	} else	{
		AI_Output(self,other,"DIA_BAU_News_01_02");	//��� ��� ������.
	};
};

func void B_AssignAmbientInfos_BAU_1(var C_Npc slf)
{
	dia_BAU_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_BAU_1_howau.npc = Hlp_GetInstanceID(slf);
	dia_BAU_1_news.npc = Hlp_GetInstanceID(slf);
};



