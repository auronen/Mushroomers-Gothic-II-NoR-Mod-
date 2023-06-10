
instance DIA_Bromor_EXIT(DIA_Proto_End)
{
	npc = VLK_433_Bromor;
};

//////////////////////////////////����////////////////////////////////////////
instance DIA_Bromor_Sarah_Hello(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 1;
	condition = DIA_Bromor_Sarah_MR_Hello_cond;
	information = DIA_Bromor_Sarah_MR_Hello_info;
	important = TRUE;
};
func int DIA_Bromor_Sarah_MR_Hello_cond()
{
	if (C_HeroIs_Sarah())	{
		return TRUE;
	};
};
func void DIA_Bromor_Sarah_MR_Hello_info()
{
	AI_Output(self,other,"DIA_Bromor_Sarah_MR_Hello_07_01");	//���� ����? � �� ����� ����� ������ ����� �� ������� ���� ������!
		AI_Output(other,self,"DIA_Bromor_Sarah_MR_Hello_16_02");	//�� �����, � ���������. �������� ����� ������� �� ����.
	AI_StopProcessInfos(self);
};
//============================================
instance DIA_Bromor_Sarah_Perm(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 2;
	condition = DIA_Bromor_Sarah_Perm_cond;
	information = DIA_Bromor_Sarah_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Bromor_Sarah_Perm_cond()
{
	if (C_HeroIs_Sarah() && DIA_WhenAsked_cond() && Npc_KnowsInfo(other,DIA_Bromor_Sarah_Hello))	{
		return TRUE;
	};
};
func void DIA_Bromor_Sarah_Perm_info()
{
	AI_Output(self,other,"DIA_Bromor_Sarah_Perm_07_01");	//(������ ����) ���� ������!
	AI_StopProcessInfos(self);
};

//////////////////////////////////�����////////////////////////////////////////
instance DIA_Bromor_Elena_Perm(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 10;
	condition = DIA_Bromor_Elena_Perm_cond;
	information = DIA_Bromor_Elena_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Bromor_Elena_Perm_cond()
{
	if (C_HeroIs_Elena() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Bromor_Elena_Perm_info()
{
	AI_Output(self,other,"DIA_Bromor_Elena_Perm_07_01");	//�� ������, ��� �� ����� � ���� ������. � ������� ����� �� ����. ��������!
	AI_StopProcessInfos(self);
};

//////////////////////////////////����////////////////////////////////////////
instance DIA_Bromor_Till_Perm(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 20;
	condition = DIA_Bromor_Till_Perm_cond;
	information = DIA_Bromor_Till_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Bromor_Till_Perm_cond()
{
	if (C_HeroIs_Till() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Bromor_Till_Perm_info()
{
	var int rnd;	rnd = Hlp_Random(25);
	if (rnd < 10)	{
		AI_Output(self,other,"DIA_Bromor_Till_Perm_07_01");	//� �� ��� ��� �����, �����? �������, ����� ����������!
	}
	else if (rnd < 20)	{
		AI_Output(self,other,"DIA_Bromor_Till_Perm_07_02");	//� ���� ��� ������ �� ����� �� �������! ���, ������� ���-������.
	}
	else	{
		AI_Output(self,other,"DIA_Bromor_Till_Perm_07_03");	//������ ������ - ��� � �����!
	};
	AI_StopProcessInfos(self);
};

//////////////////////////////////����////////////////////////////////////////
var int DIA_Bromor_Erol_Perm_Cnt;
instance DIA_Bromor_Erol_Perm(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 31;
	condition = DIA_Bromor_Erol_Perm_cond;
	information = DIA_Bromor_Erol_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Bromor_Erol_Perm_cond()
{
	if (C_HeroIs_Erol() && DIA_WhenAsked_cond() && Npc_KnowsInfo(other,DIA_Bromor_Erol_Hello))	{
		return TRUE;
	};
};
func void DIA_Bromor_Erol_Perm_info()
{
	AI_Output(self,other,"DIA_Bromor_Erol_Perm_07_01");	//������� ����������?
	if (DIA_Bromor_Erol_Perm_Cnt % 3 == 0)	{
		AI_Output(other,self,"DIA_Bromor_Erol_Perm_10_02");	//� ��������� ������� �� �������� � ����� ��������, � ������ � �������.
	}
	else if (DIA_Bromor_Erol_Perm_Cnt % 3 == 1)	{
		AI_Output(self,other,"DIA_Bromor_Erol_Perm_07_03");	//��� ������� ������� ��� �������� �����.
		AI_Output(other,self,"DIA_Bromor_Erol_Perm_10_04");	//� ��� �� ��������� ����, ����� ��� ����� ������ � ������� �����!
	}
	else	{
		AI_Output(self,other,"DIA_Bromor_Erol_Perm_07_05");	//�� ������ ���������� ����� ���������� �����.
		AI_Output(other,self,"DIA_Bromor_Erol_Perm_10_06");	//�������� ������� ��� ��� �����������, ������� ��� ���������.
	};
	if (DIA_Bromor_Erol_Perm_Cnt == 2)	{
		AI_Output(self,other,"DIA_Bromor_Erol_Perm_07_07");	//����� ����� �� ������ ����?
			AI_Output(other,self,"DIA_Bromor_Erol_Perm_10_08");	//�� �� �� �� ���� ���� ����������.
	};
	DIA_Bromor_Erol_Perm_Cnt += 1;
	AI_StopProcessInfos(self);
};
//============================================
instance DIA_Bromor_Erol_Hello(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 30;
	condition = DIA_Bromor_Erol_Hello_cond;
	information = DIA_Bromor_Erol_Hello_info;
	important = TRUE;
};
func int DIA_Bromor_Erol_Hello_cond()
{
	if (C_HeroIs_Erol())	{
		return TRUE;
	};
};
func void DIA_Bromor_Erol_Hello_info()
{
	AI_Output(self,other,"DIA_Bromor_Erol_Hello_07_01");	//�������� ����! �� ������ ������� ��� � ����� �������� ���������.
	DIA_Bromor_Erol_Perm_info();
};

//////////////////////////////////���////////////////////////////////////////
var int DIA_Bromor_Odo_Perm_Once;
instance DIA_Bromor_Odo_Perm(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 40;
	condition = DIA_Bromor_Odo_Perm_cond;
	information = DIA_Bromor_Odo_Perm_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Bromor_Odo_Perm_cond()
{
	if (C_HeroIs_Odo() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Bromor_Odo_Perm_info()
{
	if (C_NpcWears(other, ItAr_NOV_L))	{
		AI_Output(self,other,"DIA_Bromor_Odo_Perm_07_01");	//�, �� ������ ���� ������ �� ���������! ������ ������ ��� ���� ������!
			AI_Output(other,self,"DIA_Bromor_Odo_Perm_03_02");	//(�������������) ��� ���� ������? ������� ����� ���, �����������!
	}
	else	{
		if (!DIA_Bromor_Odo_Perm_Once)	{
			AI_Output(self,other,"DIA_Bromor_Odo_Perm_07_03");	//����� ����������! ������ ������� ������ ����� ����.
		};
		AI_Output(self,other,"DIA_Bromor_Odo_Perm_07_04");	//����� 50 ������� �...
			AI_Output(other,self,"DIA_Bromor_Odo_Perm_03_05");	//(����) �� ����������.
	};
	DIA_Bromor_Odo_Perm_Once = TRUE;
	AI_StopProcessInfos(self);
};

//////////////////////////////////������////////////////////////////////////////
instance DIA_Bromor_Rupert_Hello(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 50;
	condition = DIA_Bromor_Rupert_Hello_cond;
	information = DIA_Bromor_Rupert_Hello_info;
	important = TRUE;
};
func int DIA_Bromor_Rupert_Hello_cond()
{
	if (C_HeroIs_Rupert() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Bromor_Rupert_Hello_info()
{
	AI_Output(self,other,"DIA_Bromor_Rupert_Hello_07_01");	//�� ��� �� ������ ���������. ���� �������  � � � � � �  �� ������ 50 �������, ����?
	AI_StopProcessInfos(self);
};
//============================================
instance DIA_Bromor_Rupert_Pay(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 50;
	condition = DIA_Bromor_Rupert_Pay_cond;
	information = DIA_Bromor_Rupert_Pay_info;
	description = "� ���� ����������. (50 ���.)";
	permanent = TRUE;
};
func int DIA_Bromor_Rupert_Pay_cond()
{
	if (C_HeroIs_Rupert())	{
		return TRUE;
	};
};
func void DIA_Bromor_Rupert_Pay_info()
{
	AI_Output(other,self,"DIA_Bromor_Rupert_Pay_03_00");	//� ���� ����������.
	if (B_GiveGold(other,self,50))	{
		AI_Output(self,other,"DIA_Bromor_Rupert_Pay_07_01");	//���� �� ������� - ������� ������. ���� ����� ����� ���� �������.
		Bromor_Paid = TRUE;
		B_StartOtherRoutine(VLK_491_Vanja,"WORK");
	}
	else	{
		AI_Output(self,other,"DIA_Bromor_Rupert_Pay_07_02");	//� �� ������ - ����� �� ������ ���������.
	};
	AI_StopProcessInfos(self);
};
//////////////////////////////////������////////////////////////////////////////
instance DIA_Bromor_Talbin_Hello(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 60;
	condition = DIA_Bromor_Talbin_Hello_cond;
	information = DIA_Bromor_Talbin_Hello_info;
	important = TRUE;
};
func int DIA_Bromor_Talbin_Hello_cond()
{
	if (C_HeroIs_Talbin() && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};
func void DIA_Bromor_Talbin_Hello_info()
{
	AI_Output(self,other,"DIA_Bromor_Talbin_Hello_07_01");	//�������� �������! ��������� ����� � �������� ����� �������. ����� �� 50 �������.
};
//============================================
instance DIA_Bromor_Talbin_Pay(C_INFO)
{
	npc = VLK_433_Bromor;			nr = 50;
	condition = DIA_Bromor_Talbin_Pay_cond;
	information = DIA_Bromor_Talbin_Pay_info;
	description = "� ���� ����������. (50 ���.)";
	permanent = TRUE;
};
func int DIA_Bromor_Talbin_Pay_cond()
{
	if (C_HeroIs_Talbin())	{
		return TRUE;
	};
};
func void DIA_Bromor_Talbin_Pay_info()
{
	AI_Output(other,self,"DIA_Bromor_Talbin_Pay_07_00");	//� ���� ����������.
	if (B_GiveGold(other,self,50))	{
		AI_Output(self,other,"DIA_Bromor_Talbin_Pay_07_01");	//����������� � ����� ������, �, ����������, �� �������� ��� ���� �� ���� �����.
		Bromor_Paid = TRUE;
		B_StartOtherRoutine(VLK_491_Vanja,"WORK");
	}
	else	{
		AI_Output(self,other,"DIA_Bromor_Talbin_Perm_07_03");	//����� ����� ��������� 50 �������.
	};
	AI_StopProcessInfos(self);
};


