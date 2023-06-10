
instance DIA_Wasili_EXIT(DIA_Proto_End)
{
	npc = BAU_907_Wasili;
};

////////////////////////////// ����� /////////////////////////////////////
//==================================================
instance DIA_Wasili_Elena_Start(C_INFO)
{
	npc = BAU_907_Wasili;
	nr = 0;
	condition = DIA_Wasili_Elena_Start_cond;
	information = DIA_Wasili_Elena_Start_info;
	important = true;
};
func int DIA_Wasili_Elena_Start_cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Wasili_Elena_Start_info()
{
	AI_Output(self,other,"DIA_Wasili_Elena_Start_01_00");	//���, �����, ����� ���� �� �������?
		AI_Output(other,self,"DIA_Wasili_Elena_Start_16_01");	//�� �����, ����.
};
//==================================================
var int DIA_Wasili_Elena_Coins_Once;
instance DIA_Wasili_Elena_Coins(C_INFO)
{
	npc = BAU_907_Wasili;			nr = 51;
	condition = DIA_Wasili_Elena_Coins_cond;
	information = DIA_Wasili_Elena_Coins_info;
	description = "������, ��� � ���� ����! (������ ������ ������)";
	permanent = true;
};
func int DIA_Wasili_Elena_Coins_cond()
{
	if (C_HeroIs_Elena() && (Npc_HasItems(other,ItMi_OldCoin) > 0))	{
		return TRUE;
	};
};
func void DIA_Wasili_Elena_Coins_info()
{
	var int x;	x = 0;
	var int cnt;	cnt = Npc_HasItems(other,ItMi_OldCoin);
		AI_Output(other,self,"DIA_Wasili_Elena_Coins_16_00");	//������, ��� � ���� ����!
		if (cnt == 1)	{
			AI_Output(other,self,"DIA_Wasili_Elena_Coins_16_01");	//��������� �������!
		}
		else	if (cnt <= 5)	{
			AI_Output(other,self,"DIA_Wasili_Elena_Coins_16_02");	//��������� ��������� �����!
		}
		else	{
			AI_Output(other,self,"DIA_Wasili_Elena_Coins_16_03");	//����� ���� �������!
		};
	x = 1;	if (x==1)	{
		B_GiveInvItems(other,self,ItMi_OldCoin,cnt);
		Npc_RemoveInvItems(self,ItMi_OldCoin,cnt);
		B_GivePlayerXP(cnt);
	};
	if (DIA_Wasili_Elena_Coins_Once == FALSE)	{
		AI_Output(self,other,"DIA_Wasili_Elena_Coins_01_04");	//�� �� ����� �� �������, � �� ��������� ����������?
			AI_Output(other,self,"DIA_Wasili_Elena_Coins_16_05");	//���� ������� �� ������.
		AI_Output(self,other,"DIA_Wasili_Elena_Coins_01_06");	//�� ����� ������� ���, ���� �������.
		DIA_Wasili_Elena_Coins_Once = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Wasili_Elena_Coins_01_07");	//�������, �������!
	};
};
//==================================================
instance DIA_Wasili_Elena_TellStory(C_INFO)
{
	npc = BAU_907_Wasili;				nr = 50;
	condition = DIA_Wasili_Elena_TellStory_cond;
	information = DIA_Wasili_Elena_TellStory_info;
	description = "�������� ���-������.";
	permanent = true;
};
func int DIA_Wasili_Elena_TellStory_cond()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Wasili_Elena_TellStory_info()
{
	AI_Output(other,self,"DIA_Wasili_Elena_TellStory_16_00");	//�������� ���-������.
	if (Wld_IsTime(8,0,21,0))	{
		AI_Output(self,other,"DIA_Wasili_Elena_TellStory_01_01");	//������� ��� ������ ���������. ���� ������, ��� �����, ���� �� �������.
		AI_Output(self,other,"DIA_Wasili_Elena_TellStory_01_02");	//(�������, ����������) ������� �������, ���� ������ ���������.
	}
	else	if (Wld_IsTime(2,0,8,0))	{
		AI_Output(self,other,"DIA_Wasili_Elena_TellStory_01_03");	//(��������) � ��������� ������� ������� �� ����?
	}
	else	{
		AI_Output(self,other,"DIA_Wasili_Elena_TellStory_01_04");	//��� ��� ���� ����������?
		Info_ClearChoices(DIA_Wasili_Elena_TellStory);
		Info_AddChoice(DIA_Wasili_Elena_TellStory,Dialog_Back,DIA_Wasili_Elena_TellStory_Back);
		Info_AddChoice(DIA_Wasili_Elena_TellStory,"��� ������� �����.",DIA_Wasili_Elena_TellStory_Ruins);
		Info_AddChoice(DIA_Wasili_Elena_TellStory,"��� �������.",DIA_Wasili_Elena_TellStory_Ritter);
		Info_AddChoice(DIA_Wasili_Elena_TellStory,"��� ��������.",DIA_Wasili_Elena_TellStory_Dragons);
		if (Wasili_LutikStory_Part == 1)	{
			Info_AddChoice(DIA_Wasili_Elena_TellStory,"��� ������-���������.",DIA_Wasili_Elena_TellStory_Lutik01);
		}
		else if (Wasili_LutikStory_Part == 2)	{
			Info_AddChoice(DIA_Wasili_Elena_TellStory,"����������� ��� ������-���������.",DIA_Wasili_Elena_TellStory_Lutik02);
		}
		else if (Wasili_LutikStory_Part == 3)	{
			Info_AddChoice(DIA_Wasili_Elena_TellStory,"����� ������� ��� ������-���������.",DIA_Wasili_Elena_TellStory_Lutik03);
		};
	};
};
func void DIA_Wasili_Elena_TellStory_Back()
{
		AI_Output(other,self,"DIA_Wasili_Elena_TellStory_Back_16_00");	//���-������ � ������ ���.
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
};
func void DIA_Wasili_Elena_TellStory_Dragons()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_00");	//� ����������� �������, ��� �����, ��� ��� ����� � �� ������, � ���������, ��� ���� �� ����� ���� �������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_01");	//��� ���� ����� �������� ��������, � �������� ���������� ����� ������ � �������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_02");	//��� ���� ���������, ��� �����, �� ������� ������ ��������� �� � ����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_03");	//�� ������ ����� ���� ����� ������ �����, � � �������� �� ������ ��������� �����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_04");	//� �� ���� ��������� �����, ������� ������ �������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_05");	//������� ���� ������ � �����, ������� � �������, � ����� ������� �����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_06");	//��� ��� ������� ��� ������������ �� ������ ����. � ���� ������� ����� �����, ��� ��� � ��� ������������ ����� ���� ������ � ��������������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_07");	//�� ������� ������� �����, ������� ����� �������� ���� ��������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_08");	//�� ����� �������� ��� ������ ���� �������, � ������ �������, �������, ����� �������� ����� �������. � ������ � ��� ���� �������, ������� � ������ ����� �� ��������� �� ��� �����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_09");	//��������� �� �������� ����������� ��� ������, � �������� ��� ������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_10");	//� ����� ������� ������ �������, � � ���� ������ � ��������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Dragons_01_11");	//��������� ������, ������, ����� �������� �� �����, ���� �� ����� ��� �����-��������... �� ��� ��� ��������� ������.
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	if (Wasili_LutikStory_Part == 0)	{
		Wasili_LutikStory_Part = 1;
	};
	if (!Tale_Dragons_Once)	{
		Tale_Dragons_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
func void DIA_Wasili_Elena_TellStory_Ritter()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_00");	//������... ������ ������ ������ �� ��, ��� ���� ������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_01");	//������ �� �� ������ ���� � ������ �������, �� ������ ��������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_02");	//� ������ ������ ������ ��� ������. � ���� �� �� ����� �����, � �����-����� ����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_03");	//��� ����� ��� ������������� � ����� ������ ����������, ����� ��������� ����� �������� ������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_04");	//��� �� ��������� � ������, � �������������� �� ����� ����, ����� ���� ������ � ����� ������ � ������� ������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_05");	//� ����� �� ��� ������� ����� �������: �� ����������� �������, �� �������� ������, �� ������ ����-����������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ritter_01_06");	//����, ������ � ������ ������, ��������� �������. �� ��� ��� ������ ����� ������ �� ����� - �� ������ �������, �� ���� ������.
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	if (!Tale_Ritters_Once)	{
		Tale_Ritters_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
func void DIA_Wasili_Elena_TellStory_Ruins()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_00");	//������ � ����� ����� ����� ������� �����. ��� ��������� �������� ������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_01");	//�������, �����-�� ��� ���� ���������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_02");	//� ��� ������, ����� ��� ���� ��������� ��� � ����� ����� �� ������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_03");	//������ � ���� ������ ����� ���� ����� ������ ���������, � ���� ���������� ������ �������� �����������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_04");	//��� �������� ������, ������������ ������, ���������� ������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_05");	//�� ������ ��� �������� ������ ������� ���� � �������� �������� � ���������� �� ������� �����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Ruins_01_06");	//� ��� �������, ��� ����� ���� � � ������, �� �� ��������� � �� ������ ������� ���������� �����.
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	if (!Tale_Ruins_Once)	{
		Tale_Ruins_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};

