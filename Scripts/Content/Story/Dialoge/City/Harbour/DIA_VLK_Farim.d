
instance DIA_Farim_EXIT(DIA_Proto_End)
{
	npc = VLK_4301_Addon_Farim;
};

//===================================================
instance DIA_Farim_Hello(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Farim_MR_Hello_Info;
	permanent = TRUE;
	description = "��� �������?";
};
func void DIA_Farim_MR_Hello_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Farim_MR_Hello_03_00");	//��� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Farim_MR_Hello_07_00");	//��� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Farim_MR_Hello_10_00");	//��� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Farim_MR_Hello_14_00");	//��� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Farim_MR_Hello_16_00");	//��� �������?
	};
	if (Fishers_Rain_Day == 0)	{
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_01");	//����� ������ ��� ���� ���� �� ������� � �� ������������. ����� ������� � ����. ���� ������ �������.
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_02");	//������ ����� ����� � �������� ����, � � ������, ��� ��� ����������, �� � ������. ������ ����� ����������� � ����� ������.
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_03");	//� ���������� �� ������ ������� ����� ���.
		Fishers_Rain_Day = Wld_GetDay() + 1;
		/* DISABLED ������� ����� ������ �� �����
		MEM_InitGlobalInst();
		MEM_SkyController.rainFX_timeStartRain = FLOATNULL;
		if (Wld_IsRaining())	{
			var int h;	h = C_GetHour()+1;
			if (h >= 12)	{h = h - 12;}	else {h = h + 12;};
			MEM_SkyController.rainFX_timeStopRain = fracf(h,24);
		}
		else	{
			MEM_SkyController.rainFX_timeStopRain = FLOATNULL;
		};
		//*/
	}
	else if (Wld_GetDay() > Fishers_Rain_Day)	{
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_04");	//����� ���� ���� ���� ���������� � ����� ����� �������� ��������.
		if (!DIA_Farim_TellTales)	{
			AI_Output(self,other,"DIA_Farim_MR_Hello_11_05");	//����, �������, �� ��������� �� �������� ����.
			DIA_Farim_TellTales = TRUE;
		};
	}
	else	{
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_06");	//�� �������� �� ������. � �����.
	};
};

//===================================================
instance DIA_Farim_TrueRain(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 2;
	condition = DIA_Farim_TrueRain_cond;
	information = DIA_Farim_TrueRain_Info;
	important = TRUE;
};
func int DIA_Farim_TrueRain_cond()
{
	if (Fishers_Rain_Started == TRUE)	{
		return TRUE;
	};
};
func void DIA_Farim_TrueRain_Info()
{
	AI_Output(self,other,"DIA_Farim_TrueRain_11_00");	//� �� �������, ��� ������ ����������!
	AI_Output(self,other,"DIA_Farim_MR_Hello_11_04");	//����� ���� ���� ���� ���������� � ����� ����� �������� ��������.
	if (!DIA_Farim_TellTales)	{
		AI_Output(self,other,"DIA_Farim_MR_Hello_11_05");	//����, �������, �� ��������� �� �������� ����.
		DIA_Farim_TellTales = TRUE;
	};
	B_GivePlayerXP(XP_Ambient);
};

