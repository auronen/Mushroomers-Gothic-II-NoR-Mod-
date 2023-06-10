
instance DIA_Brian_EXIT(DIA_Proto_End)
{
	npc = VLK_457_Brian;
};

/////////////////////////////////////// ����� /////////////////////////////////////////////

//===================================================
instance DIA_Brian_Elena_HeardPresent(C_Info)
{
	npc = VLK_457_Brian;					nr = 1;
	condition = DIA_Brian_Elena_HeardPresent_Cond;
	information = DIA_Brian_Elena_HeardPresent_Info;
	important = TRUE;
};
func int DIA_Brian_Elena_HeardPresent_Cond()
{
	if (C_HeroIs_Elena()
		 && (Npc_KnowsInfo(other,DIA_Harad_Elena_AskPresent))
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_HeardPresent_Info()
{
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_00");	//��, ������! � ������, ���� ����� ������� ��� ���������.
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_01");	//�, �������, ����� ���� ������ ����������, �� � �������� �������� � � ������������ ���������.
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_02");	//���� ������, � ���� ����������� �������� ���� �����, � ������ �� ������� ����� �������� ��������� �������.
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_03");	//����� ��� ������ ������ ������ ���� ���� �����.
		AI_Output(other,self,"DIA_Brian_Elena_HeardPresent_12_04");	//�� ��! ��� ����� ����������. � �������� �����������.
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_05");	//� ������� ����� ��� ��������, �� ��� ���������� ��� ������� ���������.
		AI_Output(other,self,"DIA_Brian_Elena_HeardPresent_12_06");	//� ������� �������� �� ������?
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_07");	//150 �������. � � �� ����� ������� ������. ������ ������, ����� ������� ������� ������.
		AI_Output(other,self,"DIA_Brian_Elena_HeardPresent_12_08");	//� �� ����������?
	AI_Output(self,other,"DIA_Brian_Elena_HeardPresent_04_09");	//� ������, ��� ����� ���������� ���������� ������. �� � ���� ��� ��������� � ���������.
	B_LogEntry_Elena_Present(TOPIC_Elena_Present_Brian);
};

//===================================================
instance DIA_Brian_Elena_AboutMaterials(C_Info)
{
	npc = VLK_457_Brian;					nr = 2;
	condition = DIA_Brian_Elena_AboutMaterials_Cond;
	information = DIA_Brian_Elena_AboutMaterials_Info;
	description = "����� ��������� ���� �����?";
};
func int DIA_Brian_Elena_AboutMaterials_Cond()
{
	if (C_HeroIs_Elena()
		 && (Npc_KnowsInfo(other,DIA_Brian_Elena_HeardPresent))
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_AboutMaterials_Info()
{
		AI_Output(other,self,"DIA_Brian_Elena_AboutMaterials_12_00");	//����� ��������� ���� �����?
	AI_Output(self,other,"DIA_Brian_Elena_AboutMaterials_04_01");	//������, ����������. ����������� ����� �� ����� ������� �����, �� ��� ������, �����������.
	AI_Output(self,other,"DIA_Brian_Elena_AboutMaterials_04_02");	//����� �����, ���� � ���� ���� ��� ������� ������� ������.
		AI_Output(other,self,"DIA_Brian_Elena_AboutMaterials_12_03");	//� ������� ������ ���� �� ��������?
	AI_Output(self,other,"DIA_Brian_Elena_AboutMaterials_04_04");	//���. ��, ��������, �� ������, �� ������ ������ �� �� ������� ������. � ��� ���� ��������, � ������ �������, ����. � ��� ���������� ����������� �����, ��� ������ �������� ���������.
	AI_Output(self,other,"DIA_Brian_Elena_AboutMaterials_04_05");	//��� ������ ��� ����� ������ ������.
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_NeededMaterials);
};

//===================================================
instance DIA_Brian_Elena_GiveRings(C_Info)
{
	npc = VLK_457_Brian;					nr = 3;
	condition = DIA_Brian_Elena_GiveRings_Cond;
	information = DIA_Brian_Elena_GiveRings_Info;
	description = "� �������� ������.";
};
func int DIA_Brian_Elena_GiveRings_Cond()
{
	if (C_HeroIs_Elena()
		 && (Npc_KnowsInfo(other,DIA_Brian_Elena_AboutMaterials))
		 && (Npc_HasItems(other,ItMi_GoldRing) >= 2)
		 && (MIS_Elena_Present == LOG_Running))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_GiveRings_Info()
{
		AI_Output(other,self,"DIA_Brian_Elena_GiveRings_12_00");	//� �������� ������.
	B_GiveInvItems(other,self,ItMi_GoldRing,2);
	Npc_RemoveInvItems(self,ItMi_GoldRing,2);
	AI_Output(self,other,"DIA_Brian_Elena_GiveRings_04_01");	//������������! ��� �� �������� ���������� � ������.
	AI_Output(self,other,"DIA_Brian_Elena_GiveRings_04_02");	//� �� ������, ������� ������� ��� �����������... �� ���������� ��������� �� ����.
	MIS_Elena_Present_BrianTime = (Wld_GetDay()*24 + 24) * 60;
	B_GivePlayerXP(XP_Elena_RingsGot);
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_BrianStart);
};

//===================================================
instance DIA_Brian_Elena_AskRingsReady(C_Info)
{
	npc = VLK_457_Brian;					nr = 4;
	condition = DIA_Brian_Elena_AskRingsReady_Cond;
	information = DIA_Brian_Elena_AskRingsReady_Info;
	description = "������ ������?";
	permanent = TRUE;
};
func int DIA_Brian_Elena_AskRingsReady_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_BrianTime > 0)
		 && (MIS_Elena_Present_BrianTime >= Wld_GetFullTime()))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_AskRingsReady_Info()
{
		AI_Output(other,self,"DIA_Brian_Elena_AskRingsReady_12_00");	//������ ������?
	AI_Output(self,other,"DIA_Brian_Elena_AskRingsReady_04_01");	//��� ���. � ������� ��� ���� ������.
};

//===================================================
var int PortraitRings_View;
instance DIA_Brian_Elena_RingsReady(C_Info)
{
	npc = VLK_457_Brian;					nr = 5;
	condition = DIA_Brian_Elena_RingsReady_Cond;
	information = DIA_Brian_Elena_RingsReady_Info;
	important = TRUE;
};
func int DIA_Brian_Elena_RingsReady_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_BrianTime > 0)
		 && (MIS_Elena_Present_BrianTime < Wld_GetFullTime()))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_RingsReady_Info()
{
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_04_00");	//� ��������! ��������, ��-�����, ���������� �������.
	CreateInvItems(self,ItMi_PortraitRings_Empty,1);
	PortraitRings_View = View_CreateCenterPxl(Print_ToPixel(PS_VMax / 2, PS_X),Print_ToPixel(PS_VMax / 2, PS_Y),512,256);
	View_SetTexture(PortraitRings_View,"ElenaRings_Empty.TGA");
	View_Open(PortraitRings_View);
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_RingsReady);
	Info_ClearChoices(DIA_Brian_Elena_RingsReady);
	Info_AddChoice(DIA_Brian_Elena_RingsReady,"��� ����... �������� ���������.",DIA_Brian_Elena_RingsReady_Bad);
	Info_AddChoice(DIA_Brian_Elena_RingsReady,"��, �������. ��� ��������. ������, �� �� ������.",DIA_Brian_Elena_RingsReady_NotBad);
	Info_AddChoice(DIA_Brian_Elena_RingsReady,"����� ��������!!! ������ ������������!",DIA_Brian_Elena_RingsReady_Great);
};
func void DIA_Brian_Elena_RingsReady_Great()
{
	View_Close(PortraitRings_View);
	View_Delete(PortraitRings_View);
	PortraitRings_View = 0;
		AI_Output(other,self,"DIA_Brian_Elena_RingsReady_Great_12_00");	//����� ��������!!! ������ ������������!
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Great_04_01");	//(��������) ��, �� �������������. � ���������� ������ ������ �������, ����� ������� ��������� � ��� ���� ��������.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Great_04_02");	//� ������������ ����� ����� ��������� �� ���������� �������.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Great_04_03");	//������ ���� �� 150 �������, ��� ��������������.
	Info_ClearChoices(DIA_Brian_Elena_RingsReady);
};
func void DIA_Brian_Elena_RingsReady_NotBad()
{
	View_Close(PortraitRings_View);
	View_Delete(PortraitRings_View);
	PortraitRings_View = 0;
		AI_Output(other,self,"DIA_Brian_Elena_RingsReady_NotBad_12_00");	//��, �������. ��� ��������. ������, �� �� ������.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_NotBad_04_01");	//(� �����������) �������. � ������, ���� ��� ��������� �����������. � ���� ������ ������ �������...
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Great_04_02");	//� ������������ ����� ����� ��������� �� ���������� �������.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Great_04_03");	//������ ���� �� 150 �������, ��� ��������������.
	Info_ClearChoices(DIA_Brian_Elena_RingsReady);
};
func void DIA_Brian_Elena_RingsReady_Bad()
{
	View_Close(PortraitRings_View);
	View_Delete(PortraitRings_View);
	PortraitRings_View = 0;
		AI_Output(other,self,"DIA_Brian_Elena_RingsReady_Bad_12_00");	//��� ����... �������� ���������.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Bad_04_01");	//�� �� ������. � ������ ���, ��� ��� �� ����� ����.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReady_Bad_04_02");	//��� ���� �� ��������, � ������ ������� �� ������� � ������� ������ � ����� ����.
		AI_Output(other,self,"DIA_Brian_Elena_RingsReady_Bad_12_03");	//�������� ����. � ��� �������.
	Info_ClearChoices(DIA_Brian_Elena_RingsReady);
};

