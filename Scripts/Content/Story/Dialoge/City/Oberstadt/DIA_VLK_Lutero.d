
instance DIA_Lutero_EXIT(DIA_Proto_End)
{
	npc = VLK_404_Lutero;
};

/////////////////////////////////////// ����� ///////////////////////////////////////////

//===================================================
instance DIA_Lutero_Elena_HavePresent(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 11;
	condition = DIA_Lutero_Elena_HavePresent_Cond;
	information = DIA_Lutero_Elena_HavePresent_Info;
	description = "� � ���� ���� ���-������ ���������?";
};
func int DIA_Lutero_Elena_HavePresent_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Lutero_MR_Hello)
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Lutero_Elena_HavePresent_Info()
{
		AI_Output(other,self,"DIA_Lutero_Elena_HavePresent_16_00");	//� � ���� ���� ���-������ ���������?
		AI_Output(other,self,"DIA_Lutero_Elena_HavePresent_16_01");	//� ��� ������� ��������� �� ��������� �������.
	AI_Output(self,other,"DIA_Lutero_Elena_HavePresent_13_02");	//� ���� ���� ���-���, ��� ������ ���� ��������������.
	AI_Output(self,other,"DIA_Lutero_Elena_HavePresent_13_03");	//�������, ��� ����� ��������. ������������� ��������� �������� ��.
	AI_Output(self,other,"DIA_Lutero_Elena_HavePresent_13_04");	//������-��, �� ������ ���� ���, ��� ���� � ����. �� � ���� ���� ������ ���� �� ����.
	AI_Output(self,other,"DIA_Lutero_Elena_HavePresent_13_05");	//���� ����� � � ������������� ������ ���� �� 350 �������.
	B_LogEntry_Elena_Present(TOPIC_Elena_Present_CupLutero);
};

//===================================================
instance DIA_Lutero_Elena_BuyCup(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 12;
	condition = DIA_Lutero_Elena_BuyCup_Cond;
	information = DIA_Lutero_Elena_BuyCup_Info;
	description = "� ���� ������ ����� ��������. (350 ���.)";
	permanent = TRUE;
};
func int DIA_Lutero_Elena_BuyCup_Cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lutero_Elena_HavePresent)
		&& !MIS_Elena_Present_CupLuteroGot && (MIS_Elena_Present == LOG_Running))
	{
		return TRUE;
	};
};
var int DIA_Lutero_Elena_BuyCup_NoMoneyOnce;
func void DIA_Lutero_Elena_BuyCup_Info()
{
	AI_Output(other,self,"DIA_Lutero_Elena_BuyCup_16_00");	//� ���� ������ ����� ��������.
	if (C_NpcHasGold(other, 350))	{
		B_GiveInvItems(other,self,ItMi_Gold,350);
		AI_Output(self,other,"DIA_Lutero_Elena_BuyCup_13_01");	//����������. ��������� ��� ������������ ���������.
		B_GiveInvItems(self,other,ItMi_FaithfulnessCup_01,1);
		B_GivePlayerXP(XP_Elena_CupLuteroGot);
		B_LogEntry_Elena_CupGot(TOPIC_Elena_Present_CupLuteroGot);
		MIS_Elena_Present_CupLuteroGot = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Lutero_Elena_BuyCup_13_02");	//����� ������� 350 �������.
		if (!DIA_Lutero_Elena_BuyCup_NoMoneyOnce || (Hlp_Random(100) < 30))	{
			AI_Output(self,other,"DIA_Lutero_Elena_BuyCup_13_03");	//��� ������������� ������ ����, � � �� ����� ������.
			DIA_Lutero_Elena_BuyCup_NoMoneyOnce = TRUE;
		};
	};
};

