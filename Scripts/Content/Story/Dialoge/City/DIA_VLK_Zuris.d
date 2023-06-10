
instance DIA_Zuris_EXIT(DIA_Proto_End)
{
	npc = VLK_409_Zuris;
};

// �������� ==============================================

instance DIA_Zuris_Hello(C_INFO)
{
	nr = 1;
	npc = VLK_409_Zuris;
	condition = DIA_WhenAsked_cond;
	information = DIA_Zuris_MR_Hello_info;
	important = TRUE;
};
func void DIA_Zuris_MR_Hello_info()
{
	if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Zuris_MR_Hello_14_00");	//������� ���, ��������� ����. � ���� ���� ��������� ����� �������, �� ������� �� ���������?
	}
	else
	{
		AI_Output(self,other,"DIA_Zuris_MR_Hello_14_01");	//������ �����! �������� �����! ���������� ������.
	};
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Zuris);
};
//-----------------------------------------
instance DIA_Zuris_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_409_Zuris;
	condition = DIA_NoCond_cond;
	information = DIA_Zuris_MRTrade_info;
	description = "� ���� ��������� �� ���� ������.";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Zuris_MRTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Zuris_MRTrade_03_00");	//� ���� ��������� �� ���� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Zuris_MRTrade_07_00");	//� ���� ��������� �� ���� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Zuris_MRTrade_10_00");	//� ���� ��������� �� ���� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Zuris_MRTrade_14_00");	//� ���� ��������� �� ���� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Zuris_MRTrade_16_00");	//� ���� ��������� �� ���� ������.
	};
	B_GiveTradeInv_Zuris(self);
};