//===================================================
instance DIA_Brian_Elena_RingsBuy(C_Info)
{
	npc = VLK_457_Brian;					nr = 6;
	condition = DIA_Brian_Elena_RingsBuy_Cond;
	information = DIA_Brian_Elena_RingsBuy_Info;
	description = "��� ������ �� ������. (150 ���.)";
	permanent = TRUE;
};
func int DIA_Brian_Elena_RingsBuy_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Brian_Elena_RingsReady) && Npc_HasItems(self,ItMi_PortraitRings_Empty))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_RingsBuy_Info()
{
	AI_Output(other,self,"DIA_Brian_Elena_RingsBuy_12_00");	//��� ������ �� ������.
	if (C_NpcHasGold(other, 150))	{
		B_GiveInvItems(other,self,ItMi_Gold,150);
		AI_Output(self,other,"DIA_Brian_Elena_RingsBuy_04_01");	//����������.
		B_GiveInvItems(self,other,ItMi_PortraitRings_Empty,1);
		AI_Output(self,other,"DIA_Brian_Elena_RingsBuy_04_02");	//����� ���� � ����� ��������� ����� ����������.
		B_GivePlayerXP(XP_Elena_RingsReady);
		B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_RingsGot);
	}
	else	{
		AI_Output(self,other,"DIA_Brian_Elena_RingsBuy_04_03");	//�� �������������� � 150 �������, ���� �� �� ������.
	};
};

