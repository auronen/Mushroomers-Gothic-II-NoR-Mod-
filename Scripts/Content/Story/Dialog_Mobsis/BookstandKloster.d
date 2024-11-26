
const string Bookstand_Rune_01_S1_1 = "�������� 1";
const string Bookstand_Rune_01_S1_2 = "������ �����";
const string Bookstand_Rune_01_S1_3 = "�������� 2";

func void Use_Bookstand_Rune_01_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Rune_01_S1_1);
		Doc_PrintLine(nDocID,0,Bookstand_Rune_01_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,Bookstand_Rune_01_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

const string Bookstand_Rune_02_S1_1 = "�������� 1";
const string Bookstand_Rune_02_S1_2 = "���� � �����������";
const string Bookstand_Rune_02_S1_3 = "�������� 2";

func void Use_Bookstand_Rune_02_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Rune_02_S1_1);
		Doc_PrintLine(nDocID,0,Bookstand_Rune_02_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,Bookstand_Rune_02_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

const string Bookstand_Innos_01_S1_1 = "�������� 1";
const string Bookstand_Innos_01_S1_2 = "������ ������";
const string Bookstand_Innos_01_S1_3 = "�������� 2";

func void Use_Bookstand_Innos_01_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Innos_01_S1_1);
		Doc_PrintLine(nDocID,0,Bookstand_Innos_01_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,Bookstand_Innos_01_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

const string Bookstand_Innos_02_S1_1 = "�������� 1";
const string Bookstand_Innos_02_S1_2 = "�������� ������";
const string Bookstand_Innos_02_S1_3 = "�������� 2";

func void Use_Bookstand_Innos_02_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Innos_02_S1_1);
		Doc_PrintLine(nDocID,0,Bookstand_Innos_02_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,Bookstand_Innos_02_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_01_S1_1 = "������ ����";
const string Bookstand_Kreise_01_S1_2 = "���� 1-�� ����� � �����������, ����������� ��� �� ��������.";
const string Bookstand_Kreise_01_S1_3 = "����";
const string Bookstand_Kreise_01_S1_4 = "������� ������";
const string Bookstand_Kreise_01_S1_5 = "�������� ������";
const string Bookstand_Kreise_01_S1_6 = "����";
const string Bookstand_Kreise_01_S1_7 = "����� ������";
const string Bookstand_Kreise_01_S1_8 = "������ ��������";
const string Bookstand_Kreise_01_S1_9 = "������ �������";
const string Bookstand_Kreise_01_S1_10 = "����� �������";
const string Bookstand_Kreise_01_S1_11 = "������� ������ �������";
const string Bookstand_Kreise_01_S1_12 = "�������� �����";
const string Bookstand_Kreise_01_S1_13 = "����� ������� ����, ������ ��������� ���� �� ����������������� ������������.";
const string Bookstand_Kreise_01_S1_14 = "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.";
const string Bookstand_Kreise_01_S1_15 = "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.";

func void Use_Bookstand_Kreise_01_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_01_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_5);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_7);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_9);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_10);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_11);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_12);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_01_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_01_S1_14);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_01_S1_15);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_02_S1_1 = "������ ����";
const string Bookstand_Kreise_02_S1_2 = "���� 2-�� ����� � �����������, ����������� ��� �� ��������.";
const string Bookstand_Kreise_02_S1_3 = "�������� ���";
const string Bookstand_Kreise_02_S1_4 = "�����";
const string Bookstand_Kreise_02_S1_5 = "������� ������";
const string Bookstand_Kreise_02_S1_6 = "������� �����";
const string Bookstand_Kreise_02_S1_7 = "����� �����";
const string Bookstand_Kreise_02_S1_8 = "����� �����";
const string Bookstand_Kreise_02_S1_9 = "����� �����";
const string Bookstand_Kreise_02_S1_10 = "�����";
const string Bookstand_Kreise_02_S1_11 = "���";
const string Bookstand_Kreise_02_S1_12 = "�������� �����";
const string Bookstand_Kreise_02_S1_13 = "����� ������� ����, ������ ��������� ���� �� ����������������� ������������.";
const string Bookstand_Kreise_02_S1_14 = "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.";
const string Bookstand_Kreise_02_S1_15 = "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.";

