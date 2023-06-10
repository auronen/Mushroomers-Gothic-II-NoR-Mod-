
instance DIA_Halvor_EXIT(DIA_Proto_End)
{
	npc = VLK_469_Halvor;
};

/////////////////////////////////////// ����� //////////////////////////////////////////////

// ==============================================
instance DIA_Halvor_Elena_AboutCup(C_INFO)
{
	nr = 1;
	npc = VLK_469_Halvor;
	condition = DIA_Halvor_Elena_AboutCup_cond;
	information = DIA_Halvor_Elena_AboutCup_info;
	description = "������ �������, �� ������ ������ ��� ������� ���-���...";
};
func int DIA_Halvor_Elena_AboutCup_cond()
{
	if (C_HeroIs_Elena()
		&& MIS_Elena_Present_KardifTold
		&& !MIS_Elena_Present_CupLehmarGot)	{
		return TRUE;
	};
};
func void DIA_Halvor_Elena_AboutCup_info()
{
		AI_Output(other,self,"DIA_Halvor_Elena_AboutCup_16_00");	//������ �������, �� ������ ������ ��� ������� ���-���...
	AI_Output(self,other,"DIA_Halvor_Elena_AboutCup_06_01");	//��� ������ ���� ����������?
		AI_Output(other,self,"DIA_Halvor_Elena_AboutCup_16_02");	//� ������ ���� ����� ��������, �� �� ����� �� ������ ��� ���������.
	AI_Output(self,other,"DIA_Halvor_Elena_AboutCup_06_03");	//� ���� �����������, �... ��������� ������.
	AI_Output(self,other,"DIA_Halvor_Elena_AboutCup_06_04");	//�� ��� ����� ������ 500 �������. � ������ ������.
	MIS_Elena_Present_HalvorAsked = TRUE;
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_HalvorAsked);
};

// ==============================================
instance DIA_Halvor_Elena_OrderCup(C_INFO)
{
	nr = 2;
	npc = VLK_469_Halvor;
	condition = DIA_Halvor_Elena_OrderCup_cond;
	information = DIA_Halvor_Elena_OrderCup_info;
	description = "������� ��� ����� ��������. (500 ���.)";
	permanent = TRUE;
};
func int DIA_Halvor_Elena_OrderCup_cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Halvor_Elena_AboutCup) && (MIS_Elena_Present_HalvorPayedDay == 0)
		&& !MIS_Elena_Present_CupLehmarGot && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Halvor_Elena_OrderCup_info()
{
	AI_Output(other,self,"DIA_Halvor_Elena_OrderCup_16_00");	//������� ��� ����� ��������.
	if (C_NpcHasGold(other,500))	{
		B_GiveInvItems(other,self,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Halvor_Elena_OrderCup_06_01");	//������, ������� ������ ����� ������.
		MIS_Elena_Present_HalvorPayedDay = Wld_GetDay() + 1;
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_HalvorPayed);
	}
	else	{
		AI_Output(self,other,"DIA_Halvor_Elena_OrderCup_06_02");	//������ ������.
	};
};

// ==============================================
instance DIA_Halvor_Elena_TakeCup(C_INFO)
{
	nr = 3;
	npc = VLK_469_Halvor;
	condition = DIA_Halvor_Elena_TakeCup_cond;
	information = DIA_Halvor_Elena_TakeCup_info;
	important = TRUE;
};
func int DIA_Halvor_Elena_TakeCup_cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond()
		&& (MIS_Elena_Present_HalvorPayedDay > 0) && (Wld_GetDay_Shifted(19) + 1 > MIS_Elena_Present_HalvorPayedDay)
		&& !MIS_Elena_Present_CupLehmarGot)	{
		return TRUE;
	};
};
func void DIA_Halvor_Elena_TakeCup_info()
{
	if (Wld_IsTime(18,0,4,0))	{
		AI_Output(self,other,"DIA_Halvor_Elena_TakeCup_06_01");	//��� ���� �����.
	}
	else	{
		AI_Output(self,other,"DIA_Halvor_Elena_TakeCup_06_02");	//� �� ������, ������� ����� ������!
		AI_Output(self,other,"DIA_Halvor_Elena_TakeCup_06_03");	//�����, ����� ���� �����.
	};
	B_GiveInvItems(self,other,ItMi_FaithfulnessCup_02,1);
	MIS_Elena_Present_CupLehmarGot = TRUE;
	B_GivePlayerXP(XP_Elena_CupLehmarGot);
	B_LogEntry_Elena_CupGot(TOPIC_Elena_Present_CupLehmarGot);
	AI_Output(self,other,"DIA_Halvor_Elena_TakeCup_06_04");	//�� ������ ��� �������! ���� ��...
	B_StartOtherRoutine(VLK_484_Lehmar,"WAIT");
	B_StartOtherRoutine(VLK_415_Meldor,"WAIT");
};

