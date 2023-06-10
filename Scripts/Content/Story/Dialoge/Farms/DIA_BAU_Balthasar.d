

instance DIA_Balthasar_EXIT(DIA_Proto_End)
{
	npc = BAU_932_Balthasar;
};

///////////////////////////// ���� ///////////////////////////////
//-----------------------------------------
instance DIA_Balthasar_Till_HowOurSheep(C_INFO)
{
	npc = BAU_932_Balthasar;			nr = 10;
	condition = DIA_Balthasar_Till_HowOurSheep_cond;
	information = DIA_Balthasar_Till_HowOurSheep_info;
	description = "��� ���� ������?";
	permanent = TRUE;
};
func int DIA_Balthasar_Till_HowOurSheep_cond()
{
	if (C_HeroIs_Till())	{
		return TRUE;
	};
};
func void DIA_Balthasar_Till_HowOurSheep_info()
{
		AI_Output(other,self,"DIA_Balthasar_Till_HowOurSheep_14_00");	//��� ���� ������?
	AI_Output(self,other,"DIA_Balthasar_Till_HowOurSheep_05_01");	//��� �������� - ��� ��� ��������. ������ ��� �������...
};

///////////////////////////// ����� ///////////////////////////////
//-----------------------------------------
instance DIA_Balthasar_Elena_HowYourSheep(C_INFO)
{
	npc = BAU_932_Balthasar;			nr = 20;
	condition = DIA_Balthasar_Elena_HowYourSheep_cond;
	information = DIA_Balthasar_Elena_HowYourSheep_info;
	description = "��� ���� ����, ���������?";
	permanent = TRUE;
};
func int DIA_Balthasar_Elena_HowYourSheep_cond()
{
	if (C_HeroIs_Elena()
		 || (!C_HeroIs_Till() && Npc_KnowsInfo(other,DIA_Balthasar_IsItYourSheep)))	{
		return TRUE;
	};
};
func void DIA_Balthasar_Elena_HowYourSheep_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Balthasar_HowYourSheep_03_00");	//��� ���� ����, ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Balthasar_HowYourSheep_07_00");	//��� ���� ����, ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Balthasar_HowYourSheep_10_00");	//��� ���� ����, ���������?
	} else	{							//����
		AI_Output(other,self,"DIA_Balthasar_Elena_HowYourSheep_16_00");	//��� ���� ����, ���������?
	};
	AI_Output(self,other,"DIA_Balthasar_Elena_HowYourSheep_05_01");	//�������� ������.
};

///////////////////////////// ��� ///////////////////////////////
//-----------------------------------------
instance DIA_Balthasar_IsItYourSheep(C_INFO)
{
	npc = BAU_932_Balthasar;			nr = 1;
	condition = DIA_Balthasar_IsItYourSheep_cond;
	information = DIA_Balthasar_IsItYourSheep_info;
	description = "��� ���� ����?";
};
func int DIA_Balthasar_IsItYourSheep_cond()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Balthasar_IsItYourSheep_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Balthasar_IsItYourSheep_03_00");	//��� ���� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Balthasar_IsItYourSheep_07_00");	//��� ���� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Balthasar_IsItYourSheep_10_00");	//��� ���� ����?
	} else	{							//����
		AI_Output(other,self,"DIA_Balthasar_IsItYourSheep_16_00");	//��� ���� ����?
	};
	AI_Output(self,other,"DIA_Balthasar_IsItYourSheep_05_01");	//��� ���� ����������� ������. � � �� ���� � �������� �� ����.
	AI_Output(self,other,"DIA_Balthasar_IsItYourSheep_05_02");	//��� ��� ���������.
};
