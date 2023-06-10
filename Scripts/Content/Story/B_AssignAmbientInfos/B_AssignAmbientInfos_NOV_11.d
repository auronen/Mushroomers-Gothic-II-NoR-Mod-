
instance DIA_NOV_11_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_11_EXIT_Condition;
	information = DIA_NOV_11_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NOV_11_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_11_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NOV_11_Intruder(C_Info)
{
	nr = 0;
	condition = DIA_NOV_11_Intruder_Condition;
	information = DIA_NOV_11_Intruder_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_NOV_11_Intruder_Condition()
{
	if (!C_HeroIs_Odo())	{
		Npc_ClearAIQueue(self);
		AI_SetWalkmode(self,NPC_RUN);
		AI_GotoNpc(self,hero);
		return TRUE;
	};
};

func void DIA_NOV_11_Intruder_Info()
{
	var int rnd;	rnd = Hlp_Random(100);
	if (MON_Intruder_Once == FALSE)	{
		if (other.aivar[AIV_Gender] == MALE)	{
			if (rnd < 50)	{
				AI_Output(self,other,"DIA_NOV_Intruder_03_00");	//��� �� ��� �������? ���� ����� �� �����.
			}
			else	{
				AI_Output(self,other,"DIA_NOV_Intruder_03_01");	//��� �� ���� �����? ���� ������ ����� ������.
			};
		}
		else	{
			if (rnd < 50)	{
				AI_Output(self,other,"DIA_NOV_Intruder_03_02");	//��� ������� ������ � ���������? ���� ����� �� �����.
			}
			else	{
				AI_Output(self,other,"DIA_NOV_Intruder_03_03");	//��� �� ���� ������? ���� ������ ����� ������.
			};
		};
		MON_Intruder_Once = TRUE;
	}
	else	{
		AI_DrawWeapon(self);
		AI_Output(self,other,"DIA_NOV_Intruder_03_04");	//�� ����� �����? ���!
	};
	Hero_ThrowOut_Monastery = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_NOV_11_Odo(C_Info)
{
	nr = 1;
	condition = DIA_NOV_11_Odo_Condition;
	information = DIA_NOV_11_Odo_Info;
	permanent = TRUE;
	description = "��� ������, ����?";
};

func int DIA_NOV_11_Odo_Condition()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};

func void DIA_NOV_11_Odo_Info()
{
	var int rnd;	rnd = Hlp_Random(3);
		AI_Output(other,self,"DIA_NOV_Odo_03_00");	//��� ������, ����?
	if (rnd == 0)	{
		AI_Output(self,other,"DIA_NOV_Odo_03_01");	//������. ��� ��� ������.
	}
	else if (rnd == 1)	{
		AI_Output(self,other,"DIA_NOV_Odo_03_02");	//� ���� ������� ��������.
	}
	else if (rnd == 2)	{
		AI_Output(self,other,"DIA_NOV_Odo_03_03");	//���� ���� �������� �� ������. ��� ����� ������� ������� �� ��������� ������.
	};
};

func void B_AssignAmbientInfos_NOV_11(var C_Npc slf)
{
	dia_NOV_11_exit.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_11_Intruder.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_11_Odo.npc = Hlp_GetInstanceID(slf);
};


