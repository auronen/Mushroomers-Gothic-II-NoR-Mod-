
//===================================================
instance DIA_Fabio_HasYew(C_Info)
{
	npc = VLK_442_Arbeiter;
	nr = 1;
	condition = DIA_Fabio_HasYew_Cond;
	information = DIA_Fabio_HasYew_Info;
	description = "�����, � ��� ���� ���?";
};
func int DIA_Fabio_HasYew_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_KnowsInfo(other,DIA_Thorben_HammerWood))	{
		return TRUE;
	};
};

func void DIA_Fabio_HasYew_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fabio_HasYew_03_00");	//�����, � ��� ���� ���?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fabio_HasYew_07_00");	//�����, � ��� ���� ���?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fabio_HasYew_10_00");	//�����, � ��� ���� ���?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fabio_HasYew_14_00");	//�����, � ��� ���� ���?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fabio_HasYew_16_00");	//�����, � ��� ���� ���?
	};
	AI_Output(self,other,"DIA_Fabio_HasYew_06_01");	//���� ���. ����� ������ �������, � �� ��� ����� �� ������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fabio_HasYew_03_02");	//������ �������? ��� �������� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fabio_HasYew_07_02");	//������ �������? ��� �������� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fabio_HasYew_10_02");	//������ �������? ��� �������� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fabio_HasYew_14_02");	//������ �������? ��� �������� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fabio_HasYew_16_02");	//������ �������? ��� �������� �������.
	};
	AI_Output(self,other,"DIA_Fabio_HasYew_06_03");	//������ �� � ���. �� 50 ������� ���� ������ ����� �����.
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerHafen);
};

//===================================================
instance DIA_Fabio_BuyYew(C_Info)
{
	npc = VLK_442_Arbeiter;
	nr = 2;
	condition = DIA_Fabio_BuyYew_Cond;
	information = DIA_Fabio_BuyYew_Info;
	description = "����� 50 �������.";
	permanent = TRUE;
};
func int DIA_Fabio_BuyYew_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_KnowsInfo(other,DIA_Fabio_HasYew)
		&& !MIS_FellanGoHome_YewGot)	{
		return TRUE;
	};
};

func void DIA_Fabio_BuyYew_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fabio_BuyYew_03_00");	//����� 50 �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fabio_BuyYew_07_00");	//����� 50 �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fabio_BuyYew_10_00");	//����� 50 �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fabio_BuyYew_14_00");	//����� 50 �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fabio_BuyYew_16_00");	//����� 50 �������.
	};
	if (B_GiveGold(other,self,50))	{
		AI_Output(self,other,"DIA_Fabio_BuyYew_06_01");	//������� ����� � ����� ����.
		B_GiveInvItems(self,other,ItMi_YewPiece,1);
		MIS_FellanGoHome_YewGot = TRUE;
		B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerYew);
		B_GivePlayerXP(XP_Fellan_YewGot);
	}
	else	{
		AI_Output(self,other,"DIA_Fabio_BuyYew_06_02");	//���? � ��� �� ��������� �������.
	};
};

//===================================================
instance DIA_Fabio_TooExpensive(C_Info)
{
	npc = VLK_442_Arbeiter;
	nr = 3;
	condition = DIA_Fabio_TooExpensive_Cond;
	information = DIA_Fabio_TooExpensive_Info;
	description = "50 �������? ��� ������!";
};
func int DIA_Fabio_TooExpensive_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_KnowsInfo(other,DIA_Fabio_HasYew)
		&& !MIS_FellanGoHome_YewGot)	{
		return TRUE;
	};
};

func void DIA_Fabio_TooExpensive_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fabio_TooExpensive_03_00");	//50 �������? ��� ������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fabio_TooExpensive_07_00");	//50 �������? ��� ������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fabio_TooExpensive_10_00");	//50 �������? ��� ������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fabio_TooExpensive_14_00");	//50 �������? ��� ������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fabio_TooExpensive_16_00");	//50 �������? ��� ������!
	};
	AI_Output(self,other,"DIA_Fabio_TooExpensive_06_01");	//��, � ��������� ����� ��.
	AI_Output(self,other,"DIA_Fabio_TooExpensive_06_02");	//��� ����� �����, � �� �� �� ��� �� ������ ���, ���� � ��� ������.
	AI_Output(self,other,"DIA_Fabio_TooExpensive_06_03");	//�� �� ����� ��, ��� �����, ������� � ����� ��� ���� ����� �� ��������.
};

