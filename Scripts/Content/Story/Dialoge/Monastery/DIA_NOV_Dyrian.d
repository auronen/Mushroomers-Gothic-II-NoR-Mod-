

instance DIA_Dyrian_EXIT(DIA_Proto_End)
{
	npc = NOV_604_Dyrian;
};

/////////////////////////////////////// ��� /////////////////////////////////////////////

//===================================================
var int Dyrian_Odo_KnowBooks;
instance DIA_Dyrian_HowWork_Odo(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_HowWork_Odo_Cond;
	information = DIA_Dyrian_HowWork_Odo_Info;
	permanent = TRUE;
	description = "��� ���� �������?";
};
func int DIA_Dyrian_HowWork_Odo_Cond()
{
	if (C_HeroIs_Odo() && !Dyrian_Odo_KnowBooks)	{
		return TRUE;
	};
};
func void DIA_Dyrian_HowWork_Odo_Info()
{
		AI_Output(other,self,"DIA_Dyrian_HowWork_Odo_03_00");	//��� ���� �������?
	var C_NPC oth;	oth = Hlp_GetNpc(other);
	Npc_PerceiveAll(self);
	if (Wld_DetectNpc(self,-1,NOFUNC,GIL_KDF))	{
		if (Hlp_IsValidNpc(other))	{
			if (Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)	{
				other = Hlp_GetNpc(oth);
				AI_Output(self,other,"DIA_Dyrian_HowWork_Odo_13_05");	//(������) � ������� �������, ����.
				return;
			};
		};
	};
	other = Hlp_GetNpc(oth);
	Dyrian_Odo_KnowBooks = TRUE;
	AI_Output(self,other,"DIA_Dyrian_HowWork_Odo_13_01");	//��, � �� ���������. ��� �������� ��������� ������� �����, � � ���� � ����, ������ ����.
	AI_Output(self,other,"DIA_Dyrian_HowWork_Odo_13_02");	//� ��� �� �������� ������� ����� � ����������.
	AI_Output(self,other,"DIA_Dyrian_HowWork_Odo_13_03");	//�� ������ ��������, ���� ���-������!
	AI_Output(self,other,"DIA_Dyrian_HowWork_Odo_13_04");	//����� � ������ � ���������, �����, ��� ���� ������� �������, �� ���� ���� �� �����, ��� �������� ����������.
};

//===================================================
instance DIA_Dyrian_HowAU_Odo(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_HowAU_Odo_Cond;
	information = DIA_Dyrian_HowAU_Odo_Info;
	permanent = TRUE;
	description = "��� ��?";
};
func int DIA_Dyrian_HowAU_Odo_Cond()
{
	if (C_HeroIs_Odo() && Dyrian_Odo_KnowBooks)	{
		return TRUE;
	};
};
func void DIA_Dyrian_HowAU_Odo_Info()
{
		AI_Output(other,self,"DIA_Dyrian_HowAU_Odo_03_00");	//��� ��?
	if (!Dyrian_HasBook) {
		AI_Output(self,other,"DIA_Dyrian_HowAU_Odo_13_01");	//��� ���� �� ������� �����, ���� �� � ��� �������� ���-������ ����� ����...
	}
	else {
		AI_Output(self,other,"DIA_Dyrian_HowAU_Odo_13_02");    //������, ����� � ���� ���� ��� ��������, ��� ������� �����!
	};
};

