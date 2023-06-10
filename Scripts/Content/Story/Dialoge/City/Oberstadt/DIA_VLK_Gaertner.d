
instance DIA_Gaertner_EXIT(DIA_Proto_End)
{
	npc = VLK_411_Gaertner;
};

// ==============================================

instance DIA_Gaertner_HowAU(C_INFO)
{
	nr = 1;
	npc = VLK_411_Gaertner;
	condition = DIA_NoCond_cond;
	information = DIA_Gaertner_HowAU_info;
	permanent = TRUE;
	description = "��� ����?";
};
func void DIA_Gaertner_HowAU_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Gaertner_HowAU_03_00");	//��� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Gaertner_HowAU_07_00");	//��� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Gaertner_HowAU_10_00");	//��� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Gaertner_HowAU_14_00");	//��� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Gaertner_HowAU_16_00");	//��� ����?
	};
	AI_Output(self,other,"DIA_Gaertner_HowAU_14_01");	//�������. ���� ���������� � �������, ����� ������� ��c���������.
	AI_Output(self,other,"DIA_Gaertner_HowAU_14_02");	//���������� ��� �������� ���� �� ����.
};


