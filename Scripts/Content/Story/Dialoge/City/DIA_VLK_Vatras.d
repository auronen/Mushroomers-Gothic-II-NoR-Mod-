
instance DIA_Vatras_EXIT(DIA_Proto_End)
{
	npc = VLK_439_Vatras;
};


/////////////////////////////////////// ���� /////////////////////////////////////////////

//������ ��� ��������
func void B_GivePlates2Vatras(var C_NPC slf, var C_NPC oth)
{
	var int cnt;	cnt = Npc_HasItems(oth,ItWr_OldStonePlate_Erol);
	
	if (cnt == 0)	{return;};
	if (MIS_Erol_Plates_GivenCnt == 0) {
		MIS_Erol_Plates_GivenDay1 = Wld_GetDay();
		AI_Output(self,other,"DIA_Vatras_Erol_GivePlates_05_00");	//������ �� ���, ��������, � ����� �������� ���-�� �������� ��� �������.
	};
	//B_GiveInvItems(oth,slf,ItWr_OldStonePlate_Erol,cnt);
	ItemTrans_items[0] = ItWr_OldStonePlate_Erol;
	ItemTrans_amount[0] = cnt;
	B_ItemsTransaction(oth,slf);
	
	MIS_Erol_Plates_GivenCnt += cnt;
	//B_GiveInvItems(slf,oth,ItMi_Gold,cnt * MIS_Erol_Plates_Pay);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = cnt * MIS_Erol_Plates_Pay;
	//B_GiveInvItems(slf,oth,ItPo_Health_02,cnt);
	ItemTrans_items[1] = ItPo_Health_02;
	ItemTrans_amount[1] = cnt;
	if (MIS_Erol_Plates_GivenCnt % 5 == 0)	{
		//B_GiveInvItems(slf,oth,ItPo_Health_03,cnt / 5 + 1);
		ItemTrans_items[2] = ItPo_Health_03;
		ItemTrans_amount[2] = cnt / 5 + 1;
	}
	else	{
		//B_GiveInvItems(slf,oth,ItPo_Health_03,cnt / 5);
		ItemTrans_items[2] = ItPo_Health_03;
		ItemTrans_amount[2] = cnt / 5;
	};
	
	B_ItemsTransaction(slf,oth);
	B_GivePlayerXP(XP_Erol_Plate * cnt);
	B_GiveAchievement_Erol_Archeologist();
};

//===================================================
instance DIA_Vatras_Erol_Hello(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_Erol_MR_Hello_Cond;
	information = DIA_Vatras_Erol_MR_Hello_Info;
	description = "�����������, ����������� ���!";
};
func int DIA_Vatras_Erol_MR_Hello_Cond()
{
	if (C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_MR_Hello_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_MR_Hello_10_00");	//�����������, ����������� ���!
	AI_Output(self,other,"DIA_Vatras_Erol_MR_Hello_05_01");	//� ���� ����. ����� �� �� ���-�� ����� � ����� �����������?
	if (Npc_HasItems(other,ItWr_OldStonePlate_Erol) == 0)	{
			AI_Output(other,self,"DIA_Vatras_Erol_MR_Hello_10_02");	//���� ���.
		AI_Output(self,other,"DIA_Vatras_Erol_MR_Hello_05_03");	//����� ����.
	}
	else	{
		if (Npc_HasItems(other,ItWr_OldStonePlate_Erol) > 1)	{
			AI_Output(other,self,"DIA_Vatras_Erol_MR_Hello_10_04");	//��, ��� �������� ��������� �������� ��������.
		}
		else	{
			AI_Output(other,self,"DIA_Vatras_Erol_MR_Hello_10_05");	//��, � ����� �������� ��������.
		};
		AI_Output(self,other,"DIA_Vatras_Erol_MR_Hello_05_06");	//��������� ����. ��� �������� ����������� ���������.
		B_GivePlates2Vatras(self,other);
	};
};

//===================================================
instance DIA_Vatras_Erol_GivePlates(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 10;
	condition = DIA_Vatras_Erol_GivePlates_Cond;
	information = DIA_Vatras_Erol_GivePlates_Info;
	description = "(������ �������� ��������)";
	permanent = TRUE;
};
func int DIA_Vatras_Erol_GivePlates_Cond()
{
	if (C_HeroIs_Erol() 
		&& Npc_HasItems(other,ItWr_OldStonePlate_Erol) && Npc_KnowsInfo(other,DIA_Vatras_Erol_Hello))	
	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_GivePlates_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_GivePlates_10_00");	//� ���-��� ����� ��� ����.
	AI_Output(self,other,"DIA_Vatras_Erol_GivePlates_05_01");	//���������.
	B_GivePlates2Vatras(self,other);	
};

//===================================================
instance DIA_Vatras_Erol_AboutPlates(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_Erol_AboutPlates_Cond;
	information = DIA_Vatras_Erol_AboutPlates_Info;
	description = "��� ������ ����������� � ���� ���������?";
};
func int DIA_Vatras_Erol_AboutPlates_Cond()
{
	if (C_HeroIs_Erol() && Npc_KnowsInfo(other,DIA_Vatras_Erol_Hello))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_AboutPlates_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_AboutPlates_10_00");	//��� ������ ����������� � ���� ���������?
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_01");	//��� � ������� ���� �����, ��� �������� ����������� �������� ������, ��� ��� ����� ����� ����� �����.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_02");	//�������� �������� ���������������� �������� �� �� �����.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_03");	//�� �������� ������� � ������ �� ����� ������� � ������ �����.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_04");	//��� ��� ���������� ���������� ���� � ��������� �� �������� � ����.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_05");	//��������� �������� ������ �������� ������ �� �����, �������� � ��������������.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutPlates_05_06");	//����, ��� ��� ���������� ����������� �� ������. ���� ����� ��� ������, ���� ������������ �� ������� �������.
};

//===================================================
instance DIA_Vatras_Erol_OldLanguage(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_Erol_OldLanguage_Cond;
	information = DIA_Vatras_Erol_OldLanguage_Info;
	description = "�� ��� �� ������� ���� ����� �������?";
};
func int DIA_Vatras_Erol_OldLanguage_Cond()
{
	if (C_HeroIs_Erol() && Npc_KnowsInfo(other,DIA_Vatras_Erol_Hello))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_OldLanguage_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_OldLanguage_10_00");	//�� ��� �� ������� ���� ����� �������?
	AI_Output(self,other,"DIA_Vatras_Erol_OldLanguage_05_01");	//�����, � ��� �������� ���� � ������ ����� ����.
	AI_Output(self,other,"DIA_Vatras_Erol_OldLanguage_05_02");	//�������, ��� ������ �������� �� ���������, ��� ������ � ����� �� ���� ������������.
};

//*///********************************* ����� ************************************

