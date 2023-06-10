
instance DIA_NastasSanna_EXIT(DIA_Proto_End)
{
	npc = PC_NastasSanna;
};

//=====================================================
instance DIA_NastasSanna_Found1(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_NastasSanna_Found1_info;
	important = TRUE;
};
func void DIA_NastasSanna_Found1_info()
{
	ADMIS_NS_Found = 1;
	AI_Output(self,other,"DIA_NastasSanna_Found1_19_00");	//�, �� ����� ����. � � ������, ���� ����� �� �������...
	AI_Output(self,other,"DIA_NastasSanna_Found1_19_01");	//�������� �������������.
	B_StartOtherRoutine(self,"HIDE2");
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
};

//=====================================================
instance DIA_NastasSanna_Found2(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_NastasSanna_Found2_info;
	important = TRUE;
};
func void DIA_NastasSanna_Found2_info()
{
	ADMIS_NS_Found = 2;
	AI_Output(self,other,"DIA_NastasSanna_Found2_19_00");	//��, �� ����� ���� �����. ��� �� �� ���� ������� ����� �������� ����������?
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_StartOtherRoutine(self,"HIDE3");
};

//=====================================================
instance DIA_NastasSanna_Found3(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 3;
	condition = DIA_NoCond_cond;
	information = DIA_NastasSanna_Found3_info;
	important = TRUE;
};
func void DIA_NastasSanna_Found3_info()
{
	ADMIS_NS_Found = 3;
	var int x; x = 0;
	AI_Output(self,other,"DIA_NastasSanna_Found3_19_00");	//������, �� ��� ����� �� ���������.
	AI_Output(self,other,"DIA_NastasSanna_Found3_19_01");	//� �, ���� ������, ��������� ������� �� ���� �������.
	AI_Output(self,other,"DIA_NastasSanna_Found3_19_02");	//��������-�� �����! �� ������� 7 ��������.
	AI_Output(self,other,"DIA_NastasSanna_Found3_19_03");	//��, ����� ������� ��������� �� ���, ����������� ��� ���.
	x = 1;	if (x==1)	{
		B_GiveInvItems(self,other,ItWr_Script_Teleport,1);
	};
};

