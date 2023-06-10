
instance DIA_Dragomir_EXIT(DIA_Proto_End)
{
	npc = OUT_1212_Dragomir;
};


///////////////////////////// ����� ///////////////////////////////
//-----------------------------------------
instance DIA_Dragomir_Elena_ShadowFur(C_INFO)
{
	npc = OUT_1212_Dragomir;			nr = 10;
	condition = DIA_Dragomir_Elena_ShadowFur_cond;
	information = DIA_Dragomir_Elena_ShadowFur_info;
	description = "�� �������� �����? � ��� ����� ���������.";
};
func int DIA_Dragomir_Elena_ShadowFur_cond()
{
	if (C_HeroIs_Elena() && (Npc_KnowsInfo(other,DIA_Dragomir_WhatAUDoingHere) || Npc_KnowsInfo(other,DIA_Bosper_Elena_AskFur))
		 && MIS_Elena_Present_LuteroAskedFur
		 && (MIS_Elena_Present == LOG_Running)
		 && !MIS_Elena_Present_FurGot)	{
		return TRUE;
	};
};
func void DIA_Dragomir_Elena_ShadowFur_info()
{
		AI_Output(other,self,"DIA_Dragomir_Elena_ShadowFur_16_00");	//�� �������� �����? � ��� ����� ���������.
	AI_Output(self,other,"DIA_Dragomir_Elena_ShadowFur_12_01");	//���, ����� ��������� � ���� ������ ���.
	AI_Output(self,other,"DIA_Dragomir_Elena_ShadowFur_12_02");	//���� ����� �����, ������, �������, ���� ����������.
		AI_Output(other,self,"DIA_Dragomir_Elena_ShadowFur_16_03");	//���, ��� ����� ������ ���������.
};


///////////////////////////// ��� ///////////////////////////////
//-----------------------------------------
instance DIA_Dragomir_Hello(C_INFO)
{
	nr = 1;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_MR_Hello_cond;
	information = DIA_Dragomir_MR_Hello_info;
	important = TRUE;
};
func int DIA_Dragomir_MR_Hello_cond()
{
	if (DIA_WhenAsked_cond())
	{
		return TRUE;
	};
	
};
func void DIA_Dragomir_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Dragomir_MR_Hello_12_00");	//�����������! ������ �� ���� �������.
	AI_Output(self,other,"DIA_Dragomir_MR_Hello_12_01");	//�����, � �����, ������� ����� ��������� ������ ��������.
	AI_Output(self,other,"DIA_Dragomir_MR_Hello_12_02");	//������ � ����, ���� ���������� ���������.
};
//-----------------------------------------
instance DIA_Dragomir_WhatAUDoingHere(C_INFO)
{
	nr = 2;
	npc = OUT_1212_Dragomir;
	condition = DIA_NoCond_cond;
	information = DIA_Dragomir_WhatAUDoingHere_info;
	description = "��� �� ����� �������?";
};

