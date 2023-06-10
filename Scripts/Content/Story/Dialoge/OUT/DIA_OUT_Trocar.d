
instance DIA_Trocar_EXIT(DIA_Proto_End)
{
	npc = OUT_1230_Trocar;
};

///////////////////////////// ����� ///////////////////////////////
//-----------------------------------------
instance DIA_Trocar_Elena_ShadowFur(C_INFO)
{
	npc = OUT_1230_Trocar;			nr = 20;
	condition = DIA_Trocar_Elena_ShadowFur_cond;
	information = DIA_Trocar_Elena_ShadowFur_info;
	description = "� ����� ��������� � ���� ����?";
};
func int DIA_Trocar_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena() && Npc_KnowsInfo(other,DIA_Trocar_WhoAU)
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Trocar_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Trocar_Elena_ShadowFur_16_00");	//� ����� ��������� � ���� ����?
	AI_Output(self,other,"DIA_Trocar_Elena_ShadowFur_12_01");	//���. ���� �� ���� ������� �������, ������ �� �� ��� �������� �� �������.
};

///////////////////////////// ��� ///////////////////////////////
//=====================================================
instance DIA_Trocar_Start(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Trocar_Start_info;
	important = TRUE;
};
func void DIA_Trocar_Start_info()
{
	self.aivar[AIV_Behaviour] = self.aivar[AIV_Behaviour] & ~BEHAV_Hidden;	//������ �� ��������
	AI_Output(self,other,"DIA_Trocar_Start_12_01");	//��! ������ ������ �� ��� ��������?
	AI_SetWalkmode(self,NPC_RUN);
	AI_GotoNpc(self,other);
	AI_TurnToNpc(self,other);
	AI_WaitTillEnd(other,self);
	AI_TurnToNpc(other,self);
	AI_LookAtNpc(self,other);
	AI_LookAtNpc(other,self);
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_Start_03_02");	//���� ������ ���� ��� �� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_Start_07_02");	//� ���� ������, ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_Start_10_02");	//���� ������ ���� ��� �� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_Start_14_02");	//���� ������ ���� ��� �� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_Start_16_02");	//���� ������ ���� ��� �� ������.
	};
	AI_Output(self,other,"DIA_Trocar_Start_12_03");	//� ���� ��� ���� �������, ���� ���-��� �� ������ � �� ����� ������ ��� ������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_Start_03_04");	//� �� ���� �� ��������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_Start_07_04");	//� �� ���� ���� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_Start_10_04");	//� �� ���� ���� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_Start_14_04");	//� �� ���� ���� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_Start_16_04");	//� �� ���� �� ��������?
	};
	AI_Output(self,other,"DIA_Trocar_Start_12_05");	//��� �� ����!
	AI_StopProcessInfos(self);
	AI_ReadyRangedWeapon(self);
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_DrawWeapon;
	Trocar_InsertKeiler = TRUE;
};

