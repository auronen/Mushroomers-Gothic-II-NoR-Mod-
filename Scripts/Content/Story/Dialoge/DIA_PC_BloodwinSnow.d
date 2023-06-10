
instance DIA_BloodwinSnow_EXIT(DIA_Proto_End)
{
	npc = PC_BloodwinSnow;
};

//=====================================================
instance DIA_BloodwinSnow_Hallo(C_INFO)
{
	npc = PC_BloodwinSnow;		nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_BloodwinSnow_Hallo_info;
	important = TRUE;
};
func void DIA_BloodwinSnow_Hallo_info()
{
	if (other.aivar[AIV_Gender] == MALE) {
		AI_Output(self,other,"DIA_BloodwinSnow_Hallo");	 //������ ��������. ������� ����� � �� ������, ������? ������ ���-�� ��������? (����������) � ���� ��� �������.
	}
	else {
		AI_Output(self,other,"DIA_BloodwinSnow_Hallo_F");	//������ ���������. ������� ����� � �� ������, ������? ������ ���-�� ��������? (����������) � ���� ��� �������.
	};
	B_GiveAchievement_SnowStudio();
	B_LogNote(TOPIC_SnowStudio, TOPIC_SnowStudio_BloodwinSnow);
};

//=====================================================
instance DIA_BloodwinSnow_WhoAU(C_INFO)
{
	npc = PC_BloodwinSnow;		nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_BloodwinSnow_WhoAU_info;
	description = "�� ���?";
};
func void DIA_BloodwinSnow_WhoAU_info()
{
	AI_Output(self,other,"DIA_BloodwinSnow_WhoYou");	 //� - ���������� Snow Studio, �������� �����, ������������� � ������ ������� �������.
};

//=====================================================
instance DIA_BloodwinSnow_YouLike(C_INFO)
{
	npc = PC_BloodwinSnow;		nr = 3;
	condition = DIA_BloodwinSnow_YouLike_cond;
	information = DIA_BloodwinSnow_YouLike_info;
	description = "����� ��������� ��� ������?";
};
func int DIA_BloodwinSnow_YouLike_cond()
{
	if (Npc_KnowsInfo(other,DIA_BloodwinSnow_WhoAU))	{
		return TRUE;
	};
};
func void DIA_BloodwinSnow_YouLike_info()
{
	AI_Output(self,other,"DIA_BloodwinSnow_YouLike");	//...������ �����, ���� ����������� ������� � ���� ����?
	Info_ClearChoices(DIA_BloodwinSnow_YouLike);
	Info_AddChoice(DIA_BloodwinSnow_YouLike,"���, ����� ���� �������.",DIA_BloodwinSnow_YouLike_No);
	Info_AddChoice(DIA_BloodwinSnow_YouLike,"��, � � ��������!",DIA_BloodwinSnow_YouLike_Yes);
};
func void DIA_BloodwinSnow_YouLike_Yes()
{
	AI_Output(self,other,"DIA_BloodwinSnow_YouLike_Yes");	//��� �, � ��� ��� �������. ����� ��������� ��� ������, �� �� ���� �������. �� ������� ����������� �� Snow ���� � ������ �������.
	Info_ClearChoices(DIA_BloodwinSnow_YouLike);
};
func void DIA_BloodwinSnow_YouLike_No()
{
	BloodwinSnow_KillPlayer = 100;
	if (other.aivar[AIV_Gender] == MALE) {
		AI_Output(self,other,"DIA_BloodwinSnow_YouLike_No");	//��� ������ ���? �� ��������� ���� � ���������, ��� ������� ������������ ������? ����� ���, �����! �������� �� �����!
	}
	else {
		AI_Output(self,other,"DIA_BloodwinSnow_YouLike_No_F");	//��� ������ ���? �� ��������� ���� � ���������, ��� ���� ������� ������������ ������? ����� ��, �����! �������� �� �����!
	};
	self.aivar[AIV_Temper] = self.aivar[AIV_Temper] & ~TEMPER_NoFightParker;
	AI_StopProcessInfos(self);
			Wld_InsertNpc(PC_SnowStudioActor_01,"NW_MAGECAVE_14");
			AI_GotoWP(PC_SnowStudioActor_01,"NW_MAGECAVE_15");
			Wld_InsertNpc(PC_SnowStudioActor_02,"NW_MAGECAVE_11");
			AI_GotoWP(PC_SnowStudioActor_02,"NW_MAGECAVE_16");
};

//=====================================================
var int DIA_BloodwinSnow_Inter_Cnt;
instance DIA_BloodwinSnow_Inter(C_INFO)
{
	npc = PC_BloodwinSnow;		nr = 4;
	condition = DIA_BloodwinSnow_YouLike_cond;
	information = DIA_BloodwinSnow_Inter_info;
	description = "�������� ���-������ ���������� �� ����� ������.";
	permanent = TRUE;
};
func void DIA_BloodwinSnow_Inter_info()
{
	if (DIA_BloodwinSnow_Inter_Cnt == 0) {
		AI_Output(self,other,"DIA_BloodwinSnow_inter_1");	//���... ������ ���, �� ������� ������� Snow ������, ���������� ����� ��� ��������. � � ������� �� ������.
	}
	else if (DIA_BloodwinSnow_Inter_Cnt == 1) {
		AI_Output(self,other,"DIA_BloodwinSnow_inter_2");	//���... ���������� ���, ����� ���������� ����, � �������� ������� �� �����. � ������ ��� ������ ����� ������ �� ����� ���������� ���.
	}
	else {
		AI_Output(self,other,"DIA_BloodwinSnow_inter_3");	//���... � ������ �� ��, ��� �������� - ���������� ���, �����-���� ���������� ����? � ��� ������ ������ � �������� ����� ������.
	};
	DIA_BloodwinSnow_Inter_Cnt += 1;
	if (DIA_BloodwinSnow_Inter_Cnt > 2) {
		DIA_BloodwinSnow_Inter_Cnt = 0;
	};
};
