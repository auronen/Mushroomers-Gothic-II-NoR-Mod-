
instance DIA_Bengar_EXIT(DIA_Proto_End)
{
	npc = BAU_960_Bengar;
};

// ��� ==================================================================
instance DIA_Bengar_Odo_Straw(C_INFO)
{
	npc = BAU_960_Bengar;	nr = 20;
	condition = DIA_Bengar_Odo_Straw_cond;
	information = DIA_Bengar_Odo_Straw_info;
	description = "� ���� ����� ������ ����?";
};
func int DIA_Bengar_Odo_Straw_cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Bengar_Odo_Straw_info()
{
		AI_Output(other,self,"DIA_Bengar_Odo_Straw_03_00");	//� ���� ����� ������ ����?
	AI_Output(self,other,"DIA_Bengar_Odo_Straw_10_01");	//�������.
		AI_Output(other,self,"DIA_Bengar_Odo_Straw_03_02");	//� �����?
	AI_Output(self,other,"DIA_Bengar_Odo_Straw_10_03");	//16 ������� �� ���. ���� �������, ��� ��������.
	B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Bengar_Price);
	MIS_Odo_Straw_Bengar[Straw_Price] = 1;
};
//------------------------------------------------
instance DIA_Bengar_Odo_StrawBuy(C_INFO)
{
	npc = BAU_960_Bengar;	nr = 20;
	condition = DIA_Bengar_Odo_StrawBuy_cond;
	information = DIA_Bengar_Odo_StrawBuy_info;
	description = "��������� ����� �� ������ � ���� ����.";
	permanent = TRUE;
};
func int DIA_Bengar_Odo_StrawBuy_cond()
{
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running) && MIS_Odo_Straw_MoneyGiven)	{
		return TRUE;
	};
};
func void DIA_Bengar_Odo_StrawBuy_info()
{
		AI_Output(other,self,"DIA_Bengar_Odo_StrawBuy_03_00");	//��������� ����� �� ������ � ���� ����.
		AI_Output(other,self,"DIA_Bengar_Odo_StrawBuy_03_01");	//��� ����� 32 ����.
	AI_Output(self,other,"DIA_Bengar_Odo_StrawBuy_10_02");	//��� �����... 512 �������.
	if (B_GiveGold(other,self,512))	{
			AI_Output(other,self,"DIA_Bengar_Odo_StrawBuy_03_03");	//��� ������.
		AI_Output(self,other,"DIA_Bengar_Odo_StrawBuy_10_04");	//�� �������� ���� � ��������� ����� ��������� ����, ��� ������ ������ ������� ���������.
		B_LogEntry_Status(TOPIC_Odo_Straw,LOG_SUCCESS,TOPIC_Odo_Straw_Success);
		MIS_Odo_Straw = LOG_SUCCESS;
		B_GivePlayerXP(XP_Odo_Straw_Success);
	}
	else	{
			AI_Output(other,self,"DIA_Bengar_Odo_StrawBuy_03_05");	//� ���������� ����� �� ��������.
	};
};

// ����� ==================================================================
instance DIA_Bengar_MR_Perm(C_INFO)
{
	npc = BAU_960_Bengar;	nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Bengar_MR_Perm_info;
	description = "��� ���� �� ����� �����?";
	permanent = TRUE;
};
func void DIA_Bengar_MR_Perm_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Bengar_MR_Perm_03_00");	//��� ���� �� ����� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Bengar_MR_Perm_07_00");	//��� ���� �� ����� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Bengar_MR_Perm_10_00");	//��� ���� �� ����� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Bengar_MR_Perm_14_00");	//��� ���� �� ����� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Bengar_MR_Perm_16_00");	//��� ���� �� ����� �����?
	};
	AI_Output(self,other,"DIA_Bengar_MR_Perm_10_01");	//��� �� �� ��� ����������.
};