//===================================================
instance DIA_Vatras_Erol_Help(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Vatras_Erol_Help_Cond;
	information = DIA_Vatras_Erol_Help_Info;
	description = "���� �����, � ����� ������ � ������������ �������?";
};
func int DIA_Vatras_Erol_Help_Cond()
{
	if (C_HeroIs_Erol() && Npc_KnowsInfo(other,DIA_Vatras_Erol_OldLanguage))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_Help_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_Help_10_00");	//���� �����, � ����� ������ � ������������ �������?
	AI_Output(self,other,"DIA_Vatras_Erol_Help_05_01");	//��, ������ �� � ���.
	AI_Output(self,other,"DIA_Vatras_Erol_Help_05_02");	//� ���������� ������� ����� �������, �� ����� ��-�������� ������ ���� � �����. ���� �� ������� ������ �� ������� �����...
	AI_Output(self,other,"DIA_Vatras_Erol_Help_05_03");	//���, � ���� ���� ��������, �� �������, ��������, �������� �����-�� �������.
	B_GiveInvItems(self,other,ItWr_Clayplate_Numbers,1);
	//UNFINISHED ������� ���������
	AI_Output(self,other,"DIA_Vatras_Erol_Help_05_04");	//����� �������� � ���� ����� �������� � ��� �������. ��� ������� ������ ������ ������ ���� ����� �����, ���������� ��� ���.
	AI_Output(self,other,"DIA_Vatras_Erol_Help_05_05");	//�������� ������, ��� ��� �� ����� � ��� �������� ������ ������, �������������� ��� ����.
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_Numbers);
};

//===================================================
instance DIA_Vatras_Erol_NumbersSolved(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 4;
	condition = DIA_Vatras_Erol_NumbersSolved_Cond;
	information = DIA_Vatras_Erol_NumbersSolved_Info;
	description = "��� ������� ���������, ��� ��� �� �����!";
};
func int DIA_Vatras_Erol_NumbersSolved_Cond()
{
	if (C_HeroIs_Erol() && Npc_KnowsInfo(other,DIA_Vatras_Erol_Help) && MIS_Erol_Plates_NumbersSolved
		 && Npc_HasItems(other,ItWr_Clayplate_Numbers_Result) && Npc_HasItems(other,ItWr_Clayplate_Numbers))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_NumbersSolved_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_NumbersSolved_10_00");	//��� ������� ���������, ��� ��� �� �����! ���, ��������, � ��� �������.
	B_GiveInvItems(other,self,ItWr_Clayplate_Numbers_Result,1);
	B_GiveInvItems(other,self,ItWr_Clayplate_Numbers,1);
	AI_Output(self,other,"DIA_Vatras_Erol_NumbersSolved_05_01");	//���, �������...
	AI_Output(self,other,"DIA_Vatras_Erol_NumbersSolved_05_02");	//��������� ���� �� ������. ������ ��� ����� � ������ � �������� �������. � ������� ��� ����������, ��� ���� ���������.
	//B_GiveInvItems(self,other,ItPo_Health_Addon_04,2);
	//B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	//B_GiveInvItems(self,other,ItSc_Thunderstorm,1);
	ItemTrans_items[0] = ItPo_Health_Addon_04;
	ItemTrans_amount[0] = 2;
	ItemTrans_items[1] = ItPo_Perm_Mana;
	ItemTrans_amount[1] = 1;
	ItemTrans_items[2] = ItSc_Thunderstorm;
	ItemTrans_amount[2] = 1;
	B_ItemsTransaction(self,other);
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_NumbersTold);
	B_GivePlayerXP(XP_Erol_NumbersSolved);	//���� ������ ����� ��������!
};

//*///********************************* ������ ************************************

