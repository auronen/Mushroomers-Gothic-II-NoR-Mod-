
const string Bookstand_Milten_03_S1_1 = "������.";
const string Bookstand_Milten_03_S1_2 = "��������� ���� ������ ����� ������� ������� ������������ ������ �������.";
const string Bookstand_Milten_03_S1_3 = "����� ����� �� ��������� �����, ������� ���-��� ���������.";
const string Bookstand_Milten_03_S1_4 = "��������";
const string Bookstand_Milten_03_S1_5 = "�� ������, ��� � ��������� ����� ������� ���� ����� ������. ��, �������, ��� �� ���� ������� ��������. � ����� ��� ������ ����� �� ������������.";
const string Bookstand_Milten_03_S1_6 = "��������";
const string Bookstand_Milten_03_S1_7 = "����� ����� �� ������ �������� ��� ������, � ��� �������, � ����, ��� �� ���������. �� ������ ������������ ����� ����, ���� ��� �� ������� ������.";
const string Bookstand_Milten_03_S1_8 = "��������";
const string Bookstand_Milten_03_S1_9 = "��������, ��� ������� �������� ����������. ���������� ������ � ���, ��� ����������, ���� ����� ...";

func void Bookstand_Milten_03_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Milten_03_S1_1);
		Doc_PrintLines(nDocID,0,Bookstand_Milten_03_S1_2);
		Doc_PrintLines(nDocID,0,Bookstand_Milten_03_S1_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Milten_03_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Milten_03_S1_5);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Milten_03_S1_6);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Milten_03_S1_7);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,Bookstand_Milten_03_S1_8);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Milten_03_S1_9);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Milten_02_S1_1 = "� �������� ���� ���������� ����� ������� ����������. ��� �� ��� ��������, ��� ������� � �������� ������������ ����� � ������?";
const string Bookstand_Milten_02_S1_2 = "��, �� ���� �������, ��� � ��� �����������. �� ����� ����, ��� ����� ������� �������� ������.";
const string Bookstand_Milten_02_S1_3 = "���� ���������� �� ������� ���������� �������.";
const string Bookstand_Milten_02_S1_4 = "��������� ���� �����. ��� ����� � ����� ����� - �� ��������, ���� �� ������.";
const string Bookstand_Milten_02_S1_5 = "�� �����, ��� ��� ���������� ������ ������.";
const string Bookstand_Milten_02_S1_6 = "��, � � ��������� ��������� ����� ��� ����� ������������ �������� �������.";
const string Bookstand_Milten_02_S1_7 = "������";

func void Bookstand_Milten_02_S1()
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
		Doc_PrintLines(nDocID,0,Bookstand_Milten_02_S1_1);
		Doc_PrintLines(nDocID,0,Bookstand_Milten_02_S1_2);
		Doc_PrintLines(nDocID,0,Bookstand_Milten_02_S1_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Milten_02_S1_4);
		Doc_PrintLines(nDocID,1,Bookstand_Milten_02_S1_5);
		Doc_PrintLines(nDocID,1,Bookstand_Milten_02_S1_6);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,Bookstand_Milten_02_S1_7);
		Doc_Show(nDocID);
	};
};

func void Bookstand_Milten_01_S1()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		Document = Doc_CreateMap();
		Doc_SetPages(Document,1);
		Doc_SetPage(Document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
		Doc_Show(Document);
	};
};

const string Bookstand_Engor_01_S1_1 = "������";
const string Bookstand_Engor_01_S1_2 = "�� ����� ���-��� - ������ ���������. ������ �����������:";
const string Bookstand_Engor_01_S1_3 = "3 ����� ������";
const string Bookstand_Engor_01_S1_4 = "8 ������ ������ �������";
const string Bookstand_Engor_01_S1_5 = "4 ����� � ��������� ���������";
const string Bookstand_Engor_01_S1_6 = "5 ������ (�������) ���� � ����";
const string Bookstand_Engor_01_S1_7 = "2 ����� � �������";
const string Bookstand_Engor_01_S1_8 = "3 ����� � �������������";
const string Bookstand_Engor_01_S1_9 = "16 ������ � ������� (���� ��� ����� ���)";
const string Bookstand_Engor_01_S1_10 = "1 ���� � ������� ��������";
const string Bookstand_Engor_01_S1_11 = "4 ����� � �������� �������";
const string Bookstand_Engor_01_S1_12 = "56 ����� � �����";
const string Bookstand_Engor_01_S1_13 = "1 ���� � ���-�� ������ (��� �� ��� �� ����, ��� ������)";
const string Bookstand_Engor_01_S1_14 = "�����";

func void Bookstand_Engor_01_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Engor_01_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Engor_01_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Engor_01_S1_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Engor_01_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Engor_01_S1_5);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Engor_01_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_7);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_8);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_9);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_10);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_11);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_12);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,Bookstand_Engor_01_S1_14);
		Doc_Show(nDocID);
	};
};