func void DIA_Wasili_Elena_TellStory_Lutik01()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_00");	//�����-�������� ������� ������ ���������� ������� �� ���� ��������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_01");	//��� ����� ����� ��� ���������, ������� ����� ������������ ��� ��� ������� �������, ������� ��������� �� ����� ������� � ����� � ����� ������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_02");	//����� ������� ��� ���� ������ ����� �������, � ����� �����, ���������� � �����������. ���� ��������� �� ������������� ��� ������� �� ��������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_03");	//����� ��� ��� ������ ��������, ������ ��� �� ��� ����� ����� � ����������, ����� ����, �� � ��� � ���� ���� ������ �� ������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_04");	//���� �� ����� ������ �����, ���� ���������� ������ �� ����� ��� �������. �� � ���� ��� ����� �� �������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik01_01_05");	//�� ������ ����� ���� ������ � ���� �����, ����� � ������� ������� � ��������� ��������, �� ����� ����� �� ����� ������� �������. �� ������ �������� ����, ������ ��� ��� ��� ����� ��������� ������ � ��������.
	Wasili_LutikStory_Part = 2;
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	Info_AddChoice(DIA_Wasili_Elena_TellStory,"����� ��������� �������.",DIA_Wasili_Elena_TellStory_LutikLater);
	Info_AddChoice(DIA_Wasili_Elena_TellStory,"(������� ������)",DIA_Wasili_Elena_TellStory_Lutik02);
};

