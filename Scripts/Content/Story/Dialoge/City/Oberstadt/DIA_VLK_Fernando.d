
//AMBIENT - EXIT �� �����


// ����� �������� ==============================================================
instance DIA_Fernando_FurFromHalvor(C_INFO)
{
	npc = VLK_405_Fernando;				nr = 1;
	condition = DIA_Fernando_FurFromHalvor_cond;
	information = DIA_Fernando_FurFromHalvor_info;
	description = "�� ��������� ���� �������� �����?";
};
func int DIA_Fernando_FurFromHalvor_cond()
{
	if (MIS_KhorinisPost_Stage_FromHalvor
		&& Npc_HasItems(other,ItAt_SharkSkin))	{
		return TRUE;
	};
};
func void DIA_Fernando_FurFromHalvor_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fernando_FurFromHalvor_03_00");	//�� ��������� ���� �������� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fernando_FurFromHalvor_07_00");	//�� ��������� ���� �������� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fernando_FurFromHalvor_10_00");	//�� ��������� ���� �������� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fernando_FurFromHalvor_14_00");	//�� ��������� ���� �������� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fernando_FurFromHalvor_16_00");	//�� ��������� ���� �������� �����?
	};
	AI_Output(self,other,"DIA_Fernando_FurFromHalvor_14_01");	//��, �������-��! � ���� �� ��� ������. ������, ����� ������� ����� �� ������� � ����, ������� ������ � �������� ���������� ��� �������...
	AI_Output(self,other,"DIA_Fernando_FurFromHalvor_14_02");	//��� ���� ������.
	//200���., �������� ����
	B_TradeItems(other,self,ItAt_SharkSkin,1,200);
	B_GivePlayerXP(XP_KhorinisPost_FernandoDelivered);
	MIS_KhorinisPost_FernandoDelivered = TRUE;
	B_LogEntry(TOPIC_KhorinisPost, TOPIC_KhorinisPost_FernandoDelivered);
	AI_StopProcessInfos(self);
};

// ==============================================================
instance DIA_Fernando_GiveMoney(C_INFO)
{
	npc = VLK_405_Fernando;				nr = 2;
	condition = DIA_Fernando_GiveMoney_cond;
	information = DIA_Fernando_GiveMoney_info;
	description = "� ��� ��� 50 �������?";
};
func int DIA_Fernando_GiveMoney_cond()
{
	if (MIS_KhorinisPost_FernandoDelivered)	{
		return TRUE;
	};
};
func void DIA_Fernando_GiveMoney_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fernando_GiveMoney_03_00");	//� ��� ��� 50 �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fernando_GiveMoney_07_00");	//� ��� ��� 50 �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fernando_GiveMoney_10_00");	//� ��� ��� 50 �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fernando_GiveMoney_14_00");	//� ��� ��� 50 �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fernando_GiveMoney_16_00");	//� ��� ��� 50 �������?
	};
	AI_Output(self,other,"DIA_Fernando_GiveMoney_14_01");	//����� � ���� ��� ���-�� ������?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fernando_GiveMoney_03_02");	//���� ����� 250 �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fernando_GiveMoney_07_02");	//���� ����� 250 �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fernando_GiveMoney_10_02");	//���� ����� 250 �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fernando_GiveMoney_14_02");	//���� ����� 250 �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fernando_GiveMoney_16_02");	//���� ����� 250 �������.
	};
	AI_Output(self,other,"DIA_Fernando_GiveMoney_14_03");	//��? � � ����� 200... ���, �����.
	//���� ��� 50���.
	B_GiveGold(self,other,50);
	B_GivePlayerXP(XP_KhorinisPost_FernandoMoney);
	B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_FernandoMoney);
};