//=====================================================
instance DIA_Trocar_HogKilled(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 2;
	condition = DIA_Trocar_HogKilled_cond;
	information = DIA_Trocar_HogKilled_info;
	important = TRUE;
};
func int DIA_Trocar_HogKilled_cond()
{
	if (C_NpcIsDown(Keiler_Hog_Trocar))	{
		return TRUE;
	};
};
func void DIA_Trocar_HogKilled_info()
{
	AI_Output(self,other,"DIA_Trocar_HogKilled_12_01");	//�������-��! � ������ ����� ������� �� ��� �����.
	AI_Output(self,other,"DIA_Trocar_HogKilled_12_02");	//� ����� ��� � ����, �� �� �������� ����������� � ����� �������. � ������ ���� �� ��� �����.
	AI_Output(self,other,"DIA_Trocar_HogKilled_12_03");	//����� �� �������� ��� �����, � ������� ������� �� ������. �� ��� ������� �� ������ ���������� ���� ����� �� ��������.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Trocar_HogKilled_12_04m");	//���� �� �������� ��.
	}
	else	{
		AI_Output(self,other,"DIA_Trocar_HogKilled_12_04f");	//���� �� ��������� ��.
	};
	AI_Output(self,other,"DIA_Trocar_HogKilled_12_05");	//��� ������ �����-�� ����������� �������, ��� �� ����� ����� �� ���� ��� ���, ��� �� ��� ��������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_Thanks_03_06");	//����� �������, ��� ��� ���� �������� �� �������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_Thanks_07_06");	//����� �������, ��� ��� ���� �������� �� �������!
		B_LogEntry(TOPIC_FindTrocar, TOPIC_FindTrocar_Found);
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_Thanks_10_06");	//����� �������, ��� ��� ���� �������� �� �������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_Thanks_14_06");	//����� �������, ��� ��� ���� �������� �� �������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_Thanks_16_06");	//����� �������, ��� ��� ���� �������� �� �������!
	};
	AI_Output(self,other,"DIA_Trocar_Thanks_12_07");	//������? ����!
	if (other.aivar[AIV_Gender] == FEMALE)	{
		AI_Output(self,other,"DIA_Trocar_Thanks_12_08a");	//�� ����?
	}
	else if (C_HeroIs_Odo() && C_NpcWears(other, ItAr_NOV_L))	{
		AI_Output(self,other,"DIA_Trocar_Thanks_12_08b");	//�� ������������ �����?
	}
	else if (C_HeroIs_Rupert() || C_HeroIs_Till())	{
		AI_Output(self,other,"DIA_Trocar_Thanks_12_08c");	//�� ������ �������?
	}
	else if (C_HeroIs_Erol())	{
		AI_Output(self,other,"DIA_Trocar_Thanks_12_08d");	//�� �������?
	}
	else	{
		AI_Output(self,other,"DIA_Trocar_Thanks_12_08e");	//�� ����-��?
	};
	AI_Output(self,other,"DIA_Trocar_Thanks_12_09");	//��� ���� ���� ����������� ���� �� ��������!
	B_StartOtherRoutine(self,"START");
	B_StartOtherRoutine(VLK_440_Bartok,"TROCARMEET");
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] & ~IGNORE_DrawWeapon;
	B_GivePlayerXP(XP_Trocar_Found);
};

//=====================================================
func void DIA_Trocar_OfOldTimes()
{
	AI_Output(self,other,"DIA_Trocar_OfOldTimes_12_00");	//���� ������ ����� �� ��, ��� ������.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Trocar_OfOldTimes_12_01");	//�� �� ������, � ����� ������ ����������� ��� ���!
	}
	else	{
		AI_Output(self,other,"DIA_Trocar_OfOldTimes_12_01f");	//�� �� �������, � ����� ������ ����������� ��� ���!
	};
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_OfOldTimes_03_02");	//��������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_OfOldTimes_07_02");	//��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_OfOldTimes_10_02");	//��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_OfOldTimes_14_02");	//��������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_OfOldTimes_16_02");	//��������?
	};
	AI_Output(self,other,"DIA_Trocar_OfOldTimes_12_03");	//��������, ��� ������ ���������. ��� ��� ��������� ������. � ��� ��� ��������� ������.
	DIA_Trocar_TellTales = TRUE;
};
// ----------------------------------------------
instance DIA_Trocar_WhoAU(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 3;
	condition = DIA_Trocar_WhoAU_cond;
	information = DIA_Trocar_WhoAU_info;
	description = "��� ��?";
};
func int DIA_Trocar_WhoAU_cond()
{
	if (!C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Trocar_HogKilled))	{
		return TRUE;
	};
};
func void DIA_Trocar_WhoAU_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_WhoAU_03_00");	//��� ��?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_WhoAU_10_00");	//��� ��?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_WhoAU_14_00");	//��� ��?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_WhoAU_16_00");	//��� ��?
	};
	AI_Output(self,other,"DIA_Trocar_WhoAU_12_01");	//���� ����� ������.
	AI_Output(self,other,"DIA_Trocar_WhoAU_12_02");	//� ������� ������ �� ����� ������, ��������. �� �� �� ����� �����������.
	AI_Output(self,other,"DIA_Trocar_WhoAU_12_03");	//������ - �������� �������, �� ��� �� ������� �����������.
	AI_Output(self,other,"DIA_Trocar_WhoAU_12_04");	//��������� ������� � ������, ������� ����� ������� � ��������� ���������� ������ � ������� - ��� ��� ��������.
	AI_Output(self,other,"DIA_Trocar_WhoAU_12_05");	//� ��� �� ����. ����� - ��� �����, ��� ����� �� ������. ������� � ������ ����� ����������� ��� ����.
	B_LogEntry(TOPIC_FindTrocar, TOPIC_FindTrocar_Found);
	DIA_Trocar_OfOldTimes();
};

