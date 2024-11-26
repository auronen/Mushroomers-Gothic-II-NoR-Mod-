
var int Animals_1_permanent;
var int Animals_2_permanent;
var int Animals_3_permanent;

const string BookstandAnimals1_S1_1 = "����� � ������";
const string BookstandAnimals1_S1_2 = "� ������� ����� ��� ��������� ����� �������� ������,  ������������� ����� � �������������� �������� ��������.";
const string BookstandAnimals1_S1_3 = "������� ������� ����� ��� � ������� ������ � ��� �������� ��.";
const string BookstandAnimals1_S1_4 = "������� �����";
const string BookstandAnimals1_S1_5 = "���� - ��� ������ ������ ������ � ��������. ���� �� ������, ��� ������ �� � ����� ������, �� ������, ���������, ����������, �������� ���� � ������� ����� ������� ������� ������.";
const string BookstandAnimals1_S1_6 = "������ ����";
const string BookstandAnimals1_S1_7 = "����������� � ������� �������� ������ �������, � ��� ������ ����� ���� - ����, ������ � ����������, ��������.";
const string BookstandAnimals1_S1_8 = "����� ������� �������� ����� ����� ������� ����� � �������� ���� � ��������.";
const string BookstandAnimals1_S1_9 = "������� ������";
const string BookstandAnimals1_S1_10 = "��� ��������� ��������� �� ���� ����� ������, ���������, �������� � ����������.";

func void Use_BookstandAnimals1_S1()
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
		Doc_PrintLine(nDocID,0,BookstandAnimals1_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandAnimals1_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandAnimals1_S1_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandAnimals1_S1_4);
		Doc_PrintLines(nDocID,0,BookstandAnimals1_S1_5);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,BookstandAnimals1_S1_6);
		Doc_PrintLines(nDocID,1,BookstandAnimals1_S1_7);
		Doc_PrintLines(nDocID,1,BookstandAnimals1_S1_8);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,BookstandAnimals1_S1_9);
		Doc_PrintLines(nDocID,1,BookstandAnimals1_S1_10);
		Doc_Show(nDocID);
		Animals_1_permanent = B_GivePlayerXP_Bookstand(Animals_1_permanent);
	};
};

const string BookstandAnimals2_S1_1 = "����� � ������";
const string BookstandAnimals2_S1_2 = "� ������� ����� ��� ��������� ����� �������� ������,  ������������� ����� � �������������� �������� ��������.";
const string BookstandAnimals2_S1_3 = "�������� ����";
const string BookstandAnimals2_S1_4 = "����� ����������� ���� �������� ��������, ���������� �������� ����� ��������.";
const string BookstandAnimals2_S1_5 = "� ��� ����� �������� ������ � ����.";
const string BookstandAnimals2_S1_6 = "��� ���� ������ ������������ �������� ���������� ��� ��������� �������.";
const string BookstandAnimals2_S1_7 = "������� ������� � �������� ������� ��� ������ ��������. ��������� ���������";
const string BookstandAnimals2_S1_8 = "�������� �������, ��� ��� ��� �������� ������, ���������� ���������� ����.";
const string BookstandAnimals2_S1_9 = "������, �� ������� ������������ ���������, ��� ��� ������������ �������� ���������� ���������� ������������� � ���.";
const string BookstandAnimals2_S1_10 = "������� ��������� ����� ������ ���������. �� ��� ����� ������������� �������.";

func void Use_BookstandAnimals2_S1()
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
		Doc_PrintLine(nDocID,0,BookstandAnimals2_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandAnimals2_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandAnimals2_S1_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandAnimals2_S1_4);
		Doc_PrintLines(nDocID,0,BookstandAnimals2_S1_5);
		Doc_PrintLines(nDocID,0,BookstandAnimals2_S1_6);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandAnimals2_S1_7);
		Doc_PrintLines(nDocID,1,BookstandAnimals2_S1_8);
		Doc_PrintLines(nDocID,1,BookstandAnimals2_S1_9);
		Doc_PrintLines(nDocID,1,BookstandAnimals2_S1_10);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
		Animals_2_permanent = B_GivePlayerXP_Bookstand(Animals_2_permanent);
	};
};

const string BookstandAnimals3_S1_1 = "����� � ������";
const string BookstandAnimals3_S1_2 = "� ������� ����� ��� ��������� ����� �������� ������,  ������������� ����� � �������������� �������� ��������.";
const string BookstandAnimals3_S1_3 = "�������� ����";
const string BookstandAnimals3_S1_4 = "���� ����� - ����, ���������� �����, ������� ����� ����� ������ � �������� ���������� ����� �� ���� �����.";
const string BookstandAnimals3_S1_5 = "������ ��, ��� �������� ������� �� ����, ����� ��������� �� ���� �������� � �������� �� ������ �����.";
const string BookstandAnimals3_S1_6 = "��������";
const string BookstandAnimals3_S1_7 = "�������� - ��� ������� �����, �������������� ��������� � ������� ��� �������� ����.";
const string BookstandAnimals3_S1_8 = "���� �������� �������� ����� ����, � ������� ��� �� ������������ ������ ��������� ��� �����, ���� ������ �� �� �������� �� ���������� �� �����.";
const string BookstandAnimals3_S1_9 = "��� ��������� ��������� ������ ���������� �������. �� ����� ���������� ���, �������";
const string BookstandAnimals3_S1_10 = "������ ����� ��������� �������� ���.";

func void Use_BookstandAnimals3_S1()
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
		Doc_PrintLine(nDocID,0,BookstandAnimals3_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandAnimals3_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandAnimals3_S1_3);
		Doc_PrintLines(nDocID,0,BookstandAnimals3_S1_4);
		Doc_PrintLines(nDocID,0,BookstandAnimals3_S1_5);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,BookstandAnimals3_S1_6);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandAnimals3_S1_7);
		Doc_PrintLines(nDocID,1,BookstandAnimals3_S1_8);
		Doc_PrintLines(nDocID,1,BookstandAnimals3_S1_9);
		Doc_PrintLines(nDocID,1,BookstandAnimals3_S1_10);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		Animals_3_permanent = B_GivePlayerXP_Bookstand(Animals_3_permanent);
	};
};

