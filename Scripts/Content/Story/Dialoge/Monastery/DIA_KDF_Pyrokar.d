
instance DIA_Pyrokar_EXIT(DIA_Proto_End)
{
	npc = KDF_500_Pyrokar;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Pyrokar_Bless_Odo(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Bless_Odo_Cond;
	information = DIA_Pyrokar_Bless_Odo_Info;
	permanent = TRUE;
	description = "� ����� ������ ��������������, ������!";
};
func int DIA_Pyrokar_Bless_Odo_Cond()
{
	if (C_HeroIs_Odo())	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Bless_Odo_Info()
{
		AI_Output(other,self,"DIA_Pyrokar_Bless_Odo_03_00");	//(��������) � ����� ������ ��������������, ������!
	AI_Output(self,other,"DIA_Pyrokar_Bless_Odo_11_01");	//����� ���� ������ ������ ������� ���� ������, ���������.
	if (PATRONGOD == PATRONGOD_Innos)	{
		// ����. �����
		if (Wld_GetDay() != Fishers_Rain_Day)	{
			MEM_InitGlobalInst();
			MEM_SkyController.rainFX_timeStartRain = FLOATNULL;
			MEM_SkyController.rainFX_timeStopRain = FLOATNULL;
			MEM_SkyController.rainFX_renderLightning = FALSE;
		};
		if (!Odo_Bless_Innos_Once)	{
			B_BlessAttribute(other,ATR_MANA,2);
			Odo_Bless_Innos_Once = TRUE;
		};
	};
	if (PATRONGOD == PATRONGOD_Beliar)	{
		PrintScreen(PRINT_GOD_Beliar_Rage, -1, 55, FONT_Screen, 3);
		if (other.attribute[ATR_HITPOINTS] > 1)	{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS] / 2;
		};
	}
	else {
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	};
};

// ================================== �������� =========================================
instance DIA_Pyrokar_Crime(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_Crime_Condition;
	information = DIA_Pyrokar_Crime_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Pyrokar_Crime_Condition()
{
	if (B_GetGreatestPetzCrime(self) > 0)	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Crime_Info()
{
	HERO_Imprisoned = FALSE;
	//��� �� ����� ����������
	if (C_HeroIs_Odo())	{
		AI_Output(self,other,"DIA_Pyrokar_Crime_Odo_11_00");	//���������! �� ��������� ������� � ������ ���������!
		AI_Output(self,other,"DIA_Pyrokar_Crime_Odo_11_01");	//�� ��������� �������� ���� ���������.
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
		return;
	};
	var int crime;	crime = B_GetGreatestPetzCrime(self);
	Monastery_Schulden = B_GetTotalPetzCounter(self) + 100 * ABSOLUTIONLEVEL_Monastery;
	if (ABSOLUTIONLEVEL_Monastery == 0)	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_00");	//�� ��������� ��� ������ ����� ������ ����������� ����������!
		}
		else	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_01");	//��� ������� �� �������� ������� � ��� ������ �����?
		};
		if (Crime == CRIME_MURDER)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_02");	//�������� - ��� ������ ���������!
		}
		else if (Crime == CRIME_THEFT)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_03");	//��������� - ������ ����.
		}
		else if (Crime == CRIME_ATTACK)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_04");	//����� �� ����� ��� ����.
		}
		else if (Crime == CRIME_SHEEPKILLER)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_05");	//��� ���� ����������� ���������. �� �� ������ ����� ��������� �� �����!
		};
	}
	else	{
		AI_Output(self,other,"DIA_Pyrokar_Crime_11_06");	//�� ����� ������� ����� ����� ���� ������!
	};
	
	if (Monastery_Schulden < 1000)	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_07");	//�� ������ ���������� � �������� ���� ����!
		}
		else	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_08");	//�� ������ ���������� � �������� ���� ����!
		};
		//B_Say_Gold(self,other,Monastery_Schulden);
		Info_ClearChoices(DIA_Pyrokar_Crime);
		Info_AddChoice(DIA_Pyrokar_Crime,"� ���� ��� ������� �����.",DIA_Pyrokar_Crime_NoPay);
		Info_AddChoice(DIA_Pyrokar_Crime,B_BuildStrShulden(Monastery_Schulden),DIA_Pyrokar_Crime_Pay);
	}
	else	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_09");	//���� ������������ ������� ������, ����� ����������� �������.
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_10");	//��������, ������ �� �������� ������� ����� �� ���.
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_11");	//������� � ������! �������� ��� � �����.
		}
		else	{
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_12");	//������������! ������� � ������, ����� ����� ���� ����, ��� ������ ������ ��� �� � ����� ������!
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_13");	//��������, ���������� � ��������� ������ �������� ����.
			AI_Output(self,other,"DIA_Pyrokar_Crime_11_14");	//�������� �� � �����!
		};
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
	};
};

func void DIA_Pyrokar_Crime_Pay()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Pyrokar_Crime_Pay_03_00");	//� ���� �������� ���� �����!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Pyrokar_Crime_Pay_07_00");	//� ���� �������� ���� �����!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Pyrokar_Crime_Pay_10_00");	//� ���� �������� ���� �����!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Pyrokar_Crime_Pay_14_00");	//� ���� �������� ���� �����!
	} else	{							//����
		AI_Output(other,self,"DIA_Pyrokar_Crime_Pay_16_00");	//� ���� �������� ���� �����!
	};
	if (C_NpcHasGold(other,Farms_Schulden))	{
		B_GiveInvItems(other,self,ItMi_Gold,Farms_Schulden);
		AI_Output(self,other,"DIA_Pyrokar_Crime_Pay_14_01");	//������, ���� ���� ������. � ������ ������ ��� �����, ����������!
		B_GrantAbsolution(LOC_MONASTERY);
		AI_StopProcessInfos(self);
		Hero_ThrowOut_Monastery = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_Crime_Pay_14_02");	//����� ���� ����������� ������, ������������ ���� �����������.
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
	};
};
	
func void DIA_Pyrokar_Crime_NoPay()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Pyrokar_Crime_NoPay_03_00");	//� ���� ��� ������� �����!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Pyrokar_Crime_NoPay_07_00");	//� ���� ��� ������� �����!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Pyrokar_Crime_NoPay_10_00");	//� ���� ��� ������� �����!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Pyrokar_Crime_NoPay_14_00");	//� ���� ��� ������� �����!
	} else	{							//����
		AI_Output(other,self,"DIA_Pyrokar_Crime_NoPay_16_00");	//� ���� ��� ������� �����!
	};
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Pyrokar_Crime_NoPay_14_01");	//� ����� ������, ���� �������� �������� ���� ���� �� ��������.
	}
	else	{
		AI_Output(self,other,"DIA_Pyrokar_Crime_NoPay_14_02");	//����� ���������� � ��������� ������ ������� ���� �������� �����.
	};
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
};