func void DIA_Dragomir_WhatAUDoingHere_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_WhatAUDoingHere_03_00");	//��� �� ����� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_WhatAUDoingHere_07_00");	//��� �� ����� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_WhatAUDoingHere_10_00");	//��� �� ����� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_WhatAUDoingHere_14_00");	//��� �� ����� �������?
	} else 	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_WhatAUDoingHere_16_00");	//��� �� ����� �������?
	};
	AI_Output(self,other,"DIA_Dragomir_WhatAUDoingHere_12_01");	//� ������� � ������� ����� ������� ������� � ����� ��������� �� ����� ���������.
	AI_Output(self,other,"DIA_Dragomir_WhatAUDoingHere_12_02");	//�� � ����� ������, ��� � ��������� ���, ������� ����� ���� �����-�� ����� ��� �������.
};
//-----------------------------------------
instance DIA_Dragomir_WhyNotHotel(C_INFO)
{
	nr = 3;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_WhyNotHotel_cond;
	information = DIA_Dragomir_WhyNotHotel_info;
	description = "������ �� ����� �� ������ � ��������?";
};
func int DIA_Dragomir_WhyNotHotel_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_WhatAUDoingHere))
	{
		return TRUE;
	};
	
};
func void DIA_Dragomir_WhyNotHotel_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_WhyNotHotel_03_00");	//������ �� ����� �� ������ � ��������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_WhyNotHotel_07_00");	//������ �� ����� �� ������ � ��������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_WhyNotHotel_10_00");	//������ �� ����� �� ������ � ��������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_WhyNotHotel_14_00");	//������ �� ����� �� ������ � ��������?
	} else 	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_WhyNotHotel_16_00");	//������ �� ����� �� ������ � ��������?
	};
	AI_Output(self,other,"DIA_Dragomir_WhyNotHotel_12_01");	//� ���� ��� ������, ����� ��������� �� ������.
	AI_Output(self,other,"DIA_Dragomir_WhyNotHotel_12_02");	//� ���� ��, � ������� ������ � ����������� �������� �� ������ �������.
};
//-----------------------------------------
instance DIA_Dragomir_UAWelcome(C_INFO)
{
	nr = 4;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_UAWelcome_cond;
	information = DIA_Dragomir_UAWelcome_info;
	description = "���� �����������, ������ ������������ � ����.";
};
func int DIA_Dragomir_UAWelcome_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_WhatAUDoingHere)
		&& (C_HeroIs_Elena() || C_HeroIs_Erol() || C_HeroIs_Talbin()))
	{
		return TRUE;
	};
	
};
func void DIA_Dragomir_UAWelcome_info()
{
	if (C_HeroIs_Talbin())	{		//������
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_07_00");	//���� �����������, ������ ������������ � ����.
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_07_01");	//���� ������� ��������� �������� �� ������� ������.
	} else if (C_HeroIs_Erol())	{	//����
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_10_00");	//���� �����������, ������ ������������ � ����.
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_10_01");	//��� ��� ��������� �� ������ �����, �� ������ � ��������� �����.
	} else if (C_HeroIs_Elena())	{	//����� 
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_16_00");	//���� �����������, ������ ������������ � ����.
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_16_01");	//� ���� ��������� �����. � ��� � ����� ����� ��������� �������� �������� ��� ����������.
		AI_Output(other,self,"DIA_Dragomir_UAWelcome_16_02");	//���, �������, �� ������� �����, �� ����� ������ ��������.
	};
	AI_Output(self,other,"DIA_Dragomir_UAWelcome_12_03");	//������� �� �����������, �� � ���� �� ��������� ���������� � ������.
};
//-----------------------------------------
instance DIA_Dragomir_IsItDangerousHere(C_INFO)
{
	nr = 5;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_IsItDangerousHere_cond;
	information = DIA_Dragomir_IsItDangerousHere_info;
	description = "����� ������?";
	permanent = TRUE;
};
func int DIA_Dragomir_IsItDangerousHere_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_WhatAUDoingHere))
	{
		return TRUE;
	};
	
};
func void DIA_Dragomir_IsItDangerousHere_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_IsItDangerousHere_03_00");	//����� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_IsItDangerousHere_07_00");	//����� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_IsItDangerousHere_10_00");	//����� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_IsItDangerousHere_14_00");	//����� ������?
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_IsItDangerousHere_16_00");	//����� ������?
	};
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_01");	//��, ��� ���������� �������, � ���, ���� ������� �� ���� ��������. ������� - ������, ���� �����.
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_02");	//��������, ���� ����������� � ������� ��� ������ ������, �� ���������� �� ��������� ������.
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_03");	//��� ��������� ������ ��������� ���� � �������. �� �� �������� ��� ������.
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_04");	//��� �� ������� �������� � ������. � ������� ����� ���������� ���������� �� ������� ��������, � �� � �� ���� ������.
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_05");	//�� ������� ������������ ���������, ���� �� ������� ������, ������� � ��������.
	AI_Output(self,other,"DIA_Dragomir_IsItDangerousHere_12_06");	//���������� ���� ���� ������ ������, ���� ��� ���� ��� �����.
};
// ����� ��������� ====================================
// � ������� ������
//-----------------------------------------
instance DIA_Dragomir_AboutRuins(C_INFO)
{
	nr = 10;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_AboutRuins_cond;
	information = DIA_Dragomir_AboutRuins_info;
	description = "���������, ��� �������� ��� ������?";
};
func int DIA_Dragomir_AboutRuins_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_WhatAUDoingHere))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_AboutRuins_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_03_00");	//���������, ��� �������� ��� ������?
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_03_01");	//�� ��� �� ��� ���, �� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_07_00");	//���������, ��� �������� ��� ������?
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_07_01");	//��, �������, ���� ����� ���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_10_00");	//���������, ��� �������� ��� ������?
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_10_01");	//��, ������ ����, ����� ����� ���.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_14_00");	//���������, ��� �������� ��� ������?
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_14_01");	//�� ��� �� ��� ���, �� ������.
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_16_00");	//���������, ��� �������� ��� ������?
		AI_Output(other,self,"DIA_Dragomir_AboutRuins_16_01");	//�� ��� ����� ������, ��, ��������, ����� ���.
	};
	AI_Output(self,other,"DIA_Dragomir_AboutRuins_12_02");	//�� ��, �� ��� ��������, ��� ����� � ����� ����� ������ ������...
	AI_Output(self,other,"DIA_Dragomir_AboutRuins_12_03");	//� ��� �� �������� - ������ �� ����� �� ������. ���� � ������ ������ �������...
};
//-----------------------------------------
instance DIA_Dragomir_Tell_AboutRuins(C_INFO)
{
	nr = 11;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_Tell_AboutRuins_cond;
	information = DIA_Dragomir_Tell_AboutRuins_info;
	description = "��������, ��� �� ������ � ���������.";
};
func int DIA_Dragomir_Tell_AboutRuins_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_AboutRuins))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_Tell_AboutRuins_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_03_00");	//��������, ��� �� ������ � ���������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_07_00");	//��������, ��� �� ������ � ���������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_10_00");	//��������, ��� �� ������ � ���������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_14_00");	//��������, ��� �� ������ � ���������.
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_16_00");	//��������, ��� �� ������ � ���������.
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_01");	//������ ��� ��� - �� ����, �� ���� ��������� �������� � �������� ������� ��������� ��� ��� �������.
	if (C_NpcWears(other,ItAr_NOV_L))	{
		AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_02");	//�� ������ ����� �� ������, � �� ���� ��... ������� �� �������.
		AI_Output(other,self,"DIA_Dragomir_Tell_AboutRuins_03_03");	//�� ����� ����. �����������!
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_04");	//�����-��, � ������ �������, ���� �� ���, � ����� ���� �����.
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_05");	//����� ������, ������� � ������� ����� ������� ��� ��� ����� � ��� �����.
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_06");	//���� ����� ���� ����-������, ��� �� �� ����������, ����� �������� ���� �� ������ � ����������������.
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_07");	//���� ��� ����� ������ ����� ����� ����� � �����, ��� ����� ������ ��� ���� �������� �������, � ��� ����� ������ �������������� �� �����.
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_08");	//��� ����� �������� ��� ����� � �� ������ - ����� �� ����� �� ������. � ������ ���� ����� �� ��������. 
	AI_Output(self,other,"DIA_Dragomir_Tell_AboutRuins_12_09");	//������ ������� ������ � ��������� ��� ����� �����. ���-�� � ����� �������� �����, � � ���� ��������� ������ ���� � ���� ������� ���� �����.
};
//-----------------------------------------
instance DIA_Dragomir_Tell_DirtCity(C_INFO)
{
	nr = 12;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_Tell_DirtCity_cond;
	information = DIA_Dragomir_Tell_DirtCity_info;
	description = "� �������� �����?";
};
func int DIA_Dragomir_Tell_DirtCity_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_Tell_AboutRuins))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_Tell_DirtCity_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_DirtCity_03_00");	//� �������� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_DirtCity_07_00");	//� ��� ������ ��������� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_DirtCity_10_00");	//� ��� ������ ��������� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_DirtCity_14_00");	//� ��� ������ ��������� ������?
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_DirtCity_16_00");	//� �������� ����� ���?
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_DirtCity_12_01");	//����� ��, ��� � �������� ����� ���-�� �� �������. �����, � ���������� ������, � ����� �� ���.
	AI_Output(self,other,"DIA_Dragomir_Tell_DirtCity_12_02");	//������ ����� - �������� ���������. �� ����� ��� �������� ���� ������� � ��� ������� ������.
	AI_Output(self,other,"DIA_Dragomir_Tell_DirtCity_12_03");	//��� ��� ����� ���� ����� ��������� �������� �������� ���������.
};
//-----------------------------------------
instance DIA_Dragomir_Tell_Golems(C_INFO)
{
	nr = 13;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_Tell_Golems_cond;
	information = DIA_Dragomir_Tell_Golems_info;
	description = "������?";
};
func int DIA_Dragomir_Tell_Golems_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_Tell_AboutRuins))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_Tell_Golems_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_03_00");	//������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_07_00");	//������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_10_00");	//������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_14_00");	//������?
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_16_00");	//������?
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_Golems_12_01");	//��, ��������� ���� ������� ���� ������ ��� ����� � ��� ������������ �����.
	AI_Output(self,other,"DIA_Dragomir_Tell_Golems_12_02");	//��� ������� ������ � ������� �� ������. ����� ����� ������ �������� ���� �����, ��� ����. ����� ������ ������ � �� ����������.
	AI_Output(self,other,"DIA_Dragomir_Tell_Golems_12_03");	//��� �������, ������ � ����� ����� ��������� ������� � �������� �������, ������� ��� �����, ������ ��� ������� ������.
	AI_Output(self,other,"DIA_Dragomir_Tell_Golems_12_04");	//������ ���� ������ ��� �� ����� ������, � ���� �� ������.
	AI_Output(self,other,"DIA_Dragomir_Tell_Golems_12_05");	//���� �������� ����� ����� ����� ������, ������� �� ���� � ����. ���� ���� �� ��� - �� �� ��� �� �������� ����.
	Info_ClearChoices(DIA_Dragomir_Tell_Golems);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Dragomir_Tell_Golems, "��� ��, ����� ������...", DIA_Dragomir_Tell_Golems_Seen);
		Info_AddChoice(DIA_Dragomir_Tell_Golems, "������� ������ �� �����.", DIA_Dragomir_Tell_Golems_NeverSeen);
	}
	else	{
		Info_AddChoice(DIA_Dragomir_Tell_Golems, "������ ������...", DIA_Dragomir_Tell_Golems_Seen);
		Info_AddChoice(DIA_Dragomir_Tell_Golems, "������� ������ �� ������.", DIA_Dragomir_Tell_Golems_NeverSeen);
	};
};
func void DIA_Dragomir_Tell_Golems_NeverSeen()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_NeverSeen_03_00");	//������� ������ �� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_NeverSeen_07_00");	//������� ������ �� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_NeverSeen_10_00");	//������� ������ �� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_NeverSeen_14_00");	//������� ������ �� �����.
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_NeverSeen_16_00");	//������� ������ �� ������.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_Golems);
};
func void DIA_Dragomir_Tell_Golems_Seen()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_Seen_03_00");	//��� ��, ����� ������...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_Seen_07_00");	//��� ��, ����� ������...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_Seen_10_00");	//��� ��, ����� ������...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_Seen_14_00");	//��� ��, ����� ������...
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_Golems_Seen_16_00");	//������ ������...
	};
	Info_ClearChoices(DIA_Dragomir_Tell_Golems);
};
//-----------------------------------------
instance DIA_Dragomir_Tell_WhyDestroyed(C_INFO)
{
	nr = 14;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_Tell_WhyDestroyed_cond;
	information = DIA_Dragomir_Tell_WhyDestroyed_info;
	description = "��� ���� ��� ������?";
};
func int DIA_Dragomir_Tell_WhyDestroyed_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_Tell_AboutRuins))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_Tell_WhyDestroyed_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhyDestroyed_03_00");	//��� ���� ��� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhyDestroyed_07_00");	//��� ���� ��� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhyDestroyed_10_00");	//��� ���� ��� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhyDestroyed_14_00");	//��� ���� ��� ������?
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhyDestroyed_16_00");	//��� ���� ��� ������?
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_01");	//��, ��� ����������, ��� ������ ����� ������� � �����, � �����.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_02");	//������� ���� �� ����� �� ����, �� ����, ��� �� ����, �� ������, �� �������.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_03");	//����������� ������ �����. �� �� ����� � ������ ����� �������, ���� ������ ����� ������� �����.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_04");	//���� � ���� �� �������, � ����� ������ ������, ������� � ������� � ������. 
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_05");	//�� ��� ���� ������������� ��������� ���� ����� ����� � �����, � ������ �� ����� �������� ������ � ������������.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_06");	//������, �� �����������, ��������� �������� �����, ����� - ������� ����� �����, ����� ��������� � ������. �� ����� �� ������� �� ������ ������, �� � ������ ��� �����.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_07");	//����� ������ ��������� ����������� ���������. �� ������� ���������� ����� - ����� ������� ������, � ������ ������� �������.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_08");	//����� ���� ���������� � ��������� ����� � ���������� ��. ������ ���� � �������, � ������-�� � ��� ����� ���. ��� ��� ������� ���� �� ����� ��������.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_09");	//����� ���� ����� ����������, ��� �������� ������������, �������� ������ ������� �� ��������, � �������� - �� ��������. ��� �������� �����.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhyDestroyed_12_10");	//������ ����� ������� ������ ������� ���� ����� � ������. � �� ���������� ���� ����-�� �������.
};	