//===================================================
instance DIA_Lutero_Elena_CupTooExpensive(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 13;
	condition = DIA_Lutero_Elena_CupTooExpensive_Cond;
	information = DIA_Lutero_Elena_CupTooExpensive_Info;
	description = "�� ������� �� ����� ������� �����!";
};
func int DIA_Lutero_Elena_CupTooExpensive_Cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lutero_Elena_HavePresent)
		&& !MIS_Elena_Present_CupLuteroGot && (MIS_Elena_Present == LOG_Running))
	{
		return TRUE;
	};
};
func void DIA_Lutero_Elena_CupTooExpensive_Info()
{
		AI_Output(other,self,"DIA_Lutero_Elena_CupTooExpensive_16_00");	//�� ������� �� ����� ������� �����!
	AI_Output(self,other,"DIA_Lutero_Elena_CupTooExpensive_13_01");	//� �� ����� ������. ��� � ��� ������� �� ����� ������ �������!
	AI_Output(self,other,"DIA_Lutero_Elena_CupTooExpensive_13_02");	//����... ���� ������, � ������� ���� ����� �� ����� ���������.
	AI_Output(self,other,"DIA_Lutero_Elena_CupTooExpensive_13_03");	//����� ����� ���������� �����.
		AI_Output(other,self,"DIA_Lutero_Elena_CupTooExpensive_16_04");	//��������? ������, � �������.
	MIS_Elena_Present_LuteroAskedFur = TRUE;
	B_LogEntry(TOPIC_Elena_Present, TOPIC_Elena_Present_CupLuteroFur);
};

//===================================================
instance DIA_Lutero_Elena_GiveFur(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 14;
	condition = DIA_Lutero_Elena_GiveFur_Cond;
	information = DIA_Lutero_Elena_GiveFur_Info;
	description = "� �������� ����� ���������, ��� �� � ��������������.";
};
func int DIA_Lutero_Elena_GiveFur_Cond()
{
	if (C_HeroIs_Elena()
		&& MIS_Elena_Present_LuteroAskedFur
		&& Npc_HasItems(other,ItAt_ShadowFur) 
		&& !MIS_Elena_Present_CupLuteroGot && (MIS_Elena_Present == LOG_Running))
	{
		return TRUE;
	};
};
func void DIA_Lutero_Elena_GiveFur_Info()
{
		AI_Output(other,self,"DIA_Lutero_Elena_GiveFur_16_00");	//� �������� ����� ���������, ��� �� � ��������������.
	B_GiveInvItems(other,self,ItAt_ShadowFur,1);
	AI_Output(self,other,"DIA_Lutero_Elena_GiveFur_13_01");	//������. ��� ���� �����.
		B_GivePlayerXP(XP_Elena_CupLuteroGot);
	B_GiveInvItems(self,other,ItMi_FaithfulnessCup_01,1);
	B_LogEntry_Elena_CupGot(TOPIC_Elena_Present_CupLuteroGot);
	MIS_Elena_Present_CupLuteroGot = TRUE;
};

//===================================================
instance DIA_Lutero_Elena_Where2Cup(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 15;
	condition = DIA_Lutero_Elena_Where2Cup_Cond;
	information = DIA_Lutero_Elena_Where2Cup_Info;
	description = "� � ���� ����� ���� ������ �����?";
};
func int DIA_Lutero_Elena_Where2Cup_Cond()
{
	if (C_HeroIs_Elena()
		&& Npc_KnowsInfo(other,DIA_Lutero_Elena_HavePresent))	{
		return TRUE;
	};
};
func void DIA_Lutero_Elena_Where2Cup_Info()
{
		AI_Output(other,self,"DIA_Lutero_Elena_Where2Cup_16_00");	//� � ���� ����� ���� ������ �����?
	AI_Output(self,other,"DIA_Lutero_Elena_Where2Cup_13_01");	//�����-�� � ������� ��� �� ���������� ������...
	AI_Output(self,other,"DIA_Lutero_Elena_Where2Cup_13_02");	//����� �� ��� ����� �� ���������� ����� � ������� ��������, � ������ ��������� � ������� ������ � �������� ������.
	AI_Output(self,other,"DIA_Lutero_Elena_Where2Cup_13_03");	//�����, ������ ����� ��� ��� � ����.
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_Lehmar);
	MIS_Elena_Present_KnowsLehmar = TRUE;
};



