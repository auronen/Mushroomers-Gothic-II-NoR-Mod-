
instance DIA_Grom_EXIT(DIA_Proto_End)
{
	npc = OUT_1204_Grom;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
instance DIA_Grom_Hello(C_Info)
{
	npc = OUT_1204_Grom;				nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Grom_MR_Hello_Info;
	description = "�����������!";
};
func void DIA_Grom_MR_Hello_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_MR_Hello_03_00");	//�����������!
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_MR_Hello_07_00");	//�����������!
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_MR_Hello_10_00");	//�����������!
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_MR_Hello_14_00");	//������!
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_MR_Hello_16_00");	//�����������!
	};
	if (Wld_IsTime(5,0,10,30))	{
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_01a");	//������ ����!
	}
	else	if  (Wld_IsTime(10,30,17,00))	{
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_01b");	//���� ������!
	}
	else	if  (Wld_IsTime(17,00,22,00))	{
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_01c");	//����� ������!
	}
	else	{
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_01d");	//������ ����!
	};
	AI_Output(self,other,"DIA_Grom_MR_Hello_08_02");	//������� � ���� ������ �����.
	AI_Output(self,other,"DIA_Grom_MR_Hello_08_03");	//����� ������ ���� ���� �������?
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_MR_Hello_03_04");	//����� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_MR_Hello_07_04");	//����� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_MR_Hello_10_04");	//����� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_MR_Hello_14_04");	//����� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_MR_Hello_16_04");	//����� �������.
	};
	AI_Output(self,other,"DIA_Grom_MR_Hello_08_05");	//��� ��� ���! ���� ������, ������ ����� �����.
	AI_Output(self,other,"DIA_Grom_MR_Hello_08_06");	//������, ����� � �� ������� �����! ��� ������ �� ����, ��������� �� ���.
	B_GiveInvItems(self,other,ItMr_LadysEar,4);
	if (MR_Eaten[MR_LadysEar] > 0)	{
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Grom_MR_Hello_03_07");	//��, � ��������, �����, ��� ������. ������ � ������ �� ��� �����. 
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Grom_MR_Hello_07_07");	//��, � ��������, �����, ��� ������. ������ � ������ �� ��� �����.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Grom_MR_Hello_10_07");	//��, � ��������, �����, ��� ������. ������ � ������ �� ��� �����.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Grom_MR_Hello_14_07");	//��, � ��������, �����, ��� ������. ������ � ������ �� ��� �����.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Grom_MR_Hello_16_07");	//��, � ���������, � �����, ��� ������. ������ � ������ �� ��� �����.
		};
		B_GivePlayerXP(XP_Cookery_ToldEatableRaw);
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Grom_MR_Hello_08_08a");	//���,... � ��� �� �� �������?
		}
		else	{
			AI_Output(self,other,"DIA_Grom_MR_Hello_08_08b");	//���,... � ��� �� �� ��������?
		};
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Grom_MR_Hello_03_09");	//�������?
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Grom_MR_Hello_07_09");	//�������?
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Grom_MR_Hello_10_09");	//�������?
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Grom_MR_Hello_14_09");	//�������?
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Grom_MR_Hello_16_09");	//��������?
		};
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Grom_MR_Hello_08_10a");	//� �� ���, ������ �� ��?
		}
		else	{
			AI_Output(self,other,"DIA_Grom_MR_Hello_08_10b");	//� �� ���, ������ �� ���?
		};
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_11");	//� �� �� �������. ����� �� ������, ������, ������, ������, ����������, ������... ������ ����� ���.
	}
	else	{//�� ���
		if (hero.voice == 3)	{			//���/������
			AI_Output(other,self,"DIA_Grom_MR_Hello_03_12");	//�� ����. ���� �������� � �����������.
		} else if (hero.voice == 7)	{		//������
			AI_Output(other,self,"DIA_Grom_MR_Hello_07_12");	//�� ����. ���� �������� � �����������.
		} else if (hero.voice == 10)	{	//����
			AI_Output(other,self,"DIA_Grom_MR_Hello_10_12");	//�� ����. ���� �������� � �����������.
		} else if (hero.voice == 14)	{	//����
			AI_Output(other,self,"DIA_Grom_MR_Hello_14_12");	//�� ����. ���� �������� � �����������.
		} else	{							//�����/����
			AI_Output(other,self,"DIA_Grom_MR_Hello_16_12");	//�� ����. ���� �������� � �����������.
		};
		AI_Output(self,other,"DIA_Grom_MR_Hello_08_13");	//�� � �������� �� �� ����� �������. ������, ������, ������, ������ ��� ����������... � ������ ��������, �������, �������, �����...
	};
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_MR_Hello_03_14");	//(�� ������) � � �������, �� � ���� ������ ����! � ���������� ������ ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_MR_Hello_07_14");	//(�� ������) � � �������, �� � ���� ������ ����! � ���������� ������ ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_MR_Hello_10_14");	//(�� ������) � � �������, �� � ���� ������ ����! � ���������� ������ ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_MR_Hello_14_14");	//(�� ������) � � �������, �� � ���� ������ ����! � ���������� ������ ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_MR_Hello_16_14");	//(�� ������) � � �������, �� ������ � ���� ����! � ���������� ������ ������.
	};
	MIS_Cookery = LOG_Running;
	B_LogEntry_Create(TOPIC_Cookery,LOG_MISSION,TOPIC_Cookery_Start);
	if (Npc_IsDead(BAU_913_Thekla))	{
		B_CloseLogOnDeath(BAU_913_Thekla);
	};
	if (Npc_IsDead(OUT_1203_Sagitta))	{
		B_CloseLogOnDeath(OUT_1203_Sagitta);
	};
	if (Npc_IsDead(BAU_951_Hilda))	{
		B_CloseLogOnDeath(BAU_951_Hilda);
	};
};


