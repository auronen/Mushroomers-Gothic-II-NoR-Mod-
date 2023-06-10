
instance DIA_Grimbald_EXIT(DIA_Proto_End)
{
	npc = OUT_1210_Grimbald;
};


///////////////////////////// ����� ///////////////////////////////
//-----------------------------------------
instance DIA_Grimbald_Elena_ShadowFur(C_INFO)
{
	npc = OUT_1210_Grimbald;			nr = 30;
	condition = DIA_Grimbald_Elena_ShadowFur_cond;
	information = DIA_Grimbald_Elena_ShadowFur_info;
	description = "�����, � � ���� ���� ����� ���������?";
};
func int DIA_Grimbald_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena()
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Grimbald_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Grimbald_Elena_ShadowFur_16_00");	//�����, � � ���� ���� ����� ���������?
	AI_Output(self,other,"DIA_Grimbald_Elena_ShadowFur_07_01");	//����. �� ������� ��������.
};


///////////////////////////// ��� ///////////////////////////////

//=============================================
func void DIA_Grimbald_Success_GoEast()
{
	if (C_HeroIs_Talbin())	{
		AI_Output(other,self,"DIA_Grimbald_Success_GoEast_07_01");	//�� ������ ����������� � ����� ������ ���������� �� ������� ������.
		AI_Output(self,other,"DIA_Grimbald_Success_GoEast_07_02");	//� ��������, ��� �� ��� �������. � �������� �� ��������� ����, ���� �� �� ������.
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_Success_GoEast_07_03");	//� ������� � ������ ��������� ����� ������� ������. ��� ���� ���, ���� �����������.
	};
	B_StartOtherRoutine(self,"GOEAST");
};
//==================================================
instance DIA_Grimbald_Start(C_INFO)
{
	npc = OUT_1210_Grimbald;
	condition = DIA_NoCond_cond;
	information = DIA_Grimbald_Start_Info;
	important = TRUE;
};
func void DIA_Grimbald_Start_Info()
{
	B_StartOtherRoutine(self,"START");
	AI_StopAim(self);
	AI_Output(self,other,"DIA_Grimbald_Start_07_00");	//����� ���� ������! � �� ���� ������ �� ������!
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Grimbald_Start_07_01");	//�����, ���� ��� ������ �����. �� � ��������� �������� � ������...
	AI_Output(self,other,"DIA_Grimbald_Start_07_02");	//� �� ��� ������ ��������?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_Start_03_03");	//����� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_Start_07_03");	//�� �� �������� - �� ����� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Start_10_03");	//�� ���, �� ������� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Start_14_03");	//�� ���, �� ������� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_Start_16_03");	//������� �����.
	};
	AI_Output(self,other,"DIA_Grimbald_Start_07_04");	//�� ����� ������� �����.
	AI_Output(self,other,"DIA_Grimbald_Start_07_05");	//���� �� �������� ��� ���� ������ � ����, �� ���������� �� ����� �����.
	AI_Output(self,other,"DIA_Grimbald_Start_07_06");	//��� ����� ���������� � ���, ������ �� ��� ������ � ����� ���� ���� ���������!
	AI_Output(self,other,"DIA_Grimbald_Start_07_07");	//���� ����� - � � ������� ����. � ����� �����, ��� ����� ������, � ��� ���� �� ���� �������.
	AI_Output(self,other,"DIA_Grimbald_Start_07_08");	//��������� � ���� ������. ��� � ��� ����� ��� �����.
	B_LogEntry_Create(TOPIC_GrimbaldOrcs,LOG_MISSION,TOPIC_GrimbaldOrcs_Start);
	MIS_GrimbaldOrcs = LOG_Running;
};
//==================================================
instance DIA_Grimbald_HowLongAUHere(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 1;
	condition = DIA_Grimbald_HowLongAUHere_cond;
	information = DIA_Grimbald_HowLongAUHere_Info;
	description = "����� �� ��� ������?";
};
func int DIA_Grimbald_HowLongAUHere_cond()
{
	if (MIS_GrimbaldOrcs != LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_Grimbald_HowLongAUHere_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_HowLongAUHere_03_00");	//����� �� ��� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_HowLongAUHere_07_00");	//����� �� ��� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_HowLongAUHere_10_00");	//����� �� ��� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_HowLongAUHere_14_00");	//����� �� ��� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_HowLongAUHere_16_00");	//����� �� ��� ������?
	};
	AI_Output(self,other,"DIA_Grimbald_HowLongAUHere_07_01");	//��������� ����. 
	AI_Output(self,other,"DIA_Grimbald_HowLongAUHere_07_02");	//� ��������, ��� ���� �����, � � ����� ������ ���� �� �������� ��-�����������...
	if (MIS_GrimbaldOrcs_GetBow == 0)	{
		AI_Output(self,other,"DIA_Grimbald_HowLongAUHere_07_03");	//�� � ���� ��� ���-����� ��������...
	};
};