//===================================================
instance DIA_Vatras_Erol_AboutAmul(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 6;
	condition = DIA_Vatras_Erol_AboutAmul_Cond;
	information = DIA_Vatras_Erol_AboutAmul_Info;
	important = TRUE;
};
func int DIA_Vatras_Erol_AboutAmul_Cond()
{
	if (C_HeroIs_Erol() && (MIS_Erol_Plates_GivenCnt > 0) 
		&& (MIS_Erol_Plates_GivenDay1 < Wld_GetDay_Shifted(6)))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_AboutAmul_Info()
{
	AI_Output(self,other,"DIA_Vatras_Erol_AboutAmul_05_00");	//����, � ���� ����. � ���� ��� ���� ����� �����.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutAmul_05_01");	//��� ������� �������� ���� �� ��������, ��� �� ��� ������.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutAmul_05_02");	//� ��� ����������� ����� ���������� ������ - ������ ������ ������� �������.
	AI_Output(self,other,"DIA_Vatras_Erol_AboutAmul_05_03");	//� �������, ��� ��� ����� ����� ���-�� �� �������. ��� �� ����� �������� ��� �������.
		AI_Output(other,self,"DIA_Vatras_Erol_AboutAmul_10_04");	//� ���������� �������� ���.
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_Amul);
	Wld_InsertItem(ItAm_MR_WispDetector_Lake,"FP_ITEM_AMUL_LAKE");
};
//===================================================
instance DIA_Vatras_Erol_WhereAmul(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 7;
	condition = DIA_Vatras_Erol_WhereAmul_Cond;
	information = DIA_Vatras_Erol_WhereAmul_Info;
	description = "��� ��� ������ ���� ������?";
};
func int DIA_Vatras_Erol_WhereAmul_Cond()
{
	if (C_HeroIs_Erol() && !MIS_Erol_Plates_AmulFound
		&& Npc_KnowsInfo(other,DIA_Vatras_Erol_AboutAmul))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_WhereAmul_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_WhereAmul_10_00");	//��� ��� ������ ���� ������?
	AI_Output(self,other,"DIA_Vatras_Erol_WhereAmul_05_01");	//� ���������, � �������� ��� ������� ��������. �� ��� � ����� ��������� ��� ���� �������� ��� ������.
	AI_Output(self,other,"DIA_Vatras_Erol_WhereAmul_05_02");	//�� ���� ���� ������ ������� - ���������� �� ������� ���������� ���������� ����.
	AI_Output(self,other,"DIA_Vatras_Erol_WhereAmul_05_03");	//�������, ��� ������� � �������.
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulWhere);
};
//===================================================
instance DIA_Vatras_Erol_Wisps(C_Info)
{
	npc = VLK_439_Vatras;							nr = 8;
	condition = DIA_Vatras_Erol_Wisps_Cond;
	information = DIA_Vatras_Erol_Wisps_Info;
	description = "�������� ��� �� ������ �������.";
};
func int DIA_Vatras_Erol_Wisps_Cond()
{
	if (C_HeroIs_Erol()
		&& Npc_KnowsInfo(other,DIA_Vatras_Erol_AboutAmul))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_Wisps_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_Wisps_10_00");	//�������� ��� �� ������ �������.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_01");	//������ ������� - ��� ������������ ������� ���������� �������.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_02");	//��� ��������� �� ���������� ����, � �� ��� ����� �������� ��������� � ���.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_03");	//������ ����� �������� ������ ��� �������, �� ������ ��������� ����� �� ����������.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_04");	//������, ���� ������ �� �����-�� �������� ������ ���� ����, �� ���������� ����������.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_05");	//��� ���������� �������� ���������� ��������� � ������� ������ ����.
	AI_Output(self,other,"DIA_Vatras_Erol_Wisps_05_06");	//����������� � ������ ����������, ��� ����� ��������� ������������ ����, �� ���������� �� ��������.
};
//===================================================
var int DIA_Vatras_Erol_ChargeAmul_DateTime;
instance DIA_Vatras_Erol_AmulFound(C_Info)
{
	npc = VLK_439_Vatras;							nr = 9;
	condition = DIA_Vatras_Erol_AmulFound_Cond;
	information = DIA_Vatras_Erol_AmulFound_Info;
	description = "� ����� ������ ������� �������.";
};
func int DIA_Vatras_Erol_AmulFound_Cond()
{
	if (C_HeroIs_Erol() && MIS_Erol_Plates_AmulFound
		&& Npc_HasItems(other,ItAm_MR_WispDetector_Lake))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_AmulFound_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_AmulFound_10_00");	//� ����� ������ ������� �������. �� ����� �� ��� ����� � �����.
	B_GiveInvItems(other,self,ItAm_MR_WispDetector_Lake,1);
	Npc_RemoveInvItem(self,ItAm_MR_WispDetector_Lake);
	AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_01");	//�����������! �����, ���� ������� �������� ������?
	//��������?
	if (Equip_WispDetector_Uncharged_Once)	{	//��
			AI_Output(other,self,"DIA_Vatras_Erol_AmulFound_10_02");	//���. ����� � ����� ������, ������ �� ���������.
		AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_03");	//�������. (����������� ����������� ������)
	}
	else	{	//���
			AI_Output(other,self,"DIA_Vatras_Erol_AmulFound_10_04");	//� �� �������.
		AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_05");	//�������� �� � ����, �� ����� ���������� ���������� ���������� ��������.
		AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_06");	//� �������� ������ ���.
		AI_Wait(self,1.1);
		B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulWearVatras);
		AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_07");	//�������, ������ �� ����������. (����������� ����������� ������)
	};
	AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_08");	//�������, ����� ���� � ������� ����������. ��� ����� ��������, ��� ������������ �� ����.
	AI_Output(self,other,"DIA_Vatras_Erol_AmulFound_05_09");	//����������, ����� �� ��� ������ �����.
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulGiven);
	B_GivePlayerXP(XP_Erol_AmulGiven);
	DIA_Vatras_Erol_ChargeAmul_DateTime = (24 * (Wld_GetDay() + 1) + 5) * 60 + 50;
};
//===================================================
instance DIA_Vatras_Erol_ChargeAmul(C_Info)
{
	npc = VLK_439_Vatras;							nr = 10;
	condition = DIA_Vatras_Erol_ChargeAmul_Cond;
	information = DIA_Vatras_Erol_ChargeAmul_Info;
	important = TRUE;
};
func int DIA_Vatras_Erol_ChargeAmul_Cond()
{
	if (C_HeroIs_Erol()	&& DIA_WhenAsked_cond()
		&& (DIA_Vatras_Erol_ChargeAmul_DateTime > 0)
		&& (Wld_GetFullTime() >= DIA_Vatras_Erol_ChargeAmul_DateTime)
		&& Npc_KnowsInfo(other,DIA_Vatras_Erol_AmulFound))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_ChargeAmul_Info()
{
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_00");	//� ����� ������ �������� ������. �� ��� ����� ����������� ���� ������.
		AI_Output(other,self,"DIA_Vatras_Erol_ChargeAmul_10_01");	//��� ����� �������?
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_02");	//������ ������ � ���� ������.
	//���� ������ � ������ �������
	//B_GiveInvItems(self,other,ItAm_MR_WispDetector_Uncharged,1);
	//B_GiveInvItems(self,other,ItMi_Vatras_AmulScroll,1);
	ItemTrans_items[0] = ItAm_MR_WispDetector_Uncharged;
	ItemTrans_amount[0] = 1;
	ItemTrans_items[1] = ItMi_Vatras_AmulScroll;
	ItemTrans_amount[1] = 1;
	B_ItemsTransaction(self, other);
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_03");	//������� ���� �������� ������������ ���������� ������� ����, � ����� ������� �� � ������.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_04");	//���� ����������� ��� ���� ����� ����.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_05");	//��������� � ����, ������ ��� ���� ������ �� ������� �����, � ������� �� �������. �� � ���� � ���� �����������.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_06");	//����� ������� ����, ������ � ����� ���� - ���� �� �������� ������. ������� ����� ���� � ������� � ������ ����������, ��� � ���� ���.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_07");	//� ���������� ���������� ������� �� ����� ���� ������ �������� � ������.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_08");	//��, �����, ����� ������������, ����� ������ ����������.
	AI_Output(self,other,"DIA_Vatras_Erol_ChargeAmul_05_09");	//�������� �������� ���� ���������� ������. ����� ������ ������ ����������.
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulCharge);
	Wld_InsertNpc(Wisp,"NW_TROLLAREA_PATH_71");
};
//===================================================
instance DIA_Vatras_Erol_LestReplaceOre(C_Info)
{
	npc = VLK_439_Vatras;							nr = 11;
	condition = DIA_Vatras_Erol_LestReplaceOre_Cond;
	information = DIA_Vatras_Erol_LestReplaceOre_Info;
	description = "� ������ �� ������ �� �������� ����?";
};
func int DIA_Vatras_Erol_LestReplaceOre_Cond()
{
	if (C_HeroIs_Erol()
		 && Npc_KnowsInfo(other,DIA_Vatras_Erol_AmulFound)
		 && !MIS_Erol_Plates_AmulReady && !MIS_Erol_Plates_AmulWorks && !Npc_HasItems(other,ItAm_MR_WispDetector_Ready))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_LestReplaceOre_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_LestReplaceOre_10_00");	//� ������ �� ������ �� �������� ����?
	AI_Output(self,other,"DIA_Vatras_Erol_LestReplaceOre_05_01");	//������ ���������� ������ �� ����� ������ ����. ����� ���� - ������������ ��������.
	AI_Output(self,other,"DIA_Vatras_Erol_LestReplaceOre_05_02");	//������ - ����� ���� ������ ��� ���.
};
//===================================================
instance DIA_Vatras_Erol_AmulReady(C_Info)
{
	npc = VLK_439_Vatras;							nr = 12;
	condition = DIA_Vatras_Erol_AmulReady_Cond;
	information = DIA_Vatras_Erol_AmulReady_Info;
	description = "� ��� ������, ��� �� ������.";
};
func int DIA_Vatras_Erol_AmulReady_Cond()
{
	if (C_HeroIs_Erol() 
		&& Npc_KnowsInfo(other,DIA_Vatras_Erol_AmulFound)
		&& Npc_HasItems(other,ItAm_MR_WispDetector_Ready))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_AmulReady_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_10_00");	//� ��� ������, ��� �� ������.
	B_GivePlayerXP(XP_Erol_AmulCharged);
	if (Npc_CanSeeNpc(self,Wisp_Detector) || (Npc_GetDistToNpc(self,Wisp_Detector) < PERC_DIST_DIALOG))	{
		AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_01");	//����, ���������.
		Info_ClearChoices(DIA_Vatras_Erol_AmulReady);
		Info_AddChoice(DIA_Vatras_Erol_AmulReady,"��, �� �� ������ �� ����!",DIA_Vatras_Erol_AmulReady_NoSearch);
	}
	else	{
		AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_02");	//� ���? ����������?
			AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_10_03");	//� �� �� ��� ������ � ����������?
		AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_04");	//��� ����� ������� �����, � � ��� ��� �� ������ � ����������� ��������� ��������.
		AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_05");	//�� ���� � ����� ������ ������ �� ��������.
		if (MIS_Erol_Plates_AmulWorks)	{
			AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_10_06");	//����� � ����� ������, ������ ��������, �� �� ������ �� �����.
			AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_10_07");	//������ ��� ����� ������, ��� ������ ���������.
				AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_08");	//������, ��� ������, ��� ����.
			Info_ClearChoices(DIA_Vatras_Erol_AmulReady);
			Info_AddChoice(DIA_Vatras_Erol_AmulReady,"��, �� �� ������ �� ����!",DIA_Vatras_Erol_AmulReady_NoSearch);
		}
		else	{
				AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_10_09");	//�����. �� � �� ������� �������� ������.
			AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_05_10");	//��� �, �������� ������. �� ��������, ��� ��������� ���������.
			Info_ClearChoices(DIA_Vatras_Erol_AmulReady);
			Info_AddChoice(DIA_Vatras_Erol_AmulReady,"(������ ������)",DIA_Vatras_Erol_AmulReady_Wear);
		};
	};
};
func void DIA_Vatras_Erol_AmulReady_Wear()
{
	// TEST NEEDED!
	EquipItem(other,ItAm_MR_WispDetector_Ready);
	AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_Wear_05_00");	//����, ������ ��������.
	Info_ClearChoices(DIA_Vatras_Erol_AmulReady);
	Info_AddChoice(DIA_Vatras_Erol_AmulReady,"��, �� �� ������ �� ����!",DIA_Vatras_Erol_AmulReady_NoSearch);
};
func void DIA_Vatras_Erol_AmulReady_NoSearch()
{
		AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_NoSearch_10_00");	//��, �� �� ������ �� ����!
	AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_NoSearch_05_01");	//������������ ������ ������� �������������� ��������. ����� ������� ���, ����� �� ����� ����� ���-������.
		AI_Output(other,self,"DIA_Vatras_Erol_AmulReady_NoSearch_10_02");	//� ��� ��� �������?
	AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_NoSearch_05_03");	//�� ���� ������ � � ���� ������ ����� � ��������� �����.
	AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_NoSearch_05_04");	//������, ����������, ����� ��� ������.
	//������
	B_GiveInvItems(other,self,ItAm_MR_WispDetector_Ready,1);
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulSuccess);
	AI_Output(self,other,"DIA_Vatras_Erol_AmulReady_NoSearch_05_05");	//������ ��� ����� � ������ � �������. �������, ��� ������� ���� � �����������.
	MIS_Erol_Plates_AmulReady = TRUE;
	//�������
	//B_GiveInvItems(self,other,ItPo_Mana_02,2);
	//B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	//B_GiveInvItems(self,other,ItSc_MediumHeal,2);
	//B_GiveInvItems(self,other,ItSc_IceWave,1);
	ItemTrans_items[0] = ItPo_Mana_02;
	ItemTrans_amount[0] = 2;
	ItemTrans_items[1] = ItPo_Perm_DEX;
	ItemTrans_amount[1] = 1;
	ItemTrans_items[2] = ItSc_MediumHeal;
	ItemTrans_amount[2] = 2;
	ItemTrans_items[3] = ItSc_IceWave;
	ItemTrans_amount[3] = 1;
	B_ItemsTransaction(self, other);
	Info_ClearChoices(DIA_Vatras_Erol_AmulReady);
};

