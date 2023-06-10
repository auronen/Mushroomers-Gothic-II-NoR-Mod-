
instance DIA_Fellan_EXIT(DIA_Proto_End)
{
	npc = VLK_480_Fellan;
};

//============================================================
instance DIA_Fellan_HowAU(C_INFO)
{
	nr = 1;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_HowAU_cond;
	information = DIA_Fellan_HowAU_info;
	description = "��, ��� ����?";
};
func int DIA_Fellan_HowAU_cond()
{
	return TRUE;
};
func void DIA_Fellan_HowAU_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_HowAU_03_00");	//��, ��� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_HowAU_07_00");	//��, ��� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_HowAU_10_00");	//��, ��� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_HowAU_14_00");	//��, ��� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_HowAU_16_00");	//��, ��� ����?
	};
	AI_Output(self,other,"DIA_Fellan_HowAU_06_01");	//���, ���. � �� �������. ����� ���, ��� ������. ����� ������ ����������, � ������ �� ���� ������ ���� �� ���� �������.
	AI_Output(self,other,"DIA_Fellan_HowAU_06_02");	//� ���� �� �������. �����, ���� �� ������.
};

//============================================================
instance DIA_Fellan_WhyAUHere(C_INFO)
{
	nr = 2;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_WhyAUHere_cond;
	information = DIA_Fellan_WhyAUHere_info;
	description = "��� �� ��� �������?";
	permanent = TRUE;
};
func int DIA_Fellan_WhyAUHere_cond()
{
	if (!MIS_FellanGoHome_Returned)	{
		return TRUE;
	};
};
func void DIA_Fellan_WhyAUHere_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_WhyAUHere_03_00");	//��� �� ��� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_WhyAUHere_07_00");	//��� �� ��� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_WhyAUHere_10_00");	//��� �� ��� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_WhyAUHere_14_00");	//��� �� ��� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_WhyAUHere_16_00");	//��� �� ��� �������?
	};
	AI_Output(self,other,"DIA_Fellan_WhyAUHere_06_01");	//��� �����-������ �������.
};

//============================================================
instance DIA_Fellan_WhatFallDown(C_INFO)
{
	nr = 3;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_WhatFallDown_cond;
	information = DIA_Fellan_WhatFallDown_info;
	description = "������� ������. ��� ������?";
};
func int DIA_Fellan_WhatFallDown_cond()
{
	if (Npc_KnowsInfo(other,DIA_Fellan_HowAU))	{
		return TRUE;
	};
};
func void DIA_Fellan_WhatFallDown_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_WhatFallDown_03_00");	//������� ������. ��� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_WhatFallDown_07_00");	//������� ������. ��� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_WhatFallDown_10_00");	//������� ������. ��� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_WhatFallDown_14_00");	//������� ������. ��� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_WhatFallDown_16_00");	//������� ������. ��� ������?
	};
	AI_Output(self,other,"DIA_Fellan_WhatFallDown_06_01");	//���! ����, ����, ����... �����, ���� ���� ������ �� �����! 
	AI_Output(self,other,"DIA_Fellan_WhatFallDown_06_02");	//� ������ �� ���� ����� ������. � �� �������.
};

//============================================================
instance DIA_Fellan_WhyFallDown(C_INFO)
{
	nr = 4;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_WhyFallDown_cond;
	information = DIA_Fellan_WhyFallDown_info;
	description = "������ �� ��� ������, ��� ��� ������?";
};
func int DIA_Fellan_WhyFallDown_cond()
{
	if (Npc_KnowsInfo(other,DIA_Fellan_HowAU))	{
		return TRUE;
	};
};
func void DIA_Fellan_WhyFallDown_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_WhyFallDown_03_00");	//������ �� ��� ������, ��� ��� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_WhyFallDown_07_00");	//������ �� ��� ������, ��� ��� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_WhyFallDown_10_00");	//������ �� ��� ������, ��� ��� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_WhyFallDown_14_00");	//������ �� ��� ������, ��� ��� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_WhyFallDown_16_00");	//������ �� ��� ������, ��� ��� ������?
	};
	AI_Output(self,other,"DIA_Fellan_WhyFallDown_06_01");	//� ���� ���, ������ ����� ����! �����, � �����!
	AI_Output(self,other,"DIA_Fellan_WhyFallDown_06_02");	//� ���� � �������, � �� ���� ������ �����. � �� ��� ���... ������ ��������. ������������ � ����.
	AI_Output(self,other,"DIA_Fellan_WhyFallDown_06_03");	//� �����... ������� ������ ������� �� ����! �� ������ ���, �������� ������ �� ���������!
};