//-----------------------------------------
instance DIA_Dragomir_Tell_WhereGodsGone(C_INFO)
{
	nr = 15;
	npc = OUT_1212_Dragomir;
	condition = DIA_Dragomir_Tell_WhereGodsGone_cond;
	information = DIA_Dragomir_Tell_WhereGodsGone_info;
	description = "���������, ���� ������ �� ��� ����.";
};
func int DIA_Dragomir_Tell_WhereGodsGone_cond()
{
	if (Npc_KnowsInfo(other,DIA_Dragomir_Tell_WhyDestroyed))
	{
		return TRUE;
	};
};
func void DIA_Dragomir_Tell_WhereGodsGone_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_03_00");	//���������, ���� ������ �� ��� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_07_00");	//���������, ���� ������ �� ��� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_10_00");	//���������, ���� ������ �� ��� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_14_00");	//���������, ���� ������ �� ��� ����.
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_16_00");	//���������, ���� ������ �� ��� ����.
	};
	AI_Output(self,other,"DIA_Dragomir_Tell_WhereGodsGone_12_01");	//��� �������� �������, ��� �� ������� �� ����� ����, ����-��, ������ ��� ������� �� ��������.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhereGodsGone_12_02");	//����� �� ��� ��� � ������� ���� � ������ �� ����� ������.
	AI_Output(self,other,"DIA_Dragomir_Tell_WhereGodsGone_12_03");	//� � ������, ��� ��� ������ �������� � ����� �����������. ��� � ������ �� ��� ��� ����� ���, ��� ��������, �� ����� �� �� ��������.
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
	Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "� � �����, ��� ���� �� ���.", DIA_Dragomir_Tell_WhereGodsGone_Other);
	Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "�, �������, ��������� � ��� ����������.", DIA_Dragomir_Tell_WhereGodsGone_Stranger);
	if (other.aivar[AIV_Gender] == MALE)	{
		Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "� � ����� ��������.", DIA_Dragomir_Tell_WhereGodsGone_Agree);
	}
	else	{
		Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "� � ����� ��������.", DIA_Dragomir_Tell_WhereGodsGone_Agree);
	};
};
func void DIA_Dragomir_Tell_WhereGodsGone_Agree()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Agree_03_00");	//� � ����� ��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Agree_07_00");	//� � ����� ��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Agree_10_00");	//� � ����� ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Agree_14_00");	//� � ����� ��������.
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Agree_16_00");	//� � ����� ��������.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
};
func void DIA_Dragomir_Tell_WhereGodsGone_Stranger()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Stranger_03_00");	//�, �������, ��������� � ��� ����������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Stranger_07_00");	//�, �������, ��������� � ��� ����������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Stranger_10_00");	//�, �������, ��������� � ��� ����������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Stranger_14_00");	//�, �������, ��������� � ��� ����������.
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Stranger_16_00");	//�, �������, ��������� � ��� ����������.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
};