/////////////////////////////////////// ������ ///////////////////////////////////////////

//===================================================
instance DIA_Lutero_Talbin_Tusk(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 21;
	condition = DIA_Lutero_Talbin_Tusk_Cond;
	information = DIA_Lutero_Talbin_Tusk_Info;
	description = "������ ������ ������� �����?";
};
func int DIA_Lutero_Talbin_Tusk_Cond()
{
	if (C_HeroIs_Talbin()
		 && Npc_KnowsInfo(other,DIA_Lutero_MR_Hello)
		 && (Npc_HasItems(other,ItAt_KeilerHogTusk) || Npc_HasItems(other,ItAt_KeilerHogTuskBig) || Npc_HasItems(other,ItAt_KeilerTusk)))	{
		return TRUE;
	};
};
func void DIA_Lutero_Talbin_Tusk_Info()
{
		AI_Output(other,self,"DIA_Lutero_Talbin_Tusk_07_00");	//������ ������ ������� �����?
	AI_Output(self,other,"DIA_Lutero_Talbin_Tusk_13_01");	//�����? ���...
	AI_Output(self,other,"DIA_Lutero_Talbin_Tusk_13_02");	//� ���� ��� ���� ��������� ���, �� ���� �� ������ ���������� ��� ������� ���������, � � �������� ����� ��.
	AI_Output(self,other,"DIA_Lutero_Talbin_Tusk_13_03");	//����� ������ ���� �� ������ ���� � ��������� ������� � �����.
	B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_KeilsLutero);
};

//===================================================
instance DIA_Lutero_Talbin_TuskBig(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 22;
	condition = DIA_Lutero_Talbin_TuskBig_Cond;
	information = DIA_Lutero_Talbin_TuskBig_Info;
	description = "�������, ����� �����!";
};
func int DIA_Lutero_Talbin_TuskBig_Cond()
{
	if (C_HeroIs_Talbin()
		 && Npc_KnowsInfo(other,DIA_Lutero_Talbin_Tusk)
		 && (Npc_HasItems(other,ItAt_KeilerHogTuskBig)))	{
		return TRUE;
	};
};
func void DIA_Lutero_Talbin_TuskBig_Info()
{
		AI_Output(other,self,"DIA_Lutero_Talbin_TuskBig_07_00");	//�������, ����� �����! ����� � ���� ����� ���.
	AI_Output(self,other,"DIA_Lutero_Talbin_TuskBig_13_01");	//������-��... ���, ������������� �������!
		AI_Output(other,self,"DIA_Lutero_Talbin_TuskBig_07_02");	//�� ��� �� ������ ������� ������� � ������!
	AI_Output(self,other,"DIA_Lutero_Talbin_TuskBig_13_03");	//(��������� ��������) �������...
		AI_Output(other,self,"DIA_Lutero_Talbin_TuskBig_07_04");	//��� ���� �� ������? ����, ��� ��������������.
	AI_Output(self,other,"DIA_Lutero_Talbin_TuskBig_13_05");	//���, ��� �� �������. � ���� ���� ������ ���� �����������, ���������� �������������� �� �����!
	AI_Output(self,other,"DIA_Lutero_Talbin_TuskBig_13_06");	//��� ����������� �� �����.
		AI_Output(other,self,"DIA_Lutero_Talbin_TuskBig_07_07");	//� ��� � ������ ���� ����������?
	AI_Output(self,other,"DIA_Lutero_Talbin_TuskBig_13_08");	//� ������� ������� ���� ����������� ��� ���������. � � ������� ��� �����.
	B_LogEntry(TOPIC_Talbin_Hunt,TOPIC_Talbin_Hunt_KeilsMeasure);
};

