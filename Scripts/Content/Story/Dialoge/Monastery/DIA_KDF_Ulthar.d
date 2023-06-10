
instance DIA_Ulthar_EXIT(DIA_Proto_End)
{
	npc = KDF_502_Ulthar;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Ulthar_MRPerm_Odo(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 1;
	condition = DIA_Ulthar_MRPerm_Odo_Cond;
	information = DIA_Ulthar_MRPerm_Odo_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Ulthar_MRPerm_Odo_Cond()
{
	if (C_HeroIs_Odo() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Ulthar_MRPerm_Odo_Info()
{
	AI_Output(self,other,"DIA_Ulthar_MRPerm_Odo_05_00");	//���� ���������� � ������ ���������, �� ������ ��� ������ ������� ����.
	AI_StopProcessInfos(self);
};

