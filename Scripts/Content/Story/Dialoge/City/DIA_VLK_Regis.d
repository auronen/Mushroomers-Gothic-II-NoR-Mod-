
instance DIA_Regis_EXIT(DIA_Proto_End)
{
	npc = VLK_425_Regis;
};

/////////////////////////////////////// ������ /////////////////////////////////////////////

//===================================================
instance DIA_Regis_Start_Rupert(C_Info)
{
	npc = VLK_425_Regis;
	nr = 10;
	condition = DIA_Regis_Start_Rupert_Condition;
	information = DIA_Regis_Start_Rupert_Info;
	important = TRUE;
};
func int DIA_Regis_Start_Rupert_Condition()
{
	if (C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Regis_Start_Rupert_Info()
{
	START_DIA_Finished = TRUE;
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_00");	//... ������, �������������, �� �������� �������, � �������: 
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_01");	//��������, ���, ������� �� ����� ������! � �������� �������� ���� ������ �� ������ ����, ������� ��� �������� �� ���� ������. 
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_02");	//� ���������� - ������� �����-�� ������� ����.
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_03");	//�, �������, ������, ��� �� � ������ ������� �����, �� ���� ���...
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_04");	//������, ������ ���� ����������� ���� ��������. ��� � ������� ����� ��� �������...  (�������)
	CreateInvItem(self,ItFo_Beer);	B_UseItem(self,ItFo_Beer);
		AI_Output(other,self,"DIA_Regis_Start_Rupert_03_05");	//��� ���, �� ������� �� �������?
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_06");	//�?! ���, �-�� ��� � ����� ���. � ������ ����� �� ������, ��������� � ����. 
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_07");	//� � ��� ���� �� �� ����� �������� �� ��������. �� ����, ����� ��-�� ���� ��������� ���� ������� �����. ��� ��� ������.
		AI_Output(other,self,"DIA_Regis_Start_Rupert_03_08");	//� �, �������, ������� �������. � ������ ������ �� ����...
	AI_Output(self,other,"DIA_Regis_Start_Rupert_13_09");	//���� ����.
	CreateInvItem(self,ItFo_Beer);	B_UseItem(self,ItFo_Beer);
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Regis_Rupert_Final(C_Info)
{
	npc = VLK_425_Regis;
	nr = 11;
	condition = DIA_Regis_Rupert_Final_Condition;
	information = DIA_Regis_Rupert_Final_Info;
	important = TRUE;
};
func int DIA_Regis_Rupert_Final_Condition()
{
	if ((C_HeroIs_Rupert()) && (Competition_Result != Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Regis_Rupert_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
			AI_Output(self,other,"DIA_Regis_Rupert_Final_WON_13_01");	//������, �� ������� �������!
			AI_Output(self,other,"DIA_Regis_Rupert_Final_WON_13_02");	//�����, �����������, ��� ��� �� ����.
		AI_Output(other,self,"DIA_Regis_Rupert_Final_WON_03_03");	//����� ����������� � ������. �������� ���������� ���. � ����������, � ����������.
			AI_Output(self,other,"DIA_Regis_Rupert_Final_WON_13_04");	//���� ������ ������! ����� � ���������.
	}
	else	{
			AI_Output(self,other,"DIA_Regis_Rupert_Final_LOST_13_01");	//������, �� �������� �������!
		AI_Output(other,self,"DIA_Regis_Rupert_Final_LOST_03_02");	//���� ����� ������� �����������.
			AI_Output(self,other,"DIA_Regis_Rupert_Final_LOST_13_03");	//� �� ������ �� ��� ������ ���������?
	};
	Info_ClearChoices(DIA_Regis_Rupert_Final);
	Info_AddChoice(DIA_Regis_Rupert_Final,"�����!",DIA_Regis_Rupert_Final_Yes);
	Info_AddChoice(DIA_Regis_Rupert_Final,"������� � ���.",DIA_Regis_Rupert_Final_No);
};
func void DIA_Regis_Rupert_Final_No()
{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_01");	//������� � ���.
	if (C_NpcHasGold(other,100))	{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_02");	//�� ���� ������� � ������ ����������� ������.
	}
	else	{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_03");	//� ��-�������� ��� �����.
	};
	if (MIS_Rupert_Debts == LOG_SUCCESS)	{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_04");	//� � ������-������ ����������� �� ����� �������.
	};
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_05");	//� ����� ��������� ����� ������.
	AI_Output(self,other,"DIA_Regis_Rupert_Final_No_13_06");	//� �����, ��� ���� �������? ���� �� ��� �������?
	AI_Output(self,other,"DIA_Regis_Rupert_Final_No_13_07");	//��� ���� ����������� �����-�� ������ ������?
		AI_Output(other,self,"DIA_Regis_Rupert_Final_No_03_08");	//����� ����� �����, ���������� ������ �������. ������� ����� �� ������ �� ��������� ��������, �� � ���������� ����-�� � �����!
	AI_Output(self,other,"DIA_Regis_Rupert_Final_No_13_09");	//�����, �����, � �����. �� ������ - �� ����.
	AI_StopProcessInfos(self);
	
};
func void DIA_Regis_Rupert_Final_Yes()
{
	Rupert_Binge = 1;
		AI_Output(other,self,"DIA_Regis_Rupert_Final_Yes_03_01");	//�����!
	if (C_NpcHasGold(other,100))	{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_Yes_03_02");	//� ������! � ������ ��� �������.
			AI_Output(self,other,"DIA_Regis_Rupert_Final_Yes_13_03");	//��� ��� ��������!
	}
	else	{
		AI_Output(other,self,"DIA_Regis_Rupert_Final_Yes_03_04");	//������ �� ��������. � ��� ��� ��� �����.
			AI_Output(self,other,"DIA_Regis_Rupert_Final_Yes_13_05");	//��, �� ������ ������...
	};
			AI_Output(self,other,"DIA_Regis_Rupert_Final_Yes_13_06");	//���� �������!
	B_StartOtherRoutine(self,"BINGE");
	AI_StopProcessInfos(self);
};
// ������� ==================================================
instance DIA_Regis_Rupert_Binge(C_Info)
{
	npc = VLK_425_Regis;
	nr = 12;
	condition = DIA_Regis_Rupert_Binge_Condition;
	information = DIA_Regis_Rupert_Binge_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Regis_Rupert_Binge_Condition()
{
	if ((C_HeroIs_Rupert()) && (Rupert_Binge > 0))	{
		return TRUE;
	};
};
func void DIA_Regis_Rupert_Binge_Info()
{
	Wld_GetFullTime();
	var string h;
	var string m;
	if (Wld_hour > 9)	{	h = IntToString(Wld_Hour);	} else {	h = ConcatStrings("0",IntToString(Wld_Hour));	};
	if (Wld_minute > 9)	{	m = IntToString(Wld_minute);} else {	m = ConcatStrings("0",IntToString(Wld_minute));	};
	PrintScreen(CS3(h,":",m),-1,-1,FONT_Screen,4);
	Wld_StopEffect("TIMELAPSE_BLEND");
	if (Rupert_Binge == 1)	{
		AI_Output(self,other,"DIA_Regis_Rupert_Binge_Start_13_01");	//��, �� �����!
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_Start_03_02");	//�� �����!
	};
	if (Rupert_Binge == 2)	{
		if (MR_Counter[MR_Heart] > 0)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_MR_Heart_03_01");	//...���� ���� ����� ��� ������. ����������� ��� ���� �� �������, ����� ������!
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_MR_Heart_13_02");	//����, ��������. ������ �� ������, ��� �� ��� ��!
		}
		else	{
			Rupert_Binge += 1;	//��������� �����
		};
	};
	if (Rupert_Binge == 3)	{
		if ((MR_Counter[MR_Governor] > 0) || (MR_Eaten[MR_Governor] > 0))	{
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_MR_Governor_13_01");	//...� � ������ �����! ������ ����������� � �����, � ���������� �����!
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_MR_Governor_03_02");	//� ������� ����� ������ �� ������?
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_MR_Governor_13_03");	//� � ������?
		}
		else	{
			Rupert_Binge += 1;	//��������� �����
		};
	};
	if (Rupert_Binge == 4)	{
		if (MIS_Rupert_Debts_Lehmar_Sword == MIS_Rupert_Debts_Lehmar_SwordGiven)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_SwordGiven_03_01");	//...��������� ������ ���! �� � ���� ��� ���� � ������ �� �������!
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_SwordGiven_13_02");	//�� ����!
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_SwordGiven_03_03");	//�� ����!
		}
		else	{
			Rupert_Binge += 1;	//��������� �����
		};
	};
	if (Rupert_Binge == 5)	{
		if (MIS_MalethWolves == LOG_SUCCESS)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_MalethWolves_03_01");	//...������� ����� � ��� �������� ������ ����, ��� �� ����� � ��������. ��� ���� �������� ������ � ������.
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_MalethWolves_13_02");	//�����!
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_MalethWolves_03_03");	//����� �������!
		}
		else	{
			Rupert_Binge += 1;	//��������� �����
		};
	};
	if (Rupert_Binge == 6)	{
		if (MIS_FellanGoHome == LOG_SUCCESS)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_FellanGoHome_03_01");	//...� ������ �� ����� ���� ������ �������� �� ����� ������. 
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_FellanGoHome_13_02");	//� �-�� �����, ������ ����� � �����? ��-��.
		}
		else	{
			Rupert_Binge += 1;	//��������� �����
		};
	};
	if (Rupert_Binge == 7)	{
		if (MIS_Cookery == LOG_SUCCESS)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_Cookery_03_01");	//...� ���������� ������� ��� � �����. �� ������ ���������� �����������!
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_Cookery_13_02");	//� �� ����� �� �������� ����������� ���������������...
		}
		else	{
			Rupert_Binge += 1;	//��������� �����
		};
	};
	if (Rupert_Binge == 8)	{
		if (Vino_Found)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_VinoFound_03_01");	//...�� ������ �������� � ����� ���� � �����. �� �� ����, ���� �� ��� �������, �� �������� ��� ������!
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_VinoFound_13_02");	//��������� �� ��� ���-����, ��...
		}
		else	{
			Rupert_Binge += 1;	//��������� �����
		};
	};
	if (Rupert_Binge == 9)	{
		if (MIS_KhorinisPost_VinoDelivered)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_VinoDelivered_03_01");	//...� �� ��� � ���... �����... ������ ��������... ������ ����... ������... �����...
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_VinoDelivered_13_02");	//��� �� ��� ����������, �!
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_VinoDelivered_03_03");	//���!
	}
		else	{
			Rupert_Binge += 1;	//��������� �����
		};
	};
	if (Rupert_Binge == 10)	{
			AI_Output(other,self,"DIA_Regis_Rupert_Binge_More_03_01");	//���� �����-���!
				AI_Output(self,other,"DIA_Regis_Rupert_Binge_More_13_02");	//����!
	};
	//�����
	if (Rupert_Binge == 12)	{
		Wld_PlayEffect("DRUNK",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,ItMi_Gold,Npc_HasItems(hero,ItMi_Gold));
		AI_PlayAni(other,"T_DANCE_04");
		AI_TurnToNpc(self,other);
		AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
		AI_Wait(other,0.8);
		AI_PlayAniBS(other,"T_STAND_2_SLEEPFIRECAMP",BS_LIE);
		AI_StopProcessInfos(self);
		Rupert_Binge = 100;
		return;
	};
	//����� ������ ����� ���� - ������� ����, ����� ����, ����� �������
	AI_StopLookAt(self);
	if (Rupert_Binge < 4)	{
		CreateInvItem(self,ItFo_Beer);		B_UseItem(self,ItFo_Beer);
		CreateInvItem(other,ItFo_Beer);		B_UseItem(other,ItFo_Beer);
	}
	else if (Rupert_Binge < 7)	{
		CreateInvItem(self,ItFo_Wine);		B_UseItem(self,ItFo_Wine);
		CreateInvItem(other,ItFo_Wine);		B_UseItem(other,ItFo_Wine);
	}
	else	{
		CreateInvItem(self,ItFo_Booze);		B_UseItem(self,ItFo_Booze);
		CreateInvItem(other,ItFo_Booze);	B_UseItem(other,ItFo_Booze);
	};
	Rupert_Binge += 1;
	AI_StopProcessInfos(self);
};
//==========================
instance DIA_Regis_Rupert_Binge_Wake(C_Info)
{
	npc = PC_Rupert;
	condition = DIA_Regis_Rupert_Binge_Wake_Condition;
	information = DIA_Regis_Rupert_Binge_OpenEyes;
	description = "(������� �����)";
};
func int DIA_Regis_Rupert_Binge_Wake_Condition()
{
	if ((C_HeroIs_Rupert()) && (Rupert_Binge == -2))	{
		return TRUE;
	};
};
func void DIA_Regis_Rupert_Binge_OpenEyes()
{
	Wld_StopEffect("TIMELAPSE_BLEND");
	Wld_PlayEffect("DRUNK",hero,hero,0,0,0,FALSE);
	Info_ClearChoices(DIA_Regis_Rupert_Binge_Wake);
	Info_AddChoice(DIA_Regis_Rupert_Binge_Wake,"(���������� ������)",DIA_Regis_Rupert_Binge_TryGetUp);
};	
func void DIA_Regis_Rupert_Binge_TryGetUp()
{
	AI_PlayAniBS(hero,"T_SLEEPGROUND_2_STAND",BS_STAND);
	AI_PrintScreen("��� ������...",-1,-1,FONT_Screen,2);
	AI_PlayAniBS(hero,"T_STAND_2_WOUNDED",BS_LIE);
	Info_ClearChoices(DIA_Regis_Rupert_Binge_Wake);
	Info_AddChoice(DIA_Regis_Rupert_Binge_Wake,"(���������� ��� ���)",DIA_Regis_Rupert_Binge_GetUp);
};	
func void DIA_Regis_Rupert_Binge_GetUp()
{
	AI_PlayAniBS(hero,"T_WOUNDED_2_STAND",BS_STAND);
	AI_PrintScreen("����, ���� ���� �������...",-1,-1,FONT_Screen,2);
	AI_StopProcessInfos(self);
//	Wld_StopEffect("DRUNK");
	Rupert_Binge = -3;
};