//===================================================
instance DIA_Brian_Elena_RingsReturn(C_Info)
{
	npc = VLK_457_Brian;					nr = 7;
	condition = DIA_Brian_Elena_RingsReturn_Cond;
	information = DIA_Brian_Elena_RingsReturn_Info;
	description = "� ��������... ��� �� ����� ���� ������. ����� ��� ������.";
};
func int DIA_Brian_Elena_RingsReturn_Cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Brian_Elena_RingsReady) && Npc_HasItems(self,ItMi_PortraitRings_Empty))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_RingsReturn_Info()
{
		AI_Output(other,self,"DIA_Brian_Elena_RingsReturn_12_00");	//� ��������... ��� �� ����� ���� ������. ����� ��� ������.
	AI_Output(self,other,"DIA_Brian_Elena_RingsReturn_04_01");	//��, ����. ������ � ���������� �� �������, �� ������� ������...
	AI_Output(self,other,"DIA_Brian_Elena_RingsReturn_04_02");	//������� �������, ��� ������.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_RemoveInvItem(self,ItMi_PortraitRings_Empty);
	MIS_Elena_Present_BrianReturn = TRUE;
	B_GiveAchievement_Elena_CapriciousGirl();
};

//===================================================
instance DIA_Brian_Elena_RingsReturnDone(C_Info)
{
	npc = VLK_457_Brian;					nr = 8;
	condition = DIA_Brian_Elena_RingsReturn_Cond;
	information = DIA_Brian_Elena_RingsReturn_Info;
	important = TRUE;
};
func int DIA_Brian_Elena_RingsReturnDone_Cond()
{
	if (C_HeroIs_Elena()
		 && (MIS_Elena_Present_BrianReturn == TRUE))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_RingsReturnDone_Info()
{
	AI_Output(other,self,"DIA_Brian_Elena_RingsReturnDone_12_00");	//��� ���� ������.
	B_GiveInvItems(self,other,ItMi_GoldRing,2);
	AI_StopProcessInfos(self);
	MIS_Elena_Present_BrianReturn = -1;
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_RingsReturned);
	
};

