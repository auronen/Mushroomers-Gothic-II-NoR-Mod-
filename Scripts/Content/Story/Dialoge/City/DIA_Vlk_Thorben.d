
instance DIA_Thorben_EXIT(DIA_Proto_End)
{
	npc = VLK_462_Thorben;
};
//===================================================
instance DIA_Thorben_Hello(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_MR_Hello_Cond;
	information = DIA_Thorben_MR_Hello_Info;
	important = TRUE;
};
func int DIA_Thorben_MR_Hello_Cond()
{
	if (Wld_IsTime(7,0,19,0) && !Npc_KnowsInfo(other,DIA_Thorben_Hello2)
		&& ((Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG) || DIA_WhenAsked_cond()))	{
		return TRUE;
	};
};
//===================================================
instance DIA_Thorben_Hello2(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Hello2_Cond;
	information = DIA_Thorben_MR_Hello_Info;
	description = "��� ����? �� ��������� ������������.";
};
func int DIA_Thorben_Hello2_Cond()
{
	if (!DIA_Thorben_MR_Hello_Cond() && !Npc_KnowsInfo(other,DIA_Thorben_Hello))	{
		return TRUE;
	};
};
func void DIA_Thorben_MR_Hello_Info()
{
	if (Wld_IsTime(7,0,19,0))	{
		AI_Output(self,other,"DIA_Thorben_MR_Hello_06_00");	//������ ����! �� ������� �� ���������� ������?
		AI_Output(self,other,"DIA_Thorben_MR_Hello_06_01");	//�����, ������, �������... ���, ��� ���������!
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Thorben_MR_Hello_03_02");	//���... ���, �������. ������ ��� ������ �� �����.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Thorben_MR_Hello_07_02");	//���, �������. ��������� ������ �� �����-�� �������� ��� ���������� �������.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Thorben_MR_Hello_10_02");	//���. ������ ��� ������ �� �����.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Thorben_MR_Hello_14_02");	//���... ���. ��� ������ �� �����.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Thorben_MR_Hello_16_02");	//���... ���, �������. ������ ��� ������ �� �����.
		};
		AI_Output(self,other,"DIA_Thorben_MR_Hello_06_03");	//����. ����� ����������� ����.
	}
	else
	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Thorben_MR_Hello_03_04");	//��� ����? �� ��������� ������������.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Thorben_MR_Hello_07_04");	//��� ����? �� ��������� ������������.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Thorben_MR_Hello_10_04");	//��� ����? �� ��������� ������������.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Thorben_MR_Hello_14_04");	//��� ����? �� ��������� ������������.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Thorben_MR_Hello_16_04");	//��� ����? �� ��������� ������������.
		};
		AI_Output(self,other,"DIA_Thorben_MR_Hello_06_05");	//���������� ������, �� �����. ����� ����������� ����.
	};
	AI_Output(self,other,"DIA_Thorben_MR_Hello_06_06");	//���� ��� ������ � ������, � ��������.
};
//===================================================
instance DIA_Thorben_IsItSoBad(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 3;
	condition = DIA_Thorben_IsItSoBad_Cond;
	information = DIA_Thorben_IsItSoBad_Info;
	description = "��� ��� �����?";
};
func int DIA_Thorben_IsItSoBad_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Thorben_Hello) || Npc_KnowsInfo(other,DIA_Thorben_Hello2))	{
		return TRUE;
	};
};
func void DIA_Thorben_IsItSoBad_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thorben_IsItSoBad_03_00");	//��� ��� �����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thorben_IsItSoBad_07_00");	//��� ��� �����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thorben_IsItSoBad_10_00");	//��� ��� �����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thorben_IsItSoBad_14_00");	//��� ��� �����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thorben_IsItSoBad_16_00");	//��� ��� �����?
	};
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_01");	//�����, ��� ���. �� ��������� ��� � ��������� ������� ��, ������� �����-�� ������� �� ���� �������.
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_02");	//� ���� ���������� � ��������. ���� ������ ����������, �������, � �������. 
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_03");	//�� ������ ��� ����� ������ ��� � ����� ��� �������.
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_04");	//� � ��� ���, ��� �� ���� ����� ����������, ��� ����� ������� ��� � ��.
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_05");	//� �� ������ �������! �������!
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_06");	//� �� ����, ��� ������ ����� � �������, � � ��� ������ ������ ����� ������!..
	AI_Output(self,other,"DIA_Thorben_IsItSoBad_06_07");	//������. ��� �� ��������� ��������� ���� ������ ����������...
	AI_StopProcessInfos(self);
	AI_TurnAway(self, other);
};