// ���� ������ ==================================================
instance DIA_Grimbald_OrcsDead(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 2;
	condition = DIA_Grimbald_OrcsDead_cond;
	information = DIA_Grimbald_OrcsDead_Info;
	description = "���� ������.";
};
func int DIA_Grimbald_OrcsDead_cond()
{
	if ((MIS_GrimbaldOrcs_DeadCnt == 3) && (MIS_GrimbaldOrcs >= LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Grimbald_OrcsDead_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_03_00");	//���� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_07_00");	//���� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_10_00");	//���� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_14_00");	//���� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_16_00");	//���� ������.
	};
	if (MIS_GrimbaldOrcs == LOG_SUCCESS)	{	//��� ������ ��� � ����
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_07_01");	//��! ��� ����� ���-���� �������� ����. �� � ���� ������ �� �������.
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_07_02");	//������ ����� ���� ���, ��� ��� �������.
		B_GivePlayerXP(XP_GrimbaldOrcs_OrcsDead);
	}
	else if ((MIS_GrimbaldOrcs_GetBow >= MIS_GrimbaldOrcs_GetBow_Go) || (MIS_GrimbaldOrcs_DeadCnt_Seen >= 2))	{	//��� ����������
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_07_03");	//��, � �����. ��� ����� ���-���� �������� ����!
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_07_04");	//� �������� ����� ���������, � ����� ������� �� ������.
		if (Npc_HasItems(self, ItKe_Chest_Hunters))	{
			AI_Output(self,other,"DIA_Grimbald_OrcsDead_True_07_04");	//������ ���� �� ������ �������. ���, ��� ��� ������� - ����.
			B_GiveInvItems(self,other,ItKe_Chest_Hunters,1);
		};
		B_GivePlayerXP(XP_GrimbaldOrcs_OrcsDead);
		DIA_Grimbald_Success_GoEast();
		MIS_GrimbaldOrcs = LOG_SUCCESS;
		B_LogEntry_Status(TOPIC_GrimbaldOrcs,LOG_SUCCESS,TOPIC_GrimbaldOrcs_Success_OrcsDead);
		self.npcType = NPCTYPE_FRIEND;
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_07_05");	//���?! � ���� �� ����.
		Info_ClearChoices(DIA_Grimbald_OrcsDead);
		Info_AddChoice(DIA_Grimbald_OrcsDead,"����� � �������� ���, ���� �� ������.",DIA_Grimbald_OrcsDead_Go2See);
	};
};
func void DIA_Grimbald_OrcsDead_Go2See()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_Go2See_03_00");	//����� � �������� ���, ���� �� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_Go2See_07_00");	//����� � �������� ���, ���� �� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_Go2See_10_00");	//����� � �������� ���, ���� �� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_Go2See_14_00");	//����� � �������� ���, ���� �� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_OrcsDead_Go2See_16_00");	//����� � �������� ���, ���� �� ������.
	};
	AI_Output(self,other,"DIA_Grimbald_OrcsDead_Go2See_07_01");	//������ ��� � � ������! � ���� �� �����, ���� ���� ������� �������!
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_Go2See_07_02");	//���� ���� �� �������.
	}
	else if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_Go2See_07_03");	//���� �� � ������.
	};
	B_StartOtherRoutine(self,"CHECK");
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_GrimbaldOrcs,TOPIC_GrimbaldOrcs_OrcsDead_Liar);
};

// ==================================================
instance DIA_Grimbald_OrcsDead_True(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_OrcsDead_True_cond;
	information = DIA_Grimbald_OrcsDead_True_Info;
	important = TRUE;
};
func int DIA_Grimbald_OrcsDead_True_cond()
{
	if (Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead)
		&& (Npc_GetDistToWP(self,"NW_XARDAS_GOBBO_01") < PERC_DIST_INTERMEDIAT))	{
		return TRUE;
	};
};
func void DIA_Grimbald_OrcsDead_True_Info()
{
	AI_Output(self,other,"DIA_Grimbald_OrcsDead_True_07_01");	//��� ������! ���� � � �� ���� ����� ������.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_True_07_02");	//��������, � ����� ������ �� ������� ����� �����, ����� ����� �����������.
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_True_07_03");	//��������, ���� �� ����� ������ � ���� ����� ����� ������, �� �� ����� �������.
	};
	if (Npc_HasItems(self, ItKe_Chest_Hunters))	{
		AI_Output(self,other,"DIA_Grimbald_OrcsDead_True_07_04");	//������ ���� �� ������ �������. ���, ��� ��� ������� - ����.
		B_GiveInvItems(self,other,ItKe_Chest_Hunters,1);
	};
	//UNTESTED
	B_GivePlayerXP(XP_GrimbaldOrcs_OrcsDead);
	DIA_Grimbald_Success_GoEast();
	MIS_GrimbaldOrcs = LOG_SUCCESS;
	B_LogEntry_Status(TOPIC_GrimbaldOrcs,LOG_SUCCESS,TOPIC_GrimbaldOrcs_Success_OrcsDead);
	self.npcType = NPCTYPE_FRIEND;
};