func void Use_Bookstand_Kreise_02_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_02_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_5);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_7);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_9);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_10);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_11);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_12);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_02_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_02_S1_14);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_02_S1_15);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_03_S1_1 = "������ ����";
const string Bookstand_Kreise_03_S1_2 = "���� 3-�� ����� � �����������, ����������� ��� �� ��������.";
const string Bookstand_Kreise_03_S1_3 = "������� ������� �������";
const string Bookstand_Kreise_03_S1_4 = "�������� ��������";
const string Bookstand_Kreise_03_S1_5 = "����� �������� ����";
const string Bookstand_Kreise_03_S1_6 = "�����";
const string Bookstand_Kreise_03_S1_7 = "����";
const string Bookstand_Kreise_03_S1_8 = "�������� �������";
const string Bookstand_Kreise_03_S1_9 = "����� �������";
const string Bookstand_Kreise_03_S1_10 = "�����";
const string Bookstand_Kreise_03_S1_11 = "������ ������";
const string Bookstand_Kreise_03_S1_12 = "������� ����";
const string Bookstand_Kreise_03_S1_13 = "������� �����";
const string Bookstand_Kreise_03_S1_14 = "���������";
const string Bookstand_Kreise_03_S1_15 = "������� ������";
const string Bookstand_Kreise_03_S1_16 = "������ ��������";
const string Bookstand_Kreise_03_S1_17 = "����";
const string Bookstand_Kreise_03_S1_18 = "�������� ���";
const string Bookstand_Kreise_03_S1_19 = "�����";
const string Bookstand_Kreise_03_S1_20 = "����";
const string Bookstand_Kreise_03_S1_21 = "����� ������� ����, ������ ��������� ���� �� ����������������� ������������.";
const string Bookstand_Kreise_03_S1_22 = "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.";
const string Bookstand_Kreise_03_S1_23 = "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.";

func void Use_Bookstand_Kreise_03_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_03_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_5);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_6);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_7);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_8);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_9);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_10);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_11);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_12);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_13);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_14);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_15);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_16);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_17);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_18);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_19);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_20);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_03_S1_21);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_03_S1_22);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_03_S1_23);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_04_S1_1 = "��������� ����";
const string Bookstand_Kreise_04_S1_2 = "���� 4-�� ����� � �����������, ����������� ��� �� ��������.";
const string Bookstand_Kreise_04_S1_3 = "������� �������� ���";
const string Bookstand_Kreise_04_S1_4 = "����";
const string Bookstand_Kreise_04_S1_5 = "�����";
const string Bookstand_Kreise_04_S1_6 = "������";
const string Bookstand_Kreise_04_S1_7 = "������ ��������";
const string Bookstand_Kreise_04_S1_8 = "������� �����";
const string Bookstand_Kreise_04_S1_9 = "����������� ������";
const string Bookstand_Kreise_04_S1_10 = "������ ��������� ������";
const string Bookstand_Kreise_04_S1_11 = "����������� ������";
const string Bookstand_Kreise_04_S1_12 = "������ ����";
const string Bookstand_Kreise_04_S1_13 = "����� ������� ����, ������ ��������� ���� �� ����������������� ������������.";
const string Bookstand_Kreise_04_S1_14 = "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.";
const string Bookstand_Kreise_04_S1_15 = "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.";

