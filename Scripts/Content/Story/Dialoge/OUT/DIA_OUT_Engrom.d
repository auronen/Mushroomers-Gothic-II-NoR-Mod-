
instance DIA_Engrom_EXIT(DIA_Proto_End)
{
	npc = OUT_1200_Engrom;
};

/////////////////////////////////////// ������ /////////////////////////////////////////////

//===================================================
instance DIA_Engrom_Start_Talbin(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 0;
	condition = DIA_Engrom_Start_Talbin_Cond;
	information = DIA_Engrom_Start_Talbin_Info;
	important = TRUE;
};
func int DIA_Engrom_Start_Talbin_Cond()
{
	if (C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Engrom_Start_Talbin_Info()
{
	Engrom_ArmHurt_Day = Wld_GetDay() + 4;
	Engrom_ArmHurt_Hour = 18;
	var int x; 	x=0;
	START_DIA_Finished = TRUE;
	AI_GotoNpc(other,self);
	AI_StandUp(self);
	AI_TurnToNpc(self,other);
	AI_TurnToNpc(other,self);
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_07_00");	//������, �� ���� �� �������� �������?
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_12_01");	//�� ����?
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_07_02");	//�� �����!
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_12_03");	//����... �� �����. ��� ����� �����?
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_07_04");	//�� ���, � ��������. ������� �� ������, �����������, ������, ������� ���������, �� ��� ������, ��� ������� ������� �� �� �����.
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_07_05");	//�� ����� ������ ����� ����� ������� ����, ��� �������� ��� �����, � � ����� ������ ���������� ����!
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_12_06");	//��? �� ����� ������...
	Info_ClearChoices(DIA_Engrom_Start_Talbin);
	Info_AddChoice(DIA_Engrom_Start_Talbin,"�����!",DIA_Engrom_Start_Talbin_Go);
	Info_AddChoice(DIA_Engrom_Start_Talbin,"������, ����� � � ���� ��� ����...",DIA_Engrom_Start_Talbin_Stay);
};
func void DIA_Engrom_Start_Talbin_Go()
{
	Engrom_Follows = TRUE;
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_Go_07_00");	//�����! ������ � ����������. ����� ���� ����������� ����� ���������.
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_Go_12_01");	//�����. ���� ��� ����� ��� ��� ����. �� ����, ����� �� � ��������� ��������.
	B_StartOtherRoutine(self,"FOLLOW");
	AI_StopProcessInfos(self);
};
func void DIA_Engrom_Start_Talbin_Stay()
{
	Engrom_Follows = FALSE;
		AI_Output(other,self,"DIA_Engrom_Start_Talbin_Stay_07_00");	//������, ����� � � ���� ��� ����... �����, ���� ����� ����������� ����� ����� ������� �����. ���, ������, ���� �����?
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_Stay_12_01");	//��� �����. �� �������� ��� ����� ��������. �����, ����� ������ ��� ��� �������.
	AI_Output(self,other,"DIA_Engrom_Start_Talbin_Stay_12_02");	//�� ���� ���, ����. ����� � ����������� �� ����� � �����?
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Engrom_FollowMe_Talbin(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 1;
	condition = DIA_Engrom_FollowMe_Talbin_Cond;
	information = DIA_Engrom_FollowMe_Talbin_Info;
	description = "������ �� ����.";
};
func int DIA_Engrom_FollowMe_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && (Engrom_Follows == FALSE))	{
		return TRUE;
	};
};
func void DIA_Engrom_FollowMe_Talbin_Info()
{
	Engrom_Follows = TRUE;
	AI_Output(other,self,"DIA_Engrom_FollowMe_Talbin_07_00");	//������ �� ����.
	if (Wld_GetDay_Shifted(Engrom_ArmHurt_Hour) <= Engrom_ArmHurt_Day)	{
		AI_Output(self,other,"DIA_Engrom_FollowMe_Talbin_12_01");	//���.
	}
	else if (Engrom_ArmHurt == TRUE)	{
		AI_Output(self,other,"DIA_Engrom_FollowMe_Talbin_12_02");	//��� ����� ��� ��� �����.
		Engrom_ArmHurt = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_Engrom_FollowMe_Talbin_12_03");	//���-�� � ���� ����� ����� �����������... � ����� ��������.
		AI_Output(self,other,"DIA_Engrom_FollowMe_Talbin_12_04");	//��� ����� �� ����� �������� ���������.
		Engrom_ArmHurt = TRUE;
	};
	B_StartOtherRoutine(self,"FOLLOW");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Engrom_ArmHurt_Talbin(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 3;
	condition = DIA_Engrom_ArmHurt_Talbin_Cond;
	information = DIA_Engrom_ArmHurt_Talbin_Info;
	important = TRUE;
};
func int DIA_Engrom_ArmHurt_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && (Engrom_Follows == TRUE) && (Wld_GetDay_Shifted(Engrom_ArmHurt_Hour) >= Engrom_ArmHurt_Day))	{
		return TRUE;
	};
};
func void DIA_Engrom_ArmHurt_Talbin_Info()
{
	Engrom_Follows = FALSE;
	Engrom_ArmHurt = TRUE;
	Mdl_StartFaceAni(self,"T_HURT",1,5);
	AI_Output(self,other,"DIA_Engrom_ArmHurt_Talbin_12_01");	//������! ��� �����... ��, ������, ��� ������!
	AI_Output(self,other,"DIA_Engrom_ArmHurt_Talbin_12_02");	//� ����� ������� � ������.
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Engrom_Talbin_Perm(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 4;
	condition = DIA_Engrom_Talbin_Perm_Cond;
	information = DIA_Engrom_Talbin_Perm_Info;
	description = "��� ���� �����?";
	permanent = TRUE;
};
func int DIA_Engrom_Talbin_Perm_Cond()
{
	if (C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Engrom_Talbin_Perm_Info()
{
	AI_Output(other,self,"DIA_Engrom_Talbin_Perm_07_03");	//��� ���� �����?
	if (Wld_GetDay_Shifted(Engrom_ArmHurt_Hour) < Engrom_ArmHurt_Day)	{
		AI_Output(self,other,"DIA_Engrom_Talbin_Perm_12_01");	//�������.
	}
	else if (Engrom_ArmHurt == TRUE)	{
		AI_Output(self,other,"DIA_Engrom_Talbin_Perm_12_02");	//�����, ������.
	}
	else	{
		AI_Output(self,other,"DIA_Engrom_Talbin_Perm_12_03");	//����� �����������. ���� ����� ������� ������, �� �� ��� �������.
		Engrom_ArmHurt = TRUE;
	};
};

//===================================================
instance DIA_Engrom_GoHome_Talbin(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 2;
	condition = DIA_Engrom_GoHome_Talbin_Cond;
	information = DIA_Engrom_GoHome_Talbin_Info;
	description = "������ ������������ � ������.";
};
func int DIA_Engrom_GoHome_Talbin_Cond()
{
	if (C_HeroIs_Talbin() && (Engrom_Follows == TRUE))	{
		return TRUE;
	};
};
func void DIA_Engrom_GoHome_Talbin_Info()
{
	Engrom_Follows = FALSE;
		AI_Output(other,self,"DIA_Engrom_GoHome_Talbin_07_00");	//������ ������������ � ������.
	AI_Output(self,other,"DIA_Engrom_GoHome_Talbin_12_01");	//������. ��� ���� ���.
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Engrom_Talbin_Final(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 10;
	condition = DIA_Engrom_Talbin_Final_Condition;
	information = DIA_Engrom_Talbin_Final_Info;
	description = "�� ���, �� ��������!";
};
func int DIA_Engrom_Talbin_Final_Condition()
{
	if ((C_HeroIs_Talbin()) && (Competition_Result != Competition_Result_NONE))	{
		if (Competition_Result == Competition_Result_LOST)	{
			DIA_Engrom_Talbin_Final.description = "���������...";
		};
		return TRUE;
	};
};
func void DIA_Engrom_Talbin_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
			AI_Output(other,self,"DIA_Engrom_Talbin_Final_WON_03_00");	//�� ���, �� ��������!
		AI_Output(self,other,"DIA_Engrom_Talbin_Final_03_WON_01");	//������? ��-�� - � ������ ������� ��������? ��!
		AI_Output(self,other,"DIA_Engrom_Talbin_Final_03_WON_02");	//� ��� ��� �� ����?
			AI_Output(other,self,"DIA_Engrom_Talbin_Final_WON_03_03");	//�� ������ ��� �����... ����������� ������ �� ��� ���������.
	}
	else	{
			AI_Output(other,self,"DIA_Engrom_Talbin_Final_LOST_03_01");	//���������...
		AI_Output(self,other,"DIA_Engrom_Talbin_Final_LOST_03_02");	//����� ��-�� ���� �������! ����� ��� �� �� ��������� ���� ���������?
			AI_Output(other,self,"DIA_Engrom_Talbin_Final_LOST_03_03");	//�� �� ����� �! ������ ����� ���� ��������� �� ����.
	};
	if(Npc_HasItems(other,ItMi_Gold) > 100)	{
			AI_Output(other,self,"DIA_Engrom_Talbin_Final_03_00");	//���� ��������� �����������.
		AI_Output(self,other,"DIA_Engrom_Talbin_Final_03_01");	//� ��� ��� ������.
	};
};


///////////////////////////// ����� ///////////////////////////////
//-----------------------------------------
instance DIA_Engrom_Elena_ShadowFur(C_INFO)
{
	npc = OUT_1200_Engrom;			nr = 20;
	condition = DIA_Engrom_Elena_ShadowFur_cond;
	information = DIA_Engrom_Elena_ShadowFur_info;
	description = "� �� ������ ������ ����� ���������.";
};
func int DIA_Engrom_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena()
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Engrom_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Engrom_Elena_ShadowFur_16_00");	//� �� ������ ������ ����� ���������.
	AI_Output(self,other,"DIA_Engrom_Elena_ShadowFur_12_01");	//���, ������ ����� ���.
	AI_Output(self,other,"DIA_Engrom_Elena_ShadowFur_12_02");	//������ ������ �������� ������ �� �����, � � ���� ����� �����, ������.
};


/////////////////////////////////////// ��������� /////////////////////////////////////////////
var int DIA_Engrom_HowAU_Others_Once;
instance DIA_Engrom_HowAU_Others(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 10;
	condition = DIA_Engrom_HowAU_Others_Cond;
	information = DIA_Engrom_HowAU_Others_Info;
	description = "��� ����?";
	permanent = TRUE;
};
func int DIA_Engrom_HowAU_Others_Cond()
{
	if (!C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Engrom_HowAU_Others_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Engrom_HowAU_Others_03_00");	//��� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Engrom_HowAU_Others_10_00");	//��� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Engrom_HowAU_Others_14_00");	//��� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Engrom_HowAU_Others_16_00");	//��� ����?
	};
	if (DIA_Engrom_HowAU_Others_Once == FALSE)	{
		AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_01");	//�������� �������. � �������� ���� �� ������� ����� � �� ���� ������ ��������.
		AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_02");	//� ��� ��������, ������, ������ ����� ������� ������ ������.
		if (Npc_GetDistToNpc(self,CMP_Talbin) > PERC_DIST_DIALOG)	{
			if ((Npc_GetDistToNpc(self,CMP_Talbin) < PERC_DIST_ACTIVE_MAX) && !C_BodyStateContains(self,BS_SIT))	{
				AI_PlayAni(self,"T_SEARCH");
			};
			AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_03");	//� ������� �����, �� �������� ��� ���� ��������. �������� �� ������� � �������� ������� � ������, ��� ���� ��������� �� �����.
		};
		AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_04");	//������, �� �������� ������� �������� �������.
		DIA_Engrom_HowAU_Others_Once = TRUE;
	}
	else	{
		if (Hlp_Random(2) == 0)	{
			AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_05");	//��� ��� ��.
		}
		else	{
			AI_Output(self,other,"DIA_Engrom_HowAU_Others_12_06");	//������ ������.
		};
	};
};

