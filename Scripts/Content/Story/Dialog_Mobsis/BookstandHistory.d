
var int History_1_permanent;
var int History_2_permanent;
var int History_3_permanent;

const string BookstandHistory1_S1_1 = "���� �����";
const string BookstandHistory1_S1_2 = "������ ������ - ��� ������� ���������, �� ������� ����, ����� ���� �������� ������. ���������� ���������� ����� ������ ��� ��������.";
const string BookstandHistory1_S1_3 = "����� ����� ������� ����� �� ���������� ��� ������ ������, ���������� ������, � ����� ������� ����������� �������������� �����.";
const string BookstandHistory1_S1_4 = "�������, ������ ������� ����� ����� ������������ ������������. ���� �� ������� �������� ���, �� ���� ������� ������������ ��������� ����������.";

func void Use_BookstandHistory1_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,BookstandHistory1_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandHistory1_S1_2);
		Doc_PrintLines(nDocID,0,BookstandHistory1_S1_3);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandHistory1_S1_4);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		History_1_permanent = B_GivePlayerXP_Bookstand(History_1_permanent);
	};
};

const string BookstandHistory2_S1_1 = "������";
const string BookstandHistory2_S1_2 = "�������� ����� ������� ��������� �� ������� � ��������� ����������� �������.";
const string BookstandHistory2_S1_3 = "���� ������ ��������, ������ �����, ����� ������� ��������. � ��� ����� ������ �����, ����� ��� ��� ���� ������� ���������� �������� � ������� ������� ��� ���� ���������� �����������.";
const string BookstandHistory2_S1_4 = "����� �������, ��� ������ ����� �������� ��������, ��� ���������� ������� ��� ������ �������� ���������� ����.";
const string BookstandHistory2_S1_5 = "���������� �� �������� ��������� ��������� ����, ��� ��������� �� ����������� ����� ���������� ������� � ����, � ����� �������� ����.";
const string BookstandHistory2_S1_6 = "��� ������ ��������� ����� ������� ����� ����������� ���������, ������� ����� � ������ ���������� ����� ������ ��������.";
const string BookstandHistory2_S1_7 = "� ������ ������� ��������� ������� ��������� ������, ������������� ������ ����. ��� �������� ��� ������������ � ������� ����� � �������, � ����� ������ �������� ����.";

func void Use_BookstandHistory2_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,BookstandHistory2_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandHistory2_S1_2);
		Doc_PrintLines(nDocID,0,BookstandHistory2_S1_3);
		Doc_PrintLines(nDocID,0,BookstandHistory2_S1_4);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandHistory2_S1_5);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandHistory2_S1_6);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandHistory2_S1_7);
		Doc_Show(nDocID);
		History_2_permanent = B_GivePlayerXP_Bookstand(History_2_permanent);
	};
};

const string BookstandHistory3_S1_1 = "����� �� �������";
const string BookstandHistory3_S1_2 = "����� ���� ����� ������, ���������� ������ ������� ����������� ���� - ���� ��� ���������, ����� ��� ����� ���������.";
const string BookstandHistory3_S1_3 = "����� ������������ ������ ���������� �������� ���������.";
const string BookstandHistory3_S1_4 = "���������� ��������� �������� �� ������, � ����� ����������� � ��� ������ �������.";
const string BookstandHistory3_S1_5 = "��������� ����� �������� ���������. ����� ���� ��� ������� ������ ����� ��������� ��������� �������� - ����.";
const string BookstandHistory3_S1_6 = "���� ���-���� ������ ������� ��� ����� ���, ���������� ������ �������� �� �����.";
const string BookstandHistory3_S1_7 = "����� �������� �������� ������, �������� ������ ��������� ������� �����.";
const string BookstandHistory3_S1_8 = "�� ���� ������ �������� ��������� ������, ����������� ������������ �����. �� ��� ������� �������� ��� ���� �������������, � � �� ����������� ������ ��������� ��������� � �������������� �������.";
const string BookstandHistory3_S1_9 = "���, ��� ���� ������� ������������ ��� ��� ���������� ��������, ������ �������� �� ���� �������.";

func void Use_BookstandHistory3_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,BookstandHistory3_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandHistory3_S1_2);
		Doc_PrintLines(nDocID,0,BookstandHistory3_S1_3);
		Doc_PrintLines(nDocID,0,BookstandHistory3_S1_4);
		Doc_PrintLines(nDocID,0,BookstandHistory3_S1_5);
		Doc_PrintLines(nDocID,0," ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandHistory3_S1_6);
		Doc_PrintLines(nDocID,1,BookstandHistory3_S1_7);
		Doc_PrintLines(nDocID,1,BookstandHistory3_S1_8);
		Doc_PrintLines(nDocID,1,BookstandHistory3_S1_9);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		History_2_permanent = B_GivePlayerXP_Bookstand(History_2_permanent);
	};
};