//===================================================
instance DIA_Brian_Elena_AboutPortraits(C_Info)
{
	npc = VLK_457_Brian;					nr = 9;
	condition = DIA_Brian_Elena_AboutPortraits_Cond;
	information = DIA_Brian_Elena_AboutPortraits_Info;
	description = "��� ��� ����� ��������?";
};
func int DIA_Brian_Elena_AboutPortraits_Cond()
{
	if (C_HeroIs_Elena()
		 && (Npc_KnowsInfo(other,DIA_Brian_Elena_HeardPresent))
		 && (MIS_Elena_Present == LOG_Running) && (MIS_Elena_Present_BrianReturn == FALSE) && (MIS_Elena_Present_KnowsBrahim == FALSE))	{
		return TRUE;
	};
};

func void DIA_Brian_Elena_AboutPortraits_Info()
{
		AI_Output(other,self,"DIA_Brian_Elena_AboutPortraits_12_00");	//��� ��� ����� ��������?
	AI_Output(self,other,"DIA_Brian_Elena_AboutPortraits_04_01");	//� ���� ����, ��������.
		AI_Output(other,self,"DIA_Brian_Elena_AboutPortraits_12_02");	//��� � �������. �� � ��� ����� ��� ����� ��������� ���������, ������� ����� �������� � ������.
		AI_Output(other,self,"DIA_Brian_Elena_AboutPortraits_12_03");	//�� �� ������ ���������, ������� ��� �� ������� ����� ������� �������?
	AI_Output(self,other,"DIA_Brian_Elena_AboutPortraits_04_04");	//�������� � ���������, �����������. �� ����� � �����, ������ �� ������.
	MIS_Elena_Present_KnowsBrahim = TRUE;
	B_LogEntry(TOPIC_Elena_Present,TOPIC_Elena_Present_KnowsBrahim);
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Brian_Apprentice(C_Info)
{
	npc = VLK_457_Brian;					nr = 10;
	condition = DIA_NoCond_cond;
	information = DIA_Brian_Apprentice_Info;
	description = "������ ���� �������� �������?";
	permanent = TRUE;
};
func void DIA_Brian_Apprentice_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Brian_Apprentice_03_00");	//������ ���� �������� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Brian_Apprentice_07_00");	//������ ���� �������� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Brian_Apprentice_10_00");	//������ ���� �������� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Brian_Apprentice_14_00");	//������ ���� �������� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Brian_Apprentice_16_00");	//������ ���� �������� �������?
	};
	AI_Output(self,other,"DIA_Brian_Apprentice_04_01");	//��������. ���� �����-������ � ��� ����� ��������� ��������.
};