/////////////////////////////////////// ���� //////////////////////////////////////////////

// ==============================================
instance DIA_Halvor_Sarah_HaveRum(C_INFO)
{
	npc = VLK_469_Halvor;			nr = 20;
	condition = DIA_Halvor_Sarah_HaveRum_cond;
	information = DIA_Halvor_Sarah_HaveRum_info;
	description = "� ���� �������� ��� ������ ����?";
};
func int DIA_Halvor_Sarah_HaveRum_cond()
{
	if (C_HeroIs_Sarah()
		&& MIS_Sarah_BadHabit_MoeAsked && !MIS_Sarah_BadHabit_MoeTalked)	{
		return TRUE;
	};
};
func void DIA_Halvor_Sarah_HaveRum_info()
{
		AI_Output(other,self,"DIA_Halvor_Sarah_HaveRum_16_00");	//� ���� �������� ��� ������ ����?
	AI_Output(self,other,"DIA_Halvor_Sarah_HaveRum_06_01");	//� �� ����� �� ����?
		AI_Output(other,self,"DIA_Halvor_Sarah_HaveRum_16_02");	//�� ����� ����, ���� ���� �����, ��� �� �� ������ ����� ��������.
	AI_Output(self,other,"DIA_Halvor_Sarah_HaveRum_06_03");	//������ � ���� ���!
	AI_StopProcessInfos(self);
};

// ==============================================
instance DIA_Halvor_Sarah_HaveRum2(C_INFO)
{
	npc = VLK_469_Halvor;			nr = 21;
	condition = DIA_Halvor_Sarah_HaveRum2_cond;
	information = DIA_Halvor_Sarah_HaveRum2_info;
	description = "� ����� ���-���� �������� ���������? (50 ���.)";
	permanent = TRUE;
};
func int DIA_Halvor_Sarah_HaveRum2_cond()
{
	if (C_HeroIs_Sarah() && Wld_IsTime(19,30,4,0)
		 && MIS_Sarah_BadHabit_MoeAsked && Npc_KnowsInfo(other,DIA_Halvor_Sarah_HaveRum)
		 && !MIS_Sarah_BadHabit_MoeTalked && !Npc_HasItems(other,ItFo_Addon_Rum))	{
		return TRUE;
	};
};
func void DIA_Halvor_Sarah_HaveRum2_info()
{
		AI_Output(other,self,"DIA_Halvor_Sarah_HaveRum2_16_00");	//� ����� ���-���� �������� ���������?
	AI_Output(self,other,"DIA_Halvor_Sarah_HaveRum2_06_01");	//���� � ���� ���� 50 �������, �� � �����.
	if (C_NpcHasGold(other,50))	{
			AI_Output(other,self,"DIA_Halvor_Sarah_HaveRum2_16_02");	//����.
		AI_Output(self,other,"DIA_Halvor_Sarah_HaveRum2_06_03");	//�����, � ��������. � ���� �������� ��� ��������� �� ������ �������.
		B_GiveGold(other,self,50);
		B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
	}
	else	{
			AI_Output(other,self,"DIA_Halvor_Sarah_HaveRum2_16_04");	//���.
		AI_Output(self,other,"DIA_Halvor_Sarah_HaveRum2_06_05");	//������, � ���� ���.
	};
};
//*/

/////////////////////////////////////// ��� /////////////////////////////////////////////

