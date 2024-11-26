
const string Runemaking_KDW_CIRC1_S1_1 = "����� ����";
const string Runemaking_KDW_CIRC1_S1_2 = "���� ���� � �����������, ����������� ��� �� ��������.";
const string Runemaking_KDW_CIRC1_S1_3 = "�����";
const string Runemaking_KDW_CIRC1_S1_4 = "������ �������� ����";
const string Runemaking_KDW_CIRC1_S1_5 = "������� �����";
const string Runemaking_KDW_CIRC1_S1_6 = "������� �����";
const string Runemaking_KDW_CIRC1_S1_7 = "������";
const string Runemaking_KDW_CIRC1_S1_8 = "���������";
const string Runemaking_KDW_CIRC1_S1_9 = "����";
const string Runemaking_KDW_CIRC1_S1_10 = "������� �����";
const string Runemaking_KDW_CIRC1_S1_11 = "������ �������� ����";
const string Runemaking_KDW_CIRC1_S1_12 = "����� ����";
const string Runemaking_KDW_CIRC1_S1_13 = "���������";
const string Runemaking_KDW_CIRC1_S1_14 = "������ ��������";
const string Runemaking_KDW_CIRC1_S1_15 = "����� ������� ����, ������ ��������� ���� �� ����������������� ������������.";
const string Runemaking_KDW_CIRC1_S1_16 = "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.";
const string Runemaking_KDW_CIRC1_S1_17 = "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.";

func void Use_Runemaking_KDW_CIRC1_S1()
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
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Runemaking_KDW_CIRC1_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_3);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_5);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_7);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_9);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_10);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_11);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_12);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_13);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_14);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Runemaking_KDW_CIRC1_S1_15);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Runemaking_KDW_CIRC1_S1_16);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Runemaking_KDW_CIRC1_S1_17);
		Doc_Show(nDocID);
	};
};

func void Use_Runemaking_KDW_CIRC2_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC3_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC4_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC5_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC6_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