//===================================================
instance DIA_Brian_AboutTrade(C_Info)
{
	npc = VLK_457_Brian;					nr = 11;
	condition = DIA_Brian_AboutTrade_cond;
	information = DIA_Brian_AboutTrade_Info;
	description = "�� ���-������ ��������?";
	permanent = TRUE;
};
func int DIA_Brian_AboutTrade_cond() 
{
	if (Brian_KnifeSell == FALSE) {
		return TRUE;
	};
};
func void DIA_Brian_AboutTrade_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Brian_AboutTrade_03_00");	//�� ���-������ ��������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Brian_AboutTrade_07_00");	//�� ���-������ ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Brian_AboutTrade_10_00");	//�� ���-������ ��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Brian_AboutTrade_14_00");	//�� ���-������ ��������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Brian_AboutTrade_16_00");	//�� ���-������ ��������?
	};
	if ((Npc_GetDistToNpc(VLK_412_Harad,self) < PERC_DIST_INTERMEDIAT) || 
		(Npc_GetDistToNpc(VLK_412_Harad,other) < PERC_DIST_DIALOG)
	)	{
		AI_Output(self,other,"DIA_Brian_AboutTrade_04_01");	//���. ������ ���� �� ��������� ��� ���������.
	}
	else	{
		AI_Output(self,other,"DIA_Brian_AboutTrade_04_02");	//� ���� ������� ���� ��������� ���, ������� ������� �� ������� �������.
		AI_Output(self,other,"DIA_Brian_AboutTrade_04_03");	//� ���� ���������� ������ � �������� ������. ��� �������� ���� ���� ��������.
		AI_Output(self,other,"DIA_Brian_AboutTrade_04_04");	//��� ���� - 400 �������.
		AI_Output(self,other,"DIA_Brian_AboutTrade_04_05");	//������ ����� ������ ����� �� ����. ��, ������-��, �� ����� ���������� ��� ���������.
		B_LogNote(TOPIC_Trader,TOPIC_Trader_Brian);
		Brian_KnifeSell = TRUE;
	};
};

//===================================================
instance DIA_Brian_BuyKnife(C_Info)
{
	npc = VLK_457_Brian;					nr = 12;
	condition = DIA_Brian_BuyKnife_cond;
	information = DIA_Brian_BuyKnife_Info;
	description = "� ����� ���� ���. (400 ���., ���� 20, ���� 40, +5 � �����.������)";
	permanent = TRUE;
};
func int DIA_Brian_BuyKnife_cond()
{
	if (Brian_KnifeSell == TRUE)	{
		return TRUE;
	};
};
func void DIA_Brian_BuyKnife_Info()
{
	if ((Npc_GetDistToNpc(VLK_412_Harad,self) < PERC_DIST_INTERMEDIAT) || (Npc_GetDistToNpc(VLK_412_Harad,other) < PERC_DIST_DIALOG))	{
		PrintScreen("������ ������������ ������",-1,25,FONT_Screen,3);
	}
	else	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Brian_BuyKnife_03_00");	//� ����� ���� ���.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Brian_BuyKnife_07_00");	//� ����� ���� ���.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Brian_BuyKnife_10_00");	//� ����� ���� ���.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Brian_BuyKnife_14_00");	//� ����� ���� ���.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Brian_BuyKnife_16_00");	//� ����� ���� ���.
		};
		if (C_NpcHasGold(other,Value_BrianKnife))	{
			B_GiveInvItems(other,self,ItMi_Gold,Value_BrianKnife);
			AI_Output(self,other,"DIA_Brian_BuyKnife_04_01");	//�����. ��� ������ �������� ���.
			B_GiveInvItems(self,other,ItMW_MR_1h_BrianKnife,1);
			B_GivePlayerXP(XP_Ambient);
			Brian_KnifeSell = -1;
		}
		else	{
			AI_Output(self,other,"DIA_Brian_BuyKnife_04_02");	//� ������ ��� ������ �� 400 �������.
		};
	};
};