//*///********************************* ����������� �������� ************************************

//===================================================
instance DIA_Vatras_Erol_GoldPlate(C_Info)
{
	npc = VLK_439_Vatras;						nr = 13;
	condition = DIA_Vatras_Erol_GoldPlate_Cond;
	information = DIA_Vatras_Erol_GoldPlate_Info;
	description = "������, ��� � �����! ������� ��������!";
};
func int DIA_Vatras_Erol_GoldPlate_Cond()
{
	if (C_HeroIs_Erol()
		 && Npc_KnowsInfo(other, DIA_Vatras_Erol_Hello)
		 && Npc_HasItems(other,ItWr_Stoneplate_Gold))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_GoldPlate_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_GoldPlate_10_00");	//������, ��� � �����! ������� ��������!
	B_GivePlayerXP(XP_Erol_Gold);
	B_GiveInvItems(other,self,ItWr_Stoneplate_Gold,1);
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_01");	//�������?! ��� ����� ����!
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_02");	//������ �������� � ��������, ������� ����� ����������� � �������, � ���������� ��������.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_03");	//��, ������, �� ����������� �� ��� ��������� �������� �� �����������, ������� ����������� ���� ������.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_04");	//��� �� �� �����?
		AI_Output(other,self,"DIA_Vatras_Erol_GoldPlate_10_05");	//� ���� �� �� ������� �� ����������� �������� � ����.
	//������ ������ ��������
	AI_StandUp(self);
	AI_UseItemToState(self,ItWr_Stoneplate_Gold,1);
	AI_Wait(self, 1.5);
	AI_UseItemToState(self,ItWr_Stoneplate_Gold,-1);
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_06");	//��� ����������� ������ �������, ����� ������ �� ���������, �� � ����� ����� ���� ���� � �����-�� ������� ��������.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_07");	//��������, �� ��� ��������� �� ���� ��������.
		AI_Output(other,self,"DIA_Vatras_Erol_GoldPlate_10_08");	//�����! ��� ������ �� ��� ������. �� ��� �������� ���� � �������� ������.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_09");	//���� ��� ������������� ����� ��� �����������, �� ��� ����� ���� ���-�� ���.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_10");	//�������� �������� � �����. �������� ���������� �������, �� ��� ������ ����� ��������� ����� �������.
	AI_Output(self,other,"DIA_Vatras_Erol_GoldPlate_05_11");	//������ ��� ������ � ���� �������.
	//���� ������ ����������� ������, �����, ������� ���������
	//B_GiveInvItems(self,other,ItMi_Gold,100);
	//B_GiveInvItems(self,other,ItSc_FullHeal,1);
	//B_GiveInvItems(self,other,ItSc_Light,3);
	//B_GiveInvItems(self,other,ItSc_HarmUndead,1);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = 100;
	ItemTrans_items[1] = ItSc_FullHeal;
	ItemTrans_amount[1] = 1;
	ItemTrans_items[2] = ItSc_Light;
	ItemTrans_amount[2] = 3;
	ItemTrans_items[3] = ItSc_HarmUndead;
	ItemTrans_amount[3] = 1;
	B_ItemsTransaction(self,other);
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_GoldGiven);
	MIS_Erol_Plates_GoldGiven = TRUE;
};
//===================================================
instance DIA_Vatras_Erol_SilverPlate(C_Info)
{
	npc = VLK_439_Vatras;						nr = 14;
	condition = DIA_Vatras_Erol_SilverPlate_Cond;
	information = DIA_Vatras_Erol_SilverPlate_Info;
	description = "���, � ������� ��� ���������� ��������.";
};
func int DIA_Vatras_Erol_SilverPlate_Cond()
{
	if (C_HeroIs_Erol() 
		&& MIS_Erol_Plates_GoldGiven
		&& Npc_HasItems(other,ItWr_Stoneplate_Silver))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_SilverPlate_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_SilverPlate_10_00");	//���, � ������� ��� ���������� ��������.
	B_GiveInvItems(other,self,ItWr_Stoneplate_Silver,1);
	if (Npc_HasItems(other,ItWr_Stoneplate_SilverPiece))	{//��� ����� �������
		B_GivePlayerXP(XP_Erol_Silver + XP_Erol_SilverPiece);
			AI_Output(other,self,"DIA_Vatras_Erol_SilverPlate_10_01");	//� ���� ����� � ������� � ��������.
		B_GiveInvItems(other,self,ItWr_Stoneplate_SilverPiece,1);
		B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_SilverGivenFull);
		AI_Output(self,other,"DIA_Vatras_Erol_SilverPlate_05_02");	//����� �����, ��� �� �� ��� ������. ����� ������ ���� ������� ���������� ��������� �����.
		AI_Output(self,other,"DIA_Vatras_Erol_SilverPlate_05_03");	//������ ��� �������.
		//B_GiveInvItems(self,other,ItMi_Gold,MIS_Erol_Plates_PaySpecial * 2);
		//B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
		//B_GiveInvItems(self,other,ItPo_Health_03,3);
		ItemTrans_items[0] = ItMi_Gold;
		ItemTrans_amount[0] = MIS_Erol_Plates_PaySpecial * 2;
		ItemTrans_items[1] = ItPo_Perm_DEX;
		ItemTrans_amount[1] = 1;
		ItemTrans_items[2] = ItPo_Health_03;
		ItemTrans_amount[2] = 3;
		B_ItemsTransaction(self,other);
		MIS_Erol_Plates_SilverFull_Day = Wld_GetDay_Shifted(23) + 1;
		MIS_Erol_Plates_SilverFull = TRUE;
	}
	else	{//��� ����
		B_GivePlayerXP(XP_Erol_Silver);
			AI_Output(other,self,"DIA_Vatras_Erol_SilverPlate_10_04");	//�� � ��� �� ������� �����. � ������� ��� ��������, �� ������ �� �����.
		AI_Output(self,other,"DIA_Vatras_Erol_SilverPlate_05_05");	//��������, ���� ��� ����� �������� ������������.
			AI_Output(other,self,"DIA_Vatras_Erol_SilverPlate_10_06");	//��� ���� �������. ���� ���� ����� ������� �������, �� ��, ������ �����, ���.
			AI_Output(other,self,"DIA_Vatras_Erol_SilverPlate_10_07");	//� ���������� ��������� ���.
		AI_Output(self,other,"DIA_Vatras_Erol_SilverPlate_05_08");	//��������� �� ����. � ���� ������ ������� �� ���� �����.
		//B_GiveInvItems(self,other,ItMi_Gold,MIS_Erol_Plates_PaySpecial);
		//B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
		//B_GiveInvItems(self,other,ItPo_Health_03,1);
		ItemTrans_items[0] = ItMi_Gold;
		ItemTrans_amount[0] = MIS_Erol_Plates_PaySpecial;
		ItemTrans_items[1] = ItPo_Perm_DEX;
		ItemTrans_amount[1] = 1;
		ItemTrans_items[2] = ItPo_Health_03;
		ItemTrans_amount[2] = 1;
		B_ItemsTransaction(self,other);
	};
};
//===================================================
instance DIA_Vatras_Erol_SilverPiece(C_Info)
{
	npc = VLK_439_Vatras;						nr = 15;
	condition = DIA_Vatras_Erol_SilverPiece_Cond;
	information = DIA_Vatras_Erol_SilverPiece_Info;
	description = "� ����� ��������� �������.";
};
func int DIA_Vatras_Erol_SilverPiece_Cond()
{
	if (C_HeroIs_Erol() 
		&& Npc_KnowsInfo(other,DIA_Vatras_Erol_SilverPlate)
		&& Npc_HasItems(other,ItWr_Stoneplate_SilverPiece))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_SilverPiece_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_SilverPiece_10_00");	//� ����� ��������� �������.
	B_GiveInvItems(other,self,ItWr_Stoneplate_SilverPiece,1);
	B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_SilverGivenFull);
	B_GivePlayerXP(XP_Erol_SilverPiece);
	AI_Output(self,other,"DIA_Vatras_Erol_SilverPiece_05_01");	//�������-��! �������. �� ��� �������� ��������� ������ ����������� �����.
		AI_Output(other,self,"DIA_Vatras_Erol_SilverPiece_10_02");	//��� ������ �������?
	AI_Output(self,other,"DIA_Vatras_Erol_SilverPiece_05_03");	//��, ������, ���� �� �����. ������.
	//B_GiveInvItems(self,other,ItMi_Gold,MIS_Erol_Plates_PaySpecial);
	//B_GiveInvItems(self,other,ItPo_Health_03,3);
	ItemTrans_items[0] = ItMi_Gold;
	ItemTrans_amount[0] = MIS_Erol_Plates_PaySpecial;
	ItemTrans_items[1] = ItPo_Health_03;
	ItemTrans_amount[1] = 2;
	B_ItemsTransaction(self,other);
	MIS_Erol_Plates_SilverFull_Day = Wld_GetDay_Shifted(23) + 1;
	MIS_Erol_Plates_SilverFull = TRUE;
};
//===================================================
instance DIA_Vatras_Erol_AncientPotion(C_Info)
{
	npc = VLK_439_Vatras;						nr = 16;
	condition = DIA_Vatras_Erol_AncientPotion_Cond;
	information = DIA_Vatras_Erol_AncientPotion_Info;
	important = TRUE;
};
func int DIA_Vatras_Erol_AncientPotion_Cond()
{
	if (C_HeroIs_Erol() 
		&& MIS_Erol_Plates_SilverFull && (MIS_Erol_Plates_SilverFull_Day < Wld_GetDay_Shifted(4)))	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_AncientPotion_Info()
{
	AI_Output(self,other,"DIA_Vatras_Erol_AncientPotion_05_01");	//����, ������!
	AI_Output(self,other,"DIA_Vatras_Erol_AncientPotion_05_02");	//��� ������� ����������� ���� �� ����� � ��� ��������. ������, �� �� ����� ������������ �������� ��� ������.
	B_GiveInvItems(self,other,ItPo_MR_OldAlch,1);
		AI_Output(other,self,"DIA_Vatras_Erol_AncientPotion_10_03");	//� ��� ��� ����?
	AI_Output(self,other,"DIA_Vatras_Erol_AncientPotion_05_04");	//��� �� ������ ��������� ���������� ����, �� � ������ ���� ���� ������.
};

//*/

//*///********************************* �����! ************************************

//===================================================
instance DIA_Vatras_Erol_Success(C_Info)
{
	npc = VLK_439_Vatras;						nr = 17;
	condition = DIA_Vatras_Erol_Success_Cond;
	information = DIA_Vatras_Erol_Success_Info;
	description = "� ���� ��� ���-������ ������?";
};
func int DIA_Vatras_Erol_Success_Cond()
{
	if (C_HeroIs_Erol()
		&& MIS_Erol_Plates_NumbersSolved && MIS_Erol_Plates_AmulReady && MIS_Erol_Plates_GoldGiven && MIS_Erol_Plates_SilverFull)	{
		return TRUE;
	};
};
func void DIA_Vatras_Erol_Success_Info()
{
		AI_Output(other,self,"DIA_Vatras_Erol_Success_10_00");	//� ���� ��� ���-������ ������?
	AI_Output(self,other,"DIA_Vatras_Erol_Success_05_01");	//�����, ���� ���.
	AI_Output(self,other,"DIA_Vatras_Erol_Success_05_02");	//������ ��������� ��������� ��� ��������, ������� ������� �����.
	AI_Output(self,other,"DIA_Vatras_Erol_Success_05_03");	//� � ���������� ��������� ������� ��, ��� �������.
	B_LogEntry_Status(TOPIC_Erol_Plates,LOG_SUCCESS,TOPIC_Erol_Plates_Success);
	B_GivePlayerXP(XP_Erol_Success);
};

//*/


/////////////////////////////////////// ���� /////////////////////////////////////////////

//===================================================
instance DIA_Vatras_Sarah_NeedHelp(C_Info)
{
	npc = VLK_439_Vatras;						nr = 20;
	condition = DIA_Vatras_Sarah_NeedHelp_Cond;
	information = DIA_Vatras_Sarah_NeedHelp_Info;
	description = "����������� ���, ��� ����� ����� ��� �����!";
};
func int DIA_Vatras_Sarah_NeedHelp_Cond()
{
	if (C_HeroIs_Sarah()
		&& (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other, DIA_Nadja_Sarah_TellAsIs))	{
		return TRUE;
	};
};
func void DIA_Vatras_Sarah_NeedHelp_Info()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_NeedHelp_16_00");	//����������� ���, ��� ����� ����� ��� �����!
	AI_Output(self,other,"DIA_Vatras_Sarah_NeedHelp_05_01");	//� ����������� ������ ����.
		AI_Output(other,self,"DIA_Vatras_Sarah_NeedHelp_16_02");	//��� �������, ���... � �����, ����� �����-�� �������. � ��� ��� ��� ������ �����. � ���� �����, ��� ��� �����.
		AI_Output(other,self,"DIA_Vatras_Sarah_NeedHelp_16_03");	//� �� ����, ��� ������. ��� ������� ��� �� �������.
	AI_Output(self,other,"DIA_Vatras_Sarah_NeedHelp_05_04");	//��� ���� � �����, ��� ��-��� ������ �������� �� ������ ����, �� � �������� - �����, ������� ����� ������ �����, ����� ��������� ���� ����.
	AI_Output(self,other,"DIA_Vatras_Sarah_NeedHelp_05_05");	//���� ��� ���������� ���, ��� ������ �� ����� ������������. �� ���� � ����� �������� � �����������, � ���������� �� ��� ������ ������.
};