// ����� �������� ==============================================================
instance DIA_Halvor_YourPost(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 30;
	condition = DIA_Halvor_YourPost_cond;
	information = DIA_Halvor_YourPost_info;
	description = "��, � ���� ��� ���� �������!";
};
func int DIA_Halvor_YourPost_cond()
{
	if (MIS_KhorinisPost_Stage_FromBootlegger
		&& Npc_HasItems(other,ItMi_Packet_Halvor))	{
		return TRUE;
	};
};
func void DIA_Halvor_YourPost_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_YourPost_03_00");	//��, � ���� ��� ���� �������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_YourPost_07_00");	//��, � ���� ��� ���� �������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_10_00");	//��, � ���� ��� ���� �������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_14_00");	//��, � ���� ��� ���� �������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_YourPost_16_00");	//��, � ���� ��� ���� �������!
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_06_01");	//�������?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_YourPost_03_02");	//�� ��, �� ����� ������ �� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_YourPost_07_02");	//�� ��, �� ����� ������ �� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_10_02");	//�� ��, �� ����� ������ �� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_14_02");	//�� ��, �� ����� ������ �� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_YourPost_16_02");	//�� ��, �� ����� ������ �� ����.
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_06_03");	//����! ������� �� ���� ������� �� ���� ����.
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Halvor_YourPost_06_04");	//����� ����.
	Info_ClearChoices(DIA_Halvor_YourPost);
	Info_AddChoice(DIA_Halvor_YourPost,"������� �������!",DIA_Halvor_YourPost_MoneyFirst);
	Info_AddChoice(DIA_Halvor_YourPost,"�����.",DIA_Halvor_YourPost_Give);
};
//----------------------------------------------
func void DIA_Halvor_YourPost_Give()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_YourPost_Give_03_00");	//�����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_YourPost_Give_07_00");	//�����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_Give_10_00");	//�����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_Give_14_00");	//�����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_YourPost_Give_16_00");	//�����.
	};
	B_GiveInvItems(other,self,ItMi_Packet_Halvor,1);
	MIS_KhorinisPost_HalvorGotPacket = TRUE;
	//������� �������
	B_UseItem(self,ItMi_Packet_Halvor);
	AI_Output(self,other,"DIA_Halvor_YourPost_Give_06_01");	//�������! � ����� �� ����.
	B_GivePlayerXP(XP_KhorinisPost_HalvorDelivered);
	MIS_KhorinisPost_HalvorDelivered = TRUE;
	// � ������� ��������?
	if (MIS_KhorinisPost_HalvorPayed == 0)	{
		B_LogEntry(TOPIC_KhorinisPost,ConcatStrings(TOPIC_KhorinisPost_HalvorDelivered,TOPIC_KhorinisPost_HalvorPayed0));
	}
	else if (MIS_KhorinisPost_HalvorPayed == 20)	{
		MIS_KhorinisPost = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_SUCCESS,ConcatStrings(TOPIC_KhorinisPost_HalvorDelivered,TOPIC_KhorinisPost_HalvorPayed20));
	}
	else if (MIS_KhorinisPost_HalvorPayed == 30)	{
		MIS_KhorinisPost = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_SUCCESS,ConcatStrings(TOPIC_KhorinisPost_HalvorDelivered,TOPIC_KhorinisPost_HalvorPayed30));
	}
	else	{	//�� ������ ������ ����!
		MIS_KhorinisPost = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_SUCCESS,TOPIC_KhorinisPost_HalvorDelivered);
	};
	Info_ClearChoices(DIA_Halvor_YourPost);
};
//----------------------------------------------
func void DIA_Halvor_YourPost_MoneyFirst()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_03_00");	//������� �������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_07_00");	//������� �������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_10_00");	//������� �������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_14_00");	//������� �������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_16_00");	//������� �������!
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirs_06_01");	//���?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_03_02");	//��� �������, ��� �� �������� � ������ �������. ���� ��� ���� ��� ������, ��� ��� ������� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_07_02");	//��� �������, ��� �� �������� � ������ �������. ���� ��� ���� ��� ������, ��� ��� ������� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_10_02");	//��� �������, ��� �� �������� � ������ �������. ���� ��� ���� ��� ������, ��� ��� ������� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_14_02");	//��� �������, ��� �� �������� � ������ �������. ���� ��� ���� ��� ������, ��� ��� ������� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst_16_02");	//��� �������, ��� �� �������� � ������ �������. ���� ��� ���� ��� ������, ��� ��� ������� ������.
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst_06_03");	//�� ������. � ��� ���� 20 �������. ����?
	Info_ClearChoices(DIA_Halvor_YourPost);
	Info_AddChoice(DIA_Halvor_YourPost,"��� ������� 100!",DIA_Halvor_YourPost_MoneyFirst100);
	Info_AddChoice(DIA_Halvor_YourPost,"���������.",DIA_Halvor_YourPost_MoneyFirst50);
	Info_AddChoice(DIA_Halvor_YourPost,"��������.",DIA_Halvor_YourPost_MoneyFirst30);
	Info_AddChoice(DIA_Halvor_YourPost,"����.",DIA_Halvor_YourPost_MoneyFirst20);
};
//----------------------------------------------
func void DIA_Halvor_YourPost_MoneyFirst20()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst20_03_00");	//����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst20_07_00");	//����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst20_10_00");	//����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst20_14_00");	//����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst20_16_00");	//����.
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst20_06_01");	//��� ���� 20 �������.
	MIS_KhorinisPost_HalvorPayed = 20;
	B_GiveInvItems(self,other,ItMi_Gold,20);
	DIA_Halvor_YourPost_Give();
};
//----------------------------------------------
func void DIA_Halvor_YourPost_MoneyFirst30()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst30_03_00");	//��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst30_07_00");	//��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst30_10_00");	//��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst30_14_00");	//��������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst30_16_00");	//��������.
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst30_06_01");	//�� �����. ����� ������.
	MIS_KhorinisPost_HalvorPayed = 30;
	B_GiveInvItems(self,other,ItMi_Gold,30);
	DIA_Halvor_YourPost_Give();
};
//----------------------------------------------
func void DIA_Halvor_YourPost_MoneyFirst50()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst50_03_00");	//���������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst50_07_00");	//���������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst50_10_00");	//���������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst50_14_00");	//���������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst50_16_00");	//���������.
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst50_06_01");	//��� ������� �����.
	Info_ClearChoices(DIA_Halvor_YourPost);
	Info_AddChoice(DIA_Halvor_YourPost,"���������.",DIA_Halvor_YourPost_MoneyFirst50);
	Info_AddChoice(DIA_Halvor_YourPost,"��������.",DIA_Halvor_YourPost_MoneyFirst30);
};