//����� � ��� ==================================================
instance DIA_Grimbald_WannaRevenge(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 4;
	condition = DIA_Grimbald_WannaRevenge_cond;
	information = DIA_Grimbald_WannaRevenge_Info;
	description = "� �� �� ����� ��������� �����?";
};
func int DIA_Grimbald_WannaRevenge_cond()
{
	if (!Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))	{
		return TRUE;
	};
};
func void DIA_Grimbald_WannaRevenge_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_WannaRevenge_03_00");	//� �� �� ����� ��������� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_WannaRevenge_07_00");	//� �� �� ����� ��������� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_WannaRevenge_10_00");	//� �� �� ����� ��������� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_WannaRevenge_14_00");	//� �� �� ����� ��������� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_WannaRevenge_16_00");	//� �� �� ����� ��������� �����?
	};
	AI_Output(self,other,"DIA_Grimbald_WannaRevenge_07_01");	//�� � ������ �� ���� � �����! �� � �������� ��� � ���� �� ����������.
	AI_Output(self,other,"DIA_Grimbald_WannaRevenge_07_02");	//� �� ��������� ������ ������ �� ���������. �� �� ������ ���� � ������� �������, �� �������� ������.
};
//==================================================
instance DIA_Grimbald_ICanHelp(C_Info)
{
	npc = OUT_1210_Grimbald;
	nr = 5;
	condition = DIA_Grimbald_ICanHelp_Cond;
	information = DIA_Grimbald_ICanHelp_Info;
	description = "������, � ������ ����?";
};
func int DIA_Grimbald_ICanHelp_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Grimbald_WannaRevenge)
		&& (MIS_GrimbaldOrcs != LOG_SUCCESS)
		&& !Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))	{
		return TRUE;
	};
};
func void DIA_Grimbald_ICanHelp_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_03_00");	//������, � ������ ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_07_00");	//������, � ������ ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_10_00");	//������, � ������ ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_14_00");	//������, � ������ ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_16_00");	//������, � ������ ����?
	};
	if (C_HeroIs_Talbin())	{
			AI_Output(self,other,"DIA_Grimbald_ICanHelp_07_01");	//���. � �� ���� ���������� ��� � ���� ����. � ��� ����� �� ����, ����� ��� �������� ������.
	}
	else	{
			AI_Output(self,other,"DIA_Grimbald_ICanHelp_07_02");	//��? �������� ������� �� �����?
			AI_Output(self,other,"DIA_Grimbald_ICanHelp_07_03");	//�� ����� ������� �����.
	};
	Info_ClearChoices(DIA_Grimbald_ICanHelp);
	Info_AddChoice(DIA_Grimbald_ICanHelp,"�� � ���� ����� ����� �����...",DIA_Grimbald_ICanHelp_EasyKillOrc);
	Info_AddChoice(DIA_Grimbald_ICanHelp,"� ��������.",DIA_Grimbald_ICanHelp_Seriosly);
	Info_AddChoice(DIA_Grimbald_ICanHelp,"��, �� ����.",DIA_Grimbald_ICanHelp_UAreRight);
};
func void DIA_Grimbald_ICanHelp_EasyKillOrc()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_EasyKillOrc_03_00");	//�� � ���� ����� ����� �����... �������� � ������ ���������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_EasyKillOrc_07_00");	//�� � ���� ����� ����� �����... ���� � ��� ����� �������, �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_EasyKillOrc_10_00");	//�� � ���� �����... � ��� �� ����� ���� �������� ��� � �����!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_EasyKillOrc_14_00");	//�� � ���� �����... �������� � ������ ���������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_EasyKillOrc_16_00");	//�� � ���� ����� ����� �����... ����� ������� ����.
	};
	AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_01");	//��?..
	Mdl_StartFaceAni(self,"T_HURT",1.0,1);
	AI_PointAtNpc(self,other);
	AI_Wait(self,1.2);
	Mdl_StartFaceAni(self,"S_FRIENDLY",1.0,1);
	AI_StopPointAt(self);
	AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_02");	//���-��-����!!!
	AI_Wait(self,0.8);
	AI_StopPointAt(self);
	B_GivePlayerXP(XP_GrimbaldOrcs_MakeLaugh);
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_03");	//��, ��������!
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_04");	//��, ���������!
	};
	AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_05");	//(������� �����) �������, � �� � ������ ����.
	AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_06");	//������ ��� ��� ������. ����� ����� � ��� �� ������ ������� �������.
	AI_Output(self,other,"DIA_Grimbald_EasyKillOrc_07_07");	//�-��. � ���-�� ��� � ����� �������. ������� ��� ���, ����.
	Info_ClearChoices(DIA_Grimbald_ICanHelp);
	MIS_GrimbaldOrcs_FeelBetter = TRUE;
	MIS_GrimbaldOrcs_GetBow = MIS_GrimbaldOrcs_GetBow_GotIdea;
};
func void DIA_Grimbald_ICanHelp_UAreRight()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_03_00");	//��, �� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_07_00");	//��, �� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_10_00");	//��, �� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_14_00");	//��, �� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_16_00");	//��, �� ����.
	};
	AI_Output(self,other,"DIA_Grimbald_ICanHelp_UAreRight_07_01");	//�������, ����. ���� - ��� �� ���� ���������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_03_02");	//� ������ ����� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_07_02");	//� ������ ����� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_10_02");	//� ������ ����� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_14_02");	//� ������ ����� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_ICanHelp_UAreRight_16_02");	//� ������ ������ ������.
	};
	AI_Output(self,other,"DIA_Grimbald_ICanHelp_UAreRight_07_03");	//�������, �� � ��� ��������, � � ���, ��� � ������ ����, � � ���, ��� ��� ���� ������� ��������� �����.
	AI_Output(self,other,"DIA_Grimbald_ICanHelp_UAreRight_07_04");	//��� ��� ����, ������� ���... ����� ��� ��� ������ �������� �������.
	MIS_GrimbaldOrcs_GetBow = MIS_GrimbaldOrcs_GetBow_GotIdea;
	Info_ClearChoices(DIA_Grimbald_ICanHelp);
};
func void DIA_Grimbald_ICanHelp_Seriosly()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_Seriosly_03_00");	//� ��������. � ����� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_Seriosly_07_00");	//� ������-�� ��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Seriosly_10_00");	//� ������ ��������. � ��� �� ��������� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Seriosly_14_00");	//� ������ ��������. � ����� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_Seriosly_16_00");	//� ��������. � �� ����� �� ������.
	};
	AI_Output(self,other,"DIA_Grimbald_Seriosly_07_01");	//� ����. �� ��� ����. �� ���� ������ ��� �����������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_Seriosly_03_02");	//��� ��� �������, ����� ��������?..
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_Seriosly_07_02");	//��� ��� �������, ����� ��������?..
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Seriosly_10_02");	//��� ��� �������, ����� ��������?...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Seriosly_14_02");	//��� ��� �������, ����� ��������?...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_Seriosly_16_02");	//��� ��� ��������?..
	};
	AI_Output(self,other,"DIA_Grimbald_Seriosly_07_03");	//��� ������ �� ���� ��� ������ ����������.
	AI_Output(self,other,"DIA_Grimbald_Seriosly_07_04");	//������ � ���� ������ ���� ���� ������. ��� ���� �� ������ ������� ��������, ������ ��.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_Seriosly_03_05");	//� ��� ��...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_Seriosly_07_05");	//� ��� ��...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Seriosly_10_05");	//� ��� ��...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Seriosly_14_05");	//� ��� ��...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_Seriosly_16_05");	//� ��� ��...
	};
	AI_Output(self,other,"DIA_Grimbald_Seriosly_07_06");	//� ������ - ���.
	Info_ClearChoices(DIA_Grimbald_ICanHelp);
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_GrimbaldOrcs,TOPIC_GrimbaldOrcs_Unbealief);
};


