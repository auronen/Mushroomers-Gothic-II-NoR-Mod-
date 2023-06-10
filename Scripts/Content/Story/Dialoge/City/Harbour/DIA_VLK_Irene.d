
instance DIA_Irene_EXIT(DIA_Proto_End)
{
	npc = VLK_478_Irene;
};

//============================================================
instance DIA_Irene_Sarah_HowAU(C_INFO)
{
	nr = 1;
	npc = VLK_478_Irene;
	condition = DIA_Irene_Sarah_HowAU_cond;
	information = DIA_Irene_Sarah_HowAU_info;
	description = "��� ����, �������?";
};
func int DIA_Irene_Sarah_HowAU_cond()
{
	if (C_HeroIs_Sarah()
		&& !MIS_FellanGoHome_WifeWaits && !Npc_IsDead(VLK_480_Fellan))	{
		return TRUE;
	};
};
func void DIA_Irene_Sarah_HowAU_info()
{
		AI_Output(other,self,"DIA_Irene_Sarah_HowAU_16_00");	//��� ����, �������? �� ��������� ����� ������������.
	AI_Output(self,other,"DIA_Irene_Sarah_HowAU_17_01");	//��� �� ��� �� � �����?
		AI_Output(other,self,"DIA_Irene_Sarah_HowAU_16_02");	//���. ��� ���������?
	AI_Output(self,other,"DIA_Irene_Sarah_HowAU_17_03");	//������, ��... �� ���� �� ����.
	AI_Output(self,other,"DIA_Irene_Sarah_HowAU_17_04");	//������ ����� ����� ���� �� �������... � ������ ���� ���������� ��� ���������, �� ��� ����������.
	AI_Output(self,other,"DIA_Irene_Sarah_HowAU_17_05");	//� �� ����, ��� ��� ������! ��� ��������� ��� ��������� �����?!
	MIS_FellanGoHome = LOG_Running;
	MIS_FellanGoHome_WifeWaits = TRUE;
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Fellan);
	B_LogEntry_Create(TOPIC_FellanGoHome,LOG_MISSION,TOPIC_FellanGoHome_Start);
};

//============================================================
instance DIA_Irene_Others_HowAU(C_INFO)
{
	nr = 2;
	npc = VLK_478_Irene;
	condition = DIA_Irene_Others_HowAU_cond;
	information = DIA_Irene_Others_HowAU_info;
	description = "��� ���������? ��������� ������������.";
};
func int DIA_Irene_Others_HowAU_cond()
{
	if (!C_HeroIs_Sarah()
		&& !MIS_FellanGoHome_WifeWaits && !Npc_IsDead(VLK_480_Fellan))	{
		return TRUE;
	};
};
func void DIA_Irene_Others_HowAU_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_Others_HowAU_03_00");	//� ���� ���-�� ���������? ��������� ����� ������������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_Others_HowAU_07_00");	//� ���� ���-�� ���������? ��������� ����� ������������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_Others_HowAU_10_00");	//� ���� ���-�� ���������? ��������� ����� ������������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_Others_HowAU_14_00");	//� ���� ���-�� ���������? ��������� ����� ������������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_Others_HowAU_16_00");	//� ���� ���-�� ���������? ��������� ����� ������������.
	};
	AI_Output(self,other,"DIA_Irene_Others_HowAU_17_01");	//��, � �� ���������!
	AI_Output(self,other,"DIA_Irene_Others_HowAU_17_02");	//��� ���, ������, ���� �� ����.
	AI_Output(self,other,"DIA_Irene_Others_HowAU_17_03");	//������ ������ ����� �� �������... � �������� ���������, �������� � �������, �� ��� ����������.
	AI_Output(self,other,"DIA_Irene_Others_HowAU_17_04");	//��� �������, ��� �� ����� � ���, ����� � ��� �������... �� � ������ ���� ������� ���� �����!
	MIS_FellanGoHome = LOG_Running;
	MIS_FellanGoHome_WifeWaits = TRUE;
	B_LogEntry_Create(TOPIC_FellanGoHome,LOG_MISSION,TOPIC_FellanGoHome_Start);
};

