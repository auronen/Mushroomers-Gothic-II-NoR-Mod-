
instance DIA_Cornelius_EXIT(DIA_Proto_End)
{
	npc = VLK_401_Cornelius;
};

//===================================================
instance DIA_Cornelius_MR_Perm(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 1;
	condition = DIA_WhenAsked_cond;
	information = DIA_Cornelius_MR_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};
func void DIA_Cornelius_MR_Perm_Info()
{
	AI_Output(self,other,"DIA_Cornelius_MR_Perm_13_00");	//����� ������� ������ �� 10, 15 � 23 ���� ������� ������. ������ �� ����� �� �������, ��� �� 10 ����...
	AI_Output(self,other,"DIA_Cornelius_MR_Perm_13_01");	//� ����� ������, ����������� ������ ���. ��������� ����� ��� �����������.
	AI_StopProcessInfos(self);
};