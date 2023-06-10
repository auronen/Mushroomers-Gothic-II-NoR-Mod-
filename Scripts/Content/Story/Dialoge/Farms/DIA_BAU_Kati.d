
// ���������� ������ ===================================================
instance DIA_Kati_AskRecipe(C_Info)
{
	npc = BAU_941_Kati;				nr = 10;
	condition = DIA_Kati_AskRecipe_cond;
	information = DIA_Kati_AskRecipe_Info;
	description = "�� �������� �� ������, ��� ����������� ����� �������� ���, ������� �����?";
};
func int DIA_Kati_AskRecipe_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Kati_AskRecipe_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Kati_AskRecipe_03_00");	//�� �������� �� ������, ��� ����������� ����� �������� ���, ������� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Kati_AskRecipe_07_00");	//�� �������� �� ������, ��� ����������� ����� �������� ���, ������� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Kati_AskRecipe_10_00");	//�� �������� �� ������, ��� ����������� ����� �������� ���, ������� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Kati_AskRecipe_14_00");	//�� �������� �� ������, ��� ����������� ����� �������� ���, ������� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Kati_AskRecipe_16_00");	//�� �������� �� ������, ��� ����������� ����� �������� ���, ������� �����?
	};
	AI_Output(self,other,"DIA_Kati_AskRecipe_16_01");	//������� �� ����.
};