func void DIA_Wasili_Elena_TellStory_Lutik02()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_00");	//������� ����� ����������� �� ������ ����� ��������� �������� ����� � ����� �����. ����� �� �������, ��� �� ��� ����� ���-�� ��������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_01");	//��� �� �� ��������, ����� ������ �� ���� �� ������ � ���� �� ������, � �������� ������ �������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_02");	//����� ���������� ����� �� ������� ����� � � ������ �������� ������ � ����, ��� �� ���� �� ����� �� ���� �������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_03");	//� ���, ��� �� ����� ������� �� ��������� � ������, �� ������ ���� ������. ��� ����������� ����� ����� ������� � ����� ���������� ������, � �� ������� ����������� ������� ����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_04");	//� ��� � ������� ����� ������� ������� ����, � ������� ���� ���������� �������������, ������� � ����� � �������� - ������������, ������ � ��� ���-��.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_05");	//����� ������ �������, �� ������ ��� ����� ��� �������. �� ����� ������� ����� ������� ������� � ������� ����������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik02_01_06");	//���������� ������ ������� � ���������� ����� � ��������. ������ - � ��� ������� ���� ����� ����� � ����� - ������� � ������ � ������� � �������.
	Wasili_LutikStory_Part = 3;
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	Info_AddChoice(DIA_Wasili_Elena_TellStory,"����� ��������� �������.",DIA_Wasili_Elena_TellStory_LutikLater);
	Info_AddChoice(DIA_Wasili_Elena_TellStory,"(������� ������)",DIA_Wasili_Elena_TellStory_Lutik03);
};

