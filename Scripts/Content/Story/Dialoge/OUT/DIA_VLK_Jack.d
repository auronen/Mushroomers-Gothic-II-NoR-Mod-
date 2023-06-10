
instance DIA_Jack_EXIT(DIA_Proto_End)
{
	npc = VLK_444_Jack;
};

///////////////////////////// ��� ///////////////////////////////
//-----------------------------------------
instance DIA_Jack_Hello(C_INFO)
{
	npc = VLK_444_Jack;			nr = 1;
	condition = DIA_WhenAsked_cond;
	information = DIA_Jack_MR_Hello_info;
	important = TRUE;
};
func void DIA_Jack_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Jack_MR_Hello_12_01");	//����� ������ ���� ���� �������, ���������� �����?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Jack_MR_Hello_03_00");	//����� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Jack_MR_Hello_07_00");	//����� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Jack_MR_Hello_10_00");	//�������. ����� ����� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Jack_MR_Hello_14_00");	//����� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Jack_MR_Hello_16_00");	//�� �����.
	};
};
//-----------------------------------------
instance DIA_Jack_WhoAreU(C_INFO)
{
	npc = VLK_444_Jack;			nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Jack_WhoAreU_info;
	description = "�� ���������� �����?";
};
func void DIA_Jack_WhoAreU_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Jack_WhoAreU_03_00");	//�� ���������� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Jack_WhoAreU_07_00");	//�� ���������� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Jack_WhoAreU_10_00");	//�� ���������� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Jack_WhoAreU_14_00");	//�� ���������� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Jack_WhoAreU_16_00");	//�� ���������� �����?
	};
	AI_Output(self,other,"DIA_Jack_WhoAreU_12_01");	//����� ���. � ��������� � ������ ������� �� �����, � ����� ������ ����� � ���� �����.
	AI_Output(self,other,"DIA_Jack_WhoAreU_12_02");	//��� ���� ��� �� �����, � �����, � ���� ���������� ���� ������.
	AI_Output(self,other,"DIA_Jack_WhoAreU_12_03");	//� ������ �� � ���� ���������, ��� ��� �������� � ������.
};
//-----------------------------------------
instance DIA_Jack_WhoIsMary(C_INFO)
{
	npc = VLK_444_Jack;			nr = 3;
	condition = DIA_Jack_WhoIsMary_cond;
	information = DIA_Jack_WhoIsMary_info;
	description = "� ��� ����� ����?";
};
func int DIA_Jack_WhoIsMary_cond()
{
	if (Npc_KnowsInfo(other,DIA_Jack_WhoAreU))	{
		return TRUE;
	};
};
func void DIA_Jack_WhoIsMary_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Jack_WhoIsMary_03_00");	//� ��� ����� ����? ���� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Jack_WhoIsMary_07_00");	//� ��� ����� ����? ���� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Jack_WhoIsMary_10_00");	//� ��� ����� ����? ���� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Jack_WhoIsMary_14_00");	//� ��� ����� ����? ���� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Jack_WhoIsMary_16_00");	//� ��� ����� ����? ���� ����?
	};
	AI_Output(self,other,"DIA_Jack_WhoIsMary_12_01");	//����� � ��� �������. � ��� ������ ���� ����.
	AI_Output(self,other,"DIA_Jack_WhoIsMary_12_02");	//�� � ��� ���������� �� ��� ����. � � ��� �, ������ �����, ������� ������� ����� ����.
	AI_Output(self,other,"DIA_Jack_WhoIsMary_12_03");	//� ��� ������� ������ � ���������� �����.
};
//-----------------------------------------
instance DIA_Jack_Dangers(C_INFO)
{
	npc = VLK_444_Jack;			nr = 3;
	condition = DIA_NoCond_cond;
	information = DIA_Jack_Dangers_info;
	description = "��� ������?";
};
func void DIA_Jack_Dangers_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Jack_Dangers_03_00");	//��� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Jack_Dangers_07_00");	//��� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Jack_Dangers_10_00");	//��� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Jack_Dangers_14_00");	//��� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Jack_Dangers_16_00");	//��� ������?
	};
	AI_Output(self,other,"DIA_Jack_Dangers_12_01");	//������ ����� ��������� �� ������������ � ����� �����.
	AI_Output(self,other,"DIA_Jack_Dangers_12_02");	//�� ���� �� ���������� � ���, �� ��������� �� ��� ����������.
};
//-----------------------------------------
instance DIA_Jack_HowIsMary(C_INFO)
{
	npc = VLK_444_Jack;			nr = 10;
	condition = DIA_Jack_HowIsMary_cond;
	information = DIA_Jack_HowIsMary_info;
	description = "��� �������� ����?";
	permanent = TRUE;
};
func int DIA_Jack_HowIsMary_cond()
{
	if (Npc_KnowsInfo(other,DIA_Jack_WhoIsMary))	{
		return TRUE;
	};
};
func void DIA_Jack_HowIsMary_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Jack_HowIsMary_03_00");	//��� �������� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Jack_HowIsMary_07_00");	//��� �������� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Jack_HowIsMary_10_00");	//��� �������� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Jack_HowIsMary_14_00");	//��� �������� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Jack_HowIsMary_16_00");	//��� �������� ����?
	};
	AI_Output(self,other,"DIA_Jack_HowIsMary_12_01");	//������, ��� � ������.
};
//-----------------------------------------
instance DIA_Jack_AULonely(C_INFO)
{
	npc = VLK_444_Jack;			nr = 11;
	condition = DIA_Jack_AULonely_cond;
	information = DIA_Jack_AULonely_info;
	description = "���� ����� �� �������?";
	permanent = TRUE;
};
func int DIA_Jack_AULonely_cond()
{
	if (Npc_KnowsInfo(other,DIA_Jack_WhoAreU))	{
		return TRUE;
	};
};
func void DIA_Jack_AULonely_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Jack_AULonely_03_00");	//���� ����� �� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Jack_AULonely_07_00");	//���� ����� �� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Jack_AULonely_10_00");	//���� ����� �� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Jack_AULonely_14_00");	//���� ����� �� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Jack_AULonely_16_00");	//���� ����� �� �������?
	};
	AI_Output(self,other,"DIA_Jack_AULonely_12_01");	//���, ���� ���� �� ����.
	AI_Output(self,other,"DIA_Jack_AULonely_12_02");	//�� � ������ ��� ���� �� ��� ����� � ����, �� ����, ��� ��� ���� ���������� � ������� ������.
};