//===================================================
instance DIA_Vatras_Sarah_HowToArgue(C_Info)
{
	npc = VLK_439_Vatras;						nr = 21;
	condition = DIA_Vatras_Sarah_HowToArgue_Cond;
	information = DIA_Vatras_Sarah_HowToArgue_Info;
	description = "��� ��� ������� �� �������?";
};
func int DIA_Vatras_Sarah_HowToArgue_Cond()
{
	if (C_HeroIs_Sarah()
		&& (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_Sarah_NeedHelp))	{
		return TRUE;
	};
};
func void DIA_Vatras_Sarah_HowToArgue_Info()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_HowToArgue_16_00");	//��� ��� ������� �� �������?
	AI_Output(self,other,"DIA_Vatras_Sarah_HowToArgue_05_01");	//�������, ������� ����� ��� ���� ���������.
		AI_Output(other,self,"DIA_Vatras_Sarah_HowToArgue_16_02");	//������� �������� ������ �� ��� �� ���������.
	AI_Output(self,other,"DIA_Vatras_Sarah_HowToArgue_05_03");	//������, ��� ��������, � ���� ����� �� �������� �����������, �� �� ������ ������������ �� ����?
	AI_Output(self,other,"DIA_Vatras_Sarah_HowToArgue_05_04");	//����� ����� ����� ������ ����������.
	AI_Output(self,other,"DIA_Vatras_Sarah_HowToArgue_05_05");	//��������� �������� � �� ��������. ���� ��� � ������ ������� ���� ��������, �� ������ ���������.
		AI_Output(other,self,"DIA_Vatras_Sarah_HowToArgue_16_06");	//�� ���� ��������� � �������. �� ��� ����� ��� �� ��������. ��� �������, ��� �� ���� � �����.
	AI_Output(self,other,"DIA_Vatras_Sarah_HowToArgue_05_07");	//����� ����� ����-��, ���� ��� �������, ���� �������� � ���� �������. ��������, ������.
	MIS_Sarah_BadHabit_VatrasAsked = TRUE;
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_NeedAuthority);
};