// ����� ��������� ====================================
// ��� �������� ����
//=====================================================
instance DIA_Farim_Tell_WhatSerpent(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 10;
	condition = DIA_Farim_Tell_WhatSerpent_cond;
	information = DIA_Farim_Tell_WhatSerpent_Info;
	description = "������ ����?";
};
func int DIA_Farim_Tell_WhatSerpent_cond()
{
	if (DIA_Farim_TellTales)	{
		return TRUE;
	};
};
func void DIA_Farim_Tell_WhatSerpent_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Farim_Tell_WhatSerpent_03_00");	//������ ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Farim_Tell_WhatSerpent_07_00");	//������ ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Farim_Tell_WhatSerpent_10_00");	//������ ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Farim_Tell_WhatSerpent_14_00");	//������ ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Farim_Tell_WhatSerpent_16_00");	//������ ����?
	};
	AI_Output(self,other,"DIA_Farim_Tell_WhatSerpent_11_01");	//������� �������� �� ������, � �������.
	AI_Output(self,other,"DIA_Farim_Tell_WhatSerpent_11_02");	//���� ������ ��� ����� �� �������� �� ������� � �����.
	AI_Output(self,other,"DIA_Farim_Tell_WhatSerpent_11_03");	//�� � ������ ������� � ���, ��� ���������� ������� ���� ���� �� ������� ����� �����.
};
//---------------------------------------------------
instance DIA_Farim_Tell_SeaSerpent(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 10;
	condition = DIA_Farim_Tell_SeaSerpent_cond;
	information = DIA_Farim_Tell_SeaSerpent_Info;
	description = "�������� ��� �������� ����.";
	permanent = TRUE;
};
func int DIA_Farim_Tell_SeaSerpent_cond()
{
	if (DIA_Farim_TellTales && Npc_KnowsInfo(other,DIA_Farim_Tell_WhatSerpent))	{
		return TRUE;
	};
};
func void DIA_Farim_Tell_SeaSerpent_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_03_00");	//�������� ��� �������� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_07_00");	//�������� ��� �������� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_10_00");	//�������� ��� �������� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_14_00");	//�������� ��� �������� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_16_00");	//�������� ��� �������� ����.
	};
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_01");	//���� ��� �������� ����� �����������, ��� ������, ����� ��� � ������ �������� �� ���� �������, ��� �������� ������� ���������.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_02");	//� ��� ������� �����-�� ����� ��� ���� �� ������. �� ��� ��������� ����� �������, � ������ �� ����� �������� ������ � ������.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_03");	//�������, ����� ��� ��������� - ������� �����, ����, ����� ������� ������, � ��������� ������� ����������. �� ����� ���� �������� � ���� � ������������ ������ ������.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_04");	//��� ������, ��� ������ ��� ������ �� ������, ���-�� ������ ������� � ����� �������. � ����� �� ���� ���������� ����� �������� �������.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_05");	//��� ���� �������, ������ �����, � � ����������� ����� ��������� ��������� ����� �������� ����� �����, ��� � ����. ������ ���� ������ - ��� �� ���������.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_06");	//���� ������ � ��������� �� ������� ������ ����������� � ���������, ��� ���� ������, ���������.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_07");	//������ ������������, �������� �� ������. �� ��� ������ ��������� �������� �������.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_08");	//�� �������� �� ����, ������� �������� ����� ����. �� ��������� ���������, � ������ ������� ������ � �������� � ����.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_09");	//��������� ��������� ���������� �������, � �������� ���� ������� � ���.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_10");	//���� ���� ������, ����� ������� �� ���� � ������ ���������� �����, �� �� ���������, �� ����������� ������ ����������� ����� �� ���.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_11");	//����� ������ ��� ������, ��� ����� ���� ��� �� ������ ��������, �������, ������� � ������ ����, ��� ���������� ��� ����.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_03_12");	//� ���? �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_07_12");	//� ���? �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_10_12");	//� ���? �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_14_12");	//� ���? �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Farim_Tell_SeaSerpent_16_12");	//� ���? �����?
	};
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_13");	//�������, �����. �� ��-�� �������� �� ����� ���� ����� ������ ����������� � �������� ���. ��� ��� ��������� �� ������������ �����.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_14");	//���� ��� ������ �������� ������ ���-��� ������� �� ������ - � ����� �� ����� ��� ����, � �������� �� ����� ��������� ���� ��� ��������.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_15");	//����� �����, � ������� ������ ����, �������� �������� - ����� ��� � �� ���� �������� �� ���� ����.
	AI_Output(self,other,"DIA_Farim_Tell_SeaSerpent_11_16");	//����� ���� ���������. ���� ����� ������ ����, ��� ������� ��������� ����, � �� ������� �����, ������ � ����� ������� ���� ������, ��� �� ����������� ����!
	if (!Tale_SeaDragon_Once)	{
		Tale_SeaDragon_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};