//===================================================
instance DIA_Grom_WhereRecipe(C_Info)
{
	npc = OUT_1204_Grom;				nr = 50;
	condition = DIA_Grom_WhereRecipe_Cond;
	information = DIA_Grom_WhereRecipe_Info;
	description = "��� �������, ��� ����� ����� ������?";
	permanent = TRUE;
};
func int DIA_Grom_WhereRecipe_Cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Grom_WhereRecipe_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_WhereRecipe_03_00");	//��� �������, ��� ����� ����� ������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_WhereRecipe_07_00");	//��� �������, ��� ����� ����� ������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_WhereRecipe_10_00");	//��� �������, ��� ����� ����� ������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_WhereRecipe_14_00");	//��� �������, ��� ����� ����� ������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_WhereRecipe_16_00");	//��� �������, ��� ����� ����� ������?
	};
	AI_Output(self,other,"DIA_Grom_WhereRecipe_08_01");	//������� ����� ����� ����������� ���� ������ ������, ��� ��������� ����� �����-������.
	AI_Output(self,other,"DIA_Grom_WhereRecipe_08_02");	//����� �� �������� ��� ��� �����, �� �� �� ����� �����, ��� �����.
	AI_Output(self,other,"DIA_Grom_WhereRecipe_08_03");	//�� � ������ ��������� ���� ������������.
	AI_Output(self,other,"DIA_Grom_WhereRecipe_08_04");	//��, ��� �������. ��� ���� � ������, � ��� ���, ��� � ���� ������, �����.
	//B_LogEntry(TOPIC_Cookery, TOPIC_Cookery_WhereSearch);
};