//===================================================
instance DIA_Vatras_Sarah_MagicHelp(C_Info)
{
	npc = VLK_439_Vatras;						nr = 22;
	condition = DIA_Vatras_Sarah_MagicHelp_Cond;
	information = DIA_Vatras_Sarah_MagicHelp_Info;
	description = "����� ����, ���� ����� �������?";
};
func int DIA_Vatras_Sarah_MagicHelp_Cond()
{
	if (C_HeroIs_Sarah()
		&& (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_Sarah_NeedHelp))	{
		return TRUE;
	};
};
func void DIA_Vatras_Sarah_MagicHelp_Info()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_MagicHelp_16_00");	//����� ����, ���� ����� �������?
	AI_Output(self,other,"DIA_Vatras_Sarah_MagicHelp_05_01");	//���� ���, ����� - ��� �� ������, � ��� �� ������ ���� �������!
	AI_Output(self,other,"DIA_Vatras_Sarah_MagicHelp_05_02");	//���� ���� �� � ��� � ������� �������� ���������� �������������� ��������, ����� ��������� �� ����, �� ��� ������ �������� ������, ��� �������� � ����� ��������.
	AI_Output(self,other,"DIA_Vatras_Sarah_MagicHelp_05_03");	//����� ����� ���� ����.
};