//============================================================
instance DIA_Irene_HusbandLeft(C_INFO)
{
	nr = 10;
	npc = VLK_478_Irene;
	condition = DIA_Irene_HusbandLeft_cond;
	information = DIA_Irene_HusbandLeft_info;
	description = "�������, ���� ��� ���� �� ����.";
};
func int DIA_Irene_HusbandLeft_cond()
{
	if (MIS_FellanGoHome_WifeWaits
		&& (MIS_FellanGoHome == 0) && !Npc_IsDead(VLK_480_Fellan))	{
		return TRUE;
	};
};
func void DIA_Irene_HusbandLeft_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_HusbandLeft_03_00");	//�������, ���� ��� ���� �� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_HusbandLeft_07_00");	//�������, ���� ��� ���� �� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_HusbandLeft_10_00");	//�������, ���� ��� ���� �� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_HusbandLeft_14_00");	//�������, ���� ��� ���� �� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_HusbandLeft_16_00");	//�������, ���� ��� ���� �� ����.
	};
	AI_Output(self,other,"DIA_Irene_HusbandLeft_17_01");	//(�� �������) ��� � ����. ����� ����� ���-�� ����������, ��� ��� �� ���� ������� �� ������ ����.
	MIS_FellanGoHome = LOG_Running;
	if (C_HeroIs_Sarah())	{
		B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_Fellan);
	};
	B_LogEntry_Create(TOPIC_FellanGoHome,LOG_MISSION,TOPIC_FellanGoHome_Start);
};

//============================================================
instance DIA_Irene_WhatHappened(C_INFO)
{
	nr = 11;
	npc = VLK_478_Irene;
	condition = DIA_Irene_WhatHappened_cond;
	information = DIA_Irene_WhatHappened_info;
	description = "��������, ��� ���������.";
};
func int DIA_Irene_WhatHappened_cond()
{
	if (MIS_FellanGoHome == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Irene_WhatHappened_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_WhatHappened_03_00");	//��������, ��� ���������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_WhatHappened_07_00");	//��������, ��� ���������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_WhatHappened_10_00");	//��������, ��� ���������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_WhatHappened_14_00");	//��������, ��� ���������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_WhatHappened_16_00");	//��������, ��� ���������.
	};
	if (C_HeroIs_Sarah())	{
		AI_Output(self,other,"DIA_Irene_WhatHappened_17_01a");	//�� �� ������, ������ � ������� ��� ������� ��������, �� ������ � ����������. � ����� ������, ��� ��� ���������� ���� �����.
	}
	else	{
		AI_Output(self,other,"DIA_Irene_WhatHappened_17_01");	//������ ������ ��� ������� ��������, �� ������ � ���������� ������. ��� ���������� ���� ������ ������.
	};
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_02");	//�� � ��������� ����� ��� ����� ���������. �� ���� �������, ������.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_03");	//� �� ������� ������ �� �������� ���� ������� ����, �������� ���-�� ����������, ��� ��� �������, ��� ����� ������ ������ ������.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_04");	//�������, ��� ��������� ������, ��� �� � ������ ���.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_05");	//�� �� ��� ����� �� ������������, ������� ���� �� ��������... �������� �� �� ������ ���, �� �� ��� ����� ����� ����.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_06");	//� ���� ����������, ��� �� ������� � ���� � ���������� ������ �� �������.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_07");	//� ����� �� ������ ������� ���, �� �������, ����� ��������.
	AI_Output(self,other,"DIA_Irene_WhatHappened_17_08");	//��� � ��� �� ����������, �� ������� ������������ ������������ �����.
};


//============================================================
instance DIA_Irene_TalkToFellan(C_INFO)
{
	nr = 12;
	npc = VLK_478_Irene;
	condition = DIA_Irene_TalkToFellan_cond;
	information = DIA_Irene_TalkToFellan_info;
	description = "� �������� � ����� �����.";
};
func int DIA_Irene_TalkToFellan_cond()
{
	if (Npc_KnowsInfo(other,DIA_Irene_WhatHappened)
		&& (MIS_FellanGoHome == LOG_Running)
		&& (MIS_FellanGoHome_ToldAttempts < MIS_FellanGoHome_ToldAttempts_Fail))	{
		return TRUE;
	};
};
func void DIA_Irene_TalkToFellan_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_TalkToFellan_03_00");	//� �������� � ����� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_TalkToFellan_07_00");	//� �������� � ����� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_TalkToFellan_10_00");	//� �������� � ����� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_TalkToFellan_14_00");	//� �������� � ����� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_TalkToFellan_16_00");	//� �������� � ����� �����.
	};
	AI_Output(self,other,"DIA_Irene_TalkToFellan_17_01");	//��������. ���� �� �� �������.
};

