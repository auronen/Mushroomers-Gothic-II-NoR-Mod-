
instance DIA_Serpentes_EXIT(DIA_Proto_End)
{
	npc = KDF_501_Serpentes;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Serpentes_GoWork_Odo(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 1;
	condition = DIA_Serpentes_GoWork_Odo_Cond;
	information = DIA_Serpentes_GoWork_Odo_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Serpentes_GoWork_Odo_Cond()
{
	if (C_HeroIs_Odo() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Serpentes_GoWork_Odo_Info()
{
	AI_Output(self,other,"DIA_Serpentes_GoWork_Odo_10_00");	//������� ������ �������������, ���������.
	AI_Output(self,other,"DIA_Serpentes_GoWork_Odo_10_01");	//������ ������� ������ �� ������� ���������� ��������.
	AI_StopProcessInfos(self);
};

