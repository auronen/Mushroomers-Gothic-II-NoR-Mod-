
instance DIA_Alwin_EXIT(DIA_Proto_End)
{
	npc = Vlk_424_Alwin;
};

// ==============================================
instance DIA_Alwin_NoTrade(C_INFO)
{
	nr = 1;
	npc = Vlk_424_Alwin;
	condition = DIA_NoCond_cond;
	information = DIA_Alwin_NoTrade_info;
	description = "����� ������ � ���� ����?";
};
func void DIA_Alwin_NoTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Alwin_NoTrade_03_00");	//����� ������ � ���� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Alwin_NoTrade_07_00");	//����� ������ � ���� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Alwin_NoTrade_10_00");	//����� ������ � ���� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Alwin_NoTrade_14_00");	//����� ������ � ���� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Alwin_NoTrade_16_00");	//����� ������ � ���� ����?
	};
	if (!C_HeroIs_Sarah())	{
		AI_Output(self,other,"DIA_Alwin_NoTrade_12_01");	//���. � ������� ���� ��� ��������� ������.
		AI_Output(self,other,"DIA_Alwin_NoTrade_12_02");	//��� �������� �� � ���� � �������� �������, � ����� ���������� � ���� ��������� �������.
	}
	else	{
		AI_Output(self,other,"DIA_Alwin_NoTrade_12_03");	//����, �� ��������� ������, ��� ���� � ����� ��������� ���� �� �������, ��������� � ���� ����� �������!
	};
};

// ==============================================
var int DIA_Alwin_News_Once;
instance DIA_Alwin_News(C_INFO)
{
	nr = 2;
	npc = Vlk_424_Alwin;
	condition = DIA_NoCond_cond;
	information = DIA_Alwin_News_info;
	permanent = TRUE;
	description = "����� �������?";
};
func void DIA_Alwin_News_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Alwin_News_03_00");	//����� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Alwin_News_07_00");	//����� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Alwin_News_10_00");	//����� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Alwin_News_14_00");	//����� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Alwin_News_16_00");	//����� �������?
	};
	if (MIS_FellanGoHome_Returned)	{
		AI_Output(self,other,"DIA_Alwin_News2_12_01");	//� ��� ��� ��� ��� ����� ������ �������� �����, � ���� ��� �� ������ �����!
		AI_Output(self,other,"DIA_Alwin_News2_12_02");	//�� ��� ������, � ������, � ������... ����� ����! ����� ��� ��� ��������?!
	}
	else	if (!DIA_Alwin_News_Once)	{
		AI_Output(self,other,"DIA_Alwin_News1_12_01");	//��� ����� ������, ������, ������ ����� �� ���.
		AI_Output(self,other,"DIA_Alwin_News1_12_02");	//���� ������ ����� ��� � ���� ���������. ���-�� ��������, ��� ������ ��� ������.
		AI_Output(self,other,"DIA_Alwin_News1_12_03");	//� ����� ������ ���� ������� ���� � ��������� ����� �� �������. ���� �������, ����� ������ � �������.
		AI_Output(self,other,"DIA_Alwin_News1_12_04");	//���� ������ ���� ����������� ��� ��������� �����, �� �� � ������� �� �����.
		DIA_Alwin_News_Once = TRUE;
		MIS_FellanGoHome_WifeWaits = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Alwin_News0_12_01");	//� ����� ��� ��-��������. ������ ��� ������ ���������� ��� ����� � �����.
	};
};