// ���� ���� ==================================================
instance DIA_Grimbald_Idea(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 6;
	condition = DIA_Grimbald_Idea_cond;
	information = DIA_Grimbald_Idea_Info;
	important = TRUE;
};
func int DIA_Grimbald_Idea_cond()
{
	if ((MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_GotIdea)
		&& (Npc_IsInState(self,ZS_Talk))
		&& !Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))
	{
		return TRUE;
	};
};
func void DIA_Grimbald_Idea_Info()
{
	AI_Output(self,other,"DIA_Grimbald_Idea_07_00");	//������� �������!
	AI_Output(self,other,"DIA_Grimbald_Idea_07_01");	//� ���� ��������� ���� ����...
	AI_Output(self,other,"DIA_Grimbald_Idea_07_02");	//��� ����, ����� ������� ���, �� ����������� ������� � ������. ����� �� ������ �������.
	AI_Output(self,other,"DIA_Grimbald_Idea_07_03");	//���� ��� ����� �� ������� ���� �� ����� �� ����, ��� ����� ������.
	Info_ClearChoices(DIA_Grimbald_Idea);
	Info_AddChoice(DIA_Grimbald_Idea,"��� ����� ����?",DIA_Grimbald_Idea_Plan);
};
func void DIA_Grimbald_Idea_Plan()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_Idea_Plan_03_00");	//��� ����� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_Idea_Plan_07_00");	//��� ����� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Idea_Plan_10_00");	//��� ����� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Idea_Plan_14_00");	//��� ����� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_Idea_Plan_16_00");	//��� ����� ����?
	};
	AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_01");	//������ ��� �������� ���� �����. ������� ����, ��� ��������� �������� � �����.
	AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_02");	//�� ������ - ��� ������ ������������. ������ ������� �� ������� �� ����� � ����� ��������.
	AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_03");	//� � � ��� ����� ������ �� �����.
	AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_04");	//� �������, ��� ������, �� ������ ���� � ���� ���.
	AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_05");	//� ���� ���� ������� ����� ������, �� ����� �����, ���� �� ��������� �����.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_06");	//�����, ���� ������ �����.
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_Idea_Plan_07_06a");	//�����, ���� ������ ������.
	};
		B_LogEntry(TOPIC_GrimbaldOrcs,TOPIC_GrimbaldOrcs_Plan);
	MIS_GrimbaldOrcs_GetBow = MIS_GrimbaldOrcs_GetBow_Planned;
};
//-------------------------------------------------
instance DIA_Grimbald_RepeatPlan(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 7;
	condition = DIA_Grimbald_RepeatPlan_cond;
	information = DIA_Grimbald_RepeatPlan_Info;
	permanent = TRUE;
	description = "������� ���� ����.";
};
func int DIA_Grimbald_RepeatPlan_cond()
{
	if ((MIS_GrimbaldOrcs == LOG_Running)
		&& ((MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Planned) || (MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Ready))
		&& !Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))
	{
		return TRUE;
	};
};
func void DIA_Grimbald_RepeatPlan_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_RepeatPlan_03_00");	//������� ���� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_RepeatPlan_07_00");	//������� ���� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_RepeatPlan_10_00");	//������� ���� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_RepeatPlan_14_00");	//������� ���� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_RepeatPlan_16_00");	//������� ���� ����.
	};
	AI_Output(self,other,"DIA_Grimbald_RepeatPlan_07_01");	//���� ������ - ������� �����. ������� ���� ����� ���� ���������� ������ �� �������.
	AI_Output(self,other,"DIA_Grimbald_RepeatPlan_07_02");	//� ��� ����� � ������ �� �����. ��� ����������� ����� ����.
};
//-------------------------------------------------
instance DIA_Grimbald_WhyMe(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 8;
	condition = DIA_Grimbald_WhyMe_cond;
	information = DIA_Grimbald_WhyMe_Info;
	description = "� ������ � �������� �����?";
};
func int DIA_Grimbald_WhyMe_cond()
{
	if ((MIS_GrimbaldOrcs == LOG_Running)
		&& (MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Planned)
		&& !Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))
	{
		return TRUE;
	};
};
func void DIA_Grimbald_WhyMe_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_WhyMe_03_00");	//� ������ � �������� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_WhyMe_07_00");	//� ������ � �������� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_WhyMe_10_00");	//� ������ � �������� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_WhyMe_14_00");	//� ������ � �������� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_WhyMe_16_00");	//� ������ � �������� �����?
	};
	AI_Output(self,other,"DIA_Grimbald_WhyMe_07_01");	//�� �� ������, ��� ��� �����, � ������ ����� ��������.
	AI_Output(self,other,"DIA_Grimbald_WhyMe_07_02");	//� � ������ ������ �� ������. ���� ��� �������� ������� ������...
};