//----------------------------------------------
func void DIA_Halvor_YourPost_MoneyFirst100()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst100_03_00");	//��� ������� 100!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst100_07_00");	//��� ������� 100!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst100_10_00");	//��� ������� 100!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst100_14_00");	//��� ������� 100!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_YourPost_MoneyFirst100_16_00");	//��� ������� 100!
	};
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst100_06_01");	//(���������) �������?!
	AI_Output(self,other,"DIA_Halvor_YourPost_MoneyFirst100_06_02");	//(�������) �����. ������� ����� ���� �����, � ���-������ ��������.
	MIS_KhorinisPost_HalvorPayed = 100;	//������ ��������
	MIS_KhorinisPost_HalvorTime100 = Wld_GetFullTime() + 2*60;
	Info_ClearChoices(DIA_Halvor_YourPost);
	B_StartOtherRoutine(self,"MONEY");
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_PortalRoom_Public;
	B_LogEntry(TOPIC_KhorinisPost,TOPIC_KhorinisPost_HalvorWait);
};

// ==============================================================
var int DIA_Halvor_Money100_Once;
instance DIA_Halvor_Money100(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 31;
	condition = DIA_Halvor_Money100_cond;
	information = DIA_Halvor_Money100_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Halvor_Money100_cond()
{
	if (DIA_WhenAsked_cond() 
		 && (Npc_GetDistToWp(self,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02") > TA_DIST_SELFWP_MAX)
		 && (MIS_KhorinisPost_HalvorTime100 < Wld_GetFullTime()) && (MIS_KhorinisPost_HalvorPayed == 100)
		 && !DIA_Halvor_GreedIsBad_Once && !MIS_KhorinisPost_HalvorGotPacket)	{
		return TRUE;
	};
};
func void DIA_Halvor_Money100_info()
{
	if (!DIA_Halvor_Money100_Once)	{
		AI_Output(self,other,"DIA_Halvor_Money100_06_00");	//� ������ 100 �������.
		DIA_Halvor_Money100_Once = TRUE;
	};
	AI_Output(self,other,"DIA_Halvor_Money100_06_01");	//������� ��� ����?
	if (Npc_HasItems(other,ItMi_Packet_Halvor))	{
		B_StartOtherRoutine(VLK_494_Attila,"TOHALVOR");
		AI_Teleport(VLK_494_Attila,VLK_494_Attila.wp);//"NW_CITY_HABOUR_POOR_AREA_PATH_01_01");
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Halvor_Money100_03_02");	//��.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Halvor_Money100_07_02");	//��.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Halvor_Money100_10_02");	//��.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Halvor_Money100_14_02");	//��.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Halvor_Money100_16_02");	//��.
		};
		AI_Output(self,other,"DIA_Halvor_Money100_06_03");	//�������.
		AI_Output(self,other,"DIA_Halvor_Money100_06_04");	//��� �� ����.
		AI_StopProcessInfos(self);
		MIS_KhorinisPost_HalvorGoWithMe = TRUE;
		AI_StartState(self,ZS_Guide_Player,1,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
	}
	else	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Halvor_Money100_03_07");	//���.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Halvor_Money100_07_07");	//���.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Halvor_Money100_10_07");	//���.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Halvor_Money100_14_07");	//���.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Halvor_Money100_16_07");	//���.
		};
		MIS_KhorinisPost_HalvorGoWithMe = FALSE;
		AI_Output(self,other,"DIA_Halvor_Money100_06_08");	//��� �������!
		AI_StopProcessInfos(self);
	};
};