func void DIA_Dragomir_Tell_WhereGodsGone_Other()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Other_03_00");	//� � �����, ��� ���� �� ���.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Other_07_00");	//� � �����, ��� ���� �� ���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Other_10_00");	//� � �����, ��� ���� �� ���.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Other_14_00");	//� � �����, ��� ���� �� ���.
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Other_16_00");	//� � �����, ��� ���� �� ���.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
	Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "(�� ���� ����� �����.)", DIA_Dragomir_Tell_WhereGodsGone_NeverBeen);
	Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "(��� ��������� � ���� ������.)", DIA_Dragomir_Tell_WhereGodsGone_Elements);
	Info_AddChoice(DIA_Dragomir_Tell_WhereGodsGone, "(������ ������ �� ������ �������������.)", DIA_Dragomir_Tell_WhereGodsGone_Beliar);
};
func void DIA_Dragomir_Tell_WhereGodsGone_Beliar()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_03_00");	//������-�� �� ������ ��� ��� ��� ������. ���������, �� �������� ��� �����-������ ����, ����� ��� ���� ����� ������� ���.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_03_01");	//�����, � �� ���� ��� ������ �����, � ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_07_00");	//������-�� �� ������ ��� ��� ��� ������. ���������, �� �������� ��� �����-������ ����, ����� ��� ���� ����� ������� ���.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_07_01");	//�����, � �� ���� ��� ������ �����, � ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_10_00");	//������-�� �� ������ ��� ��� ��� ������. ���������, �� �������� ��� �����-������ ����, ����� ��� ���� ����� ������� ���.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_10_01");	//�����, � �� ���� ��� ������ �����, � ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_14_00");	//������-�� �� ������ ��� ��� ��� ������. ���������, �� �������� ��� �����-������ ����, ����� ��� ���� ����� ������� ���.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_14_01");	//�����, � �� ���� ��� ������ �����, � ������.
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_16_00");	//������-�� �� ������ ��� ��� ��� ������. ���������, �� �������� ��� �����-������ ����, ����� ��� ���� ����� ������� ���.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Beliar_16_01");	//�����, � �� ���� ��� ������ �����, � ������.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
};
func void DIA_Dragomir_Tell_WhereGodsGone_Elements()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_03_00");	//������ ����, ������� ��� ����, ��� ������������ ������ � ����� ������.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_03_01");	//��� ��� ��� ������ � ������ ������� � � ������ ������ �����. � ����� ������ ���� �� ������, ��� �� ������, �?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_07_00");	//������ ����, ������� ��� ����, ��� ������������ ������ � ����� ������.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_07_01");	//��� ��� ��� ������ � ������ ������� � � ������ ������ �����. � ����� ������ ���� �� ������, ��� �� ������, �?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_10_00");	//������ ����, ������� ��� ����, ��� ������������ ������ � ����� ������.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_10_01");	//��� ��� ��� ������ � ������ ������� � � ������ ������ �����. � ����� ������ ���� �� ������, ��� �� ������, �?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_14_00");	//������ ����, ������� ��� ����, ��� ������������ ������ � ����� ������.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_14_01");	//��� ��� ��� ������ � ������ ������� � � ������ ������ �����. � ����� ������ ���� �� ������, ��� �� ������, �?
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_16_00");	//������ ����, ������� ��� ����, ��� ������������ ������ � ����� ������.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_Elements_16_01");	//��� ��� ��� ������ � ������ ������� � � ������ ������ �����. � ����� ������ ���� �� ������, ��� �� ������, �?
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
};
func void DIA_Dragomir_Tell_WhereGodsGone_NeverBeen()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_03_00");	//�� �� ���� ����� ����� �����. ��� ���� �������� - ��� ��� ����.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_03_01");	//�� ��� �����, ��� ��� ��� �������, ��� ��������, ��� ��������... ���� �� ������ �� ����, ��� �� ������ ��� ����� �� ����.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_03_02");	//����� ����� ���� � �����. � ��� ��������� - ���� �������, ���� ������� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_07_00");	//�� �� ���� ����� ����� �����. ��� ���� �������� - ��� ��� ����.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_07_01");	//�� ��� �����, ��� ��� ��� �������, ��� ��������, ��� ��������... ���� �� ������ �� ����, ��� �� ������ ��� ����� �� ����.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_07_02");	//����� ����� ���� � �����. � ��� ��������� - ���� �������, ���� ������� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_10_00");	//�� �� ���� ����� ����� �����. ��� ���� �������� - ��� ��� ����.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_10_01");	//�� ��� �����, ��� ��� ��� �������, ��� ��������, ��� ��������... ���� �� ������ �� ����, ��� �� ������ ��� ����� �� ����.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_10_02");	//����� ����� ���� � �����. � ��� ��������� - ���� �������, ���� ������� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_14_00");	//�� �� ���� ����� ����� �����. ��� ���� �������� - ��� ��� ����.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_14_01");	//�� ��� �����, ��� ��� ��� �������, ��� ��������, ��� ��������... ���� �� ������ �� ����, ��� �� ������ ��� ����� �� ����.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_14_02");	//����� ����� ���� � �����. � ��� ��������� - ���� �������, ���� ������� �����.
	} else	{							//����/�����
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_16_00");	//�� �� ���� ����� ����� �����. ��� ���� �������� - ��� ��� ����.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_16_01");	//�� ��� �����, ��� ��� ��� �������, ��� ��������, ��� ��������... ���� �� ������ �� ����, ��� �� ������ ��� ����� �� ����.
		AI_Output(other,self,"DIA_Dragomir_Tell_WhereGodsGone_NeverBeen_16_02");	//����� ����� ���� � �����. � ��� ��������� - ���� �������, ���� ������� �����.
	};
	Info_ClearChoices(DIA_Dragomir_Tell_WhereGodsGone);
};