//============================================================
instance DIA_Irene_FailTalk(C_INFO)
{
	nr = 13;
	npc = VLK_478_Irene;
	condition = DIA_Irene_FailTalk_cond;
	information = DIA_Irene_FailTalk_info;
	description = "��� �� ������� ��������� ������� ��������� �����.";
};
func int DIA_Irene_FailTalk_cond()
{
	if ((MIS_FellanGoHome_ToldAttempts >= MIS_FellanGoHome_ToldAttempts_Fail)
		&& (MIS_FellanGoHome == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Irene_FailTalk_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_FailTalk_03_00");	//��� �� ������� ��������� ������� ��������� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_FailTalk_07_00");	//��� �� ������� ��������� ������� ��������� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_FailTalk_10_00");	//��� �� ������� ��������� ������� ��������� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_FailTalk_14_00");	//��� �� ������� ��������� ������� ��������� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_FailTalk_16_00");	//��� �� ������� ��������� ������� ��������� �����.
	};
	AI_Output(self,other,"DIA_Irene_FailTalk_17_01");	//� � �� ���������. ����� ��� ���-�� ��������� � ������, �� ������ �� �������.
	if (hero.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Irene_FailTalk_17_02m");	//�� �������, ��� ���������.
	}
	else	{
		AI_Output(self,other,"DIA_Irene_FailTalk_17_02f");	//�� �������, ��� ����������.
	};
};

//============================================================
instance DIA_Irene_OtherWay(C_INFO)
{
	nr = 14;
	npc = VLK_478_Irene;
	condition = DIA_Irene_OtherWay_cond;
	information = DIA_Irene_OtherWay_info;
	description = "�����, ���� �������� ������.";
};
func int DIA_Irene_OtherWay_cond()
{
	if ((Npc_KnowsInfo(other,DIA_Irene_FailTalk))
		&& (MIS_FellanGoHome == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Irene_OtherWay_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_OtherWay_03_00");	//�����, ���� �������� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_OtherWay_07_00");	//�����, ���� �������� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_OtherWay_10_00");	//�����, ���� �������� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_OtherWay_14_00");	//�����, ���� �������� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_OtherWay_16_00");	//�����, ���� �������� ������.
	};
	AI_Output(self,other,"DIA_Irene_OtherWay_17_01");	//��� �� ������ �����?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_OtherWay_03_02");	//�� ���� ����������� ���. ���� ������� ���, ����� �� ��� ����� ���������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_OtherWay_07_02");	//�� ���� ����������� ���. ���� ������� ���, ����� �� ��� ����� ���������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_OtherWay_10_02");	//�� ���� ����������� ���. ���� ������� ���, ����� �� ��� ����� ���������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_OtherWay_14_02");	//�� ���� ����������� ���. ���� ������� ���, ����� �� ��� ����� ���������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_OtherWay_16_02");	//�� ���� ����������� ���. ���� ������� ���, ����� �� ��� ����� ���������.
	};
	AI_Output(self,other,"DIA_Irene_OtherWay_17_03");	//(� ���������) � ��� �� ���������� ��� �������?
};