//===================================================
instance DIA_Lutero_Talbin_CertificateGot(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 23;
	condition = DIA_Lutero_Talbin_CertificateGot_Cond;
	information = DIA_Lutero_Talbin_CertificateGot_Info;
	description = "��� ����� � ��� ���� ����������.";
};
func int DIA_Lutero_Talbin_CertificateGot_Cond()
{
	if (C_HeroIs_Talbin()
		 && Npc_KnowsInfo(other,DIA_Lutero_Talbin_TuskBig)
		 && (Npc_HasItems(other,ItAt_KeilerHogTuskBig))
		 && (Npc_HasItems(other,ItWr_TuskCertificate)))	{
		return TRUE;
	};
};
func void DIA_Lutero_Talbin_CertificateGot_Info()
{
	//B_GiveInvItems(other,self,ItAt_KeilerHogTuskBig,1);
	//B_GiveInvItems(other,self,ItWr_TuskCertificate,1);
	ItemTrans_items[0] = ItAt_KeilerHogTuskBig;
	ItemTrans_amount[0] = 1;
	ItemTrans_items[1] = ItWr_TuskCertificate;
	ItemTrans_amount[1] = 1;
	B_ItemsTransaction(other,self);
		AI_Output(other,self,"DIA_Lutero_Talbin_CertificateGot_07_00");	//��� ����� � ��� ���� ����������.
	AI_Output(self,other,"DIA_Lutero_Talbin_CertificateGot_13_01");	//������ � ���� ������� ������! ��� �������������...
	AI_Output(self,other,"DIA_Lutero_Talbin_CertificateGot_13_02");	//���, ������ 500 �������. ��� ����� ���� �����.
	B_GiveGold(self,other,500);
	MIS_Talbin_Hunt_KeilerSold = TRUE;
	B_LogEntry_Talbin_Hunt(TOPIC_Talbin_Hunt_KeilsSoldLutero);
	B_GivePlayerXP(XP_Talbin_Hunt_KeilsSold);
};

/////////////////////////////////////// ��� /////////////////////////////////////////////
// ==============================================

instance DIA_Lutero_MR_Hello(C_INFO)
{
	nr = 1;
	npc = VLK_404_Lutero;
	condition = DIA_WhenAsked_cond;
	information = DIA_Lutero_MR_MR_Hello_info;
	important = TRUE;
};
func void DIA_Lutero_MR_MR_Hello_info()
{
	if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Lutero_MR_MR_Hello_13_00");	//�����������, ����! ������� ������ � ���� �����-������ ��������?
			AI_Output(other,self,"DIA_Lutero_MR_MR_Hello_10_01");	//����� ����, ����� ����.
	}
	else	{
		AI_Output(self,other,"DIA_Lutero_MR_MR_Hello_13_02");	//���� � ���� ���� ������, ������� ��������� �� �� ��� ������.
		AI_Output(self,other,"DIA_Lutero_MR_MR_Hello_13_03");	//��� ������������� ������ � ������ ����.
	};
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Lutero);
};

// ==============================================

instance DIA_Lutero_MRTrade(C_INFO)
{
	nr = 50;
	npc = VLK_404_Lutero;
	condition = DIA_Lutero_MRTrade_cond;
	information = DIA_Lutero_MRTrade_info;
	description = "������ ���� ������.";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Lutero_MRTrade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Lutero_MR_Hello))	{
		return TRUE;
	};
};
func void DIA_Lutero_MRTrade_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Lutero_MRTrade_03_00");	//������ ���� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Lutero_MRTrade_07_00");	//������ ���� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Lutero_MRTrade_10_00");	//������ ���� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Lutero_MRTrade_14_00");	//������ ���� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Lutero_MRTrade_16_00");	//������ ���� ������.
	};
	B_GiveTradeInv_Lutero(self);
};