//============================================================
instance DIA_Fellan_WifeWaits(C_INFO)
{
	nr = 10;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_WifeWaits_cond;
	information = DIA_Fellan_WifeWaits_info;
	description = "���� ���� ���� ����.";
};
func int DIA_Fellan_WifeWaits_cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && MIS_FellanGoHome_WifeWaits && !MIS_FellanGoHome_Returned)	{
		return TRUE;
	};
};
func void DIA_Fellan_WifeWaits_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_WifeWaits_03_00");	//���� ���� ���� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_WifeWaits_07_00");	//���� ���� ���� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_WifeWaits_10_00");	//���� ���� ���� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_WifeWaits_14_00");	//���� ���� ���� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_WifeWaits_16_00");	//���� ���� ���� ����.
	};
	AI_Output(self,other,"DIA_Fellan_WifeWaits_06_01");	//��� �������! �, ��� ���, ������� ������� �� ����� �� ����.
	AI_Output(self,other,"DIA_Fellan_WifeWaits_06_02");	//�� ��� ����������. ��� ������ ����, ��� ������, ��� ������ �� ����� ������.
	MIS_FellanGoHome_ToldAttempts += 1;
	if (MIS_FellanGoHome_ToldAttempts == MIS_FellanGoHome_ToldAttempts_Fail)	{
		B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_TalkFail);
	};
};

//============================================================
instance DIA_Fellan_GoHome(C_INFO)
{
	nr = 11;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_GoHome_cond;
	information = DIA_Fellan_GoHome_info;
	description = "���� ���� ���� �����.";
	permanent = TRUE;
};
func int DIA_Fellan_GoHome_cond()
{
	if (MIS_FellanGoHome_WifeWaits && !MIS_FellanGoHome_Returned)	{
		return TRUE;
	};
};
func void DIA_Fellan_GoHome_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_GoHome_03_00");	//���� ���� ���� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_GoHome_07_00");	//���� ���� ���� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_GoHome_10_00");	//���� ���� ���� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_GoHome_14_00");	//���� ���� ���� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_GoHome_16_00");	//���� ���� ���� �����.
	};
	AI_Output(self,other,"DIA_Fellan_GoHome_06_01");	//���. �� �� ���!
	MIS_FellanGoHome_ToldAttempts += 1;
	if (MIS_FellanGoHome_ToldAttempts == MIS_FellanGoHome_ToldAttempts_Fail)	{
		B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_TalkFail);
	};
};

//============================================================
instance DIA_Fellan_Returned(C_INFO)
{
	nr = 12;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_Returned_cond;
	information = DIA_Fellan_Returned_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Fellan_Returned_cond()
{
	if (MIS_FellanGoHome_Returned && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Fellan_Returned_info()
{
	AI_Output(self,other,"DIA_Fellan_Returned_06_01");	//��� �������, � ��� ������!
	AI_StopProcessInfos(self);
};

//============================================================
instance DIA_Fellan_ShowHammer(C_INFO)
{
	nr = 20;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_ShowHammer_cond;
	information = DIA_Fellan_ShowHammer_info;
	description = "������, ��� � ���� ����! (�������� �������)";
};
func int DIA_Fellan_ShowHammer_cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && Npc_HasItems(other,ItMi_FellanHammer))	{
		return TRUE;
	};
};
func void DIA_Fellan_ShowHammer_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_ShowHammer_03_00");	//������, ��� � ���� ����!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_ShowHammer_07_00");	//������, ��� � ���� ����!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_ShowHammer_10_00");	//������, ��� � ���� ����!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_ShowHammer_14_00");	//������, ��� � ���� ����!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_ShowHammer_16_00");	//������, ��� � ���� ����!
	};
	AI_Output(self,other,"DIA_Fellan_ShowHammer_06_01");	//(� ����������) ��� �������! ������?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_ShowHammer_03_02");	//�������. �� ������� ���, �� ��� ���� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_ShowHammer_07_02");	//�������. �� ������� ���, �� ��� ���� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_ShowHammer_10_02");	//�������. �� ������� ���, �� ��� ���� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_ShowHammer_14_02");	//�������. �� ������� ���, �� ��� ���� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_ShowHammer_16_02");	//�������. �� ������� ���, �� ��� ���� �����.
	};
	AI_Output(self,other,"DIA_Fellan_ShowHammer_06_03");	//���, �... ��� ����!
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_ShowHammer_03_04");	//�� ���, ���� �� ���������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_ShowHammer_07_04");	//�� ���, ���� �� ���������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_ShowHammer_10_04");	//�� ���, ���� �� ���������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_ShowHammer_14_04");	//�� ���, ���� �� ���������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_ShowHammer_16_04");	//�� ���, ���� �� ���������.
	};
	AI_Output(self,other,"DIA_Fellan_ShowHammer_06_05");	//� �� �������! ������ �� ����.
	if (!Npc_KnowsInfo(other,DIA_Irene_HammerRepaired))	{
		B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerFail);
	};
};


