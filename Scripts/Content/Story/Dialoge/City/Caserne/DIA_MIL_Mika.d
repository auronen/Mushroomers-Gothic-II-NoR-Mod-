
instance DIA_Mika_EXIT(DIA_Proto_End)
{
	npc = Mil_337_Mika;
};

//==============================================
instance DIA_Mika_Head(C_INFO)
{
	npc = Mil_337_Mika;			nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Mika_Head_info;
	permanent = TRUE;
	description = "��� � ��� ��� �������?";
};
func void DIA_Mika_Head_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Mika_Head_03_00");	//��� � ��� ��� �������?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Mika_Head_07_00");	//��� � ��� ��� �������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Mika_Head_10_00");	//��� � ��� ��� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Mika_Head_14_00");	//��� � ��� ��� �������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Mika_Head_16_00");	//��� � ��� ��� �������?
	};
	AI_Output(self,other,"DIA_Mika_Head_12_01");	//��������� ���� ��������� ����������, �� � �� ���� �� ����� ��� � ��������.
	AI_Output(self,other,"DIA_Mika_Head_12_02");	//������� ���� ��������� �������� - ��������� ���������, �������� ���������� � ��� �����.
	AI_Output(self,other,"DIA_Mika_Head_12_03");	//��� �������� ���. �� �������� �� ������ � ��������.
};

//==============================================
instance DIA_Mika_Training(C_INFO)
{
	npc = Mil_337_Mika;			nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_Mika_Training_info;
	permanent = TRUE;
	description = "�� �� ������, ��� ����� ������������� ����?";
};
func void DIA_Mika_Training_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Mika_Training_03_00");	//�� �� ������, ��� ����� ������������� ����?
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Mika_Training_07_00");	//�� �� ������, ��� ����� ������������� ����?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Mika_Training_10_00");	//�� �� ������, ��� ����� ������������� ����?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Mika_Training_14_00");	//�� �� ������, ��� ����� ������������� ����?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Mika_Training_16_00");	//�� �� ������, ��� ����� ������������� ����?
	};
	AI_Output(self,other,"DIA_Mika_Training_12_01");	//�������� ������� ����������, �� �� �� ����� ����������� ����-�� �� �������.
	AI_Output(self,other,"DIA_Mika_Training_12_02");	//�������� ���������� � �����.
	AI_Output(self,other,"DIA_Mika_Training_12_03");	//��� ����� ����� � ��������� ��� �� ������������� ��������.
};


//==============================================
instance DIA_Mika_BodyGuard(C_INFO)
{
	npc = Mil_337_Mika;			nr = 10;
	condition = DIA_Mika_BodyGuard_cond;
	information = DIA_Mika_BodyGuard_info;
	important = TRUE;
};
func int DIA_Mika_BodyGuard_cond()
{
	if (DIA_WhenAsked_cond() && Competition_Result == Competition_Result_NONE
		&& !C_HeroIs_Talbin())	//� ������� ��� ���� ���������
	{
		return TRUE;
	};
};
func void DIA_Mika_BodyGuard_info()
{
	AI_Output(self,other,"DIA_Mika_BodyGuard_12_00");	//��, � ������, �� ���������� � ������� ��������?
	Info_ClearChoices(DIA_Mika_BodyGuard);
	Info_AddChoice(DIA_Mika_BodyGuard,"���.",DIA_Mika_BodyGuard_No);
	Info_AddChoice(DIA_Mika_BodyGuard,"��.",DIA_Mika_BodyGuard_Yes);
};

func void DIA_Mika_BodyGuard_Yes()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Mika_BodyGuard_03_01");	//��, ��� ���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Mika_BodyGuard_10_01");	//�� ����, ��������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Mika_BodyGuard_14_01");	//��, ��� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Mika_BodyGuard_16_01");	//��, ��������.
	};
	AI_Output(self,other,"DIA_Mika_BodyGuard_12_02");	//� ����� ����� ����������� - ������ ������, ������, �����...
	if (other.guild == GIL_BAU || other.guild == GIL_BAU2)	{
		AI_Output(self,other,"DIA_Mika_BodyGuard_12_03b");	//� �� ���� ��������� ���������� ����� ���������� �������� ��� ������.
	}
	else 	{ //��� ��� ��� ��������� �����
		AI_Output(self,other,"DIA_Mika_BodyGuard_12_03a");	//� �� ���� �������� ������� ����� ������ ��� ������.
	};
	AI_Output(self,other,"DIA_Mika_BodyGuard_12_04");	//� � ��� �� �� ������������ �� ����� �������� ��������������.
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Mika_BodyGuard_03_05");	//�������?
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Mika_BodyGuard_10_05");	//�������� - ��� �������?
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Mika_BodyGuard_14_05");	//�������?
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Mika_BodyGuard_16_05");	//�������?
	};
	AI_Output(self,other,"DIA_Mika_BodyGuard_12_06");	//10 ������� � ����.
	Mika_MayGuard = TRUE;
	B_LogNote(TOPIC_Misk,TOPIC_Misk_MikaGuard);
	Info_ClearChoices(DIA_Mika_BodyGuard);
};
func void DIA_Mika_BodyGuard_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Mika_BodyGuard_03_02");	//���, �� ������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Mika_BodyGuard_10_02");	//���, �� ���� � ���-�� ���������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Chief_Payment_No_14_00");	//���, ��� ��� �����������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Mika_BodyGuard_16_02");	//���, �� ������.
	};
	Info_ClearChoices(DIA_Mika_BodyGuard);
};