//------------------------------------------------------
instance DIA_Trocar_Talbin_WhyAlone(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 4;
	condition = DIA_Trocar_Talbin_WhyAlone_cond;
	information = DIA_Trocar_Talbin_WhyAlone_info;
	description = "�� ������ ����?";
};
func int DIA_Trocar_Talbin_WhyAlone_cond()
{
	if (C_HeroIs_Talbin() && Npc_KnowsInfo(other,DIA_Trocar_HogKilled))	{
		return TRUE;
	};
};
func void DIA_Trocar_Talbin_WhyAlone_info()
{
		AI_Output(other,self,"DIA_Trocar_Talbin_WhyAlone_07_00");	//�� ������ ����?
	AI_Output(self,other,"DIA_Trocar_Talbin_WhyAlone_12_01");	//������� ������� ������ �������� �� ��������� �����.
	AI_Output(self,other,"DIA_Trocar_Talbin_WhyAlone_12_02");	//� ���� ���������, ���� ����� � ��� �������? - ��� ��� �������. ��� � ��������� �������.
	AI_Output(self,other,"DIA_Trocar_Talbin_WhyAlone_12_03");	//��� ��� � ������ ����� ����������� � ��������.
	DIA_Trocar_OfOldTimes();
};

//=====================================================
instance DIA_Trocar_MsgFromBartok(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 5;
	condition = DIA_Trocar_MsgFromBartok_cond;
	information = DIA_Trocar_MsgFromBartok_info;
	description = "������ ������ �������� ����...";
};
func int DIA_Trocar_MsgFromBartok_cond()
{
	if ((Npc_KnowsInfo(other,DIA_Trocar_WhoAU) || C_HeroIs_Talbin())
		 && Npc_KnowsInfo(other,DIA_Bartok_Alone) && (Npc_GetDistToNpc(self,VLK_440_Bartok) > PERC_DIST_INTERMEDIAT))	{
		return TRUE;
	};
};
func void DIA_Trocar_MsgFromBartok_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_MsgFromBartok_03_00");	//������ ������ �������� ����, ��� �� ����� ��� � ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_MsgFromBartok_07_00");	//������ ������ �������� ����, ��� �� ����� ��� � ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_MsgFromBartok_10_00");	//������ ������ �������� ����, ��� �� ����� ��� � ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_MsgFromBartok_14_00");	//������ ������ �������� ����, ��� �� ����� ��� � ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_MsgFromBartok_16_00");	//������ ������ �������� ����, ��� �� ����� ��� � ������.
	};
	var C_NPC portal_owner;	portal_owner = Npc_GetPortalOwner(self);
	if (C_NpcIs(portal_owner,OUT_1202_Orlan))	{	//(Npc_GetDistToWP(self,self.wp) < PERC_DIST_ACTIVE_MAX)
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Trocar_MsgFromBartok_03_01");	//�� ��, ��������, � ��� ��� � �����.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Trocar_MsgFromBartok_07_01");	//�� ��, ��������, � ��� ��� � �����.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Trocar_MsgFromBartok_10_01");	//�� ��, ��������, � ��� ��� � �����.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Trocar_MsgFromBartok_14_01");	//�� ��, ��������, � ��� ��� � �����.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Trocar_MsgFromBartok_16_01");	//�� ��, ��������, � ��� ��� � �����.
		};
		AI_Output(self,other,"DIA_Trocar_MsgFromBartok_12_02");	//��, �� ��� ����� �������.
	}
	else	{
		AI_Output(self,other,"DIA_Trocar_MsgFromBartok_12_03");	//�, �������. � � �����, ��� �������, ����� �� ������� ������.
	};
	MIS_FindTrocar = LOG_SUCCESS;
	if (other.aivar[AIV_Gender] == MALE)	{
		B_LogEntry_Status(TOPIC_FindTrocar, LOG_SUCCESS, TOPIC_FindTrocar_Told);
	}
	else {
		B_LogEntry_Status(TOPIC_FindTrocar, LOG_SUCCESS, TOPIC_FindTrocar_Told_F);
	};
	B_GivePlayerXP(XP_Trocar_Told);
};

