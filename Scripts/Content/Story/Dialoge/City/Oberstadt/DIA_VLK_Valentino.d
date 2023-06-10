
instance DIA_Valentino_EXIT(DIA_Proto_End)
{
	npc = VLK_421_Valentino;
};

// ����� �������� ==============================================================
instance DIA_Valentino_RingFromHalvor(C_INFO)
{
	npc = VLK_421_Valentino;				nr = 20;
	condition = DIA_Valentino_RingFromHalvor_cond;
	information = DIA_Valentino_RingFromHalvor_info;
	description = "��� ������, ������� �� ���������.";
};
func int DIA_Valentino_RingFromHalvor_cond()
{
	if (MIS_KhorinisPost_Stage_FromHalvor && Npc_KnowsInfo(other,DIA_Valentino_Start)
		&& Npc_HasItems(other,ItRi_ValentinosRing))	{
		return TRUE;
	};
};
func void DIA_Valentino_RingFromHalvor_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_03_00");	//��� ������, ������� �� ���������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_07_00");	//��� ������, ������� �� ���������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_10_00");	//��� ������, ������� �� ���������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_14_00");	//��� ������, ������� �� ���������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_16_00");	//��� ������, ������� �� ���������.
	};
	B_GiveInvItems(other,self,ItRi_ValentinosRing,1);
	AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_01");	//��, ��. ������� ��� � ������?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_03_02");	//100 �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_07_02");	//100 �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_10_02");	//100 �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_14_02");	//100 �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Valentino_RingFromHalvor_16_02");	//100 �������.
	};
	AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_03");	//����� 150! � ������� � �������� ����������.
	//���� � �������
	if (Npc_GetDistToWP(self,"NW_CITY_TAVERN_IN_06") < 500) 	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_04");	//�����, ������� �� ����, ���������?
				AI_Output(other,self,"DIA_Valentino_RingFromHalvor_16_05");	//� � ������ �������� �� ������ ������?
			AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_06");	//�� ���, ��� ���. ����� ����������?
				AI_Output(other,self,"DIA_Valentino_RingFromHalvor_16_07");	//����� �����!
			AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_08");	//������-������. ����� ���� 150 �����. � � ����� ����-������ ����� ������.
		}
		else	{
			B_LookAtNpc(self,VLK_420_Coragon);
			AI_Output(self,other,"DIA_Valentino_RingFromHalvor_12_09");	//���� ���� �� ���� ���������!
			B_LookAtNpc(self,other);
			B_GiveInvItems(VLK_420_Coragon,other,ItFo_Beer,1);
		};
	};
	B_GiveGold(self,other,150);
	B_GivePlayerXP(XP_KhorinisPost_ValentinoDelivered);
	MIS_KhorinisPost_ValentinoDelivered = TRUE;
	B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_ValentinoDelivered);
	AI_StopProcessInfos(self);
};
// ==============================================
instance DIA_Valentino_MoneyBack(C_INFO)
{
	npc = VLK_421_Valentino;				nr = 21;
	condition = DIA_Valentino_MoneyBack_cond;
	information = DIA_Valentino_MoneyBack_info;
	description = "������ ���� 50 �����.";
};
func int DIA_Valentino_MoneyBack_cond()
{
	if (MIS_KhorinisPost_ValentinoDelivered
		&& C_NpcHasGold(other,50))	{
		return TRUE;
	};
};
func void DIA_Valentino_MoneyBack_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Valentino_MoneyBack_03_00");	//������ ���� 50 �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Valentino_MoneyBack_07_00");	//������ ���� 50 �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Valentino_MoneyBack_10_00");	//������ ���� 50 �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Valentino_MoneyBack_14_00");	//������ ���� 50 �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Valentino_MoneyBack_16_00");	//������ ���� 50 �����.
	};
	AI_Output(self,other,"DIA_Valentino_MoneyBack_12_01");	//�� ����� ����, ��� ����� ������... ��� ��� ������ �� �����, � ��� ����, ��������, ����� ���� �����.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Valentino_MoneyBack_03_02");	//��� ��� �� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Valentino_MoneyBack_07_02");	//��� ��� �� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Valentino_MoneyBack_10_02");	//��� ��� �� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Valentino_MoneyBack_14_02");	//��� ��� �� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Valentino_MoneyBack_16_02");	//��� ��� �� �����.
	};
	B_GiveGold(other,self,50);
	B_GivePlayerXP(XP_KhorinisPost_ValentinoMoneyBack);
	if (other.aivar[AIV_Gender] == MALE)	{
		B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_ValentinoMoneyBack);
	}
	else	{
		B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_ValentinoMoneyBack_Fem);
	};
	AI_StopProcessInfos(self);
};