// �������! ==================================================
instance DIA_Grimbald_Ready(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 9;
	condition = DIA_Grimbald_Ready_cond;
	information = DIA_Grimbald_Ready_Info;
	description = "� �����!";
};
func int DIA_Grimbald_Ready_cond()
{
	if ((MIS_GrimbaldOrcs == LOG_Running)
		&& (MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Planned)
		&& (MIS_GrimbaldOrcs_DeadCnt < 3)
		&& !Npc_KnowsInfo(other,DIA_Grimbald_OrcsDead))
	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Grimbald_Ready.description = "� ������!";
		};
		return TRUE;
	};
};
func void DIA_Grimbald_Ready_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_Ready_03_00");	//� �����!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_Ready_07_00");	//� �����!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Ready_10_00");	//� �����!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Ready_14_00");	//� �����!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_Ready_16_00");	//� ������!
	};
	AI_Output(self,other,"DIA_Grimbald_Ready_07_01");	//������. ������ ��� ����� - ����������.
	B_GiveInvItems(self,other,ItPl_Speed_Herb_01,2);
	AI_Output(self,other,"DIA_Grimbald_Ready_07_03");	//� ���� ����� � ������ �� ������, � ��� ������ �� �������� ����, ������� �������� �� �������.
	AI_Output(self,other,"DIA_Grimbald_Ready_07_04");	//����� ����� ���� ����� ������������ ��� ��������� �����, ����� � ����.
	MIS_GrimbaldOrcs_GetBow = MIS_GrimbaldOrcs_GetBow_Ready;
	Info_ClearChoices(DIA_Grimbald_Ready);
	Info_AddChoice(DIA_Grimbald_Ready,"�����!",DIA_Grimbald_Ready_Go);
};
func void DIA_Grimbald_Ready_Go()
{
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_DrawWeapon;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"READY");
};
// �����! ==================================================
instance DIA_Grimbald_Success(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 10;
	condition = DIA_Grimbald_Success_cond;
	information = DIA_Grimbald_Success_Info;
	important = TRUE;
};
func int DIA_Grimbald_Success_cond()
{
	if ((MIS_GrimbaldOrcs == LOG_Running)
		&& (MIS_GrimbaldOrcs_GetBow == MIS_GrimbaldOrcs_GetBow_Return))
	{
		return TRUE;
	};
};
func void DIA_Grimbald_Success_Info()
{
	AI_Output(self,other,"DIA_Grimbald_Success_07_00");	//��� ���������� ������ �������! � ������ ���� ��� � ��� ���-��� ���������.
	AI_Output(self,other,"DIA_Grimbald_Success_07_01");	//���, ������ ����� ���������. � 100 �������.
	//B_GiveInvItems(self,other,ItAt_ShadowFur,1);
	//B_GiveInvItems(self,other,ItMi_Gold,100);
	ItemTrans_items[0] = ItAt_ShadowFur;
	ItemTrans_amount[0] = 1;
	ItemTrans_items[1] = ItMi_Gold;
	ItemTrans_amount[1] = 100;
	B_ItemsTransaction(self,other);
	MobContainer_RemoveItem("CHEST_HUNTERS_BOW",ItAt_ShadowFur);
	MobContainer_RemoveItem("CHEST_HUNTERS_BOW",ItMi_Gold);
	AI_Output(self,other,"DIA_Grimbald_Success_07_02");	//���� �� �� ��, � �� ��� ��� ������ � ��� � ���� ������.
	AI_Output(self,other,"DIA_Grimbald_Success_07_03");	//���� ��������� ������. ����� � ��������� ���.
	DIA_Grimbald_Success_GoEast();
	MIS_GrimbaldOrcs = LOG_SUCCESS;
	B_LogEntry_Status(TOPIC_GrimbaldOrcs,LOG_SUCCESS,TOPIC_GrimbaldOrcs_Success_Bow);
	B_GivePlayerXP(XP_GrimbaldOrcs_OrcsGone);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] & ~IGNORE_DrawWeapon;
	self.npcType = NPCTYPE_FRIEND;
};