//=====================================================
instance DIA_Trocar_Perm(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 10;
	condition = DIA_Trocar_Perm_cond;
	information = DIA_Trocar_Perm_info;
	description = "��� ������ ������ ������?";
	permanent = TRUE;
};
func int DIA_Trocar_Perm_cond()
{
	if (Npc_KnowsInfo(other,DIA_Trocar_HogKilled))	{
		return TRUE;
	};
};
func void DIA_Trocar_Perm_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_Perm_03_00");	//��� ������ ������ ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_Perm_07_00");	//��� ������ ������ ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_Perm_10_00");	//��� ������ ������ ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_Perm_14_00");	//��� ������ ������ ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_Perm_16_00");	//��� ������ ������ ������?
	};
	AI_Output(self,other,"DIA_Trocar_Perm_12_01");	//������� � ��������� ��� �������! � �� ����� ������ ������� �� ���� �������� ������!
};

// ����� ��������� ====================================
// � ����� ���������, ������ � ������
//=====================================================
instance DIA_Trocar_WhiteShadowbeast(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 40;
	condition = DIA_Trocar_WhiteShadowbeast_cond;
	information = DIA_Trocar_WhiteShadowbeast_info;
	description = "�������� ��� ������ ���������.";
	permanent = TRUE;
};
func int DIA_Trocar_WhiteShadowbeast_cond()
{
	if (DIA_Trocar_TellTales)	{
		return TRUE;
	};
};
func void DIA_Trocar_WhiteShadowbeast_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_03_00");	//�������� ��� ������ ���������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_07_00");	//�������� ��� ������ ���������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_10_00");	//�������� ��� ������ ���������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_14_00");	//�������� ��� ������ ���������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_16_00");	//�������� ��� ������ ���������.
	};
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_01");	//���� ������ ������� �������� ������ � ����� ����� �������� ���������� � ������� ��������.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_02");	//����� ��� �������, � ����� � ���� ������ ������� �����.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_03_03");	//��� �� � ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_07_03");	//��� �� � ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_10_03");	//��� �� � ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_14_03");	//��� �� � ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_16_03");	//��� �� � ������?
	};
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_04");	//����� ���� ������! �� �������� �� �������� � ��� ���� ��������, ������ ���������� �� ������, �������, �� ��� �����, ����� �����.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_05");	//��� ������, ���������� �� ������, �� ������� ��� � ������� � ����� �����.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_06");	//�������� ������� ������ �� ���, �� ������� �� ���. � ����� ������ ��� ������� � ���� �����.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_03_07");	//� ���, ��������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_07_07");	//� ���, ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_10_07");	//� ���, ��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_14_07");	//� ���, ��������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_16_07");	//� ���, ��������?
	};
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_08");	//���, �������. ����� �� �� ���� ������� �� ��������. �� ����� ����� ������ ����� ��������.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_09");	//��������� �� ������� � ���������� �� ����� � �����-�� ������ ���������� ������.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_10");	//���������� ���� ��� ���������, �� ��� �������� �� �����������, � �� ������� ������ ���.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_11");	//��� �� �� ��������, ����� �������� �������� ����� ����� ������������, ������ ����� ������ �� ����.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_12");	//����� ������ �� ��� ��� �� ������� ����������. ����� ������� �������� � ������ � ������ ��� ������� ����� � �������-������� ����.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_13");	//�� ��� �� ���� �����, � ������ ����� �����, ����� �������� ������.
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_14");	//���� ��������� ����� ��������� ����� ����� ����� ��������, � ������ ��� � �������� ���������. ����� �� �����, ��� �� ���� �� c ���������, ��� ����� � ������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_03_15");	//� �� ��� �� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_07_15");	//� �� ��� �� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_10_15");	//� �� ��� �� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_14_15");	//� �� ��� �� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_WhiteShadowbeast_16_15");	//� �� ��� �� �����?
	};
	AI_Output(self,other,"DIA_Trocar_WhiteShadowbeast_12_16");	//���. ������� ������, ��� ������ �� � �����.
	if (!Tale_WhiteShadowbeast_Once)	{
		Tale_WhiteShadowbeast_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
//-----------------------------------------------
instance DIA_Trocar_StripedWarg(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 41;
	condition = DIA_Trocar_StripedWarg_cond;
	information = DIA_Trocar_StripedWarg_info;
	description = "����� �� ��� ����� ������ �����?";
	permanent = TRUE;
};
func int DIA_Trocar_StripedWarg_cond()
{
	if (DIA_Trocar_TellTales)	{
		return TRUE;
	};
};
func void DIA_Trocar_StripedWarg_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_StripedWarg_03_00");	//����� �� ��� ����� ������ �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_StripedWarg_07_00");	//����� �� ��� ����� ������ �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_StripedWarg_10_00");	//����� �� ��� ����� ������ �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_StripedWarg_14_00");	//����� �� ��� ����� ������ �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_StripedWarg_16_00");	//����� �� ��� ����� ������ �����?
	};
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_01");	//�� ���. ��� ������ �����, � ������� ��������� �� �����. ����� ��� ��� ������� �������� � ������ ��������. ��� ��� �� ������� ����.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_02");	//��� �������� ����� ����� �� �������� ���, � ���� �������� ���������� �� ��������. � ��� ����� ���� �������� � ���������.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_03");	//����� �� ��������� ����� ���� ���� � ����������� � �����������. �� ��� ��� ������ ��������� ������, ����� ����� ������� �� ������ �������.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_04");	//�����������, �� ������ ���� ����� ������, ��������� �� ���� �������� �����. �� ������������, ��� �������� ������� � ������ ����� ����� ���������.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_05");	//�����, � ������ ���������� �� �� ����� � ��� � � ����������� �������.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_06");	//������ ������� � �����, �� �����, ��� ��� ���� ��������� �����. � ����� � ��� ������� ����� ��������� ����� �� ������������ ��������...
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_StripedWarg_03_07");	//� ���? ��� ��� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_StripedWarg_07_07");	//� ���? ��� ��� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_StripedWarg_10_07");	//� ���? ��� ��� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_StripedWarg_14_07");	//� ���? ��� ��� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_StripedWarg_16_07");	//� ���? ��� ��� �����?
	};
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_08");	//��� ����! ��� ����� ����� ��� ������ � ����������� �������. ����� ��� ��� � �������� ������ � ��� � �������� � �������. � ����� ������ �����, ��� � �����.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_09");	//� � ��� ��� ��, �������, ������ ��������. �� ���� �� ����� ��������� � ��� ��-�����������.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_10");	//������, ��� ������� �������� ��� �����, �� ������ ���� �����. ���������, ��� ��� ���� ����������� �����, � �������� ���� ���������.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_11");	//���� �� ����� ��������� ����� � ������� ������. ����� ��� ��������� �� �� ������ ������ ���� �� ����� �������.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_12");	//���� ����������� � ���� ���� ��� ��������� ��� � �����-�� ������. ��� ����� ������� �� �����.
	AI_Output(self,other,"DIA_Trocar_StripedWarg_12_13");	//���� �� ����� ������� ������, �� � ������ �������� ������ ������� � ����� �� �����.
	if (!Tale_Wargs_Once)	{
		Tale_Wargs_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};