//============================================================
instance DIA_Fellan_UForgot(C_INFO)
{
	nr = 21;
	npc = VLK_480_Fellan;
	condition = DIA_Fellan_UForgot_cond;
	information = DIA_Fellan_UForgot_info;
	description = "� ���-����, �� ���-��� �����.";
};
func int DIA_Fellan_UForgot_cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && Npc_HasItems(other,ItMi_FellanHammer)
		&& Npc_KnowsInfo(other,DIA_Fellan_ShowHammer) && Npc_KnowsInfo(other,DIA_Irene_HammerRepaired))	{
		return TRUE;
	};
};
func void DIA_Fellan_UForgot_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_UForgot_03_00");	//� ���-����, �� ���-��� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_UForgot_07_00");	//� ���-����, �� ���-��� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_UForgot_10_00");	//� ���-����, �� ���-��� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_UForgot_14_00");	//� ���-����, �� ���-��� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_UForgot_16_00");	//� ���-����, �� ���-��� �����.
	};
	AI_Output(self,other,"DIA_Fellan_UForgot_06_01");	//���?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Fellan_UForgot_03_02");	//��������� ���� ����� ������, � �� �����������.
		AI_Output(other,self,"DIA_Fellan_UForgot_03_03");	//��������, ��� ������? � ������?
		AI_Output(other,self,"DIA_Fellan_UForgot_03_04");	//�� ������ ��, ��� ����� ������ �� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Fellan_UForgot_07_02");	//��������� ���� ����� ������, � �� �����������.
		AI_Output(other,self,"DIA_Fellan_UForgot_07_03");	//��������, ��� ������? � ������?
		AI_Output(other,self,"DIA_Fellan_UForgot_07_04");	//�� ������ ��, ��� ����� ������ �� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Fellan_UForgot_10_02");	//��������� ���� ����� ������, � �� �����������.
		AI_Output(other,self,"DIA_Fellan_UForgot_10_03");	//��������, ��� ������? � ������?
		AI_Output(other,self,"DIA_Fellan_UForgot_10_04");	//�� ������ ��, ��� ����� ������ �� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Fellan_UForgot_14_02");	//��������� ���� ����� ������, � �� �����������.
		AI_Output(other,self,"DIA_Fellan_UForgot_14_03");	//��������, ��� ������? � ������?
		AI_Output(other,self,"DIA_Fellan_UForgot_14_04");	//�����, ������ ��� ����� ������ �� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Fellan_UForgot_16_02");	//��������� ���� ����� ������, � �� �����������.
		AI_Output(other,self,"DIA_Fellan_UForgot_16_03");	//��������, ��� ������? � ������?
		AI_Output(other,self,"DIA_Fellan_UForgot_16_04");	//�� ������ ��, ��� ����� ������ �� �����?
	};
	AI_Output(self,other,"DIA_Fellan_UForgot_06_05");	//������. ������! � ��� �����!
	AI_Output(self,other,"DIA_Fellan_UForgot_06_06");	//��� ��� ��� �������.
	B_GiveInvItems(other,self,ItMi_FellanHammer,1);
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"HAMMER");
	B_StartOtherRoutine(VLK_478_Irene,"RETURNED");
	MIS_FellanGoHome_Returned = TRUE;
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_Success);
	B_GivePlayerXP(XP_Fellan_Returned);
};