// ��� ��? ==================================================
instance DIA_Grimbald_MR_Perm(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 20;
	condition = DIA_NoCond_cond;
	information = DIA_Grimbald_MR_Perm_Info;
	description = "��� ��?";
	permanent = TRUE;
};
func void DIA_Grimbald_MR_Perm_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_MR_Perm_03_00");	//��� ��?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_MR_Perm_07_00");	//��� ��?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_MR_Perm_10_00");	//��� ��?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_MR_Perm_14_00");	//��� ��?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_MR_Perm_16_00");	//��� ��?
	};
	if ((!MIS_GrimbaldOrcs_FeelBetter) && (MIS_GrimbaldOrcs != LOG_SUCCESS))	{
		AI_Output(self,other,"DIA_Grimbald_MR_Perm_07_01");	//� �� ��� �������? �������� ������.
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_MR_Perm_07_02");	//������� �����.
	};
};


// �������� ==================================================
instance DIA_Grimbald_PreTeach_Sneak(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 50;
	condition = DIA_Grimbald_PreTeach_Sneak_cond;
	information = DIA_Grimbald_PreTeach_Sneak_Info;
	description = "�� ������ ������� ���� ��������?";
};
func int DIA_Grimbald_PreTeach_Sneak_cond()
{
	if (Hero_CanSneak == 0)
	{
		return TRUE;
	};
};
func void DIA_Grimbald_PreTeach_Sneak_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_PreTeach_Sneak_03_00");	//�� ������ ������� ���� ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_PreTeach_Sneak_10_00");	//�� ������ ������� ���� ��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_PreTeach_Sneak_14_00");	//�� ������ ������� ���� ��������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_PreTeach_Sneak_16_00");	//�� ������ ������� ���� ��������?
	};
	AI_Output(self,other,"DIA_Grimbald_PreTeach_Sneak_07_01");	//�����, ��.
	AI_Output(self,other,"DIA_Grimbald_PreTeach_Sneak_07_02");	//�� �� ���������. � ������ �� ���� ���� ��������� ������ ��������.	
	B_LogNote(TOPIC_Teacher,TOPIC_Teacher_Grimbald);
};
//----------------------------------------------
instance DIA_Grimbald_Teach_Sneak(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 51;
	condition = DIA_Grimbald_Teach_Sneak_cond;
	information = DIA_Grimbald_Teach_Sneak_Info;
	description = "����� ���� ��������. (200 ���.)";
	permanent = TRUE;
};
func int DIA_Grimbald_Teach_Sneak_cond()
{
	if ((Hero_CanSneak == 0) && Npc_KnowsInfo(other,DIA_Grimbald_PreTeach_Sneak))
	{
		return TRUE;
	};
};
func void DIA_Grimbald_Teach_Sneak_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_Teach_Sneak_03_00");	//����� ���� ��������. 
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Teach_Sneak_10_00");	//����� ���� ��������. 
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Teach_Sneak_14_00");	//����� ���� ��������. 
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_Teach_Sneak_16_00");	//����� ���� ��������. 
	};
	if (B_GiveInvItems(other,self,ItMi_Gold,200))	{
		Hero_CanSneak = TRUE;
		AI_SetWalkmode(self,NPC_SNEAK);
		AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_01");	//������ �����������.
		AI_GotoNpc(self,other);
		AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_02");	//������� - ���������� ����. �������� ������ �� ��������� ���, ��� ����� �����.
		AI_SetWalkmode(self,NPC_WALK);
		AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_03");	//� ����������� ������ ��� ����. � ������ ����� ������ ���������� ����� ������ ��� ������ �����.
		//� ������ �������� �� ���������
		var C_ITEM armor; armor = Npc_GetEquippedArmor(other);
		if (Hlp_IsItem(armor,ITAR_BauBabe_L) || Hlp_IsItem(armor,ITAR_BauBabe_M)
			|| Hlp_IsItem(armor,ITAR_VlkBabe_L) || Hlp_IsItem(armor,ITAR_VlkBabe_M) || Hlp_IsItem(armor,ITAR_VlkBabe_H))
		{
			AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_04");	//������, � �� �����������, ��� �� ������ �������� � ���� ������.
			AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_05");	//����� � ������, �������� � ������. ��������, � ���� �������� ���-�� ����� ����������.
			Npc_SetTalentSkill(other,NPC_TALENT_SNEAK,0);
		}
		else	// � ��� ������ ����
		{
			Npc_SetTalentSkill(other,NPC_TALENT_SNEAK,1);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Teach_Sneak_07_NoMoney");	//������� ������.
	};
};