//-----------------------------------------------
instance DIA_Trocar_RatKing(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 42;
	condition = DIA_Trocar_RatKing_cond;
	information = DIA_Trocar_RatKing_info;
	description = "��� ��� �� �������� ������?";
	permanent = TRUE;
};
func int DIA_Trocar_RatKing_cond()
{
	if (DIA_Trocar_TellTales)	{
		return TRUE;
	};
};
func void DIA_Trocar_RatKing_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_RatKing_03_00");	//��� ��� �� �������� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_RatKing_07_00");	//��� ��� �� �������� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_RatKing_10_00");	//��� ��� �� �������� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_RatKing_14_00");	//��� ��� �� �������� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_RatKing_16_00");	//��� ��� �� �������� ������?
	};
	AI_Output(self,other,"DIA_Trocar_RatKing_12_01");	//�������� ������ - ��� ������ �����. �������, ������� ������ - � ������� ����.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_02");	//���� ����� ���� ��� ��� �����������, ��� ��������� �� ������ - ��������� �� ����� ������.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_03");	//�� �� ������ ��������� ������, � �� �������� ����. ��� �������, ��� ����������, � ����� �� ��������������. ���� � ������� ����� ������. �� �� � ���� ����.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_04");	//� ������� �� ������� ����, ��� ����� ������������ � ������� �������, ������� �� ����� ����� � �� �����.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_05");	//�� ���� ���� ����, ��� ���� ��������� �� ������ � ������ ��������, �� ����� ������ ������ ����� ���� ����.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_06");	//� ��� ��� �� ����� �������� ���� ����� ������, � ��� � �� �������� �� ����� �����. ����� ������� � �������� ���.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_07");	//�� ��� ��������� ������������, ����� ������� ������� ���� �������� ����.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_08");	//������� �� �����������, ��� ���� ������� ����. �� ����� �� �������� �� ������, ��� ��������� ��������� �������.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_09");	//�� ������� ���������� � �������� � ������� �������� ����, � �� ������ ���� ��� ����������, ������ ��� �������� ����� ����� � ���� ������������ �����.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_10");	//����� ������� � ������ �������, �� � ���������� �� ����� ���������� � �����. ���� �� ��� ��� ������, ����������� ��� ����������� ���������.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_11");	//��������� �������� ��� ���� �� ��������. � ���� ���� ������ � ������ �� ���� ���.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_12");	//����� �� �������� ���������� �����. � �� ��������� ����� ��� � �� ��������. ��� ���� ��� ����� ������ ����� ������, � ��� ��� ���� ��������� �������.
	AI_Output(self,other,"DIA_Trocar_RatKing_12_13");	//��� ����� ����� ������ �� �������, � ������� ��� ������� �� �����������.
	if (!Tale_RatKing_Once)	{
		Tale_RatKing_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};