//===================================================
instance DIA_Grom_ConstantinoTold(C_Info)
{
	npc = OUT_1204_Grom;				nr = 3;
	condition = DIA_Grom_ConstantinoTold_Cond;
	information = DIA_Grom_ConstantinoTold_Info;
	description = "����������� ������, ��� ���� � �������� ���������.";
};
func int DIA_Grom_ConstantinoTold_Cond()
{
	if ((MIS_Cookery == LOG_Running) && MIS_Cookery_ConstantinoAsked)	{
		return TRUE;
	};
};
func void DIA_Grom_ConstantinoTold_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_03_00");	//����������� ������, ��� ���� � �������� ���������.
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_03_01");	//������ ���� �������� ��� � ���� ��� ���� �� ��� ����. ��� ������ ��� �������, ��� � �������� ��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_07_00");	//����������� ������, ��� ���� � �������� ���������.
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_07_01");	//������ ���� �������� ��� � ���� ��� ���� �� ��� ����. ��� ������ ��� �������, ��� � �������� ��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_10_00");	//����������� ������, ��� ���� � �������� ���������.
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_10_01");	//������ ���� �������� ��� � ���� ��� ���� �� ��� ����. ��� ������ ��� �������, ��� � �������� ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_14_00");	//����������� ������, ��� ���� � �������� ���������.
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_14_01");	//������ ���� �������� ��� � ���� ��� ���� �� ��� ����. ��� ������ ��� �������, ��� � �������� ��������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_16_00");	//����������� ������, ��� ���� � �������� ���������.
		AI_Output(other,self,"DIA_Grom_ConstantinoTold_16_01");	//������ ���� �������� ��� � ���� ��� ���� �� ��� ����. ��� ������ ��� �������, ��� � �������� ��������.
	};
	AI_Output(self,other,"DIA_Grom_ConstantinoTold_08_02");	//������, ������ �� ������ ��� �� ������. � ���-�� �� ������ ����� ������ ����.
	if (!MIS_Cookery_Eatable)	{
		B_GivePlayerXP(XP_Cookery_ToldEatableRaw);
	};
};