//===================================================
instance DIA_Vatras_Sarah_PotionHelp(C_Info)
{
	npc = VLK_439_Vatras;						nr = 23;
	condition = DIA_Vatras_Sarah_PotionHelp_Cond;
	information = DIA_Vatras_Sarah_PotionHelp_Info;
	description = "� ��� ������ �������?";
};
func int DIA_Vatras_Sarah_PotionHelp_Cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_Sarah_NeedHelp)
		 && !Npc_KnowsInfo(other, DIA_Salandril_Sarah_AskSmokingCure)
	)	{
		return TRUE;
	};
};
func void DIA_Vatras_Sarah_PotionHelp_Info()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PotionHelp_16_00");	//� ��� ������ �������? �����, ���� ����� �����, ����� �� ���� ���������� �� ���������?
	AI_Output(self,other,"DIA_Vatras_Sarah_PotionHelp_05_01");	//��������, ����� ����� ����. �� ���� ���� ����� ���������� � ����������.
	AI_Output(self,other,"DIA_Vatras_Sarah_PotionHelp_05_02");	//� ��������� � �������� �������� ����������, ��� �������� �� ���������� ������������ �������.
	AI_Output(self,other,"DIA_Vatras_Sarah_PotionHelp_05_03");	//� ����� ������, �������� ���� ����� ������������, ���� �������� ���.
	MIS_Sarah_BadHabit_SearchPotion = TRUE;
	B_LogEntry(TOPIC_Sarah_BadHabit,TOPIC_Sarah_BadHabit_VatrasPotion);
};
//===================================================
instance DIA_Vatras_Sarah_PrayAdanosForBerny(C_Info)
{
	npc = VLK_439_Vatras;						nr = 24;
	condition = DIA_Vatras_Sarah_PrayAdanosForBerny_Cond;
	information = DIA_Vatras_Sarah_PrayAdanosForBerny_Info;
	description = "� ���� ���������� ������� �� ������ ����.";
};
func int DIA_Vatras_Sarah_PrayAdanosForBerny_Cond()
{
	if (C_HeroIs_Sarah()
		&& MIS_Sarah_OldFriends_BernyPray)	{
		return TRUE;
	};
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Info()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_16_00");	//� ���� ���������� ������� �� ������ ����.
	AI_Output(self,other,"DIA_Vatras_Sarah_PrayAdanosForBerny_05_01");	//������ �� �� ���������� ���� ������� ��������������?
	Info_ClearChoices(DIA_Vatras_Sarah_PrayAdanosForBerny);
	Info_AddChoice(DIA_Vatras_Sarah_PrayAdanosForBerny,"� ���� ��� ������.",DIA_Vatras_Sarah_PrayAdanosForBerny_NoGold);
	if (C_NpcHasGold(other,10))	{
		Info_AddChoice(DIA_Vatras_Sarah_PrayAdanosForBerny,"� ���� ������������ 10 �������.",DIA_Vatras_Sarah_PrayAdanosForBerny_Gold10);
	};
	if (C_NpcHasGold(other,20))	{
		Info_AddChoice(DIA_Vatras_Sarah_PrayAdanosForBerny,"� ���� ������������ 20 �������.",DIA_Vatras_Sarah_PrayAdanosForBerny_Gold20);
	};
	if (C_NpcHasGold(other,50))	{
		Info_AddChoice(DIA_Vatras_Sarah_PrayAdanosForBerny,"� ���� ������������ 50 �������.",DIA_Vatras_Sarah_PrayAdanosForBerny_Gold50);
	};
	if (C_NpcHasGold(other,100))	{
		Info_AddChoice(DIA_Vatras_Sarah_PrayAdanosForBerny,"� ���� ������������ 100 �������.",DIA_Vatras_Sarah_PrayAdanosForBerny_Gold100);
	};
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Pray()
{
	Info_ClearChoices(DIA_Vatras_Sarah_PrayAdanosForBerny);
	AI_Output(self,other,"DIA_Vatras_Sarah_PrayAdanosForBerny_Pray_05_01");	//�� ���� �� ������ ����������?
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_Pray_16_02");	//�� �����, ������� ����� �� ��������� ��������, ����������� � ������ ����.
	AI_Output(self,other,"DIA_Vatras_Sarah_PrayAdanosForBerny_Pray_05_03");	//������ �� ������ ����������� ��� �������� �� ��������� ��������.
	AI_Output(self,other,"DIA_Vatras_Sarah_PrayAdanosForBerny_Pray_05_04");	//����� ���� ������ ��� ���� � �������� ������ ��� ��� ����!
	AI_Output(other,self,"XXX");	//
	AI_PlayAni(other,"T_STAND_2_PRAY");
	AI_Wait(other,2);
	AI_Wait(self,2);
	AI_PlayAni(other,"T_PRAY_2_STAND");
	AI_Output(other,self,"XXX");	//
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_BernyPrayAdanos);
	MIS_Sarah_OldFriends_BernyPray = FALSE;
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_NoGold()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_NoGold_16_00");	//� ���� ��� ������.
	AI_Output(self,other,"DIA_Vatras_Sarah_PrayAdanosForBerny_NoGold_05_01");	//�� ��������, ���� ���, ������� - ����� ������� ���� ���������.
	DIA_Vatras_Sarah_PrayAdanosForBerny_Pray();
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Gold10()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_Gold10_16_00");	//� ���� ������������ 10 �������.
	B_GiveGold(other,self,10);
	B_GivePlayerXP(10);
	DIA_Vatras_Sarah_PrayAdanosForBerny_Pray();
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Gold20()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_Gold20_16_00");	//� ���� ������������ 20 �������.
	B_GiveGold(other,self,20);
	B_GivePlayerXP(20);
	DIA_Vatras_Sarah_PrayAdanosForBerny_Pray();
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Gold50()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_Gold50_16_00");	//� ���� ������������ 50 �������.
	B_GiveGold(other,self,50);
	B_GivePlayerXP(50);
	DIA_Vatras_Sarah_PrayAdanosForBerny_Pray();
};
func void DIA_Vatras_Sarah_PrayAdanosForBerny_Gold100()
{
		AI_Output(other,self,"DIA_Vatras_Sarah_PrayAdanosForBerny_Gold100_16_00");	//� ���� ������������ 100 �������.
	B_GiveGold(other,self,100);
	B_GivePlayerXP(100);
	DIA_Vatras_Sarah_PrayAdanosForBerny_Pray();
};

