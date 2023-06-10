
instance DIA_Rengaru_EXIT(DIA_Proto_End)
{
	npc = VLK_492_Rengaru;
};

instance DIA_Rengaru_NoTalk(C_INFO)
{
	nr = 1;
	npc = VLK_492_Rengaru;
	condition = DIA_Rengaru_NoTalk_cond;
	information = DIA_Rengaru_NoTalk_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Rengaru_NoTalk_cond()
{
	if ((Moe_Sign == FALSE) && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Rengaru_NoTalk_info()
{
	AI_Output(self,other,"DIA_Rengaru_NoTalk_07_00");	//���, ����� �������? ����� �����!
	AI_StopProcessInfos(self);
};

//=========================================================
instance DIA_Rengaru_LetsDrink(C_INFO)
{
	nr = 2;
	npc = VLK_492_Rengaru;
	condition = DIA_Rengaru_LetsDrink_cond;
	information = DIA_Rengaru_LetsDrink_info;
	important = TRUE;
};
func int DIA_Rengaru_LetsDrink_cond()
{
	if (Moe_Sign == TRUE)	{
		return TRUE;
	};
};
func void DIA_Rengaru_LetsDrink_info()
{
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_07_00");	//��, � ���� ��� ������ �� �����! ���������?
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_07_01");	//����� ������, ������� � ������!
	Info_ClearChoices(DIA_Rengaru_LetsDrink);
	Info_AddChoice(DIA_Rengaru_LetsDrink,"� ������ ���.",DIA_Rengaru_LetsDrink_No);
	Info_AddChoice(DIA_Rengaru_LetsDrink,"�������!",DIA_Rengaru_LetsDrink_Yes);
	
};
func void DIA_Rengaru_LetsDrink_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No_03_00");	//� ������ ���.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No_07_00");	//� ������ ���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No_10_00");	//� ������ ���.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No_14_00");	//� ������ ���.
//	} else	{							//�����/����
//		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No_16_00");	//� ������ ���.
	};
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_No_07_01");	//�� ����� ����, ��� �� �����! ��� ��� ��� ������, ��� �� ������ � ������� ��������?
	Info_AddChoice(DIA_Rengaru_LetsDrink,"� �� ������ - � ������ ���.",DIA_Rengaru_LetsDrink_No2);
};

func void DIA_Rengaru_LetsDrink_No2()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No2_03_00");	//� �� ������ - � ������ ���.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No2_07_00");	//� �� ������ - � ������ ���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No2_10_00");	//� �� ������ - � ������ ���.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No2_14_00");	//� �� ������ - � ������ ���.
//	} else	{							//�����/����
//		AI_Output(other,self,"DIA_Rengaru_LetsDrink_No2_16_00");	//� �� ������� - � ������ ���.
	};
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_No2_07_01");	//��, �����. �� ���� ����������� - � ������ ���.
	AI_StopProcessInfos(self);
};

func void DIA_Rengaru_LetsDrink_Yes()
{
	Rengaru_Hocus = TRUE;
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_Yes_03_00");	//�������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_Yes_07_00");	//�������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_Yes_10_00");	//�������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Rengaru_LetsDrink_Yes_14_00");	//�������!
//	} else	{							//�����/����
//		AI_Output(other,self,"DIA_Rengaru_LetsDrink_Yes_16_00");	//�������!
	};
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_Yes_07_01");	//�������!
	AI_TurnToNpc(self,VLK_431_Kardif);
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_Yes_07_02");	//��, ������, ��� ��� ����-������ �� ����� �������!
	AI_TurnToNpc(self,other);
	CreateInvItems(self,ItFo_Addon_Grog,2);
	B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	AI_Output(self,other,"DIA_Rengaru_LetsDrink_Yes_07_03");	//���� ��������!
	B_UseItem(self,ItFo_Addon_Grog);
	B_UseItem(other,ItFo_Addon_Grog);
	AI_StopProcessInfos(self);
};

//=========================================================
instance DIA_Rengaru_LetsDrinkYes(C_INFO)
{
	nr = 3;
	npc = VLK_492_Rengaru;
	condition = DIA_Rengaru_LetsDrinkYes_cond;
	information = DIA_Rengaru_LetsDrink_Yes;
	description = "�������!";
};
func int DIA_Rengaru_LetsDrinkYes_cond()
{
	if ((Moe_Sign == TRUE) && Npc_KnowsInfo(other,DIA_Rengaru_LetsDrink))	{
		return TRUE;
	};
};