// ==============================================================
var int DIA_Halvor_GreedIsBad_Once;
instance DIA_Halvor_GreedIsBad(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 32;
	condition = DIA_Halvor_GreedIsBad_cond;
	information = DIA_Halvor_GreedIsBad_info;
	important = TRUE;
};
func int DIA_Halvor_GreedIsBad_cond()
{
	if (MIS_KhorinisPost_HalvorGoWithMe
		 && (Npc_GetDistToWp(self,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02") <= TA_DIST_SELFWP_MAX))	{
		return TRUE;
	};
};
func void DIA_Halvor_GreedIsBad_info()
{
	DIA_Halvor_GreedIsBad_Once = TRUE;
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] & ~IGNORE_PortalRoom_Public;
		AI_Output(self,other,"DIA_Halvor_GreedIsBad_06_00");	//���� ������� �� ��������, ��� �������� - ��� �����? 100 ������� �� �������� ������, ��!
		AI_Output(self,other,"DIA_Halvor_GreedIsBad_06_01");	//� ������ �� ������ ������, ������� ���� �� �����������, � �� ���� ����������. � ����� � ��� ����� ������ ��, �� ���� ��� �� ����������!
		Info_ClearChoices(DIA_Halvor_GreedIsBad);
	MIS_KhorinisPost_HalvorGoWithMe = FALSE;
	if (Npc_HasItems(other,ItMi_Packet_Halvor))	{
		Info_AddChoice(DIA_Halvor_GreedIsBad,"�� �������� �� ����� �������!",DIA_Halvor_GreedIsBad_Yes);
	}
	else	{
		Info_AddChoice(DIA_Halvor_GreedIsBad,"����� �����? ��� � ���� �������� ������!",DIA_Halvor_GreedIsBad_NoPacket);
	};
		Info_AddChoice(DIA_Halvor_GreedIsBad,"������ � ���� �� �����!",DIA_Halvor_GreedIsBad_No);
};
func void DIA_Halvor_GreedIsBad_Yes()
{
	B_StartOtherRoutine(self,"START");
	B_StartOtherRoutine(VLK_494_Attila,"START");
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_Yes_03_00");	//�� �������� �� ����� �������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_Yes_07_00");	//�� �������� �� ����� �������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_Yes_10_00");	//�� �������� �� ����� �������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_Yes_14_00");	//�� �������� �� ����� �������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_Yes_16_00");	//�� �������� �� ����� �������!
	};
	B_GiveInvItems(other,self,ItMi_Packet_Halvor,1);
	MIS_KhorinisPost_HalvorGotPacket = TRUE;
	AI_Output(self,other,"DIA_Halvor_GreedIsBad_Yes_06_01");	//��-��! ��������� ��� ��������.
	AI_Output(self,other,"DIA_Halvor_GreedIsBad_Yes_06_02");	//� ������ ����������!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,7);
	Npc_SetRefuseTalk(VLK_494_Attila,20);
	MIS_KhorinisPost = LOG_FAILED;
	B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_Halvor100Give);
};
func void DIA_Halvor_GreedIsBad_NoPacket()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_NoPacket_03_00");	//����� �����? ��� � ���� �������� ������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_NoPacket_07_00");	//����� �����? ��� � ���� �������� ������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_NoPacket_10_00");	//����� �����? ��� � ���� �������� ������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_NoPacket_14_00");	//����� �����? ��� � ���� �������� ������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_NoPacket_16_00");	//����� �����? ��� � ���� �������� ������!
	};
	//����� ������ ����� �� ����� � �������� ���������?
	If (Npc_CanSeeItem(self, ItMi_Packet_Halvor) || Npc_CanSeeItem(VLK_494_Attila, ItMi_Packet_Halvor)
		|| Npc_GetDistToItem(self, ItMi_Packet_Halvor) < PERC_DIST_INTERMEDIAT
	)	{
		AI_Output(self,other,"DIA_Halvor_GreedIsBad_NoPacket_06_01");	//�� ������ ���� �������?
		//��������� �����
		AI_StopLookAt(self);
		AI_GotoItem(self, ItMi_Packet_Halvor);
		AI_TakeItem(self, ItMi_Packet_Halvor);
		AI_GotoNpc(self, other);
		AI_TurnToNpc(self,other);
		AI_LookAtNpc(self,other);
		AI_Output(self,other,"DIA_Halvor_GreedIsBad_NoPacket_06_02");	//���� ������, ���� � ������.
		Npc_SetRefuseTalk(self,7);
		MIS_KhorinisPost = LOG_FAILED;
		MIS_KhorinisPost_HalvorGotPacket = TRUE;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_Halvor100Give);
		Npc_SetRefuseTalk(VLK_494_Attila,20);
		B_StartOtherRoutine(VLK_494_Attila,"START");
	}
	else {
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Halvor_GreedIsBad_NoPacket_06_03m");	//�������, ����� �����?
		}
		else	{
			AI_Output(self,other,"DIA_Halvor_GreedIsBad_NoPacket_06_03f");	//�������, ����� �����?
		};
		AI_Output(self,other,"DIA_Halvor_GreedIsBad_NoPacket_06_04");	//� ��� ����� ����� ���, ������ �� �����������. �� ������� �������� ���� ����.
		Wld_RemoveItem(ItMi_Packet_Halvor);
		MIS_KhorinisPost = LOG_FAILED;
		MIS_KhorinisPost_HalvorFight = TRUE;
		B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_Halvor100Fight);
	};
	AI_StopProcessInfos(self);
};
func void DIA_Halvor_GreedIsBad_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_No_03_00");	//������ � ���� �� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_No_07_00");	//������ � ���� �� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_No_10_00");	//������ � ���� �� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_No_14_00");	//������ � ���� �� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_GreedIsBad_No_16_00");	//������ � ���� �� �����.
	};
	AI_Output(self,other,"DIA_Halvor_GreedIsBad_No_06_01");	//����, ������ � ���� ������ ���. �������� �������� ������� ��� � ���� ������ �����.
	AI_StopProcessInfos(self);
	MIS_KhorinisPost = LOG_FAILED;
	MIS_KhorinisPost_HalvorFight = TRUE;
	B_LogEntry_Status(TOPIC_KhorinisPost,LOG_FAILED,TOPIC_KhorinisPost_Halvor100Fight);
};