//===================================================
instance DIA_Grom_GiveConstantinoRecipe(C_Info)
{
	npc = OUT_1204_Grom;				nr = 10;
	condition = DIA_Grom_GiveConstantinoRecipe_Cond;
	information = DIA_Grom_GiveConstantinoRecipe_Info;
	description = "������, ����� ������ � �����!";
};
func int DIA_Grom_GiveConstantinoRecipe_Cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && Npc_HasItems(other,ItWr_EarRecipe_Constantino))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Grom_GiveConstantinoRecipe.description = "������, ����� ������ � �����!";
		};
		return TRUE;
	};
};
func void DIA_Grom_GiveConstantinoRecipe_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_03_00");	//������, ����� ������ � �����!
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_03_01");	//�������� �� ������� ����. ��� ���������� � �����������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_07_00");	//������, ����� ������ � �����!
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_07_01");	//�������� �� ������� ����. ��� ���������� � �����������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_10_00");	//������, ����� ������ � �����!
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_10_01");	//�������� �� ������� ����. ��� ���������� � �����������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_14_00");	//������, ����� ������ � �����!
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_14_01");	//�������� �� ������� ����. ��� ���������� � �����������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_16_00");	//������, ����� ������ � �����!
		AI_Output(other,self,"DIA_Grom_GiveConstantinoRecipe_16_01");	//�������� �� ������� ����. ��� ����������� � �����������.
	};
	B_GiveInvItems(other,self,ItWr_EarRecipe_Constantino,1);
	AI_Output(self,other,"DIA_Grom_GiveConstantinoRecipe_08_02");	//��� ��� ���������!
	MIS_Cookery_ConstantinoTold = TRUE;
	//������
	CreateInvItem(self,Fakescroll);
	AI_StandUp(self);
	AI_UseItemToState(self,Fakescroll,1);
	AI_Wait(self,1);
	AI_UseItemToState(self,Fakescroll,-1);
	AI_Output(self,other,"DIA_Grom_GiveConstantinoRecipe_08_03");	//���, ��������, �������... ����������� ����������!
	AI_Output(self,other,"DIA_Grom_GiveConstantinoRecipe_08_04");	//���, ������ ���� ����. � ��� �� ���� �������� ������.
	//���� �������� +5 ���
	B_GiveInvItems(self,other,ItBe_Addon_DEX_5,1);
	B_GivePlayerXP(XP_Cookery_ConstantinoTold);
	B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_ConstantinoGiven);
};
//===================================================
instance DIA_Grom_TellSagittaRecipe(C_Info)
{
	npc = OUT_1204_Grom;				nr = 11;
	condition = DIA_Grom_TellSagittaRecipe_Cond;
	information = DIA_Grom_TellSagittaRecipe_Info;
	description = "������� ������������ ������ ���� � ���������� ��������.";
};
func int DIA_Grom_TellSagittaRecipe_Cond()
{
	if ((MIS_Cookery == LOG_Running) && MIS_Cookery_SagittaAsked)	{
		return TRUE;
	};
};
func void DIA_Grom_TellSagittaRecipe_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_03_00");	//������� ������������ ������ ���� � ���������� ��������.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_03_01");	//�������� ����� ����� ����� ������, ��� ����, � ���� ������� �������� � ������ ������� ����. ���� �����.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_03_02");	//����� �������� �� ����� � ������ ��������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_07_00");	//������� ������������ ������ ���� � ���������� ��������.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_07_01");	//�������� ����� ����� ����� ������, ��� ����, � ���� ������� �������� � ������ ������� ����. ���� �����.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_07_02");	//����� �������� �� ����� � ������ ��������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_10_00");	//������� ������������ ������ ���� � ���������� ��������.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_10_01");	//�������� ����� ����� ����� ������, ��� ����, � ���� ������� �������� � ������ ������� ����. ���� �����.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_10_02");	//����� �������� �� ����� � ������ ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_14_00");	//������� ������������ ������ ���� � ���������� ��������.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_14_01");	//�������� ����� ����� ����� ������, ��� ����, � ���� ������� �������� � ������ ������� ����. ���� �����.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_14_02");	//����� �������� �� ����� � ������ ��������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_16_00");	//������� ������������ ������ ���� � ���������� ��������.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_16_01");	//�������� ����� ����� ����� ������, ��� ����, � ���� ������� �������� � ������ ������� ����. ���� �����.
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_16_02");	//����� �������� �� ����� � ������ ��������.
	};
	AI_Output(self,other,"DIA_Grom_TellSagittaRecipe_08_03");	//�� ��������, ��������? � � ����, ����� ����, ������ � ���.
	AI_Output(self,other,"DIA_Grom_TellSagittaRecipe_08_04");	//�����, �� ������� ������� ���-������ ����������?
	Info_ClearChoices(DIA_Grom_TellSagittaRecipe);
	Info_AddChoice(DIA_Grom_TellSagittaRecipe,"������, ��� �������.",DIA_Grom_TellSagittaRecipe_No);
	Info_AddChoice(DIA_Grom_TellSagittaRecipe,"�����.",DIA_Grom_TellSagittaRecipe_Yes);
};
func void DIA_Grom_TellSagittaRecipe_Thanks()
{
	AI_Output(self,other,"DIA_Grom_TellSagittaRecipe_Thanks_08_00");	//� ����� ������, ������� �� ������. � ��� ��� ���-����� ������ �����, �����.
	//���� 2 �����������, 3 �������, 2 ��������� � 1 ����������
	//B_GiveInvItems(self,other,ItMr_Bottle,2);
	//B_GiveInvItems(self,other,ItMr_BrownOiler,3);
	//B_GiveInvItems(self,other,ItMr_KeilSmall,2);
	//B_GiveInvItems(self,other,ItMr_Governor,1);
	B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_SagittaTold);
	B_GivePlayerXP(XP_Cookery_SagittaTold);
	MIS_Cookery_SagittaTold = TRUE;
	ItemTrans_items[0] = ItMr_Bottle;
	ItemTrans_amount[0] = 2;
	ItemTrans_items[1] = ItMr_BrownOiler;
	ItemTrans_amount[1] = 3;
	ItemTrans_items[2] = ItMr_KeilSmall;
	ItemTrans_amount[2] = 2;
	ItemTrans_items[3] = ItMr_Governor;
	ItemTrans_amount[3] = 1;
	B_ItemsTransaction(self,other);
};
func void DIA_Grom_TellSagittaRecipe_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_No_03_00");	//������, ��� �������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_No_07_00");	//������, ��� �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_No_10_00");	//������, ��� �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_No_14_00");	//������, ��� �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_No_16_00");	//������, ��� �������.
	};
	AI_Output(self,other,"DIA_Grom_TellSagittaRecipe_No_08_01");	//����� ����.
	DIA_Grom_TellSagittaRecipe_Thanks();
	Info_ClearChoices(DIA_Grom_TellSagittaRecipe);
};
func void DIA_Grom_TellSagittaRecipe_Yes()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_Yes_03_00");	//�����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_Yes_07_00");	//�����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_Yes_10_00");	//�����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_Yes_14_00");	//�����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_TellSagittaRecipe_Yes_16_00");	//�����.
	};
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_AskSpices);
	MIS_Cookery_AskSpices = TRUE;
	AI_Output(self,other,"DIA_Grom_TellSagittaRecipe_Yes_08_01");	//�������. ���, ������ 20 ������� - ������ � ����, � ���������, ���.
	B_GiveInvItems(self,other,ItMi_Gold,20);
	DIA_Grom_TellSagittaRecipe_Thanks();
	Info_ClearChoices(DIA_Grom_TellSagittaRecipe);
	if (MR_Eaten[MR_NightSparkles] > 0)	{
		B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_NSparklesKnown);
		MIS_Cookery_NSparclesKnown = TRUE;
	};
};