/////////////////////////////////////// ��������� /////////////////////////////////////////////

//===================================================
instance DIA_Regis_Hello(C_Info)
{
	npc = VLK_425_Regis;
	nr = 1;
	condition = DIA_Regis_MR_Hello_Condition;
	information = DIA_Regis_MR_Hello_Info;
	description = "������.";
};
func int DIA_Regis_MR_Hello_Condition()
{
	if (!C_HeroIs_Rupert()
		 && (Competition_Result == Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Regis_MR_Hello_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Regis_MR_Hello_03_00");	//������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Regis_MR_Hello_07_00");	//������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_10_00");	//������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_14_00");	//������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_16_00");	//������.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_13_01");	//������.
	AI_Output(self,other,"DIA_Regis_MR_Hello_13_02");	//�� ���� �� ����, ��������� �� �������, �����?
	AI_Output(self,other,"DIA_Regis_MR_Hello_13_03");	//��� ���� ������?
	Info_ClearChoices(DIA_Regis_Hello);
	Info_AddChoice(DIA_Regis_Hello,"�� �����.",DIA_Regis_MR_Hello_Secret);
	Info_AddChoice(DIA_Regis_Hello,"�� ����.",DIA_Regis_MR_Hello_DontKnow);
	Info_AddChoice(DIA_Regis_Hello,"�����.",DIA_Regis_MR_Hello_Bad);
	Info_AddChoice(DIA_Regis_Hello,"���������.",DIA_Regis_MR_Hello_Norm);
	Info_AddChoice(DIA_Regis_Hello,"������.",DIA_Regis_MR_Hello_Good);
	Info_AddChoice(DIA_Regis_Hello,"�������.",DIA_Regis_MR_Hello_Cool);
	
};
func void DIA_Regis_MR_Hello_Cool()
{
	if (hero.voice == 3)	{			//���/������/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Cool_03_00");	//�������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Regis_MR_Hello_Cool_07_00");	//�������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Cool_10_00");	//�������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Cool_14_00");	//�������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Cool_16_00");	//�������.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_Cool_13_01");	//����������!
	Info_ClearChoices(DIA_Regis_Hello);
};
func void DIA_Regis_MR_Hello_Good()
{
	if (hero.voice == 3)	{			//���/������/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Good_03_00");	//������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Regis_MR_Hello_Good_07_00");	//������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Good_10_00");	//������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Good_14_00");	//������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Good_16_00");	//������.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_Good_13_01");	//��� �������!
	Info_ClearChoices(DIA_Regis_Hello);
};
func void DIA_Regis_MR_Hello_Norm()
{
	if (hero.voice == 3)	{			//���/������/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Norm_03_00");	//���������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Regis_MR_Hello_Norm_07_00");	//���������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Norm_10_00");	//���������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Norm_14_00");	//���������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Norm_16_00");	//���������.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_Norm_13_01");	//��, ����� ������!
	Info_ClearChoices(DIA_Regis_Hello);
};
func void DIA_Regis_MR_Hello_Bad()
{
	if (hero.voice == 3)	{			//���/������/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Bad_03_00");	//�����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Regis_MR_Hello_Bad_07_00");	//�����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Bad_10_00");	//�����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Bad_14_00");	//�����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Bad_16_00");	//�����.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_Bad_13_01");	//����������.
	if (Wld_GetDay() < 7)	{
		AI_Output(self,other,"DIA_Regis_MR_Hello_Bad_13_02");	//�� � ���� ��� ���� �����!
	};
	Info_ClearChoices(DIA_Regis_Hello);
};
func void DIA_Regis_MR_Hello_DontKnow()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Regis_MR_Hello_DontKnow_03_00");	//�� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Regis_MR_Hello_DontKnow_07_00");	//�� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_DontKnow_10_00");	//�� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_DontKnow_14_00");	//�� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_DintKnow_16_00");	//�� ����.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_DontKnow_13_01");	//����� ������� � �����������.
	AI_Output(self,other,"DIA_Regis_MR_Hello_DontKnow_13_02");	//������, �� �� ������ ������ ������� �� ������������, � ��� ���� ���������.
	Info_ClearChoices(DIA_Regis_Hello);
};
func void DIA_Regis_MR_Hello_Secret()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Regis_MR_Hello_Secret_03_00");	//�� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Regis_MR_Hello_Secret_07_00");	//�� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Secret_10_00");	//�� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Secret_14_00");	//�� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Regis_MR_Hello_Secret_16_00");	//�� �����.
	};
	AI_Output(self,other,"DIA_Regis_MR_Hello_Secret_13_01");	//��, � ������ �������. � ����� ������, ����� �����!
	Info_ClearChoices(DIA_Regis_Hello);
};