//============================================================
instance DIA_Irene_SwitchAtttention(C_INFO)
{
	nr = 15;
	npc = VLK_478_Irene;
	condition = DIA_Irene_SwitchAtttention_cond;
	information = DIA_Irene_SwitchAtttention_info;
	description = "����� ����������� ��� ��������.";
};
func int DIA_Irene_SwitchAtttention_cond()
{
	if ((Npc_KnowsInfo(other,DIA_Irene_OtherWay))
		&& (MIS_FellanGoHome == LOG_Running))	{
		return TRUE;
	};
};
func void DIA_Irene_SwitchAtttention_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_03_00");	//����� ����������� ��� ��������.
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_03_01");	//��� � ���������� �������. ���� �� ������ � ������������ - ���� ��� ����� ����������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_07_00");	//����� ����������� ��� ��������.
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_07_01");	//��� � ���������� �������. ���� �� ������ � ������������ - ���� ��� ����� ����������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_10_00");	//����� ����������� ��� ��������.
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_10_01");	//��� � ���������� �������. ���� �� ������ � ������������ - ���� ��� ����� ����������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_14_00");	//����� ����������� ��� ��������.
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_14_01");	//��� � ���������� �������. ���� �� ������ � ������������ - ���� ��� ����� ����������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_16_00");	//����� ����������� ��� ��������.
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_16_01");	//��� � ���������� �������. ���� �� ������ � ������������ - ���� ��� ����� ����������.
	};
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_02");	//����������?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_03_03");	//������� ������. ����� ���-�� ������, ���-�� ������� ���, ���� ���� �� �� ��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_07_03");	//������� ������. ����� ���-�� ������, ���-�� ������� ���, ���� ���� �� �� ��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_10_03");	//������� ������. ����� ���-�� ������, ���-�� ������� ���, ���� ���� �� �� ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_14_03");	//������� ������. ����� ���-�� ������, ���-�� ������� ���, ���� ���� �� �� ��������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_16_03");	//������� ������. ����� ���-�� ������, ���-�� ������� ���, ���� ���� �� �� ��������.
	};
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_04");	//���-�� ��������... ������, �� ����� ������������� � ������ �������, �� ���� �� ���������, ���� ���� ��� ������ �������.
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_05");	//� ���� ����� ������ ������� �������.
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_06");	//���� �����... ��� �������!
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_03_07");	//�������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_07_07");	//�������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_10_07");	//�������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_14_07");	//�������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_SwitchAtttention_16_07");	//�������?
	};
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_08");	//��. ������� ����������� ��� ���� �������, � �� ��� ������� ���������.
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_09");	//������ ���� ����� �������� � ������, �� � ���� �� ����� ���������� - ����� ���������, ����� �� �����������, �� ��������� ������� ������ ������...
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_10");	//�� �� ��������� ��������, ���� ���� ��� ����� � ��� �������� ������� �� ��������� ��������.
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_11");	//����� �� ��� ��������, �� ������� ������ �� ��� ���. �������� �������� ���.
	AI_Output(self,other,"DIA_Irene_SwitchAtttention_17_12");	//���, ������ ���� �� ��� �������. 
	//PUBLIC
	B_GiveInvItems(self,other,ItKe_Chest_Fellan,1);
	self.aivar[AIV_IgnoreFlags] = self.aivar[AIV_IgnoreFlags] | IGNORE_PortalRoom;
	Fellan_ChestKeyGot = TRUE;
	MOBNAME_Chest_Fellan = MOBNAME_Chest_Fellan_Full;
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerTold);
};

//============================================================
instance DIA_Irene_WhoRepairHammer(C_INFO)
{
	nr = 16;
	npc = VLK_478_Irene;
	condition = DIA_Irene_WhoRepairHammer_cond;
	information = DIA_Irene_WhoRepairHammer_info;
	description = "��� ����� �������� �������?";
};
func int DIA_Irene_WhoRepairHammer_cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && Npc_KnowsInfo(other,DIA_Irene_SwitchAtttention))	{
		return TRUE;
	};
};
func void DIA_Irene_WhoRepairHammer_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_WhoRepairHammer_03_00");	//��� ����� �������� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_WhoRepairHammer_07_00");	//��� ����� �������� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_WhoRepairHammer_10_00");	//��� ����� �������� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_WhoRepairHammer_14_00");	//��� ����� �������� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_WhoRepairHammer_16_00");	//��� ����� �������� �������?
	};
	AI_Output(self,other,"DIA_Irene_WhoRepairHammer_17_01");	//�������� � �������� ������.
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerSmith);
	if (Npc_IsDead(VLK_461_Carl))	{
		B_CloseLogOnDeath(VLK_461_Carl);
	};
};

