
instance DIA_Onar_EXIT(DIA_Proto_End)
{
	npc = BAU_900_Onar;
};

/////////////////////////////////////// ����� /////////////////////////////////////////////

//===================================================
instance DIA_Onar_Start_Elena(C_Info)
{
	npc = BAU_900_Onar;
	nr = 1;
	condition = DIA_Onar_Start_Elena_Condition;
	information = DIA_Onar_Start_Elena_Info;
	important = TRUE;
};
func int DIA_Onar_Start_Elena_Condition()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Onar_Start_Elena_Info()
{
	START_DIA_Finished = TRUE;
	var int x; x = 0;
		AI_Output(other,self,"DIA_Onar_Start_Elena_16_00");	//... � 12 ������ ������� �� 48 �������. ����� 824 �������.
	//������ ������
	x = 1;	if (x == 1)	{
		CreateInvItems(other,ItMi_Gold,824);
		B_GiveInvItems(other,self,ItMi_Gold,824);
	};
	AI_Output(self,other,"DIA_Onar_Start_Elena_14_01");	//�������. � � ������, ��� �� �� ���������� � ���������.
	AI_Output(self,other,"DIA_Onar_Start_Elena_14_02");	//���� �� �����-������ ���������� ������� �� ������?
		AI_Output(other,self,"DIA_Onar_Start_Elena_16_03");	//��� �������... ��������� �������, �����������, ������� ������� �� ����� ������. �������, �� ������� �� ��������.
		AI_Output(other,self,"DIA_Onar_Start_Elena_16_04");	//������ ������ ������� ����, ��� �������� ��� ����� � ������� ���� ������. � �����-�� ������� ���� ����������...
	AI_Output(self,other,"DIA_Onar_Start_Elena_14_05");	//� ��, �������, ������ ����� �� �������.
		AI_Output(other,self,"DIA_Onar_Start_Elena_16_06");	//�...
	AI_Output(self,other,"DIA_Onar_Start_Elena_14_07");	//�� ��������� ����. ������, ���� ��. ������ ��� ��� ���� ��� ����� ���, ������ ������ �� ������ ���������. 
	AI_Output(self,other,"DIA_Onar_Start_Elena_14_08");	//������ ���� ���������, � ���� ����� ��������� ������ ������. ������ �����, ��� � ������� ����. � ���� ����� ��������.
	//���� �� �������
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};
//===================================================
instance DIA_Onar_Elena_MR_Perm(C_Info)
{
	npc = BAU_900_Onar;
	nr = 2;
	condition = DIA_Onar_Elena_MR_Perm_Condition;
	information = DIA_Onar_Elena_MR_Perm_Info;
	permanent = TRUE;
	description = "���� ���-������ �����?";
};
func int DIA_Onar_Elena_MR_Perm_Condition()
{
	if (C_HeroIs_Elena())	{
		return TRUE;
	};
};
func void DIA_Onar_Elena_MR_Perm_Info()
{
		AI_Output(other,self,"DIA_Onar_Elena_MR_Perm_16_00");	//���� ���-������ �����?
	AI_Output(self,other,"DIA_Onar_Elena_MR_Perm_14_01");	//���� ������.
	if (Competition_Result == Competition_Result_NONE)	{
		AI_Output(self,other,"DIA_Onar_Elena_MR_Perm_14_02");	//� �� ���� ��� ���������?
			AI_Output(other,self,"DIA_Onar_Elena_MR_Perm_16_03");	//������ � ���� ���� �����, ��� ��� � ���� �������� �����.
		AI_Output(self,other,"DIA_Onar_Elena_MR_Perm_14_04");	//�� ������.
	};
	AI_StopProcessInfos(self);
};
//===================================================
instance DIA_Onar_Elena_Final(C_Info)
{
	npc = BAU_900_Onar;
	nr = 3;
	condition = DIA_Onar_Elena_Final_Condition;
	information = DIA_Onar_Elena_Final_Info;
	description = "� �������� �������!";
};
func int DIA_Onar_Elena_Final_Condition()
{
	if ((C_HeroIs_Elena()) && (Competition_Result != Competition_Result_NONE))	{
		return TRUE;
	};
};
func void DIA_Onar_Elena_Final_Info()
{
	if (Competition_Result == Competition_Result_WON)	{
			AI_Output(other,self,"DIA_Onar_Elena_Final_WON_16_00");	//����! � �������� �������!
		Mdl_StartFaceAni(self,"S_FRIENDLY",1.0,5);
		AI_Output(self,other,"DIA_Onar_Elena_Final_WON_14_01");	//(���������) � � ���� � �� ����������. �� �����������, ��� ��� �� ����.
			AI_Output(other,self,"DIA_Onar_Elena_Final_WON_16_02");	//�����. ����������� ������ � ��� ��� ��������� ��� �����.
			if (Competition_Bonus > 0)	{
				AI_Output(other,self,"DIA_Onar_Elena_Final_WON_16_03");	//�� ��� ������� ����� �����, ��� ������� ���� �� �� �����.
			};
		AI_Output(self,other,"DIA_Onar_Elena_Final_WON_14_04");	//��� �, ����� ��� �� �����.
	}
	else	{
			AI_Output(other,self,"DIA_Onar_Elena_Final_LOST_16_01");	//����������, ����! ������� ��� �������� �� �������...
		AI_Output(self,other,"DIA_Onar_Elena_Final_LOST_14_02");	//�� ��� �...
	};
	if(Npc_HasItems(other,ItMi_Gold) > 100)	{
			AI_Output(other,self,"DIA_Onar_Elena_Final_16_01");	//�����������, ��� � ������, ����� ������ �� �����.
		//������ ������
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
	};
};
//===================================================
instance DIA_Onar_Elena_MR_Perm2(C_Info)
{
	npc = BAU_900_Onar;
	nr = 4;
	condition = DIA_Onar_Elena_MR_Perm2_Condition;
	information = DIA_Onar_Elena_MR_Perm2_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Onar_Elena_MR_Perm2_Condition()
{
	if ((C_HeroIs_Elena()) && Npc_IsInState(self,ZS_Talk)
		&& Npc_KnowsInfo(other,DIA_Onar_Elena_Final) && (HERO_Imprisoned != HERO_Imprisoned_Farm))
	{
		return TRUE;
	};
};
func void DIA_Onar_Elena_MR_Perm2_Info()
{
	AI_Output(self,other,"DIA_Onar_Elena_MR_Perm2_14_00");	//������ � ������, ��� �� ������ �����������.
	AI_StopProcessInfos(self);
};

/////////////////////////////////////// ���� /////////////////////////////////////////////

//===================================================
instance DIA_Onar_MR_Perm_Till(C_Info)
{
	npc = BAU_900_Onar;
	nr = 10;
	condition = DIA_Onar_MR_Perm_Till_Condition;
	information = DIA_Onar_MR_Perm_Till_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Onar_MR_Perm_Till_Condition()
{
	if ((C_HeroIs_Till()) && Npc_IsInState(self,ZS_Talk) && (HERO_Imprisoned != HERO_Imprisoned_Farm))	{
		return TRUE;
	};
};
func void DIA_Onar_MR_Perm_Till_Info()
{
	AI_Output(self,other,"DIA_Onar_MR_Perm_Till_14_00");	//���� ���� �������? �����-�� ����?
		AI_Output(other,self,"DIA_Onar_MR_Perm_Till_14_01");	//���...
	AI_Output(self,other,"DIA_Onar_MR_Perm_Till_14_02");	//��� ������� ���-������!
	AI_StopProcessInfos(self);
};

/////////////////////////////////////// ���� /////////////////////////////////////////////

//===================================================
instance DIA_Onar_MR_Hello_Erol(C_Info)
{
	npc = BAU_900_Onar;
	nr = 20;
	condition = DIA_Onar_MR_Hello_Erol_Condition;
	information = DIA_Onar_MR_Hello_Erol_Info;
	important = TRUE;
};
func int DIA_Onar_MR_Hello_Erol_Condition()
{
	if ((C_HeroIs_Erol()) && Npc_IsInState(self,ZS_Talk) && (HERO_Imprisoned != HERO_Imprisoned_Farm))	{
		return TRUE;
	};
};
func void DIA_Onar_MR_Hello_Erol_Info()
{
	AI_Output(self,other,"DIA_Onar_MR_Hello_Erol_14_00");	//�����������, ����! ����� ���� ������� ���� ����?
		AI_Output(other,self,"DIA_Onar_MR_Hello_Erol_10_01");	//�� � �����-��, �������. 
	AI_Output(self,other,"DIA_Onar_MR_Hello_Erol_14_02");	//��������� �� ������ ��� �� ���������. ���� ������� ������ ���� �� �� ����.
};

//---------------------------------------------
instance DIA_Onar_HowAU_MR_Perm_Erol(C_Info)
{
	npc = BAU_900_Onar;
	nr = 21;
	condition = DIA_Onar_HowAU_MR_Perm_Erol_Condition;
	information = DIA_Onar_HowAU_MR_Perm_Erol_Info;
	permanent = TRUE;
	description = "��� ���� ����?";
};
func int DIA_Onar_HowAU_MR_Perm_Erol_Condition()
{
	if (C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Onar_HowAU_MR_Perm_Erol_Info()
{
		AI_Output(other,self,"DIA_Onar_HowAU_MR_Perm_Erol_10_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Onar_HowAU_MR_Perm_Erol_14_01");	//�������, �� �������. ������ � ���� ���� �������. � ���� ���� ������.
};

//------------------------------------------------
var int DIA_Onar_MRTrade_Erol_once;
instance DIA_Onar_MRTrade_Erol(C_Info)
{
	npc = BAU_900_Onar;
	nr = 22;
	condition = DIA_Onar_MRTrade_Erol_Condition;
	information = DIA_Onar_MRTrade_Erol_Info;
	permanent = TRUE;
	description = "� ���� ������ � ���� ���-���.";
	trade = TRUE;
};
func int DIA_Onar_MRTrade_Erol_Condition()
{
	if (C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Onar_MRTrade_Erol_Info()
{
	if (DIA_Onar_MRTrade_Erol_once == FALSE)	{
			AI_Output(other,self,"DIA_Onar_MRTrade_Erol_10_00");	//� ���� ������ � ���� ���-���.
		AI_Output(self,other,"DIA_Onar_MRTrade_Erol_14_01");	//����� �����.
		DIA_Onar_MRTrade_Erol_once = TRUE;
		B_LogNote(TOPIC_Trader, TOPIC_Trader_Onar);
	};
	B_GiveTradeInv_Onar(self);
};

/////////////////////////////////////// ������ /////////////////////////////////////////////

//===================================================
instance DIA_Onar_MR_Perm_Other(C_Info)
{
	npc = BAU_900_Onar;
	nr = 90;
	condition = DIA_Onar_MR_Perm_Other_Condition;
	information = DIA_Onar_MR_Perm_Other_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Onar_MR_Perm_Other_Condition()
{
	if (!C_HeroIs_Till() && !C_HeroIs_Erol() && !C_HeroIs_Elena() 
		 && Npc_IsInState(self,ZS_Talk) && (HERO_Imprisoned != HERO_Imprisoned_Farm))	{
		return TRUE;
	};
};
func void DIA_Onar_MR_Perm_Other_Info()
{
	AI_Output(self,other,"DIA_Onar_MR_Perm_Other_14_01");	//� �� ���� ����. ��� �� ������� �� ���� �����?
	if (C_HeroIs_Odo() && (MIS_Odo_Straw == LOG_Running) && !MIS_Odo_Straw_Onar[Straw_Price])	{
			AI_Output(other,self,"DIA_Onar_Odo_Straw_03_02");	//��������� ��������� � ����.
		AI_Output(self,other,"DIA_Onar_Odo_Straw_14_03");	//� ���� ������� ��� ���� �� 17 ������� �� ���.
			AI_Output(other,self,"DIA_Onar_Odo_Straw_03_04");	//� ������� �������. ���� �� � ��������� �� ����?
		AI_Output(self,other,"DIA_Onar_Odo_Straw_14_05");	//��� � �����, ���� ��� ��� ����������.
		MIS_Odo_Straw_Onar[Straw_Price] = 1;
		B_LogEntry(TOPIC_Odo_Straw,TOPIC_Odo_Straw_Onar_Price);
	}
	else	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Onar_MR_Perm_Other_03_02");	//��� �����.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Onar_MR_Perm_Other_07_02");	//� ��� �����.
		} else	{							//����
			AI_Output(other,self,"DIA_Onar_MR_Perm_Other_16_02");	//������� �����.
		};
		AI_Output(self,other,"DIA_Onar_MR_Perm_Other_14_03");	//������ ����, ��� � ���� ���� ������ ���. ��� ����� � ���.
	};
	AI_StopProcessInfos(self);
};

//===================================================
instance DIA_Onar_Crime(C_Info)
{
	npc = BAU_900_Onar;
	nr = 100;
	condition = DIA_Onar_Crime_Condition;
	information = DIA_Onar_Crime_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Onar_Crime_Condition()
{
	if (HERO_Imprisoned == HERO_Imprisoned_Farm)	{
		return TRUE;
	};
};
func void DIA_Onar_Crime_Info()
{
	HERO_Imprisoned = FALSE;
	if (C_HeroIs_Elena())	{
		AI_Output(self,other,"DIA_Onar_Crime_Elena_14_00");	//�����, ��� �� ���� �����? ��� �������, ��� �� ��������� ������������!
		AI_Output(self,other,"DIA_Onar_Crime_Elena_14_01");	//������ �������� � ���� � ������� � ������� � ����� ���������. ����� � �������� ���������, ��������������� ������ ���������.
		PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
		AI_StopProcessInfos(self);
		return;
	}
	else	if (C_HeroIs_Till())	{
		AI_Output(self,other,"DIA_Onar_Crime_Till_14_00");	//�� ����������� � ������������! �����!
		AI_Output(self,other,"DIA_Onar_Crime_Till_14_01");	//�� ������ ��� � ����������� ����������� � ���� ������ ����. �������, �� ������� ���� ������� �����!
		PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		if (ABSOLUTIONLEVEL_Farm > 0)	{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_00a");	//�� ����� ����������� ����� �� ���� �����!
		}
		else	
		{
			if (other.aivar[AIV_Gender] == MALE)	{
				AI_Output(self,other,"DIA_Onar_Crime_Other_14_00b");	//��� ��������, ��� �� �������� ������������ �� ����� �� ����.
			}
			else	{
				AI_Output(self,other,"DIA_Onar_Crime_Other_14_00c");	//��� ��������, ��� �� ��������� ������������ �� ����� �� ����.
			};
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_01");	//����� � ����������� ����� � ���� ������ ����.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)	{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_02");	//�� �� ����� ������� ������ �� ����� �����!
		}	else if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)	{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_03");	//� �� ������� ����� ��������.
		}	else if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)	{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_04");	//������ ��������� - ������ � ����. � ����� ��� ����� �� �����.
		}	else if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)	{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_05");	//��� ���� ����. �� ���� ����������� � ���!
		};
		Farms_Schulden = B_GetTotalPetzCounter(self) + 50 * ABSOLUTIONLEVEL_Farm;
		if(Farms_Schulden > 1000)
		{
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_06");	//�� ������� �� ������������ �� ���� ������������ �������!
			AI_Output(self,other,"DIA_Onar_Crime_Other_14_07");	//� ����� ��������, ����� ���� ��������� �� ������, � ����� �� �����������!
			PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
			AI_StopProcessInfos(self);
			return;
		};
		AI_Output(self,other,"DIA_Onar_Crime_Other_14_08");	//�� ������ ��������� �����������, ��� ����������� � ��������� ������.
		/*
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Onar_Crime_Other_03_09");	//�������?
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Onar_Crime_Other_07_09");	//�������?
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Onar_Crime_Other_10_09");	//�������?
		} else	{							//����
			AI_Output(other,self,"DIA_Onar_Crime_Other_16_09");	//�������?
		};
		//B_Say_Gold(self,other,Farms_Schulden);
		//*/
		Info_ClearChoices(DIA_Onar_Crime);
		Info_AddChoice(DIA_Onar_Crime,"� ���� ��� ������� �����.",DIA_Onar_Crime_NoPay);
		Info_AddChoice(DIA_Onar_Crime,B_BuildStrShulden(Farms_Schulden),DIA_Onar_Crime_Pay);
	};
};
	
func void DIA_Onar_Crime_Pay()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Onar_Crime_Other_03_10");	//��� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Onar_Crime_Other_07_10");	//��� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Onar_Crime_Other_10_10");	//��� ������.
	} else	{							//����
		AI_Output(other,self,"DIA_Onar_Crime_Other_16_10");	//��� ������.
	};
	if (C_NpcHasGold(other,Farms_Schulden))	{
		B_GiveInvItems(other,self,ItMi_Gold,Farms_Schulden);
		AI_Output(self,other,"DIA_Onar_Crime_Other_14_11");	//������. �������, ��� �� �������� ������������ � ����� ���������.
		B_GrantAbsolution(LOC_FARM);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_Crime_Other_14_12");	//���? �� ������� �������� ����.
	};
};
	
func void DIA_Onar_Crime_NoPay()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Onar_Crime_Other_03_12");	//� ���� ��� ������� �����!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Onar_Crime_Other_07_12");	//� ���� ��� ������� �����!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Onar_Crime_Other_10_12");	//� ���� ��� ������� �����!
	} else	{							//����
		AI_Output(other,self,"DIA_Onar_Crime_Other_16_12");	//� ���� ��� ������� �����!
	};
	AI_Output(self,other,"DIA_Onar_Crime_Other_14_13");	//�� ���� ������ �������� ������. � �� �������� ��������� ���� ��� ������� �����.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Onar_Crime_Other_14_14");	//�� ����������� ���� ��, ���� � ��� ����������� - � ���������� ������.
	};
	PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
	AI_StopProcessInfos(self);
};

