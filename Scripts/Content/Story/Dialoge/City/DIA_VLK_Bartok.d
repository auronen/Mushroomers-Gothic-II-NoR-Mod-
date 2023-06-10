
instance DIA_Bartok_EXIT(DIA_Proto_End)
{
	npc = VLK_440_Bartok;
};

//=====================================================
instance DIA_Bartok_Start(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 1;
	condition = DIA_Bartok_Start_cond;
	information = DIA_Bartok_Start_info;
	description = "��� �����������?";
	permanent = TRUE;
};
func int DIA_Bartok_Start_cond()
{
	if (!C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Bartok_Start_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Bartok_Start_03_00");	//��� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Bartok_Start_07_00");	//��� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Bartok_Start_10_00");	//��� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Bartok_Start_14_00");	//��� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Bartok_Start_16_00");	//��� �����������?
	};
	if (Wld_IsTime(7,0,20,15))	{
		AI_Output(self,other,"DIA_Bartok_Start_04_01");	//�������. � ������� �� �������� �������.
		AI_Output(self,other,"DIA_Bartok_Start_04_02");	//��� ������ - ��������� ����� ��� ����.
	}
	else	{
		AI_Output(self,other,"DIA_Bartok_Start_04_03");	//� ������ ������ - ������������.
	};
};

//=====================================================
instance DIA_Bartok_Competition(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Bartok_Competition_info;
	description = "�� ���������� � �������� �����������?";
};

func void DIA_Bartok_Competition_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Bartok_Competition_03_00");	//�� ���������� � �������� �����������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Bartok_Competition_07_00");	//�� ���������� � �������� �����������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Bartok_Competition_10_00");	//�� ���������� � �������� �����������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Bartok_Competition_14_00");	//�� ���������� � �������� �����������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Bartok_Competition_16_00");	//�� ���������� � �������� �����������?
	};
	AI_Output(self,other,"DIA_Bartok_Competition_04_01");	//���. ������ ����� ���������, ���� � ����� �������� �� ����-�� �������.
	AI_Output(self,other,"DIA_Bartok_Competition_04_02");	//�� � � �� ����� ���������� � ������.
};

//=====================================================
instance DIA_Bartok_Alone(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 3;
	condition = DIA_Bartok_Alone_cond;
	information = DIA_Bartok_Alone_info;
	description = "�� ��� ����?";
};
func int DIA_Bartok_Alone_cond()
{
	if (C_HeroIs_Talbin() || Wld_IsTime(7,0,19,30) && !Npc_KnowsInfo(other,DIA_Trocar_HogKilled))	{
		if (C_HeroIs_Talbin())	{
			DIA_Bartok_Alone.description = "� ��� ������?";
		};
		return TRUE;
	};
};
func void DIA_Bartok_Alone_info()
{
	if (C_HeroIs_Talbin())	{
			AI_Output(other,self,"DIA_Bartok_Talbin_Alone_07_00");	//� ��� ������?
			AI_Output(other,self,"DIA_Bartok_Talbin_Alone_07_01");	//� ��� ��������� �� ����������� �� �����.
		AI_Output(self,other,"DIA_Bartok_Talbin_Alone_04_02");	//�� �� �� �� �������� ��������. ��������� �� �����.
	}
	else	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Bartok_Alone_03_00");	//�� ��� ����?
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Bartok_Alone_10_00");	//�� ��� ����?
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Bartok_Alone_14_00");	//�� ��� ����?
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Bartok_Alone_16_00");	//�� ��� ����?
		};
		AI_Output(self,other,"DIA_Bartok_Alone_04_01");	//��. ������ �� �������� � ���� ������ ��������. �� ������ �� �� ����� ���������.
	};
	AI_Output(self,other,"DIA_Bartok_Alone_04_02");	//� ��� ��� ��������� ���� �� �����. ������� �� ����, ���� �� ����������.
	if (!Npc_IsDead(OUT_1230_Trocar))	{
		if (C_HeroIs_Sarah() || C_HeroIs_Elena())	{
			AI_Output(self,other,"DIA_Bartok_Alone_04_03");	//���� ����� ��������� ���, ���� �����, �����, ����� ����� � ������� ������. �� ��� � ������ �� ������ ��� �����.
		}
		else if (C_HeroIs_Erol())	{
			AI_Output(self,other,"DIA_Bartok_Alone_04_04");	//���� ����� ��������� ���, ���������, ��� �� � ������� ������ ��� �����.
				AI_Output(other,self,"DIA_Bartok_Alone_10_05");	//�, ��� ��� ��� ��� � ������ ������ ���� �� ������ ��������.
		} 
		else 	{
			AI_Output(self,other,"DIA_Bartok_Alone_04_06");	//���� ����� ��������� ���, �����, ����� ������ � ������� ������. �� � ������ �� ������ ��� �����.
		};
		MIS_FindTrocar = LOG_Running;
		B_LogEntry_Create(TOPIC_FindTrocar, LOG_MISSION, TOPIC_FindTrocar_Start);
	};
};