//===================================================
instance DIA_Grom_SpicesRed(C_Info)
{
	npc = OUT_1204_Grom;				nr = 20;
	condition = DIA_Grom_SpicesRed_Cond;
	information = DIA_Grom_SpicesRed_Info;
	description = "� ���� ��� ���� ���� ������� �����.";
};
func int DIA_Grom_SpicesRed_Cond()
{
	if (MIS_Cookery_AskSpices && !MIS_Cookery_SpicesGiven
		 && Npc_HasItems(other,ItFo_Addon_Pfeffer_01))	{
		return TRUE;
	};
};
func void DIA_Grom_Spices_Reward(var string logEntry)
{
	AI_Output(self,other,"DIA_Grom_SpicesRed_08_02");	//� ������� ������� ��������� � ������ ����� � �����. ��� ���� ����� ���������, ��� ��� � ������.
	AI_Output(self,other,"DIA_Grom_SpicesRed_08_03");	//�� ����� ���� ����� ��������� ����� ���� � �������� ����. ������, ��� �� ���� �� ����������.
	B_GiveInvItems(self,other,ItMi_Nugget,1);
	MIS_Cookery_SpicesGiven = TRUE;
	B_GivePlayerXP(XP_Cookery_SpicesGiven);
	B_LogEntry_Cookery_SuccessAll(logEntry);	
};
func void DIA_Grom_SpicesRed_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_SpicesRed_03_00");	//� ���� ��� ���� ���� ������� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_SpicesRed_07_00");	//� ���� ��� ���� ���� ������� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_SpicesRed_10_00");	//� ���� ��� ���� ���� ������� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_SpicesRed_14_00");	//� ���� ��� ���� ���� ������� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_SpicesRed_16_00");	//� ���� ��� ���� ���� ������� �����.
	};
	B_GiveInvItems(other,self,ItFo_Addon_Pfeffer_01,1);
	AI_Output(self,other,"DIA_Grom_SpicesRed_08_01");	//�, ��� ��, ��� ����! �������, � �� ������� ����.
	DIA_Grom_Spices_Reward(TOPIC_Cookery_SpicesGiven);	
};

//===================================================
instance DIA_Grom_SpicesNSparkles(C_Info)
{
	npc = OUT_1204_Grom;				nr = 21;
	condition = DIA_Grom_SpicesNSparkles_Cond;
	information = DIA_Grom_SpicesNSparkles_Info;
	description = "��� ����� ����� ������������ ��� ��������. (������ ������ �����)";
};
func int DIA_Grom_SpicesNSparkles_Cond()
{
	if (MIS_Cookery_AskSpices && !MIS_Cookery_SpicesGiven && MIS_Cookery_NSparclesKnown
		 && Npc_HasItems(other,ItMr_NightSparkles))	{
		return TRUE;
	};
};
func void DIA_Grom_SpicesNSparkles_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_SpicesNSparkles_03_00");	//��� ����� ����� ������������ ��� �������� - ��� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_SpicesNSparkles_07_00");	//��� ����� ����� ������������ ��� ��������. ��� ������ ��� ������ �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_SpicesNSparkles_10_00");	//��� ����� ����� ������������ ��� ��������. ��� ������ ��� ������ �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_SpicesNSparkles_14_00");	//��� ����� ����� ������������ ��� �������� - ��� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_SpicesNSparkles_16_00");	//��� ����� ����� ������������ ��� �������� - ��� ����������.
	};
	B_GiveInvItems(other,self,ItMr_NightSparkles,1);
	AI_Output(self,other,"DIA_Grom_SpicesNSparkles_08_01");	//���������! ������� �� ���������� ����� �������.
	DIA_Grom_Spices_Reward(TOPIC_Cookery_NSparklesGiven);	
};

