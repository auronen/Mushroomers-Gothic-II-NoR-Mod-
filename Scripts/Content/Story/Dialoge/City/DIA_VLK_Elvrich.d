
instance DIA_Elvrich_EXIT(DIA_Proto_End)
{
	npc = VLK_4302_Addon_Elvrich;
};
//===================================================
instance DIA_Elvrich_InPuff(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 1;
	condition = DIA_Elvrich_InPuff_Cond;
	information = DIA_Elvrich_InPuff_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Elvrich_InPuff_Cond()
{
	if (Npc_IsInState(self,ZS_Talk) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_HABOUR_PUFF_PECK") && !Npc_KnowsInfo(other,DIA_Elvrich_ToldThorben))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_InPuff_Info()
{
	AI_Output(self,other,"DIA_Elvrich_InPuff_09_01");	//������, � ������ ������� �����...
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Elvrich_WhatAUDoing(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 2;
	condition = DIA_Elvrich_WhatAUDoing_Cond;
	information = DIA_Elvrich_WhatAUDoing_Info;
	description = "��� �� �����������?";
};
func int DIA_Elvrich_WhatAUDoing_Cond()
{
	return TRUE;
};
func void DIA_Elvrich_WhatAUDoing_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elvrich_WhatAUDoing_03_00");	//��� �� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elvrich_WhatAUDoing_07_00");	//��� �� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elvrich_WhatAUDoing_10_00");	//��� �� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elvrich_WhatAUDoing_14_00");	//��� �� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Elvrich_WhatAUDoing_16_00");	//��� �� �����������?
	};
	AI_Output(self,other,"DIA_Elvrich_WhatAUDoing_09_01");	//� ������ �������� �������.
	AI_Output(self,other,"DIA_Elvrich_WhatAUDoing_09_02");	//�� ������ � ������ ���� ������ � ���� ������ ������ �����.
	AI_Output(self,other,"DIA_Elvrich_WhatAUDoing_09_03");	//������-��, ����... �� ���� ������ ������ ����� ��� ���������� �������. ��� ����.
	AI_Output(self,other,"DIA_Elvrich_WhatAUDoing_09_04");	//������� � ��� ��������� ������ � ������ ����� ��� ������� ��.
	AI_Output(self,other,"DIA_Elvrich_WhatAUDoing_09_05");	//�� ��� � ��� �������.
};
//===================================================
instance DIA_Elvrich_WhereAUSleep(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 3;
	condition = DIA_Elvrich_WhereAUSleep_Cond;
	information = DIA_Elvrich_WhereAUSleep_Info;
	description = "��� �� �� �����?";
};
func int DIA_Elvrich_WhereAUSleep_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Elvrich_WhatAUDoing))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_WhereAUSleep_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elvrich_WhereAUSleep_03_00");	//��� �� �� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elvrich_WhereAUSleep_07_00");	//��� �� �� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elvrich_WhereAUSleep_10_00");	//��� �� �� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elvrich_WhereAUSleep_14_00");	//��� �� �� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Elvrich_WhereAUSleep_16_00");	//��� �� �� �����?
	};
	AI_Output(self,other,"DIA_Elvrich_WhereAUSleep_09_01");	//(���������) ��, � ���� ������ ����� ����, ��� ����� ����������...
};
//===================================================
instance DIA_Elvrich_BedIsReady(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 4;
	condition = DIA_Elvrich_BedIsReady_Cond;
	information = DIA_Elvrich_BedIsReady_Info;
	permanent = TRUE;
	description = "�� ���, ������� ������?";
};
func int DIA_Elvrich_BedIsReady_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Elvrich_WhatAUDoing))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_BedIsReady_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elvrich_BedIsReady_03_00");	//�� ���, ������� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elvrich_BedIsReady_07_00");	//�� ���, ������� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elvrich_BedIsReady_10_00");	//�� ���, ������� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elvrich_BedIsReady_14_00");	//�� ���, ������� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Elvrich_BedIsReady_16_00");	//�� ���, ������� ������?
	};
	AI_Output(self,other,"DIA_Elvrich_BedIsReady_09_01");	//(�������) ��� ���! � �� ����� �����.
};
//===================================================
instance DIA_Elvrich_USleepInPuff(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Elvrich_USleepInPuff_Cond;
	information = DIA_Elvrich_USleepInPuff_Info;
	description = "��� ������, �� ������� � �������?";
};
func int DIA_Elvrich_USleepInPuff_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Elvrich_InPuff) && Npc_KnowsInfo(other,DIA_Elvrich_WhereAUSleep))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_USleepInPuff_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_03_00");	//��� ������, �� ������� �...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_07_00");	//��� ������, �� ������� �...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_10_00");	//��� ������, �� ������� �...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_14_00");	//��� ������, �� ������� �...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_16_00");	//��� ������, �� ������� �...
	};
	if (Npc_GetDistToNpc(self,VLK_462_Thorben) < PERC_DIST_ACTIVE_MAX)	{
		AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_01");	//����! �� ���� �� ���� �������.
		AI_TurnToNpc(self,VLK_462_Thorben);
		AI_TurnToNpc(self,other);
	}
	else	{
		AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_03");	//(����������) ��, � ��� � ����?
	};
	AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_04");	//�� � ���� ���� �� ���� �����������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_03_05");	//� ��� ���� ��?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_07_05");	//� ��� ���� ��?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_10_05");	//� ��� ���� ��?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_14_05");	//� ��� ���� ��?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_16_05");	//� ��� ���� ��?
	};
	AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_06");	//� ����� ���� ������� � ������� � ��� �� ��������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_03_07");	//�� ���� ��� ��� ��������... ����� �� �� ���� �� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_07_07");	//�� ���� ��� ��� ��������... ����� �� �� ���� �� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_10_07");	//�� ���� ��� ��� ��������... ����� �� �� ���� �� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_14_07");	//�� ���� ��� ��� ��������... ����� �� �� ���� �� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Elvrich_USleepInPuff_16_08");	//��� ���... ��������? � �� � ��� ���������...
	};
	AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_09");	//�� �� ���������! � ������ ����� ��! � ��� ��� �����, ��� ��� ����������.
	AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_10");	//������ ��� ������������ ����������� �������� � ���. �� �� ����������� ������ ������ ���� ������.
	AI_Output(self,other,"DIA_Elvrich_USleepInPuff_09_11");	//�����, ������ �� ����������� ����� ����. �� �� ������.
};
//===================================================
instance DIA_Elvrich_ToldThorben(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 6;
	condition = DIA_Elvrich_ToldThorben_Cond;
	information = DIA_Elvrich_ToldThorben_Info;
	important = TRUE;
};
func int DIA_Elvrich_ToldThorben_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Thorben_ElvrichInPuff))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_ToldThorben_Info()
{
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Elvrich_ToldThorben_09_00");	//��! ��� �� ��������� ����! ��� �� ��� ��� ��������� �� ����?
	}
	else	{
		AI_Output(self,other,"DIA_Elvrich_ToldThorben_09_00b");	//��! �� ��� �� ���������� ����! ��� �� �����?
	};
	AI_Output(self,other,"DIA_Elvrich_ToldThorben_09_01");	//�� ������� �� ��� ������. ������ ���� �� ����.
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Elvrich_StopTalk(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 7;
	condition = DIA_Elvrich_StopTalk_Cond;
	information = DIA_Elvrich_StopTalk_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Elvrich_StopTalk_Cond()
{
	if (Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Elvrich_ToldThorben))
	{
		return TRUE;
	};
};
func void DIA_Elvrich_StopTalk_Info()
{
	AI_Output(self,other,"DIA_Elvrich_StopTalk_09_00");	//����! � �� ����� � ����� �������������.
	AI_StopProcessInfos(self);
};