//-----------------------------------------------
instance DIA_Trocar_SnowWolf(C_INFO)
{
	npc = OUT_1230_Trocar;		nr = 43;
	condition = DIA_Trocar_SnowWolf_cond;
	information = DIA_Trocar_SnowWolf_info;
	description = "� ��� ����� ������ �� ������?";
	permanent = TRUE;
};
func int DIA_Trocar_SnowWolf_cond()
{
	if (DIA_Trocar_TellTales && (MIS_Talbin_WhiteWolf != 0 || DIA_Gaan_Others_ManyBeasts_WhiteWolfTold))	{
		return TRUE;
	};
};
func void DIA_Trocar_SnowWolf_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_SnowWolf_03_00");	//� ��� ����� ������ �� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_SnowWolf_07_00");	//� ��� ����� ������ �� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_SnowWolf_10_00");	//� ��� ����� ������ �� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_SnowWolf_14_00");	//� ��� ����� ������ �� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_SnowWolf_16_00");	//� ��� ����� ������ �� ������?
	};
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_01");	//� ��� ��! � ������, ��� ������ � �����, ���, ��� ���� ����� �� ���� ����, ����� ������� �����. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_02");	//������ ��� ����, ������� ��� ��������� ���� � ��������. � ��� ��� ����� ����������, � ����� �� �������, ��� ������� ������. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_03");	//��������� ��� �� ������ ��� ������ �����, ����� �� ������� ������ ����� ������� ����.
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_04");	//��� �������� ������, ���� � ����� ��������� �� ���, � ����� ����� �����, ��� ���� ������� �������� �� �����.
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_05");	//� ��� ����� � ��� ���������� ������� �����. ��� ������ � ����, � ���������� �������� �� ��������. ��������� ���� ����� ���� ��������� ����������. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_06");	//� ����� ������� ����� ������� � ������ ������ � ��������� ����� ����������, ������� �������� �������� ���������. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_07");	//����� ������ ������� ��������� ����� �� ������, �� ���������� �� ��������� �����. ����� �� �����, � ��������� ��������� ���������� � ������ ��������� � �������. 
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Trocar_SnowWolf_03_08");	//� ��� ���� �� ��� ����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Trocar_SnowWolf_07_08");	//� ��� ���� �� ��� ����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Trocar_SnowWolf_10_08");	//� ��� ���� �� ��� ����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Trocar_SnowWolf_14_08");	//� ��� ���� �� ��� ����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Trocar_SnowWolf_16_08");	//� ��� ���� �� ��� ����������?
	};
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_09");	//�� �����. ������ ��������� ��������, � ������� ����� ���� ����. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_10");	//��������� ������� ����� �������, ��� �� ������ �� ������ ������ ������� ������, ����������� � ������. �� � � ��� ������ �� ����. 
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_11");	//������� ������� ������������� ����������. � ���� ����� ��������� �����, ��� �������� �������� �� ������.
	AI_Output(self,other,"DIA_Trocar_SnowWolf_12_12");	//� ��� �������� ��������, �� ��� ���������� ���������� �����, ����� �� ������. ��� ������.
	if (!Tale_WhiteWolf_Once)	{
		Tale_WhiteWolf_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