//=====================================================
instance DIA_NastasSanna_Scripts(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 4;
	condition = DIA_NastasSanna_Scripts_cond;
	information = DIA_NastasSanna_Scripts_info;
	permanent = TRUE;
	description = "(������ �������)";
};
func int DIA_NastasSanna_Scripts_cond()
{
	if ((Npc_HasItems(other, ItWr_Script1) || Npc_HasItems(other, ItWr_Script2) 
		|| Npc_HasItems(other, ItWr_Script3) || Npc_HasItems(other, ItWr_Script4) 
		|| Npc_HasItems(other, ItWr_Script5) || Npc_HasItems(other, ItWr_Script6) 
		|| Npc_HasItems(other, ItWr_Script7)) && (NastasSanna_Scripts_Cnt < 7))
	{	return TRUE;	};
};
func void DIA_NastasSanna_Scripts_info()
{
	var int rnd;	rnd = Hlp_Random(30);
	if ((rnd < 10) || (NastasSanna_Scripts_Cnt == 0))	{ 
		AI_Output(self,other,"DIA_NastasSanna_Scripts_19_00");	//�����.
	}
	else if (rnd < 20)	{
		AI_Output(self,other,"DIA_NastasSanna_Scripts_19_01");	//������������.
	}
	else	{
		AI_Output(self,other,"DIA_NastasSanna_Scripts_19_02");	//���������.
	};
	if (Npc_HasItems(other, ItWr_Script1))	{
		Npc_RemoveInvItem(other, ItWr_Script1);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script2))	{
		Npc_RemoveInvItem(other, ItWr_Script2);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script3))	{
		Npc_RemoveInvItem(other, ItWr_Script3);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script4))	{
		Npc_RemoveInvItem(other, ItWr_Script4);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script5))	{
		Npc_RemoveInvItem(other, ItWr_Script5);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script6))	{
		Npc_RemoveInvItem(other, ItWr_Script6);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (Npc_HasItems(other, ItWr_Script7))	{
		Npc_RemoveInvItem(other, ItWr_Script7);
		NastasSanna_Scripts_Cnt += 1;
	};
	if (NastasSanna_Scripts_Cnt >= 7)	{
		AI_Output(self,other,"DIA_NastasSanna_Scripts_19_03");	//�������-��, ��� ������� �� �����!
		AI_Output(self,other,"DIA_NastasSanna_Scripts_19_04");	//� ��� ���.
		
		AI_Output(other,self,"XXX");
		Wld_PlayEffect("SPELLFX_HEAL",other,other,1,0,0,0);
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		//����. ������� �����
		LevelUp();
	};
};
//=====================================================
instance DIA_NastasSanna_HowManyScripts(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 5;
	condition = DIA_NastasSanna_HowManyScripts_cond;
	information = DIA_NastasSanna_HowManyScripts_info;
	permanent = TRUE;
	description = "������� ��� ����� ����� ��������?";
};
func int DIA_NastasSanna_HowManyScripts_cond()
{
	if ((NastasSanna_Scripts_Cnt < 7) && Npc_KnowsInfo(other,DIA_NastasSanna_Found3))
	{	return TRUE;	};
};
func void DIA_NastasSanna_HowManyScripts_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_NastasSanna_HowManyScripts_03_00");	//������� ��� ����� ����� ��������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_NastasSanna_HowManyScripts_07_00");	//������� ��� ����� ����� ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_NastasSanna_HowManyScripts_10_00");	//������� ��� ����� ����� ��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_NastasSanna_HowManyScripts_14_00");	//������� ��� ����� ����� ��������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_NastasSanna_HowManyScripts_16_00");	//������� ��� ����� ����� ��������?
	};

	if (NastasSanna_Scripts_Cnt == 0)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_01");	//����.
	}
	else	if (NastasSanna_Scripts_Cnt == 1)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_02");	//�����.
	}
	else	if (NastasSanna_Scripts_Cnt == 2)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_03");	//����.
	}
	else	if (NastasSanna_Scripts_Cnt == 3)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_04");	//������.
	}
	else	if (NastasSanna_Scripts_Cnt == 4)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_05");	//���.
	}
	else	if (NastasSanna_Scripts_Cnt == 5)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_06");	//���.
	}
	else	if (NastasSanna_Scripts_Cnt == 6)	{
		AI_Output(self,other,"DIA_NastasSanna_HowManyScripts_19_07");	//����� ����.
	};
};

//=====================================================
instance DIA_NastasSanna_WhatIsScript(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 6;
	condition = DIA_NastasSanna_WhatIsScript_cond;
	information = DIA_NastasSanna_WhatIsScript_info;
	permanent = TRUE;
	description = "� ��� ����� ������?";
};
func int DIA_NastasSanna_WhatIsScript_cond()
{
	if (Npc_KnowsInfo(other,DIA_NastasSanna_Found3))	{
		return TRUE;
	};
};
func void DIA_NastasSanna_WhatIsScript_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_NastasSanna_WhatIsScript_03_00");	//� ��� ����� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_NastasSanna_WhatIsScript_07_00");	//� ��� ����� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_NastasSanna_WhatIsScript_10_00");	//� ��� ����� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_NastasSanna_WhatIsScript_14_00");	//� ��� ����� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_NastasSanna_WhatIsScript_16_00");	//� ��� ����� ������?
	};
	AI_Output(self,other,"DIA_NastasSanna_WhatIsScript_19_01");	//�, ��� ��� ������� � �������� - ������ ��� �����, ������ �� �����, ����������� ����������� ����� � ���� �����.
	AI_Output(self,other,"DIA_NastasSanna_WhatIsScript_19_02");	//�� ���������� �������. � ���� ������� �������� ��� �������� - ������ � ����.
	AI_Output(self,other,"DIA_NastasSanna_WhatIsScript_19_03");	//� ������� ��� ����� �� ��������� worldofplayers.ru, worldofplayers.de � magic-team.net.ru. 
	AI_Output(self,other,"DIA_NastasSanna_WhatIsScript_19_04");	//���, � � ������ ������� �����, ����� ��������� ������ �������� ��������������, � ����� ���������, ��������, ���������, ������, ����������, ���������� � ������ ������� �����.
	AI_Output(self,other,"DIA_NastasSanna_WhatIsScript_19_05");	//� ����� ��������, ���������� ��������� � ���������, ����� �������������� � �� �����.
};

