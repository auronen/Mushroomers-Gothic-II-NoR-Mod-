

/////////////////////////////////////// ������ //////////////////////////////////////////////
// ==============================================
instance DIA_Meldor_Rupert_Hello(C_INFO)
{
	nr = 1;
	npc = VLK_415_Meldor;
	condition = DIA_Meldor_Rupert_MR_Hello_cond;
	information = DIA_Meldor_Rupert_MR_Hello_info;
	important = TRUE;
};
func int DIA_Meldor_Rupert_MR_Hello_cond()
{
	if (C_HeroIs_Rupert() && !MIS_Rupert_Debts_Paid[Creditor_Lehmar])	{
		return TRUE;
	};
};
func void DIA_Meldor_Rupert_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Meldor_Rupert_MR_Hello_09_00");	//��, ��� ��� ����... ������! 
	AI_Output(self,other,"DIA_Meldor_Rupert_MR_Hello_09_01");	//����� ����� ���� ������. ���� �� �����, �� ������ ��� ���� �����.
	AI_StopProcessInfos(self);
};

/////////////////////////////////////// ����� //////////////////////////////////////////////
// ==============================================
instance DIA_Meldor_Elena_LehmarWaits(C_INFO)
{
	nr = 2;
	npc = VLK_415_Meldor;
	condition = DIA_Meldor_Elena_LehmarWaits_cond;
	information = DIA_Meldor_Elena_LehmarWaits_info;
	important = TRUE;
};
func int DIA_Meldor_Elena_LehmarWaits_cond()
{
	if (C_HeroIs_Elena()
		 && MIS_Elena_Present_CupLehmarGot && (MIS_Elena_Present_LehamarAskedCupBack == 0))	{
		return TRUE;
	};
};
func void DIA_Meldor_Elena_LehmarWaits_info()
{
	AI_Output(self,other,"DIA_Meldor_Rupert_LehmarWaits_09_00");	//��! ����� ����� � ����� ����������. 
	AI_Output(self,other,"DIA_Meldor_Rupert_LehmarWaits_09_01");	//�� ����, ��� ��� � ��� �� ����, �� ����� ����������� � ��� ������� �� �����.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"FREETIME");
};