func void DIA_Wasili_Elena_TellStory_Lutik03()
{
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_00");	//� ��������� ��� ������ �������� �� ������, � ����� �������� ������. �������, � ���� ���� ��� ���������, �� ������� ���� ������� ���.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_01");	//� ����� ������ �� ��������� � ����� ���������. ������ �������� �� ��� ���� ������ �� ������� ��� �... �������. 
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_02");	//������ ���� ������� ����� � ���� �� ������, �� �� ���������. ����� ������ ���� ����� ��������� ������, ����� ��������� �����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_03");	//����� �����, ��� ���� �������� �� ���� ����, �� ��������, � ������������ ����� ��������� �������� ������. � �� �������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_04");	//����� ������� ��� ������ � ������, ��� ������� �� ������, ����������� ����� �������� ����� � �������� �� ���, ����� �� �����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_05");	//������, ��� ������ �����, ��� �� ���������, ����� �������� �� ����� � �������� �� �����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_06");	//� ��� ������� ������ ����� ���� ��� � ������. ������ ����� � ��� �������, �� ����� �� ��� �������� ������ �� ���������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_07");	//�� ��� ������ ����� ���������� �������� ��������. ������ ��� ������ ������ ������� ����, � ������� �������� ������ � �����������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_08");	//������ ����� ���������, � �� ����� ���������� ������ ���������� ������ �����. � � ������ �������� ���� ��������� ������ ������ �� ��� �����.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_09");	//�� ��� ����� ������������� � �����, � ����� �������� ����� ��������. � ����� ����������� ��� �������, ��� ����� �� �����, � ������ ������� ������� ����������.
	AI_Output(self,other,"DIA_Wasili_Elena_TellStory_Lutik03_01_10");	//������ �������� ��������� ��� � ����� ����������� �� ��� ����� � ����� �����.
	Wasili_LutikStory_Part = 1;
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
	if (!Tale_Lutik_Once)	{
		Tale_Lutik_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
func void DIA_Wasili_Elena_TellStory_LutikLater()
{
		AI_Output(other,self,"DIA_Wasili_Elena_TellStory_LutikLater_16_00");	//����� ��������� �������.
	Info_ClearChoices(DIA_Wasili_Elena_TellStory);
};

//==================================================
instance DIA_Wasili_Elena_AskPortrait(C_INFO)
{
	npc = BAU_907_Wasili;				nr = 1;
	condition = DIA_Wasili_Elena_AskPortrait_cond;
	information = DIA_Wasili_Elena_AskPortrait_info;
	description = "�� �� ������, ��� ������� ��������� � ���������?";
	permanent = TRUE;
};
func int DIA_Wasili_Elena_AskPortrait_cond()
{
	if (C_HeroIs_Elena()
		 && Npc_KnowsInfo(other,DIA_Brian_Elena_HeardPresent)
		 && !MIS_Elena_Present_WasiliPortraitGot
		 && (MIS_Elena_Present == LOG_Running))	
	{
		return TRUE;
	};
};
func void DIA_Wasili_Elena_AskPortrait_info()
{
	// ���� �� ������ �������
	if (Npc_CanSeeNpcFreeLOS(Bau_900_Onar,other) || (Npc_GetDistToNpc(Bau_900_Onar,other) < PERC_DIST_INTERMEDIAT) && (Npc_GetHeightToNpc(Bau_900_Onar,other) < PERC_DIST_HEIGHT))
	{
		PrintScreen("������ ����������� ������.",-1,48,FONT_Screen,2);
		PrintScreen("���� �� ������ ��������.",-1,52,FONT_Screen,2);
	}
	else	{
		AI_Output(other,self,"DIA_Wasili_Elena_AskPortrait_16_00");	//�� �� ������, ��� ������� ��������� � ���������?
			AI_Output(self,other,"DIA_Wasili_Elena_AskPortrait_01_01");	//����, ������ ���� ���� ��� ������ �������, ���� ������, ��� �� �� �������� ������.
		AI_Output(other,self,"DIA_Wasili_Elena_AskPortrait_16_01");	//�� ��� ������? � �� �� ����� �������.
			AI_Output(self,other,"DIA_Wasili_Elena_AskPortrait_01_02");	//� ������ ���� � ���� �� ���������?
		AI_Output(other,self,"DIA_Wasili_Elena_AskPortrait_16_03");	//������� �������. ���-����!
			AI_Output(self,other,"DIA_Wasili_Elena_AskPortrait_01_04");	//��, �����. �� �����. ��� ���� ���� �������.
		B_GiveInvItems(self,other,ItMi_PortraitOnarMaria,1);
			AI_Output(self,other,"DIA_Wasili_Elena_AskPortrait_01_05");	//������ ������, �� ����� ��������.
		MIS_Elena_Present_WasiliPortraitGot = TRUE;
		B_GivePlayerXP(XP_Elena_PortretGot);
	};
};

//==================================================
instance DIA_Wasili_Elena_ReturnPortrait(C_INFO)
{
	npc = BAU_907_Wasili;				nr = 2;
	condition = DIA_Wasili_Elena_ReturnPortrait_cond;
	information = DIA_Wasili_Elena_ReturnPortrait_info;
	description = "���, � �������� �������� �����.";
};
func int DIA_Wasili_Elena_ReturnPortrait_cond()
{
	if (C_HeroIs_Elena()
		 && Npc_HasItems(other,ItMi_PortraitOnarMaria)
		// ���� �� ������ �������
		 && (!Npc_CanSeeNpcFreeLOS(Bau_900_Onar,other) || (Npc_GetDistToNpc(Bau_900_Onar,other) > PERC_DIST_INTERMEDIAT) || (Npc_GetHeightToNpc(Bau_900_Onar,other) > PERC_DIST_HEIGHT))
		// ������� ������ �� �����
		 && (MIS_Elena_Present_PortraitsReady || MIS_Elena_Present_BrianReturn || (MIS_Elena_Present == LOG_SUCCESS)))	
	{
		return TRUE;
	};
};
func void DIA_Wasili_Elena_ReturnPortrait_info()
{
	AI_Output(other,self,"DIA_Wasili_Elena_ReturnPortrait_16_00");	//���, � �������� ������� �����.
	B_GiveInvItems(other,self,ItMi_PortraitOnarMaria,1);
		AI_Output(self,other,"DIA_Wasili_Elena_ReturnPortrait_01_01");	//�������-��! � ��� ������, �������� ���� ��������.
	B_GivePlayerXP(XP_Elena_PortretReturned);
};


/////////////////////////////////// ���� ///////////////////////////////////////
//==================================================
instance DIA_Wasili_Till_Start(C_INFO)
{
	npc = BAU_907_Wasili;
	nr = 10;
	condition = DIA_Wasili_Till_Start_cond;
	information = DIA_Wasili_Till_Start_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Wasili_Till_Start_cond()
{
	if (C_HeroIs_Till() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Wasili_Till_Start_info()
{
	AI_Output(self,other,"DIA_Wasili_Till_Start_01_00");	//���, ����, ���� ���� �� ������� ���������?
};

/////////////////////////////// ��������� /////////////////////////////////////
//==================================================
instance DIA_Wasili_Others_MR_Perm(C_INFO)
{
	npc = BAU_907_Wasili;
	nr = 30;
	condition = DIA_Wasili_Others_MR_Perm_cond;
	information = DIA_Wasili_Others_MR_Perm_info;
	description = "��� ���� �� ����� �����?";
	permanent = true;
};
func int DIA_Wasili_Others_MR_Perm_cond()
{
	if (!C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Wasili_Others_MR_Perm_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Wasili_Others_MR_Perm_03_00");	//��� ���� �� ����� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Wasili_Others_MR_Perm_07_00");	//��� ���� �� ����� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Wasili_Others_MR_Perm_10_00");	//��� ���� �� ����� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Wasili_Others_MR_Perm_14_00");	//��� ���� �� ����� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Wasili_Others_MR_Perm_16_00");	//��� ���� �� ����� �����?
	};
	var int rnd;	rnd = Hlp_Random(3);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_Wasili_Others_MR_Perm_01_01");	//���� �����, ��� � ��� ������� ����� ����������, � ������ �� ��� ��������� ��� ����.
		AI_Output(self,other,"DIA_Wasili_Others_MR_Perm_01_02");	//������ ������, ���� ������� ��������.
	}
	else	if (rnd == 1)	{
		AI_Output(self,other,"DIA_Wasili_Others_MR_Perm_01_03");	//��� � �������. ����� ���� ������ ������.
	}
	else	{
		AI_Output(self,other,"DIA_Wasili_Others_MR_Perm_01_04");	//� ������� ����� ������� ������� ������ ��������� �� �������, � �� ����� ����� ����������.
	};
};
//==================================================
instance DIA_Wasili_Others_WhatsUrJob(C_INFO)
{
	npc = BAU_907_Wasili;
	nr = 31;
	condition = DIA_Wasili_Others_WhatsUrJob_cond;
	information = DIA_Wasili_Others_WhatsUrJob_info;
	description = "��� �� �����������?";
	permanent = true;
};
func int DIA_Wasili_Others_WhatsUrJob_cond()
{
	if (!C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Wasili_Others_WhatsUrJob_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Wasili_Others_WhatsUrJob_03_00");	//��� �� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Wasili_Others_WhatsUrJob_07_00");	//��� �� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Wasili_Others_WhatsUrJob_10_00");	//��� �� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Wasili_Others_WhatsUrJob_14_00");	//��� �� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Wasili_Others_WhatsUrJob_16_00");	//��� �� �����������?
	};
	AI_Output(self,other,"DIA_Wasili_Others_WhatsUrJob_01_01");	//����� �� �����. ����� ������ �� ��������� � �� �������.
};