//=====================================================
instance DIA_NastasSanna_WhatAUDoing(C_INFO)
{
	npc = PC_NastasSanna;
	nr = 7;
	condition = DIA_NastasSanna_WhatAUDoing_cond;
	information = DIA_NastasSanna_WhatAUDoing_info;
	permanent = TRUE;
	description = "��� �� �����������?";
};
func int DIA_NastasSanna_WhatAUDoing_cond()
{
	return TRUE;
};
func void DIA_NastasSanna_WhatAUDoing_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_03_00");	//��� �� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_07_00");	//��� �� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_10_00");	//��� �� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_14_00");	//��� �� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_16_00");	//��� �� �����������?
	};
	AI_Output(self,other,"DIA_NastasSanna_WhatAUDoing_19_01");	//������ - ������ �������� ������ � ����. �������� ������� �� �������� ������ �������� ����.
	Info_ClearChoices(DIA_NastasSanna_WhatAUDoing);
	Info_AddChoice(DIA_NastasSanna_WhatAUDoing,"�������.",DIA_NastasSanna_WhatAUDoing_Clear);
	Info_AddChoice(DIA_NastasSanna_WhatAUDoing,"� ��� � ���� �� ���?",DIA_NastasSanna_WhatAUDoing_WhatsWrong);
};

func void DIA_NastasSanna_WhatAUDoing_Clear()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_Clear_03_00");	//�������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_Clear_07_00");	//�������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_Clear_10_00");	//�������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_Clear_14_00");	//�������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_Clear_16_00");	//�������.
	};
	Info_ClearChoices(DIA_NastasSanna_WhatAUDoing);
};

func void DIA_NastasSanna_WhatAUDoing_WhatsWrong()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_03_00");	//� ��� � ���� �� ���?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_07_00");	//� ��� � ���� �� ���?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_10_00");	//� ��� � ���� �� ���?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_14_00");	//� ��� � ���� �� ���?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_16_00");	//� ��� � ���� �� ���?
	};
	AI_Output(self,other,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_19_01");	//��, ��-������, ��� �������� �� ���, ��� �� ��������. ������ �� ������ ���� �� ������, � ������� �� �����.
	AI_Output(self,other,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_19_02");	//����� �������� ������ ����������� � ����� �������, � ��� �� ��� �� �����������.
	AI_Output(self,other,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_19_03");	//��������� ������� ������� � ���������� �������. ������ ������� ����� � ���� ����� � 12 �����, � ��� �������.
	AI_Output(self,other,"DIA_NastasSanna_WhatAUDoing_WhatsWrong_19_04");	//��������� ��� ���� ����� ���� �� �������� � ��������� ����������� ������... � ���� �� ������� ������ �������, ������ ���� ������� ���.
	Info_ClearChoices(DIA_NastasSanna_WhatAUDoing);
};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++

instance DIA_NastasSanna_Snow_EXIT(DIA_Proto_End)
{
	npc = PC_NastasSanna_Snow;
};

//=====================================================
instance DIA_NastasSanna_Snow_EmptyFrames(C_INFO)
{
	npc = PC_NastasSanna_Snow;	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_NastasSanna_EmptyFrames_info;
	important = TRUE;
};
func void DIA_NastasSanna_EmptyFrames_info()
{
	AI_Output(self,other,"DIA_NastasSanna_EmptyFrames_19_00");	//���, ��������, ���������, ������ ��������� ����� ������?
	AI_Output(self,other,"DIA_NastasSanna_EmptyFrames_19_01");	//������ �� ���� ������� ����� ���� �������� ������ �� ������, ��������� ������ �������� �� �������. 
	AI_Output(self,other,"DIA_NastasSanna_EmptyFrames_19_02");	//�� � ��� ��� ������ �������.
	AI_StopProcessInfos(self);
};