//---------------------------------------------------
instance DIA_Engrom_Others_AboutArm(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 11;
	condition = DIA_Engrom_Others_AboutArm_Cond;
	information = DIA_Engrom_Others_AboutArm_Info;
	description = "��� ��������� � ����� �����?";
};
func int DIA_Engrom_Others_AboutArm_Cond()
{
	if (!C_HeroIs_Talbin() && DIA_Engrom_HowAU_Others_Once)	{
		return TRUE;
	};
};
func void DIA_Engrom_Others_AboutArm_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_03_00");	//��� ��������� � ����� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_10_00");	//��� ��������� � ����� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_14_00");	//��� ��������� � ����� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_16_00");	//��� ��������� � ����� �����?
	};
	AI_Output(self,other,"DIA_Engrom_Others_AboutArm_12_01");	//���� ��������. ������, ���� �� ������, ���� �� �� ���� ��� ������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_03_02");	//� ��� ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_10_02");	//� ��� ��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_14_02");	//� ��� ��������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Engrom_Others_AboutArm_16_02");	//� ��� ��������?
	};
	AI_Output(self,other,"DIA_Engrom_Others_AboutArm_12_03");	//�� ������� �������.
	DIA_Engrom_TellTales = TRUE;
};

//---------------------------------------------------
instance DIA_Engrom_Others_TellTale_DrunkKeil(C_Info)
{
	npc = OUT_1200_Engrom;
	nr = 12;
	condition = DIA_Engrom_Others_TellTale_DrunkKeil_Cond;
	information = DIA_Engrom_Others_TellTale_DrunkKeil_Info;
	description = "��������, ��� � ����� ������������.";
	permanent = TRUE;
};
func int DIA_Engrom_Others_TellTale_DrunkKeil_Cond()
{
	if (!C_HeroIs_Talbin() && DIA_Engrom_TellTales)	{
		return TRUE;
	};
};
func void DIA_Engrom_Others_TellTale_DrunkKeil_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Engrom_Others_TellTale_DrunkKeil_03_00");	//��������, ��� � ����� ������������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Engrom_Others_TellTale_DrunkKeil_10_00");	//��������, ��� � ����� ������������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Engrom_Others_TellTale_DrunkKeil_14_00");	//��������, ��� � ����� ������������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Engrom_Others_TellTale_DrunkKeil_16_00");	//��������, ��� � ����� ������������.
	};
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_01");	//���� ���� ���. ������ ���� �������� �������� �������, ���������� ��� ����.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_02");	//�� � �������� �������� ����� ���� ��������� ����� � ����� �� �������������, ����� ���������.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_03");	//���� ������� ��� ����� ����� ��� ���������� ������ � �����. ������ ��� ���� ��� �������� ����, �� ������� ���� ����������� � ��� ������.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_04");	//����� �� ��������� �� ������. ����� ����� �� �������� - �� ���� ����� �������� ������� ����� � ���� �������� �����.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_05");	//���� �������, ��� ������ � ������� �� �����, � ��� ���� ��������, ������ ���� ����� ����.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_06");	//� ���, ��� �����, ��� ����� ���������� �������. ��� ���� ������ �����! � ���� �� ����� �����������.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_07");	//��� - ��������� ������ �� �����. ����� �, ��� ����, ���������� � ������ � �������� ����� �������. � ��� �� ������������ ������.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_08");	//����� �� ����� ���� �� ������ � ���� �� �����������. � �� ��� �������� � ����� - ������� ������ � ������ ��������, ���� ����� �� ������������!
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_09");	//��, � �� ��������� � ����� ���������� �������. � ���� �� ���� ��� ��������������� �� �����-�� ������, ������������ �� ����!
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_10");	//� ��������� ����� ����� ����� ������. � ����� ���� ��������� ��������, ��������� � ������� �� ����! ��, �����, - �������.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_11");	//� �� ������� � �����, ��������� �� ����. � ���-�� ������� �����, ���������� � �����������. � ��� � �������, ��� �� ���� ������ ����� ������.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_12");	//������, ��� �� ���� ���������, � �� �� �������� � ��������. � ����� �� ���� �� ����� ��������, � ������ �����.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_13");	//���� ����������� �������� ����� �� ������� ������ � ���������� ��������� ����, ���� � ���������� ����? ��� ���� ����� ������� ������� � ���� �����.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_14");	//��� ������ ����� ���-�� �������, ����� �������� ��� ��������. ��������� ���� ������-�� �������� ��������� � ������ � ���� ���������� ������� �����.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_15");	//� ��������� ���������, �� ��� ����� ����� �������� ������ ����. ������ � ���-��� �����, � ��� ������� ������� - ���.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_16");	//� ��� ����� ������� �� ����� ������ ��� �� ����� � ����. �� ���� ����� �� ��� ����������. ����� ��� �������� ���� �� ����, ��� ����� - � ����� ��������� ��.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_17");	//��� �, ��������, ��������� ����� � ���. ������ ��� �������� ����� � ������ � ������ �������. �� ����� �������� ����� ������ ���������� � ��� ��������.
	AI_Output(self,other,"DIA_Engrom_Others_TellTale_DrunkKeil_12_18");	//������ ��������� ���� ��� ��� �����, �� �� �����. ��� �� � ���� ������� ��������� � ����. � ������ �� ���� �� ���������.
	if (!Tale_DrunkKeil_Once)	{
		Tale_DrunkKeil_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};

