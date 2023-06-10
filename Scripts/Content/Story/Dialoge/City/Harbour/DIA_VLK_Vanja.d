
instance DIA_Vanja_EXIT(DIA_Proto_End)
{
	npc = VLK_491_Vanja;
};

//////////////////////////////////���////////////////////////////////////////
instance DIA_Vanja_MR_Perm(C_INFO)
{
	npc = VLK_491_Vanja;			nr = 1;
	condition = DIA_Vanja_MR_Perm_cond;
	information = DIA_Vanja_MR_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Vanja_MR_Perm_cond()
{
	if (!Bromor_Paid && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Vanja_MR_Perm_info()
{
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Vanja_Female_Hello_16_01");	//���� �� ����� ��� ����. ��� �� ����� ��������.
	}
	else if(C_HeroIs_Till())	{
		AI_Output(self,other,"DIA_Vanja_Till_Hello_16_01");	//�����, ��� ����� �����.
	}
	else	{
		AI_Output(self,other,"DIA_Vanja_Male_Hello_16_01");	//���� ������ ������������� ������� - �������� ������� � ��������.
	};
	AI_StopProcessInfos(self);
};
//==============================================
instance DIA_Vanja_DoJob(C_INFO)
{
	npc = VLK_491_Vanja;			nr = 2;
	condition = DIA_Vanja_DoJob_cond;
	information = DIA_Vanja_DoJob_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Vanja_DoJob_cond()
{
	if (Bromor_Paid && (Npc_GetDistToWP(self,self.wp) < TA_DIST_SELFWP_MAX) && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Vanja_DoJob_info()
{
	AI_UnequipArmor(self);
	AI_Output(self,other,"DIA_Vanja_DoJob_16_01");	//��� ����, �����. ����������, � � ������� ���� �� ����� ������������...
	Vanja_Ready = TRUE;
	AI_StopProcessInfos(self);
};