// ==============================================================
instance DIA_Halvor_AboutMoney(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 33;
	condition = DIA_Halvor_AboutMoney_cond;
	information = DIA_Halvor_AboutMoney_info;
	description = "� ��� ������ �����?";
};
func int DIA_Halvor_AboutMoney_cond()
{
	if (MIS_KhorinisPost_HalvorDelivered && (MIS_KhorinisPost_HalvorPayed == 0))	{
		return TRUE;
	};
};
func void DIA_Halvor_AboutMoney_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_AboutMoney_03_00");	//� ��� ������ �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_AboutMoney_07_00");	//� ��� ������ �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_10_00");	//� ��� ������ �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_14_00");	//� ��� ������ �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_16_00");	//� ��� ������ �����?
	};
	AI_Output(self,other,"DIA_Halvor_AboutMoney_06_01");	//����� �����?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_AboutMoney_03_02");	//����� �� �������� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_AboutMoney_07_02");	//����� �� �������� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_10_02");	//����� �� �������� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_14_02");	//����� �� �������� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_16_02");	//����� �� �������� �������.
	};
	AI_Output(self,other,"DIA_Halvor_AboutMoney_06_03");	//��, ���������, � �� �����������, ��� �������� ������� ��� � �� ��������. � ���� ������ ������ ��� �����.
	AI_Output(self,other,"DIA_Halvor_AboutMoney_06_04");	//�� ���� ������, � ���� ���������� ���� ���� ����. � ������ �� ����������.
	Info_ClearChoices(DIA_Halvor_YourPost);
	Info_AddChoice(DIA_Halvor_AboutMoney,"���, ��� �� ��� ����.",DIA_Halvor_AboutMoney_NoJob);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Halvor_AboutMoney,"� ��������. ��� �� ����?",DIA_Halvor_AboutMoney_WhatJob);
	}
	else	{
		Info_AddChoice(DIA_Halvor_AboutMoney,"� ��������. ��� �� ����?",DIA_Halvor_AboutMoney_WhatJob);
	};
};
func void DIA_Halvor_AboutMoney_NoJob()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_AboutMoney_NoJob_03_00");	//���, ��� �� ��� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_AboutMoney_NoJob_07_00");	//���, ��� �� ��� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_NoJob_10_00");	//���, ��� �� ��� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_NoJob_14_00");	//���, ��� �� ��� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_NoJob_16_00");	//���, ��� �� ��� ����.
	};
	AI_Output(self,other,"DIA_Halvor_AboutMoney_NoJob_06_01");	//��, ����� �� ��������.
	Info_ClearChoices(DIA_Halvor_AboutMoney);
	MIS_KhorinisPost = LOG_SUCCESS;
	B_LogEntry_Status(TOPIC_KhorinisPost, LOG_FAILED, TOPIC_KhorinisPost_HalvorNoJob);
};
func void DIA_Halvor_AboutMoney_WhatJob()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_AboutMoney_WhatJob_03_00");	//� ��������. ��� �� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_AboutMoney_WhatJob_07_00");	//� ��������. ��� �� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_WhatJob_10_00");	//� ��������. ��� �� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_WhatJob_14_00");	//� ��������. ��� �� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_AboutMoney_WhatJob_16_00");	//� ��������. ��� �� ����?
	};
	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_01");	//� ��� ���� ���-����� ������, � �� �������� �� �����������.
	B_GiveInvItems(self,other,ItRi_ValentinosRing,1);
	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_02");	//��� ������ �������� ��������� �� �������� ��������. �� �������� ���� 100 �������.
	B_GiveInvItems(self,other,ItAt_SharkSkin,1);
	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_03");	//���� �������� ����� - ��������. �� ����� �� ����, �� �������������� � 250 �������.
	B_GiveInvItems(self,other,ItMi_Nugget,3);
	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_04");	//� ��� ����� ���������� ���� �������� ������ � �������� �������. �� ������ 50 ������� �� ������.
	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_05");	//����� 500 �������. 50 �� ��� ����.