// ����� ��������� ====================================
// ��� ��������� ������
//=====================================================
instance DIA_Grimbald_TellStory(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 40;
	condition = DIA_Grimbald_TellStory_Cond;
	information = DIA_Grimbald_TellStory_Info;
	description = "������ �����-������ �����?";
	permanent = TRUE;
};
func int DIA_Grimbald_TellStory_Cond()
{
	if (!DIA_Grimbald_TellTales)
	{
		return TRUE;
	};
};
func void DIA_Grimbald_TellStory_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_TellStory_03_00");	//������ �����-������ �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_TellStory_07_00");	//������ �����-������ �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_TellStory_10_00");	//������ �����-������ �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_TellStory_14_00");	//������ �����-������ �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_TellStory_16_00");	//������ �����-������ �����?
	};
	if ((!MIS_GrimbaldOrcs_FeelBetter) && (MIS_GrimbaldOrcs != LOG_SUCCESS))	{
		AI_Output(self,other,"DIA_Grimbald_TellStory_07_01");	//��� ������ �� �� ����!
	}
	else	{
		AI_Output(self,other,"DIA_Grimbald_TellStory_07_02");	//���� ���������� ��� ��������� ������.
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Grimbald_TellStory_03_03");	//��� ���������?
			AI_Output(other,self,"DIA_Grimbald_TellStory_03_04");	//� ����� ������ ������ ������ � ������� ������. �� ��� �� ����� �������� �� �����.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Grimbald_TellStory_07_03");	//��� ���������?
			AI_Output(other,self,"DIA_Grimbald_TellStory_07_04");	//����� � ������, �� ��� ������ ����� ����� ������ �������.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Grimbald_TellStory_10_03");	//��� ���������?
			AI_Output(other,self,"DIA_Grimbald_TellStory_10_04");	//� � �����, ��� ������ � ������ �� ������, ��� � ������. ���� ��� �������������.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Grimbald_TellStory_14_03");	//��� ���������?
			AI_Output(other,self,"DIA_Grimbald_TellStory_14_04");	//� ����� ������ ������ ������ � ������� ������. �� ��� �� ����� �������� �� �����.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Grimbald_TellStory_16_03");	//��� ���������?
			AI_Output(other,self,"DIA_Grimbald_TellStory_16_04");	//� ������ ������ ������ ������ � ������� ������. � ���, ����� ������ �����?
		AI_Output(self,other,"DIA_Grimbald_TellStory_07_05");	//���, ������� ��� ����� ���, ��� ��� �����������. �� ��� � �� ���� �� ������, ����� ��� ����������� ���-�� ���������������.
		};
		AI_Output(self,other,"DIA_Grimbald_TellStory_07_06");	//� �� ������, � ������� � ���� ����, �������� �����, ������ ��� �������.
		DIA_Grimbald_TellTales = TRUE;
	};
};
//--------------------------------------------
instance DIA_Grimbald_Tell_TalkingHarpy(C_INFO)
{
	npc = OUT_1210_Grimbald;
	nr = 41;
	condition = DIA_Grimbald_Tell_TalkingHarpy_Cond;
	information = DIA_Grimbald_Tell_TalkingHarpy_Info;
	description = "�������� ��� ��������� ������.";
	permanent = TRUE;
};
func int DIA_Grimbald_Tell_TalkingHarpy_Cond()
{
	if (DIA_Grimbald_TellTales)
	{
		return TRUE;
	};
};
func void DIA_Grimbald_Tell_TalkingHarpy_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_03_00");	//�������� ��� ��������� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_07_00");	//�������� ��� ��������� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_10_00");	//�������� ��� ��������� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_14_00");	//�������� ��� ��������� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_16_00");	//�������� ��� ��������� ������.
	};
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_01");	//���� ���� ���. ���� �������, ����� ���������� ��������� �� �������� �������� ��������� ����, ����� ������ ������, � ����������� �������.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_02");	//������� ������� ����� ������ �������, ��� ��� �� ������� �����������.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_03");	//������� � ���� ������� ����� �������� ���� �������, � � ����� �� ��� ������ ������ ��� ���������� ����� ������.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_04");	//� ���� ����� ������� - �������� ��������� �����, ������� ����� � ��� ������� ������.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_05");	//�� ��� ������ ������� ������� � ������, ������ ���������� � ��� ��-�����������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_03_06");	//� ��� ��� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_07_06");	//� ��� ��� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_10_06");	//� ��� ��� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_14_06");	//� ��� ��� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_16_06");	//� ��� ��� �������?
	};
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_07");	//������� �� ������� ��, �������, � ��������� �� �������.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_08");	//������� ������� �� ����������. �� �����, ��� ���� ���������� ��������� ������ ������� �� �������� �������, �� ����� ���������� ���� ������, ��� � ������� ����. 
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_09");	//�� ������ �������, ��� ������ ���� � ����� �������� ����, ������� � ������ �� ��������.
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_10");	//� ��� ���� ������� ���� �� �������, �� ��� �������� ��� ����� ��� �������. 
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_03_11");	//� ���, ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_07_11");	//� ���, ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_10_11");	//� ���, ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_14_11");	//� ���, ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grimbald_Tell_TalkingHarpy_16_11");	//� ���, ���������?
	};
	AI_Output(self,other,"DIA_Grimbald_Tell_TalkingHarpy_07_12");	//��������, ������! ��� ������ ������� ������ �������, ������ ����� �������, � ������ �� �� �� �����.
	if (!Tale_SpeakingHarpy_Once)	{
		Tale_SpeakingHarpy_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