//=====================================================
instance DIA_Bartok_MetTrocar(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 4;
	condition = DIA_Bartok_MetTrocar_cond;
	information = DIA_Bartok_MetTrocar_info;
	important = TRUE;
};
func int DIA_Bartok_MetTrocar_cond()
{
	if (Npc_KnowsInfo(other,DIA_Trocar_HogKilled) && Npc_KnowsInfo(other,DIA_Bartok_Start))	{
		return TRUE;
	};
};
func void DIA_Bartok_MetTrocar_info()
{
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Bartok_MetTrocar_04_01m");	//�������, ��� ����� ����� �������� ������.
	}
	else	{
		AI_Output(self,other,"DIA_Bartok_MetTrocar_04_01f");	//�������, ��� ����� ����� �������� ������.
	};
	AI_Output(self,other,"DIA_Bartok_MetTrocar_04_02");	//��� ��� �������� �� ����� ������� ���-�� � ���������! ��� �����������!
	B_GivePlayerXP(XP_Ambient);
};

// ����� ��������� ====================================
// ��� ���������� ��������
//=====================================================
instance DIA_Bartok_WhyDontHuntFarAway(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 10;
	condition = DIA_Bartok_WhyDontHuntFarAway_cond;
	information = DIA_Bartok_WhyDontHuntFarAway_info;
	description = "������ �� �� ������� ������ �� ������?";
};
func int DIA_Bartok_WhyDontHuntFarAway_cond()
{
	if (DIA_Trocar_TellTales && Npc_KnowsInfo(other,DIA_Bartok_Start))	{
		return TRUE;
	};
};
func void DIA_Bartok_WhyDontHuntFarAway_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_03_00");	//������ �� �� ������� ������ �� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_07_00");	//������ �� �� ������� ������ �� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_10_00");	//������ �� �� ������� ������ �� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_14_00");	//������ �� �� ������� ������ �� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_16_00");	//������ �� �� ������� ������ �� ������?
	};
	AI_Output(self,other,"DIA_Bartok_WhyDontHuntFarAway_04_01");	//���, ������ ����� ������ ���� ����� � ���������, ��� � �� ���� � ��� ������ ����������� �� ����� �����?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_03_02");	//��, ����� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_07_02");	//��, ����� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_10_02");	//��, ����� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_14_02");	//��, ����� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_16_02");	//����� � ��� �������.
	};
	AI_Output(self,other,"DIA_Bartok_WhyDontHuntFarAway_04_03");	//������, � �� ���� ���� ������� ������ ���� ����� - ����� �� ������ � ��� �����, ������� �� ������� ����������.
	AI_Output(self,other,"DIA_Bartok_WhyDontHuntFarAway_04_04");	//����� ���������, ��� ��� ��������� �������. � � ���� ������� � ����� �������, �������� ��������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_03_05");	//��� ��� �� ��������� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_07_05");	//��� ��� �� ��������� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_10_05");	//��� ��� �� ��������� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_14_05");	//��� ��� �� ��������� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Bartok_WhyDontHuntFarAway_16_05");	//��� ��� �� ��������� �������?
	};
	AI_Output(self,other,"DIA_Bartok_WhyDontHuntFarAway_04_06");	//������� ������ �� ��������� ����? ��� ������������ ����� ��� ����, � ������� ������������� � ����.
	DIA_Bartok_TellTales = TRUE; 
};
//---------------------------------------
instance DIA_Bartok_Tell_CursedHunter(C_INFO)
{
	npc = VLK_440_Bartok;		nr = 11;
	condition = DIA_Bartok_Tell_CursedHunter_cond;
	information = DIA_Bartok_Tell_CursedHunter_info;
	description = "�������� ��� ���������� ��������.";
	permanent = TRUE;
};
func int DIA_Bartok_Tell_CursedHunter_cond()
{
	if (DIA_Bartok_TellTales)	{
		return TRUE;
	};
};
func void DIA_Bartok_Tell_CursedHunter_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Bartok_Tell_CursedHunter_03_00");	//�������� ��� ���������� ��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Bartok_Tell_CursedHunter_07_00");	//�������� ��� ���������� ��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Bartok_Tell_CursedHunter_10_00");	//�������� ��� ���������� ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Bartok_Tell_CursedHunter_14_00");	//�������� ��� ���������� ��������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Bartok_Tell_CursedHunter_16_00");	//�������� ��� ���������� ��������.
	};
	if (!Tale_CursedHunter_Once)	{
		AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_01");	//�����, ���� ���������� �� ���� �� �����.
	};
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_02");	//� �����, � ��������� ���� ��� ��������, ����. ��� ����� ��������� ������, ��� �� � ��������.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_03");	//�� ������� ���� ���������� �� ����� ����. �� �������� ���� ������ � ���� �� �������. ����� ���� ����� � ���������� � �����.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_04");	//�� ��� �� �����, �������� �� �������� ������ � ����� �����. ����� �� ������� �����, �� ���� ��� ���������� �� ������ ��� ������.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_05");	//���� �������� ���, ���������� ���������� � �������� ������. ������ ������ � ����� ����� �����, � �� ��������� �� ������.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_06");	//���� ������� �� ������ ������, �� ����� �������, �� ������ ����� ������ �������� ���� ����, � �������� �� ���� ������� ������.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_07");	//��� �������� ��� �� ����� � �����, �� ����� ���� ����� ��������� ���. ������, ��� �� ����� ��� ����� � ��� ����� ���� � �������� ������.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_08");	//���� ������� ���������, �� �� �������� ����� � ���������. ������ ����� ���� �� ����� �������, � ��� �� �������.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_09");	//����� �� �������� � ���� ������. ���� ��������� ����, �����, ��������, � ��� ����� �� �������. ���������� �������.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_10");	//��� ����� �� ������� �����, � ��� ������ ����� ��������. �� ������� �� ��� ���� ������ ������.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_11");	//���� ����� �����������, � � ���� ������� ������� ����, �� ������������� ������. ������ ������ ������� �������� � ����� ��� �� �������.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_12");	//������ ����� ������� ��������� �� ����� � ������� �� ����������� �������. ��� �� � �����, �����, ��� � ������� ���������� ��� ���.
	AI_Output(self,other,"DIA_Bartok_Tell_CursedHunter_04_13");	//����� ����� ��� ����, �� ��� ���� ������ �� ����. ��� � ���� ������� ��� ��������.
	if (!Tale_CursedHunter_Once)	{
		Tale_CursedHunter_Once = TRUE;
		B_GiveAchievement_Listener();
	};
};