//===================================================
instance DIA_Thorben_ElvrichInPuff(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 20;
	condition = DIA_Thorben_ElvrichInPuff_Cond;
	information = DIA_Thorben_ElvrichInPuff_Info;
	description = "�� ������, ��� ������ ���� ���������?";
};
func int DIA_Thorben_ElvrichInPuff_Cond()
{
	if (Npc_KnowsInfo(other,DIA_Elvrich_USleepInPuff) || Kardif_RumorsTold[4])	{
		return TRUE;
	};
};
func void DIA_Thorben_ElvrichInPuff_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_03_00");	//�� ������, ��� ������ ���� ���������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_07_00");	//�� ������, ��� ������ ���� ���������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_10_00");	//�� ������, ��� ������ ���� ���������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_14_00");	//�� ������, ��� ������ ���� ���������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_16_00");	//�� ������, ��� ������ ���� ���������?
	};
	AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_01");	//� ����, ��� �� ������ ����-��. �� � ��� �� ���� � �� ������, ����� �������, ���� ������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_03_02");	//�� ����������� � �������� � ������� ������...
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_07_02");	//�� ����������� � �������� � ������� ������...
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_10_02");	//�� ����������� � �������� � ������� ������...
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_14_02");	//�� ����������� � �������� � ������� ������...
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thorben_ElvrichInPuff_16_02");	//�� ����������� � �������� � ������� ������...
	};
	AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_03");	//���?! �� ������ ������, ������� � ��� �����, �� �������� �����?
	AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_04");	//���� ����������! � ������ ��� ������ ����!
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_05");	//�������, ��� ��������� ���.
	}
	else	{
		AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_05b");	//�������, ��� ���������� ���.
	};
	AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_06");	//� ����� �� ������������ ����, �� � ���� ������ ��� �����...
	AI_Output(self,other,"DIA_Thorben_ElvrichInPuff_06_07");	//� �������� � ���������� �� ���� �����, ����� ��� ������� ���� ������.
	THORBEN_Discount = TRUE;
	B_StartOtherRoutine(VLK_4302_Addon_Elvrich,"PUNISHED");
};
//===================================================
instance DIA_Thorben_HammerWood(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 30;
	condition = DIA_Thorben_HammerWood_Cond;
	information = DIA_Thorben_HammerWood_Info;
	description = "�� ������ ������ ������� �������� ����� �������?";
};
func int DIA_Thorben_HammerWood_Cond()
{
	if ((MIS_FellanGoHome == LOG_Running)
		&& Npc_HasItems(other,ItMi_FellanHammer_Broken)
		&& Npc_KnowsInfo(other,DIA_Carl_CanRepairHummer))	{
		return TRUE;
	};
};
func void DIA_Thorben_HammerWood_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thorben_HammerWood_03_00");	//������ �������, �� ������ ������ ������� �������� ����� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thorben_HammerWood_07_00");	//������ �������, �� ������ ������ ������� �������� ����� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thorben_HammerWood_10_00");	//������ �������, �� ������ ������ ������� �������� ����� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thorben_HammerWood_14_00");	//������ �������, �� ������ ������ ������� �������� ����� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thorben_HammerWood_16_00");	//������ �������, �� ������ ������ ������� �������� ����� �������?
	};
	AI_Output(self,other,"DIA_Thorben_HammerWood_06_01");	//������� ���������... ��� ���.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thorben_HammerWood_03_02");	//���?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thorben_HammerWood_07_02");	//���?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thorben_HammerWood_10_02");	//���?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thorben_HammerWood_14_02");	//���?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thorben_HammerWood_16_02");	//���?
	};
	AI_Output(self,other,"DIA_Thorben_HammerWood_06_03");	//��, ����� ������� ������, ��� ��� �������� ������-������, ������ ��� �� �� �������� � ����.
	AI_Output(self,other,"DIA_Thorben_HammerWood_06_04");	//��������� � ����, �� ������ �� ������ �� ��������, �� ������ �� ������� ������������, ��� ��������� � �������, � ���������.
	AI_Output(self,other,"DIA_Thorben_HammerWood_06_05");	//�� ���� ������������� � ����, �� �� ���� ���� ����� ��������� ������ ������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Thorben_HammerWood_03_06");	//� � ���� ��� ����?
		AI_Output(other,self,"DIA_Thorben_HammerWood_03_07");	//��� ����� ������ �������, ��� ������� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Thorben_HammerWood_07_06");	//� � ���� ��� ����?
		AI_Output(other,self,"DIA_Thorben_HammerWood_07_07");	//��� ����� ������ �������, ��� ������� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Thorben_HammerWood_10_06");	//� � ���� ��� ����?
		AI_Output(other,self,"DIA_Thorben_HammerWood_10_07");	//��� ����� ������ �������, ��� ������� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Thorben_HammerWood_14_06");	//� � ���� ��� ����?
		AI_Output(other,self,"DIA_Thorben_HammerWood_14_07");	//��� ����� ������ �������, ��� ������� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Thorben_HammerWood_16_06");	//� � ���� ��� ����?
		AI_Output(other,self,"DIA_Thorben_HammerWood_16_07");	//��� ����� ������ �������, ��� ������� ������.
	};
	AI_Output(self,other,"DIA_Thorben_HammerWood_06_08");	//� ���������, ���. �������� ������������ � ������, ��������, ���� �������.
	B_LogEntry(TOPIC_FellanGoHome,TOPIC_FellanGoHome_HammerThorben);
	if (Npc_IsDead(VLK_442_Arbeiter))	{
		B_CloseLogOnDeath(VLK_442_Arbeiter);
	};
};

