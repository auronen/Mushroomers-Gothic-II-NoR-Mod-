
instance DIA_Fenia_EXIT(DIA_Proto_End)
{
	npc = VLK_476_Fenia;
};

/////////////////////////////////////// ����� //////////////////////////////////////////////

// ==============================================
instance DIA_Fenia_Elena_AboutCup(C_INFO)
{
	nr = 10;
	npc = VLK_476_Fenia;
	condition = DIA_Fenia_Elena_AboutCup_cond;
	information = DIA_Fenia_Elena_AboutCup_info;
	description = "�� �� ������, ��� ����� ��� �� ��� ������ ���-��� �������?";
};
func int DIA_Fenia_Elena_AboutCup_cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lehmar_Elena_AboutCup)
		&& !Npc_KnowsInfo(other,DIA_Kardif_Elena_AboutCup)
		&& !MIS_Elena_Present_CupLehmarGot && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Fenia_Elena_AboutCup_info()
{
		AI_Output(other,self,"DIA_Fenia_Elena_AboutCup_16_00");	//�� �� ������, ��� ����� ��� �� ��� ������ ���-��� �������?
	AI_Output(self,other,"DIA_Fenia_Elena_AboutCup_17_01");	//����� �����������, �������?
	AI_Output(self,other,"DIA_Fenia_Elena_AboutCup_17_02");	//�������� �������� � ������� � ������, �� ����� ��� ��� ���� �����. ���� �� ���������, �������.
};

/////////////////////////////////////// ���� //////////////////////////////////////////////

// ==============================================
instance DIA_Fenia_Sarah_Hello(C_INFO)
{
	nr = 20;
	npc = VLK_476_Fenia;
	condition = DIA_Fenia_Sarah_MR_Hello_cond;
	information = DIA_Fenia_Sarah_MR_Hello_info;
	important = TRUE;
};
func int DIA_Fenia_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah()
		&& DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Fenia_Sarah_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Fenia_Sarah_MR_Hello_17_01");	//����! ��������� ���� �� ������.
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Fenia);
};
// ==============================================
instance DIA_Fenia_Sarah_HowAU(C_INFO)
{
	nr = 21;
	npc = VLK_476_Fenia;
	condition = DIA_Fenia_Sarah_HowAU_cond;
	information = DIA_Fenia_Sarah_HowAU_info;
	description = "��� ����?";
};
func int DIA_Fenia_Sarah_HowAU_cond()
{
	if (C_HeroIs_Sarah()
		&& (MIS_Sarah_OldFriends == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Fenia_Sarah_HowAU_info()
{
		AI_Output(other,self,"DIA_Fenia_Sarah_HowAU_16_00");	//��� ����?
	AI_Output(self,other,"DIA_Fenia_Sarah_HowAU_17_01");	//�� ��� ������... ����� ���, ����� �� �������, ������ �� �������� ������ ���� ��� ������ ����.
	AI_Output(self,other,"DIA_Fenia_Sarah_HowAU_17_02");	//�������, ���� �����������. � � ������ ����� �� ��������?
	AI_Output(self,other,"DIA_Fenia_Sarah_HowAU_17_03");	//� ����������� ��� ����� - ���� ���� ��������, ��� ����� ��������� ���.
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Fenia);
};

// ==============================================
instance DIA_Fenia_Sarah_HaveRum(C_INFO)
{
	npc = VLK_476_Fenia;			nr = 22;
	condition = DIA_Fenia_Sarah_HaveRum_cond;
	information = DIA_Fenia_Sarah_HaveRum_info;
	description = "� ���� �������� ��� ������ ����?";
};
func int DIA_Fenia_Sarah_HaveRum_cond()
{
	if (C_HeroIs_Sarah() && Wld_IsTime(19,30,4,0) && !Npc_IsNear(self,VLK_469_Halvor)
		 && MIS_Sarah_BadHabit_MoeAsked
		 && !MIS_Sarah_BadHabit_MoeTalked && !Npc_HasItems(other,ItFo_Addon_Rum))	{
		return TRUE;
	};
};
func void DIA_Fenia_Sarah_HaveRum_info()
{
		AI_Output(other,self,"DIA_Fenia_Sarah_HaveRum_16_00");	//� ���� �������� ��� ������ ����? ��� ����� ����.
	AI_Output(self,other,"DIA_Fenia_Sarah_HaveRum_17_01");	//�����-�����?
		AI_Output(other,self,"DIA_Fenia_Sarah_HaveRum_16_02");	//�����-�����-�����.
	AI_Output(self,other,"DIA_Fenia_Sarah_HaveRum_17_03");	//�� �����, � ���� ����� ������ ������, �������� ���������. ������ �� ������, ��� �� �� �����, ����� ���� ������ ������ �����.
	B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
		AI_Output(other,self,"DIA_Fenia_Sarah_HaveRum_16_04");	//������� � ���� ������?
	AI_Output(self,other,"DIA_Fenia_Sarah_HaveRum_17_05");	//(�����������) �� ���? � ���� ������ �� ������.
};
//*/

/////////////////////////////////////// ��� /////////////////////////////////////////////
// �������� ==============================================
instance DIA_Fenia_Hello(C_INFO)
{
	nr = 0;
	npc = VLK_476_Fenia;
	condition = DIA_Fenia_MR_Hello_cond;
	information = DIA_Fenia_MR_Hello_info;
	important = TRUE;
};
func int DIA_Fenia_MR_Hello_cond()
{
	if (!C_HeroIs_Sarah()
		&& DIA_WhenAsked_cond())	{	//����� ����
		return TRUE;
	};
};
func void DIA_Fenia_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Fenia_MR_Hello_17_00");	//�������, �� �����, �������!
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Fenia);
};
//-----------------------------------------
instance DIA_Fenia_Trade(C_INFO)
{
	nr = 90;
	npc = VLK_476_Fenia;
	condition = DIA_NoCond_cond;
	information = DIA_Fenia_Trade_info;
	description = "������ ��� ���� ������.";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Fenia_Trade_info()
{
	B_GiveTradeInv_Fenia(self);
};