//============================================================
instance DIA_Irene_HammerRepaired(C_INFO)
{
	nr = 17;
	npc = VLK_478_Irene;
	condition = DIA_Irene_HammerRepaired_cond;
	information = DIA_Irene_HammerRepaired_info;
	description = "� ������� �������.";
};
func int DIA_Irene_HammerRepaired_cond()
{
	if ((MIS_FellanGoHome == LOG_Running) && Npc_HasItems(other,ItMi_FellanHammer))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Irene_HammerRepaired.description = "� �������� �������.";
		};
		return TRUE;
	};
};
func void DIA_Irene_HammerRepaired_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_HammerRepaired_03_00");	//� ������� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_HammerRepaired_07_00");	//� ������� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_HammerRepaired_10_00");	//� ������� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_HammerRepaired_14_00");	//� ������� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_HammerRepaired_16_00");	//� �������� �������.
	};
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_01");	//������-��, ��� ���������.
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_02");	//� ��� ��� ���-��� ���������. ��� ��� � ����� ������ ������� ���� � ���� ��� ������ 60 ���.
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_03");	//��� ��������, ��� ������������ ���������, ��� � ������ ����, ����� ������ ������, � �� �����������.
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_04");	//� ��� ������, ����� ����� �����������, ������, ��� ����� �� ������, ������� � �������� � �� ����� � ������, �� ���� ������� �� ������.
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_05");	//������� ��������, �� ��������.
	AI_Output(self,other,"DIA_Irene_HammerRepaired_17_06");	//�����, ���� ��� ��������� �� ����, �� ��������?
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_Clue);
};

//============================================================
instance DIA_Irene_Returned(C_INFO)
{
	nr = 18;
	npc = VLK_478_Irene;
	condition = DIA_Irene_Returned_cond;
	information = DIA_Irene_Returned_info;
	important = TRUE;
};
func int DIA_Irene_Returned_cond()
{
	if ((MIS_FellanGoHome_Returned))	{
		return TRUE;
	};
};
func void DIA_Irene_Returned_info()
{
	AI_Output(self,other,"DIA_Irene_Returned_17_00");	//���� �������! �� ��������.
	AI_Output(self,other,"DIA_Irene_Returned_17_01");	//�������, ������� ��������.
	//���� �� ������� �� �������
	if (Mob_HasItems("CHEST_FELLAN",ItAm_MR_SharkTooth_Broken))	{
		AI_Output(self,other,"DIA_Irene_Returned_17_02");	//���. ������ ���� ������ �� �����.
		AI_Output(self,other,"DIA_Irene_Returned_17_03");	//������ ������ ����� ������� ���, ��, �����, �� �� ��������, ��� � ������ ��� ����.
		//������ �� �������� ���� - ������ �� ����� +10% �����
		B_GiveInvItems(self,other,ItAm_MR_SharkTooth,1);
		MobContainer_RemoveItem("CHEST_FELLAN",ItAm_MR_SharkTooth_Broken);
		B_LogEntry_Status(TOPIC_FellanGoHome,LOG_SUCCESS,ConcatStrings(TOPIC_FellanGoHome_SuccessIrene, TOPIC_FellanGoHome_SuccessAmul));
	}
	else	{
		AI_Output(self,other,"DIA_Irene_Returned_17_04");	//� ���������, � ���� ��� ������ �������, ����� �������� ����.
		AI_Output(self,other,"DIA_Irene_Returned_17_05");	//���, ������ ���� �� ��������� �����.
		//20 ���.
		B_GiveGold(self,other,20);
		B_LogEntry_Status(TOPIC_FellanGoHome,LOG_SUCCESS,TOPIC_FellanGoHome_SuccessIrene);
	};
	B_GivePlayerXP(XP_Fellan_Success);
};

//============================================================
instance DIA_Irene_PermHowAU(C_INFO)
{
	nr = 18;
	npc = VLK_478_Irene;
	condition = DIA_NoCond_cond;
	information = DIA_Irene_PermHowAU_info;
	description = "��� ����������?";
	permanent = TRUE;
};
func void DIA_Irene_PermHowAU_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Irene_PermHowAU_03_00");	//��� ����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Irene_PermHowAU_07_00");	//��� ����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Irene_PermHowAU_10_00");	//��� ����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Irene_PermHowAU_14_00");	//��� ����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Irene_PermHowAU_16_00");	//��� ����������?
	};
	if (!MIS_FellanGoHome_Returned)	{
		AI_Output(self,other,"DIA_Irene_PermHowAU_17_01");	//� ������� �����������.
	}
	else	{
		AI_Output(self,other,"DIA_Irene_PermHowAU_17_02");	//������, ����� ������ ��������, � ���� �� ���� ��������.
		AI_Output(self,other,"DIA_Irene_PermHowAU_17_03");	//��� ������ ������, �������, �� ��� ���� ��� �����������.
		AI_Output(self,other,"DIA_Irene_PermHowAU_17_04");	//�� ��� �������. ����� ��� ���������, � �����.
	};
};