//===================================================
instance DIA_Brian_SharpKnife(C_Info)
{
	npc = VLK_457_Brian;			nr = 13;
	condition = DIA_Brian_SharpKnife_Cond;
	information = DIA_Brian_SharpKnife_Info;
	description = "�� ������ �������� �������� ���?";
	permanent = TRUE;
};
func int DIA_Brian_SharpKnife_Cond()
{
	if (Npc_HasItems(other,ItMW_MR_1h_KitchenKnife_Unsharpen))	{
		return TRUE;
	};
};
func void DIA_Brian_SharpKnife_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Brian_SharpKnife_03_00");	//�� ������ �������� �������� ���?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Brian_SharpKnife_07_00");	//�� ������ �������� �������� ���?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Brian_SharpKnife_10_00");	//�� ������ �������� �������� ���?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Brian_SharpKnife_14_00");	//�� ������ �������� �������� ���?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Brian_SharpKnife_16_00");	//�� ������ �������� �������� ���?
	};
	if (Npc_GetDistToWP(self,"NW_CITY_SMITH_SHARP") < PERC_DIST_INTERMEDIAT)	{
		AI_Output(self,other,"DIA_Brian_SharpKnife_04_01");	//��, �� 15 �������. ����� ���� ���.
		Info_ClearChoices(DIA_Brian_SharpKnife);
		Info_AddChoice(DIA_Brian_SharpKnife,"�����.",DIA_Brian_SharpKnife_Back);
		if (C_NpcHasGold(other,10))	{
			Info_AddChoice(DIA_Brian_SharpKnife,"����� ������. (15 ���.)",DIA_Brian_SharpKnife_DoIt);
		};
	}
	else	{
		AI_Output(self,other,"DIA_Brian_SharpKnife_05_02");	//��, �� 15 �������. ����� ���� � �������. ������� ����.
	};
};
func void DIA_Brian_SharpKnife_Back()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Brian_SharpKnife_Back_03_00");	//�����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Brian_SharpKnife_Back_07_00");	//�����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Brian_SharpKnife_Back_10_00");	//�����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Brian_SharpKnife_Back_14_00");	//�����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Brian_SharpKnife_Back_16_00");	//�����.
	};
	Info_ClearChoices(DIA_Brian_SharpKnife);
};
func void DIA_Brian_SharpKnife_DoIt()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Brian_SharpKnife_DoIt_03_00");	//����� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Brian_SharpKnife_DoIt_07_00");	//����� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Brian_SharpKnife_DoIt_10_00");	//����� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Brian_SharpKnife_DoIt_14_00");	//����� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Brian_SharpKnife_DoIt_16_00");	//����� ������.
	};
	//B_GiveGold(other,self,15);
	//B_GiveInvItems(other,self,ItMW_MR_1h_KitchenKnife_Unsharpen,1);
	ItemTrans_items[0] = ItMW_MR_1h_KitchenKnife_Unsharpen;
	ItemTrans_amount[0] = 1;
	ItemTrans_items[1] = ItMi_Gold;
	ItemTrans_amount[1] = 15;
	B_ItemsTransaction(other,self);
	AI_Output(self,other,"DIA_Brian_SharpKnife_DoIt_04_01");	//���� �������.
	AI_UseMob(self,"BSSHARP",1);
	AI_Wait(self,2.5);
	AI_UseMob(self,"BSSHARP",-1);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"DIA_Brian_SharpKnife_DoIt_04_03");	//��� ���� ���.	
	B_GiveInvItems(self,other,ItMW_MR_1h_KitchenKnife,1);
	Info_ClearChoices(DIA_Brian_SharpKnife);
};