// ==============================================
instance DIA_Valentino_Start(C_INFO)
{
	nr = 1;
	npc = VLK_421_Valentino;
	condition = DIA_NoCond_cond;
	information = DIA_Valentino_Start_info;
	description = "�� ���� ���������, ��?";
};
func void DIA_Valentino_Start_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Valentino_Start_03_00");	//�� ���� ���������, ��?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Valentino_Start_07_00");	//�� ���� ���������, ��?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Valentino_Start_10_00");	//�� ���� ���������, ��?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Valentino_Start_14_00");	//�� ���� ���������, ��?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Valentino_Start_16_00");	//�� ���� ���������, ��?
	};
	AI_Output(self,other,"DIA_Valentino_Start_12_01");	//��, ��� �, ��������� ������������. ����� ��� ��� ����� ������, ��-��.
	AI_Output(self,other,"DIA_Valentino_Start_12_02");	//� ������� ����� � ����� ���� ��������, ������ � �������� ��������.
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Valentino_Start_12_03");	//� ��� ������ ���� ��...
			AI_Output(other,self,"DIA_Valentino_Start_16_04");	//(�����) ������� �� ������.
	};
};

// ==============================================
instance DIA_Valentino_MR_Perm(C_INFO)
{
	nr = 50;
	npc = VLK_421_Valentino;
	condition = DIA_Valentino_MR_Perm_cond;
	information = DIA_Valentino_MR_Perm_info;
	description = "� ����� ��������...";
	permanent = TRUE;
};
func int DIA_Valentino_MR_Perm_cond()
{
	if (Npc_KnowsInfo(other,DIA_Valentino_Start))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Valentino_MR_Perm.description = "� ������ ��������...";
		};
		return TRUE;
	};
};
func void DIA_Valentino_MR_Perm_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Valentino_MR_Perm_03_00");	//� ����� ��������...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Valentino_MR_Perm_07_00");	//� ����� ��������...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Valentino_MR_Perm_10_00");	//� ����� ��������...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Valentino_MR_Perm_14_00");	//� ����� ��������...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Valentino_MR_Perm_16_00");	//� ������ ��������...
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Valentino_MR_Perm_12_01");	//���-���, �� �������� ���� ������ ����������.
		AI_Output(self,other,"DIA_Valentino_MR_Perm_12_02");	//����� �����, � ��� �������� �������� ���� �����!
	}
	Else	{
		AI_Output(self,other,"DIA_Valentino_MR_Perm_12_03");	//(����������) �������, ����� �������, � ���� ����� ���� ��������.
		if (Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TAVERN01_BACKROOM") < 500)	{
			AI_Output(self,other,"DIA_Valentino_MR_Perm_12_04");	//������ �������, � �� ��� �������.
		}
		else	{
			AI_Output(self,other,"DIA_Valentino_MR_Perm_12_05");	//������� � ������� �������� ������� �������, � �� ��� �������.
		};
		AI_Output(other,self,"DIA_Valentino_MR_Perm_16_06");	//�-� ���, ����� �� ����...
	};
	AI_StopProcessInfos(self);
};