//===================================================
instance DIA_Dyrian_GiveMrBook_Odo(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_GiveMrBook_Odo_Cond;
	information = DIA_Dyrian_GiveMrBook_Odo_Info;
	description = "� ���� ���� ��� ���� �����.";
	permanent = TRUE;
};
func int DIA_Dyrian_GiveMrBook_Odo_Cond()
{
	if (C_HeroIs_Odo() && Dyrian_Odo_KnowBooks
		&& (Npc_HasItems(other,ItWr_MushroomBook)
			|| Npc_HasItems(other,ItWr_MR_UnderInnosEye)
			|| Npc_HasItems(other,ItWr_MR_SunExtract)
			|| Npc_HasItems(other,ItWr_MR_SmithGuide)
			|| Npc_HasItems(other,ItWr_MR_OnAlchemy)
			|| Npc_HasItems(other,ItWr_MR_OakBranch)
			|| Npc_HasItems(other,ItWr_MR_BiographyBartosLaran)
			|| Npc_HasItems(other,ItWr_HerbBook)))	{
		return TRUE;
	};
	return FALSE;
};
func void DIA_Dyrian_GiveMrBook_Odo_Menu()
{
	Info_ClearChoices(DIA_Dyrian_GiveMrBook_Odo);
	if (!DIA_Dyrian_GiveMrBook_Odo_Cond()) {
		return;
	};
	if ( DIA_Dyrian_GiveMrBook_Odo_Cond()) {
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"������, � ��������� (�����).",DIA_Dyrian_GiveMrBook_Odo_Cancel);
	};
	if (Npc_HasItems(other,ItWr_MushroomBook))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"� ������ ��������.",DIA_Dyrian_GiveMrBook_Odo_MR);
	};
	if (Npc_HasItems(other,ItWr_MR_AboutDragons))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"� ��������",DIA_Dyrian_GiveMrBook_Odo_AboutDragons);
	};
	if (Npc_HasItems(other,ItWr_MR_BiographyBartosLaran))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"��������� ������� ����������.",DIA_Dyrian_GiveMrBook_Odo_BiographyBartosLaran);
	};
	if (Npc_HasItems(other,ItWr_MR_OakBranch))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"������� ����� (�������������� ��������).",DIA_Dyrian_GiveMrBook_Odo_OakBranch);
	};
	if (Npc_HasItems(other,ItWr_MR_OnAlchemy))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"�� ������� (�������).",DIA_Dyrian_GiveMrBook_Odo_OnAlchemy);
	};
	if (Npc_HasItems(other,ItWr_MR_SmithGuide))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"����������� �������.",DIA_Dyrian_GiveMrBook_Odo_SmithGuide);
	};
	if (Npc_HasItems(other,ItWr_MR_SunExtract))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"�������� ������ (����������� �� ���������).",DIA_Dyrian_GiveMrBook_Odo_SunExtract);
	};
	if (Npc_HasItems(other,ItWr_MR_UnderInnosEye))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"��� ���� ������ (�������������� �������).",DIA_Dyrian_GiveMrBook_Odo_UnderInnosEye);
	};
	if (Npc_HasItems(other,ItWr_HerbBook))	{
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"� ������ (�������)",DIA_Dyrian_GiveMrBook_Odo_UnderInnosEye);
	};
};
func void DIA_Dyrian_GiveMrBook_Odo_Info()
{
		AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_03_00");	//� ���� ���� ��� ���� �����.
	AI_Output(self,other,"DIA_Dyrian_GiveMrBook_Odo_13_01");	//� � ��� ���?
	DIA_Dyrian_GiveMrBook_Odo_Menu();
};
func void DIA_Dyrian_GiveMrBook_Odo_Cancel()
{
		AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_Cancel_03_00");	//������, � ���������.
		AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_Cancel_03_01");	//� ���� ��� ��� �������� ��.
	AI_Output(self,other,"DIA_Dyrian_GiveMrBook_Cancel_Odo_13_02");	//��� �, ��� ���� �����. �� ���� �� ��� ��� ����������� - �� ������, ��� ���� �����.
	Info_ClearChoices(DIA_Dyrian_GiveMrBook_Odo);
};
func void DIA_Dyrian_GiveMrBook_Odo_DoGiveMR()
{
	Dyrian_HasBook = TRUE;
		AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_DoGive_03_00");	//���, �����.
		AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_DoGive_03_01");	//������ ������ ��. � ���� �������� �� ����� � ������� � �����������.
	B_GiveInvItems(other,self,ItWr_MushroomBook,1);
	AI_Output(self,other,"DIA_Dyrian_GiveMrBook_Odo_DoGive_13_02");	//� ���� ������ �� ��� ������ ���.
	Info_ClearChoices(DIA_Dyrian_GiveMrBook_Odo);
	//������ ������������� ������ ���� (���� ���� �� ����������)
	B_Adanos_Bless4Good();
};
var int DIA_Dyrian_GiveMrBook_Odo_MR_Once;
func void DIA_Dyrian_GiveMrBook_Odo_MR()
{
	Info_ClearChoices(DIA_Dyrian_GiveMrBook_Odo);
	if (!DIA_Dyrian_GiveMrBook_Odo_MR_Once)	{
		DIA_Dyrian_GiveMrBook_Odo_MR_Once = TRUE;
			AI_Output(other,self,"DIA_Dyrian_GiveMrBook_Odo_03_02");	//� ������ ��������. �� ������� ��������� ������� �����������.
		AI_Output(self,other,"DIA_Dyrian_GiveMrBook_Odo_13_03");	//� ������? ��� �������... ��������.
		AI_Output(self,other,"DIA_Dyrian_GiveMrBook_Odo_13_04");	//�� � ����� �������� ���-�� �����. � � ������������� ������ ��, ���� �� �� ������.
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"������, � ���������.",DIA_Dyrian_GiveMrBook_Odo_Cancel);
		Info_AddChoice(DIA_Dyrian_GiveMrBook_Odo,"���, �����.",DIA_Dyrian_GiveMrBook_Odo_DoGiveMR);
	}
	else {
		AI_Output(other,self,"DIA_Dyrian_GiveMrBookPerm_Odo_03_00");	//�����, � ���-���� ��� ���� �����.
		DIA_Dyrian_GiveMrBook_Odo_DoGiveMR();
	};
};
func void DIA_Dyrian_GiveMrBook_Odo_DoGive()
{
	Dyrian_HasBook = TRUE;
	if (Hlp_Random(100) < 50)	{
		AI_Output(self,other,"DIA_Dyrian_GiveBook_Odo_13_02");	//�������.
	}
	else {
		AI_Output(self,other,"DIA_Dyrian_GiveBook_Odo_13_03");	//�� ��������� ����.
	};
	B_GivePlayerXP(XP_Ambient);
	DIA_Dyrian_GiveMrBook_Odo_Menu();
};
func void DIA_Dyrian_GiveMrBook_Odo_AboutDragons()
{
	B_GiveInvItems(other,self,ItWr_MR_AboutDragons,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_BiographyBartosLaran()
{
	B_GiveInvItems(other,self,ItWr_MR_BiographyBartosLaran,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_OakBranch()
{
	B_GiveInvItems(other,self,ItWr_MR_OakBranch,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_OnAlchemy()
{
	B_GiveInvItems(other,self,ItWr_MR_OnAlchemy,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_SmithGuide()
{
	B_GiveInvItems(other,self,ItWr_MR_SmithGuide,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_SunExtract()
{
	B_GiveInvItems(other,self,ItWr_MR_SunExtract,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
func void DIA_Dyrian_GiveMrBook_Odo_UnderInnosEye()
{
	B_GiveInvItems(other,self,ItWr_MR_UnderInnosEye,1);
	DIA_Dyrian_GiveMrBook_Odo_DoGive();
};