//===================================================
instance DIA_Regis_Others_Final(C_Info)
{
	npc = VLK_425_Regis;
	nr = 2;
	condition = DIA_Regis_Others_Final_Condition;
	information = DIA_Regis_Others_Final_Info;
	important = TRUE;
};
func int DIA_Regis_Others_Final_Condition()
{
	if ((!C_HeroIs_Rupert()) && (Competition_Result == Competition_Result_WON))	{
		return TRUE;
	};
};
func void DIA_Regis_Others_Final_Info()
{
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Regis_Others_Final_WON_13_01m");	//������, �� ������� � �������� �����������!
	}
	else	{
		AI_Output(self,other,"DIA_Regis_Others_Final_WON_13_01f");	//������, �� �������� � �������� �����������!
	};
		AI_Output(self,other,"DIA_Regis_Others_Final_WON_13_02");	//��� ������������!
};

// ��� ===============================================
instance DIA_Regis_MRPerm(C_Info)
{
	npc = VLK_425_Regis;
	nr = 50;
	condition = DIA_NoCond_cond;
	information = DIA_Regis_MRPerm_Info;
	permanent = TRUE;
	description = "� ��� ������� � ������?";
};
func void DIA_Regis_MRPerm_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Regis_MRPerm_03_00");	//� ��� ������� � ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Regis_MRPerm_07_00");	//� ��� ������� � ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Regis_MRPerm_10_00");	//� ��� ������� � ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Regis_MRPerm_14_00");	//� ��� ������� � ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Regis_MRPerm_16_00");	//� ��� ������� � ������?
	};
	var int rnd;	rnd = Hlp_Random(5);
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_Regis_MRPerm_13_01");	//� �������� �����������, ����������!
		AI_Output(self,other,"DIA_Regis_MRPerm_13_02");	//��� ����� �����, ��� ������ �����������. ��������� ���� ������ ������.
	}
	else if (rnd == 1)	{
		AI_Output(self,other,"DIA_Regis_MRPerm_13_03");	//� ������ ��� ��������� ������� �� �������� �������� ����, �� ������ � �������� ������������ ��������� � ������.
		AI_Output(self,other,"DIA_Regis_MRPerm_13_04");	//����� �� �����, ������ ��� �������.
	}
	else if (rnd == 2)	{
		AI_Output(self,other,"DIA_Regis_MRPerm_13_05");	//������, � ������� �������� ���������� �����.
		AI_Output(self,other,"DIA_Regis_MRPerm_13_06");	//���� ������ ���������, ��� ������, ���������� � ����������.
	}
	else if (rnd == 3)	{
		AI_Output(self,other,"DIA_Regis_MRPerm_13_07");	//����� �� ���� ������ � �����. ��� ������ ����.
		AI_Output(self,other,"DIA_Regis_MRPerm_13_08");	//����� ���� �� �������, �� � ������ � �� ������� ����� ������������.
	}
	else	{
		AI_Output(self,other,"DIA_Regis_MRPerm_13_09");	//�� ��������� ���� ������ ���� ����� �� �������, ��� � ���� �������� �����.
		AI_Output(self,other,"DIA_Regis_MRPerm_13_10");	//���� ���������� �� �����, ������ ������ �� ����� ������, ������ ��� ��� ��������.
		AI_Output(self,other,"DIA_Regis_MRPerm_13_11");	//����� ����� ������ ����� ������, ���� � ����� ��� �� ������.
	};
};
