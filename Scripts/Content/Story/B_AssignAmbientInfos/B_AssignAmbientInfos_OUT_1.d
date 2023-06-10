
instance DIA_OUT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OUT_1_EXIT_Condition;
	information = DIA_OUT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OUT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OUT_1_HowAU(C_Info)
{
	nr = 101;
	condition = DIA_OUT_1_HowAU_Condition;
	information = DIA_OUT_1_HowAU_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_OUT_1_HowAU_Condition()
{
	return TRUE;
};

func void DIA_OUT_1_HowAU_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_OUT_HowAU_03_00");	//��� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_OUT_HowAU_07_00");	//��� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_OUT_HowAU_10_00");	//��� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_OUT_HowAU_14_00");	//��� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_OUT_HowAU_16_00");	//��� ����?
	};
	var int rnd;	rnd = Hlp_Random(3);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_OUT_HowAU_01_01");	//� ���� ����� ����?
	}
	else if (rnd == 1)	{
		AI_Output(self,other,"DIA_OUT_HowAU_01_02");	//�� ���� ������.
	}
	else if (rnd == 2)	{
		AI_Output(self,other,"DIA_OUT_HowAU_01_03");	//���������.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OUT_1(var C_Npc slf)
{
	dia_OUT_1_exit.npc = Hlp_GetInstanceID(slf);
	DIA_OUT_1_HowAU.npc = Hlp_GetInstanceID(slf);
};