/////////////////////////////////////// ��� /////////////////////////////////////////////
//===================================================
instance DIA_Vatras_HealMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_NoCond_cond;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = "�� ������ �������� ����?";
};
func void DIA_Vatras_HEAL_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vatras_HealMe_03_00");	//�� ������ �������� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vatras_HealMe_07_00");	//�� ������ �������� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vatras_HealMe_10_00");	//�� ������ �������� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vatras_HealMe_14_00");	//�� ������ �������� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vatras_HealMe_16_00");	//�� ������ �������� ����?
	};
	if (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])	{
		AI_Output(self,other,"DIA_Vatras_HealMe_05_01");	//(������������) ������, ���������� ��� ����. �������� ��� �� ��� � ������ � ���� ���� ����� �����.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		AI_PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else	if ((POISON_DrgTears_Timer == 0) && (POISON_Foggy_Timer == 0))	{
		AI_Output(self,other,"DIA_Vatras_HealMe_05_02");	//������ �� �� ���������� � ����� ���������.
	};
	if ((POISON_DrgTears_Timer > 0) || (POISON_Foggy_Timer > 0))	{
		AI_Output(self,other,"DIA_Vatras_HealMe_05_03");	//������, ���� ���� ��������� ����, ������� � �� � ����� ��������.
		AI_Output(self,other,"DIA_Vatras_HealMe_05_04");	//���� ����� ����� ������ ��� ��������, ������� ����� ����������� � ���� � ������������.
	};
};

// �������������� ===================================================
// + � ���� ��� ������
var int DIA_Vatras_Donate_Day;
instance DIA_Vatras_Donate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 101;
	condition = DIA_NoCond_cond;
	information = DIA_Vatras_Donate_Info;
	permanent = TRUE;
	description = "� ���� ������� ������������� �������!";
};
func void DIA_Vatras_Donate_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vatras_Donate_03_00");	//� ���� ������� ������������� �������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vatras_Donate_07_00");	//� ���� ������� ������������� �������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vatras_Donate_10_00");	//� ���� ������� ������������� �������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vatras_Donate_14_00");	//� ���� ������� ������������� �������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vatras_Donate_16_00");	//� ���� ������� ������������� �������!
	};
	AI_Output(self,other,"DIA_Vatras_Donate_05_01");	//���� ������ ����� ��������� �� ������ ����.
	AI_Output(self,other,"DIA_Vatras_Donate_05_02");	//������� �� ������ ������������?
	Info_ClearChoices(DIA_Vatras_Donate);
	Info_AddChoice(DIA_Vatras_Donate,"������ ��� ������ ����.",DIA_Vatras_Donate_BACK);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)	{
		Info_AddChoice(DIA_Vatras_Donate,"� ���� ���� 50 ������� �����.",DIA_Vatras_Donate_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)	{
		Info_AddChoice(DIA_Vatras_Donate,"� ���� ���� 100 ������� �����.",DIA_Vatras_Donate_100);
	};
};
func void DIA_Vatras_Donate_BACK()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vatras_Donate_BACK_03_00");	//������ ��� ������ ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vatras_Donate_BACK_07_00");	//������ ��� ������ ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vatras_Donate_BACK_10_00");	//������ ��� ������ ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vatras_Donate_BACK_14_00");	//������ ��� ������ ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vatras_Donate_BACK_16_00");	//������ ��� ������ ����.
	};
	AI_Output(self,other,"DIA_Vatras_Donate_BACK_05_01");	//������ ���������. ���� ��������� ����� � ����������� � ����� �����.
	Info_ClearChoices(DIA_Vatras_Donate);
};
func void DIA_Vatras_Donate_50()
{
	PrayCounter_Adanos += 1;
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vatras_Donate50_03_00");	//� ���� ���� 50 ������� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vatras_Donate50_07_00");	//� ���� ���� 50 ������� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vatras_Donate50_10_00");	//� ���� ���� 50 ������� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vatras_Donate50_14_00");	//� ���� ���� 50 ������� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vatras_Donate50_16_00");	//� ���� ���� 50 ������� �����.
	};
	AI_Output(self,other,"DIA_Vatras_Donate50_05_01");	//�� ����� ������� � ��������� ���� �� ���� ���.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	var int rnd;	rnd = C_Random(3);
	if (PATRONGOD == PATRONGOD_Adanos)	{
		if (rnd == 0)	{
			B_RaiseProtection(other,DAM_EDGE | DAM_POINT, 2);
		}
		else	if (rnd == 1)	{
			B_RaiseProtection(other,DAM_MAGIC | DAM_FIRE, 2);
		}
		else	{
			B_RaiseAttribute(other, ATR_MANA_MAX, 4);
		};
		B_GivePlayerXP(XP_Adanos50);
	}
	else	if (DIA_Vatras_Donate_Day <= Wld_GetDay())	{
		if (rnd == 0)	{
			B_RaiseProtection(other,DAM_EDGE | DAM_POINT, 1);
		}
		else	if (rnd == 1)	{
			B_RaiseProtection(other,DAM_MAGIC | DAM_FIRE, 1);
		}
		else	{
			B_RaiseAttribute(other, ATR_MANA_MAX, 2);
		};
		B_GivePlayerXP(XP_Adanos50);
	};
	DIA_Vatras_Donate_Day += 1;
	Info_ClearChoices(DIA_Vatras_Donate);
};

func void DIA_Vatras_Donate_100()
{
	PrayCounter_Adanos += 1;
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Vatras_Donate100_03_00");	//� ���� ���� 100 ������� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Vatras_Donate100_07_00");	//� ���� ���� 100 ������� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Vatras_Donate100_10_00");	//� ���� ���� 100 ������� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Vatras_Donate100_14_00");	//� ���� ���� 100 ������� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Vatras_Donate100_16_00");	//� ���� ���� 100 ������� �����.
	};
	AI_Output(self,other,"DIA_Vatras_Donate100_05_01");	//������ ������� � ������������ ���� �� ���� ������ ���!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	var int rnd;	rnd = C_Random(3);
	if (PATRONGOD == PATRONGOD_Adanos)	{
		if (rnd == 0)	{
			B_RaiseProtection(other,DAM_EDGE | DAM_POINT, 5);
		}
		else	if (rnd == 1)	{
			B_RaiseProtection(other,DAM_MAGIC | DAM_FIRE, 5);
		}
		else	{
			B_RaiseAttribute(other, ATR_MANA_MAX, 10);
		};
		B_GivePlayerXP(XP_Adanos100);
	}
	else	if (DIA_Vatras_Donate_Day <= Wld_GetDay())	{
		if (rnd == 0)	{
			B_RaiseProtection(other,DAM_EDGE | DAM_POINT, 3);
		}
		else	if (rnd == 1)	{
			B_RaiseProtection(other,DAM_MAGIC | DAM_FIRE, 3);
		}
		else	{
			B_RaiseAttribute(other, ATR_MANA_MAX, 5);
		};
		B_GivePlayerXP(XP_Adanos100);
	};
	DIA_Vatras_Donate_Day += 1;
	Info_ClearChoices(DIA_Vatras_Donate);
};