//===================================================
instance DIA_Grom_GiveTheklaRecipe(C_Info)
{
	npc = OUT_1204_Grom;				nr = 12;
	condition = DIA_Grom_GiveTheklaRecipe_Cond;
	information = DIA_Grom_GiveTheklaRecipe_Info;
	description = "��� ���� ������ �� �����.";
};
func int DIA_Grom_GiveTheklaRecipe_Cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && Npc_HasItems(other,ItWr_EarRecipe_Thekla))	{
		return TRUE;
	};
};
func void DIA_Grom_GiveTheklaRecipe_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_GiveTheklaRecipe_03_00");	//��� ���� ������ �� �����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_GiveTheklaRecipe_07_00");	//��� ���� ������ �� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_GiveTheklaRecipe_10_00");	//��� ���� ������ �� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_GiveTheklaRecipe_14_00");	//��� ���� ������ �� �����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_GiveTheklaRecipe_16_00");	//��� ���� ������ �� �����.
	};
	B_GiveInvItems(other,self,ItWr_EarRecipe_Thekla,1);
	AI_Output(self,other,"DIA_Grom_GiveTheklaRecipe_08_01");	//� �������, ��� ��� ��� ������ ����������?
	AI_Output(self,other,"DIA_Grom_GiveTheklaRecipe_08_02");	//������� �� ��� ������. � ���� ���, ���� ������. ��������� � ���� ����!
	B_GiveInvItems(self,other,ItPl_Forestberry,10);
	MIS_Cookery_TheklaTold = TRUE;
	B_GivePlayerXP(XP_Cookery_TheklaTold);
	B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_TheklaGiven);
};

//===================================================
instance DIA_Grom_GiveHildaRecipe(C_Info)
{
	npc = OUT_1204_Grom;				nr = 13;
	condition = DIA_Grom_GiveHildaRecipe_Cond;
	information = DIA_Grom_GiveHildaRecipe_Info;
	description = "� �����, ��� ���������� ���� �����.";
};
func int DIA_Grom_GiveHildaRecipe_Cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && Npc_HasItems(other,ItWr_EarRecipe_Hilda))	{
		if (other.aivar[AIV_Gender] == FEMALE)	{
			DIA_Grom_GiveHildaRecipe.description = "� ������, ��� ���������� ���� �����.";
		};
		return TRUE;
	};
};
func void DIA_Grom_GiveHildaRecipe_Info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Grom_GiveHildaRecipe_03_00");	//� �����, ��� ���������� ���� �����. ��� ������.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Grom_GiveHildaRecipe_07_00");	//� �����, ��� ���������� ���� �����. ��� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Grom_GiveHildaRecipe_10_00");	//� �����, ��� ���������� ���� �����. ��� ������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Grom_GiveHildaRecipe_14_00");	//� �����, ��� ���������� ���� �����. ��� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Grom_GiveHildaRecipe_16_00");	//� ������, ��� ���������� ���� �����. ��� ������.
	};
	B_GiveInvItems(other,self,ItWr_EarRecipe_Hilda,1);
	AI_Output(self,other,"DIA_Grom_GiveHildaRecipe_08_01");	//�, ����������� ��������, �������!
	AI_Output(self,other,"DIA_Grom_GiveHildaRecipe_08_02");	//� ���� �� ��� ����� �����, ������� � �� ��� �������� ����...
	AI_Output(self,other,"DIA_Grom_GiveHildaRecipe_08_03");	//���, ������ ��� ������. �����, �� ������� �� ����������.
	B_GiveInvItems(self,other,ItRw_Arrow,50);
	MIS_Cookery_HildaTold = TRUE;
	B_GivePlayerXP(XP_Cookery_HildaTold);
	B_LogEntry_Cookery_SuccessAll(TOPIC_Cookery_HildaGiven);
};

