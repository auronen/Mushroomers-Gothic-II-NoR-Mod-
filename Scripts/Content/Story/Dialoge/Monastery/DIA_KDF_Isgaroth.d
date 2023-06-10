
instance DIA_Isgaroth_EXIT(DIA_Proto_End)
{
	npc = KDF_509_Isgaroth;
};

// �������� ==============================================
var int DIA_Isgaroth_MRTrade_Once;
instance DIA_Isgaroth_MRTrade(C_INFO)
{
	nr = 50;
	npc = KDF_509_Isgaroth;
	condition = DIA_Isgaroth_MRTrade_cond;
	information = DIA_Isgaroth_MRTrade_info;
	description = "���� � ������ ���-������?";
	trade = TRUE;
	permanent = TRUE;
};
func int DIA_Isgaroth_MRTrade_cond()
{
	if(C_HeroIs_Odo())	{
		DIA_Isgaroth_MRTrade.description = "���� � ������ ���-������ � ���?";
	};
	return TRUE;
};
func void DIA_Isgaroth_MRTrade_info()
{
	if (!DIA_Isgaroth_MRTrade_Once)	{
		if (C_HeroIs_Odo())	{				//���
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_Odo_03_00");	//���� � ������ ���-������ � ���?
		} else if (hero.voice == 3)	{		//������
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_03_00");	//���� � ������ ���-������?
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_07_00");	//���� � ������ ���-������?
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_10_00");	//���� � ������ ���-������?
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_14_00");	//���� � ������ ���-������?
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Isgaroth_MRTrade_16_00");	//���� � ������ ���-������?
		};	
		AI_Output(self,other,"DIA_Isgaroth_MRTrade_01_01");	//��, � ���� ���� ���������� ������.
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Isgaroth);
		DIA_Isgaroth_MRTrade_Once = TRUE;
	};
	B_GiveTradeInv_Isgaroth(self);
};

// ==============================================
instance DIA_Isgaroth_Advice(C_INFO)
{
	nr = 1;
	npc = KDF_509_Isgaroth;
	condition = DIA_Isgaroth_Advice_cond;
	information = DIA_Isgaroth_Advice_info;
	description = "�� ������ ���� ��� �����?";
	permanent = TRUE;
};
func int DIA_Isgaroth_Advice_cond()
{
	if(C_HeroIs_Odo())	{
		DIA_Isgaroth_Advice.description = "�� ������ ���� ��� �����, ������?";
	};
	return TRUE;
};
func void DIA_Isgaroth_Advice_info()
{
	if (C_HeroIs_Odo())	{				//���
		AI_Output(other,self,"DIA_Isgaroth_Advice_Odo_03_00");	//�� ������ ���� ��� �����, ������?
	} else if (hero.voice == 3)	{		//������
		AI_Output(other,self,"DIA_Isgaroth_Advice_03_00");	//�� ������ ���� ��� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Isgaroth_Advice_07_00");	//�� ������ ���� ��� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Isgaroth_Advice_10_00");	//�� ������ ���� ��� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Isgaroth_Advice_14_00");	//�� ������ ���� ��� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Isgaroth_Advice_16_00");	//�� ������ ���� ��� �����?
	};	
	AI_Output(self,other,"DIA_Isgaroth_Advice_01_01");	//�� ����� ������� ����������� ��������� �������� ������.
	AI_Output(self,other,"DIA_Isgaroth_Advice_01_02");	//�� ������� � ������������ �������, � ��� ���� ������ ����.
};

