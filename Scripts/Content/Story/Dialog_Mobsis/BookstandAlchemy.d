
var int ALchemy_1_permanent;
var int ALchemy_2_permanent;
var int ALchemy_3_permanent;

const string BookstandALCHEMY1_S1_1 = "����� ���������� ����";
const string BookstandALCHEMY1_S1_2 = "� �����������";
const string BookstandALCHEMY1_S1_3 = "�������� ����";
const string BookstandALCHEMY1_S1_4 = "2 �������� �������";
const string BookstandALCHEMY1_S1_5 = "�������� ����";
const string BookstandALCHEMY1_S1_6 = "2 �������� �����";
const string BookstandALCHEMY1_S1_7 = "������� ����";
const string BookstandALCHEMY1_S1_8 = "2 �������� �����";
const string BookstandALCHEMY1_S1_9 = "��� ������ �� ������������ ����� ���������� ��������.";
const string BookstandALCHEMY1_S1_10 = "����� ������� ����� �������� ����� ��� �����, ����������� ���������� ����, ��������� ������ ���������� � ��������:";
const string BookstandALCHEMY1_S1_11 = "������� �����";
const string BookstandALCHEMY1_S1_12 = "����� ������� �����, ����������� ������������ ����������� �� ���� ��� ���, ���������� ������������ ��������:";
const string BookstandALCHEMY1_S1_13 = "������� ������";

func void Use_BookstandALCHEMY1_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_1);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_3);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_5);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_7);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY1_S1_9);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY1_S1_10);
		Doc_PrintLine(nDocID,1,BookstandALCHEMY1_S1_11);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY1_S1_12);
		Doc_PrintLines(nDocID,1,BookstandALCHEMY1_S1_13);
		Doc_Show(nDocID);
		Alchemy_1_permanent = B_GivePlayerXP_Bookstand(Alchemy_1_permanent);
	};
};

const string BookstandALCHEMY2_S1_1 = "�������� �����";
const string BookstandALCHEMY2_S1_2 = "� �����������";
const string BookstandALCHEMY2_S1_3 = "�������� ��������";
const string BookstandALCHEMY2_S1_4 = "2 �������� �����";
const string BookstandALCHEMY2_S1_5 = "�������� ��������";
const string BookstandALCHEMY2_S1_6 = "2 �������� ��������";
const string BookstandALCHEMY2_S1_7 = "�������� �������";
const string BookstandALCHEMY2_S1_8 = "2 �������� �����";
const string BookstandALCHEMY2_S1_9 = "��� ������ �� ������������ ����� ���������� ��������.";
const string BookstandALCHEMY2_S1_10 = "����� ������� ����� �������� ����� ��� �����, ����������� ���������� ����, ��������� ������ ���������� � ��������:";
const string BookstandALCHEMY2_S1_11 = "������� �����";
const string BookstandALCHEMY2_S1_12 = "����� ������� �����, ������� ������������ �������� �� ���� ��� ���, ���������� ������������ ��������:";
const string BookstandALCHEMY2_S1_13 = "������� ������";

func void Use_BookstandALCHEMY2_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_1);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_3);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_5);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_7);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY2_S1_9);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY2_S1_10);
		Doc_PrintLine(nDocID,1,BookstandALCHEMY2_S1_11);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY2_S1_12);
		Doc_PrintLines(nDocID,1,BookstandALCHEMY2_S1_13);
		Doc_Show(nDocID);
		Alchemy_2_permanent = B_GivePlayerXP_Bookstand(Alchemy_2_permanent);
	};
};

const string BookstandALCHEMY3_S1_1 = "�����, ������ ������������ ���������";
const string BookstandALCHEMY3_S1_2 = "� �����������";
const string BookstandALCHEMY3_S1_3 = "������� ��������";
const string BookstandALCHEMY3_S1_4 = "1 ���������� �����";
const string BookstandALCHEMY3_S1_5 = "����� ��������";
const string BookstandALCHEMY3_S1_6 = "1 �������-����� - ��� ����� ����� ��������� �� ������� ������, � ������� �����.";
const string BookstandALCHEMY3_S1_7 = "������� ����";
const string BookstandALCHEMY3_S1_8 = "1 �������� ������";
const string BookstandALCHEMY3_S1_9 = "������� �����";
const string BookstandALCHEMY3_S1_10 = "1 �������� ������";
const string BookstandALCHEMY3_S1_11 = "������� ����";
const string BookstandALCHEMY3_S1_12 = "1 �������� ������";
const string BookstandALCHEMY3_S1_13 = "���������� ���� �������� - ������ ������������ ���������. ��� ��� ������� �������� ������.";
const string BookstandALCHEMY3_S1_14 = "����� �������� ������ ����������� �����, �������� ������, ��� ��� ���� �� ��������� �������� ������.";

func void Use_BookstandALCHEMY3_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandALCHEMY3_S1_1);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_3);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_5);
		Doc_PrintLines(nDocID,0,BookstandALCHEMY3_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_7);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandALCHEMY3_S1_9);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_10);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandALCHEMY3_S1_11);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_12);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY3_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY3_S1_14);
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		Alchemy_3_permanent = B_GivePlayerXP_Bookstand(Alchemy_3_permanent);
	};
};