//	AI_Output(self,other,"DIA_Halvor_AboutMoney_WhatJob_06_06");	//� �� ������������. ������ ������� � ��� �� ���� 450 �������.
	Info_ClearChoices(DIA_Halvor_AboutMoney);
	MIS_KhorinisPost_Stage_FromHalvor = TRUE;
	B_LogEntry(TOPIC_KhorinisPost, TOPIC_KhorinisPost_HalvorJob);
	//��� ����?
	if (Npc_IsDead(VLK_421_Valentino)) {
		B_CloseLogOnDeath(VLK_421_Valentino);
	};

	if (Npc_IsDead(VLK_405_Fernando)) {
		B_CloseLogOnDeath(VLK_405_Fernando);
	};

	if (Npc_IsDead(VLK_407_Hakon)) {
		B_CloseLogOnDeath(VLK_407_Hakon);
	};

};

// ==============================================================
instance DIA_Halvor_MissionAccomplished(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 34;
	condition = DIA_Halvor_MissionAccomplished_cond;
	information = DIA_Halvor_MissionAccomplished_info;
	description = "� ����� ������.";
};
func int DIA_Halvor_MissionAccomplished_cond()
{
	if (MIS_KhorinisPost_Stage_FromHalvor
		 && MIS_KhorinisPost_ValentinoDelivered && MIS_KhorinisPost_FernandoDelivered && MIS_KhorinisPost_HakonDelivered)	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Halvor_MissionAccomplished.description = "� ������� ������.";
		};
		return TRUE;
	};
};
func void DIA_Halvor_MissionAccomplished_GiveGold()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_GiveGold_03_00");	//��� ���� 450 �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_GiveGold_07_00");	//��� ���� 450 �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_GiveGold_10_00");	//��� ���� 450 �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_GiveGold_14_00");	//��� ���� 450 �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_GiveGold_16_00");	//��� ���� 450 �������.
	};
	B_GiveInvItems(other,self,ItMi_Gold,450);
	if (MIS_KhorinisPost_HalvorShareDay >= Wld_GetDay())	{
		AI_Output(self,other,"DIA_Halvor_MissionAccomplished_GiveGold_06_01");	//������� ����� � ����� ����.
	}
	else	{
		AI_Output(self,other,"DIA_Halvor_MissionAccomplished_GiveGold_06_02");	//�������-��.
	};
	B_GivePlayerXP(XP_KhorinisPost_HalvorShare);
	MIS_KhorinisPost_HalvorShareGiven = TRUE;
	//���������?
	B_LogEntry_KhorinisPost_SuccessAll(TOPIC_KhorinisPost_HalvorGive250);
};
func void DIA_Halvor_MissionAccomplished_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_03_00");	//� ����� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_07_00");	//� ����� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_10_00");	//� ����� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_14_00");	//� ����� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_MissionAccomplished_16_00");	//� ������� ������.
	};
	if (C_NpcHasGold(other, 450))	{
		DIA_Halvor_MissionAccomplished_GiveGold();
	}
	else	{
		AI_Output(self,other,"DIA_Halvor_MissionAccomplished_06_01");	//� ��� ��� ������?!
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Halvor_MissionAccomplished_03_02");	//�... ������ �������.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Halvor_MissionAccomplished_07_02");	//�... ������ �������.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Halvor_MissionAccomplished_10_02");	//�... ������ �������.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Halvor_MissionAccomplished_14_02");	//�... ������ �������.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Halvor_MissionAccomplished_16_02");	//�... ������ �������.
		};
		AI_StopProcessInfos(self);
	};
};
// ==============================================================
instance DIA_Halvor_Give450(C_INFO)
{
	npc = VLK_469_Halvor;				nr = 35;
	condition = DIA_Halvor_Give450_cond;
	information = DIA_Halvor_MissionAccomplished_GiveGold;
	description = "��� ���� 450 �������.";
};
func int DIA_Halvor_Give450_cond()
{
	if (MIS_KhorinisPost_Stage_FromHalvor 
		 && Npc_KnowsInfo(other,DIA_Halvor_MissionAccomplished) && !MIS_KhorinisPost_HalvorShareGiven
		 && C_NpcHasGold(other,450))	{
		return TRUE;
	};
};