func void Use_Bookstand_Kreise_04_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_04_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_4);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_5);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_6);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_7);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_9);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_10);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_11);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_12);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_04_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_04_S1_14);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_04_S1_15);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_05_S1_1 = "����� ����";
const string Bookstand_Kreise_05_S1_2 = "���� 5-�� ����� � �����������, ����������� ��� �� ��������.";
const string Bookstand_Kreise_05_S1_3 = "������� �����";
const string Bookstand_Kreise_05_S1_4 = "������� �����";
const string Bookstand_Kreise_05_S1_5 = "���������";
const string Bookstand_Kreise_05_S1_6 = "������� �������� ����";
const string Bookstand_Kreise_05_S1_7 = "����";
const string Bookstand_Kreise_05_S1_8 = "�������� ����";
const string Bookstand_Kreise_05_S1_9 = "����� ������";
const string Bookstand_Kreise_05_S1_10 = "������ ������";
const string Bookstand_Kreise_05_S1_11 = "������� ������� �������";
const string Bookstand_Kreise_05_S1_12 = "�������� ������";
const string Bookstand_Kreise_05_S1_13 = "����� ������� ����, ������ ��������� ���� �� ����������������� ������������.";
const string Bookstand_Kreise_05_S1_14 = "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.";
const string Bookstand_Kreise_05_S1_15 = "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.";

func void Use_Bookstand_Kreise_05_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_05_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_4);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_5);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_6);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_7);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_9);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_10);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_11);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_12);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_05_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_05_S1_14);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_05_S1_15);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_06_S1_1 = "������ ����";
const string Bookstand_Kreise_06_S1_2 = "���� 6-�� ����� � �����������, ����������� ��� �� ��������.";
const string Bookstand_Kreise_06_S1_3 = "�������� �����";
const string Bookstand_Kreise_06_S1_4 = "�����";
const string Bookstand_Kreise_06_S1_5 = "����";
const string Bookstand_Kreise_06_S1_6 = "�������� ����";
const string Bookstand_Kreise_06_S1_7 = "������� ������";
const string Bookstand_Kreise_06_S1_8 = "�����";
const string Bookstand_Kreise_06_S1_9 = "������ ������";
const string Bookstand_Kreise_06_S1_10 = "����� ������";
const string Bookstand_Kreise_06_S1_11 = "����� �������";
const string Bookstand_Kreise_06_S1_12 = "������ ������";
const string Bookstand_Kreise_06_S1_13 = "����� ����";
const string Bookstand_Kreise_06_S1_14 = "����� �������";
const string Bookstand_Kreise_06_S1_15 = "������ ������";
const string Bookstand_Kreise_06_S1_16 = "������ ��������� ������";
const string Bookstand_Kreise_06_S1_17 = "������ ������";
const string Bookstand_Kreise_06_S1_18 = "����������� �������";
const string Bookstand_Kreise_06_S1_19 = "����� �������";
const string Bookstand_Kreise_06_S1_20 = "���� ������";
const string Bookstand_Kreise_06_S1_21 = "����� ������� ����, ������ ��������� ���� �� ����������������� ������������.";
const string Bookstand_Kreise_06_S1_22 = "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.";
const string Bookstand_Kreise_06_S1_23 = "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.";

func void Use_Bookstand_Kreise_06_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_06_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_4);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_5);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_7);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_8);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_9);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_10);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_11);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_12);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_13);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_14);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_15);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_16);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_17);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,Bookstand_Kreise_06_S1_18);
		Doc_PrintLine(nDocID,1,Bookstand_Kreise_06_S1_19);
		Doc_PrintLine(nDocID,1,Bookstand_Kreise_06_S1_20);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_06_S1_21);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_06_S1_22);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_06_S1_23);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Rules_01_S1_1 = "�������� 1";
const string Bookstand_Rules_01_S1_2 = "�������";
const string Bookstand_Rules_01_S1_3 = "�������� 2";

func void Use_Bookstand_Rules_01_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Rules_01_S1_1);
		Doc_PrintLine(nDocID,0,Bookstand_Rules_01_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,Bookstand_Rules_01_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

