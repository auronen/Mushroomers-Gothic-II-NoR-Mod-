
instance DIA_William_EXIT(DIA_Proto_End)
{
	npc = VLK_4304_Addon_William;
};

//===================================================
var int DIA_William_Hello_Once;
instance DIA_William_Hello(C_Info)
{
	npc = VLK_4304_Addon_William;
	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_William_MR_Hello_Info;
	permanent = TRUE;
	description = "��� �������?";
};
func void DIA_William_MR_Hello_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_William_MR_Hello_03_00");	//��� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_William_MR_Hello_07_00");	//��� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_William_MR_Hello_10_00");	//��� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_William_MR_Hello_14_00");	//��� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_William_MR_Hello_16_00");	//��� �������?
	};
	if (Wld_GetDay() > Fishers_Rain_Day)	{
		AI_Output(self,other,"DIA_William_MR_Hello_16_04");	//����� ��� ������ �� ���� ����.
		AI_Output(self,other,"DIA_William_MR_Hello_16_05");	//��� ������ �� ���� �����, ������ � ����.
		DIA_William_Hello_Once = TRUE;
	}
	else if (DIA_William_Hello_Once == FALSE)	{
		AI_Output(self,other,"DIA_William_MR_Hello_16_01");	//������� ��� ����� � ��� ���� ���� �� ���.
		AI_Output(self,other,"DIA_William_MR_Hello_16_02");	//��� � ���� �������� �������. � ����� � ������� �������.
		AI_Output(self,other,"DIA_William_MR_Hello_16_03");	//� ������� ��������� ������ �������� ������� �������� �� ������, �� �� ������� ������������.
		DIA_William_Hello_Once = TRUE;
	}
	else 	{
		AI_Output(self,other,"DIA_William_MR_Hello_16_06");	//���� ������� ������.
	};
};