// ==============================================================


// �������� =====================================================
instance DIA_Halvor_Hello(C_INFO)
{
	nr = 50;
	npc = VLK_469_Halvor;
	condition = DIA_WhenAsked_cond;
	information = DIA_Halvor_MR_Hello_info;
	important = TRUE;
};
func void DIA_Halvor_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Halvor_MR_Hello_06_00");	//����, ����! ����!!!
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Halvor);
};
//-----------------------------------------
instance DIA_Halvor_Trade(C_INFO)
{
	nr = 52;
	npc = VLK_469_Halvor;
	condition = DIA_NoCond_cond;
	information = DIA_Halvor_Trade_info;
	description = "������ ���� ����.";
	trade = TRUE;
	permanent = TRUE;
};
func void DIA_Halvor_Trade_info()
{
	B_GiveTradeInv_Halvor(self);
};
//-----------------------------------------
instance DIA_Halvor_FreshFish(C_INFO)
{
	nr = 51;
	npc = VLK_469_Halvor;
	condition = DIA_Halvor_FreshFish_cond;
	information = DIA_Halvor_FreshFish_info;
	description = "� ����-�� � ���� ������?";
	permanent = TRUE;
};
func int DIA_Halvor_FreshFish_cond()
{
	return TRUE;
};
func void DIA_Halvor_FreshFish_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Halvor_FreshFish_03_00");	//� ����-�� � ���� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Halvor_FreshFish_07_00");	//� ����-�� � ���� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Halvor_FreshFish_10_00");	//� ����-�� � ���� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Halvor_FreshFish_14_00");	//� ����-�� � ���� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Halvor_FreshFish_16_00");	//� ����-�� � ���� ������?
	};
	AI_Output(self,other,"DIA_Halvor_FreshFish_06_01");	//�������! ������������. ������ ��������.
};