//==============================================
instance DIA_Mika_Pay(C_INFO)
{
	npc = Mil_337_Mika;			nr = 11;
	condition = DIA_Mika_Pay_cond;
	information = DIA_Mika_Pay_info;
	description = "� ���� ������ ����. (10 ���.)";
	permanent = TRUE;
};
func int DIA_Mika_Pay_cond()
{
	if (Mika_MayGuard && !Mika_Guard_Active)	{
		return TRUE;
	};
};

func void DIA_Mika_Pay_info()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Mika_Pay_03_00");	//� ���� ������ ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Mika_Pay_10_00");	//� ���� ������ ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Mika_Pay_14_00");	//� ���� ������ ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Mika_Pay_16_00");	//� ���� ������ ����.
	};
	if (B_GiveGold(other, self, 10))	{
		AI_Output(self,other,"DIA_Mika_Pay_12_01");	//�������! �����.
		Mika_Guard_Active = TRUE;
		Mika_Guard_EndTime = Wld_GetFullTime() + 24 * 60;
		AI_StopProcessInfos(self);
		self.aivar[AIV_Temper] = self.aivar[AIV_Temper]  | TEMPER_BodyGuard;
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		B_SetAttitude(self, ATT_FRIENDLY);
		B_StartOtherRoutine(self,"GUARD");
	}
	else	{
		AI_Output(self,other,"DIA_Mika_Pay_12_02");	//����� ������� 10 �������.
	};
};


//==============================================
instance DIA_Mika_PayAgain(C_INFO)
{
	npc = Mil_337_Mika;			nr = 12;
	condition = DIA_Mika_PayAgain_cond;
	information = DIA_Mika_PayAgain_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Mika_PayAgain_cond()
{
	if (Mika_MayGuard && Mika_Guard_Active && (Wld_GetFullTime() > Mika_Guard_EndTime))	{
		return TRUE;
	};
};

func void DIA_Mika_PayAgain_info()
{
	AI_Output(self,other,"DIA_Mika_PayAgain_12_00");	//���� ������. �� ���������� ���� ����������?
	Info_ClearChoices(DIA_Mika_PayAgain);
	Info_AddChoice(DIA_Mika_PayAgain,"���, �� ��� ������ �� �����.",DIA_Mika_PayAgain_No);
	if (Npc_HasItems(other, ItMi_Gold) >= 10)	{
		Info_AddChoice(DIA_Mika_PayAgain,"��, ��� ��� 10 �������.",DIA_Mika_PayAgain_Yes);
	};
};

func void DIA_Mika_PayAgain_Yes()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Mika_PayAgain_03_01");	//��, ��� ��� 10 �������.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Mika_PayAgain_10_01");	//��, ��� ��� 10 �������.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Sekob_Till_Final_14_01");	//��, ��� ������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Mika_PayAgain_16_01");	//��, ��� ��� 10 �������.
	};
	B_GiveGold(other, self, 10);
	Mika_Guard_EndTime = Wld_GetFullTime() + 24 * 60;
	AI_StopProcessInfos(self);
};
	
func void DIA_Mika_PayAgain_No()
{
	if (hero.voice == 3)	{			//���/������
		AI_Output(other,self,"DIA_Mika_PayAgain_03_02");	//���, �� ��� ������ �� �����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Mika_PayAgain_10_02");	//���, �� ��� ������ �� �����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_OldShepherd_HowAU_No_14_00");	//���, �������.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Mika_PayAgain_16_02");	//���, �� ��� ������ �� �����.
	};
	AI_Output(self,other,"DIA_Mika_PayAgain_12_03");	//��� ������.
	AI_Output(self,other,"DIA_Mika_PayAgain_12_04");	//����� � ����������� � ����� ������������ � ������.
	Mika_Guard_Active = FALSE;
	self.aivar[AIV_Temper] = self.aivar[AIV_Temper] & ~TEMPER_BodyGuard;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_SetAttitude(self, ATT_NEUTRAL);
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};


//==============================================
instance DIA_Mika_Won(C_INFO)
{
	npc = Mil_337_Mika;			nr = 13;
	condition = DIA_Mika_Won_cond;
	information = DIA_Mika_Won_info;
	important = TRUE;
};
func int DIA_Mika_Won_cond()
{
	if (Mika_MayGuard && (Competition_Result == Competition_Result_WON) && (Mika_Guard_EndTime > 0))	{
		return TRUE;
	};
};
func void DIA_Mika_Won_info()
{
	AI_Output(self,other,"DIA_Mika_Won_12_00");	//���������� � �������!
	AI_Output(self,other,"DIA_Mika_Won_12_01");	//���������, ��� ���� ���� �� �� ����������!
};

