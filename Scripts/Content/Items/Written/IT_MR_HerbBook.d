
//(C) ������ 2017

instance ItWr_HerbBook(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	
	//UNFINISHED
	visual = "addon_dungeon_scrolls_01.3DS";
	material = MAT_LEATHER;
	value = 300;
	
	description = "� ������";
	text[2] = "������� ��������� ���� ��������";
	text[3] = "����� �������� �����������";
	
	
	scemeName = "MAP";
	on_state[0] = Use_HerbBook;
	text[5] = NAME_Value;
	count[5] = value;
};

const Int HerbBook_Left_Margin = 101;
const Int HerbBook_Right_Margin = HerbBook_Left_Margin - 10;
const Int HerbBook_Top_Margin = 70;
const Int HerbBook_Btm_Margin = 50;

var int HerbBook_Page;
const int HerbBook_PageMax = 22;

//================================================================
const string HerbBook_Show_Cover_1 = "  ����������: �������, Home, End";
const string HerbBook_Show_Cover_2 = "            �";
const string HerbBook_Show_Cover_3 = "            � � � � � �";

func void HerbBook_Show_Cover(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Title.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin+10,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,HerbBook_Show_Cover_1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,HerbBook_Show_Cover_2);
	Doc_PrintLine(docID,0,HerbBook_Show_Cover_3);
};

//================================================================
const string HerbBook_Show_Summary_1 = "������� ��������� ������� �����, ������ � �������� ����� �������� �� ������ �������������� �������. ���� �� ��� ������� ����� ��� �� ���� �����, �� ������ � �����, ��� �������� �������� ������� ������ �������� �������� ��� �� �������������� ���������� ��� ����. � ��� � ������ ���� � ���� �����, � ������� ������� ������ ������ ������� �����, �������� � ���������.";
const string HerbBook_Show_Summary_2 = "����������� ��������, ����������� � �������� ����, ������, ������ � ���� ��������� ������������ �������� � ����� ����, ������ ���������� � ���������� ����. ";

func void HerbBook_Show_Summary(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_SomeHerbs.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Summary_1);
	Doc_PrintLines(docID,0,HerbBook_Show_Summary_2);
};
//================================================================
const string HerbBook_Show_Summary2_1 = "������ �������� ���� ���� ��� ���������� � ���� ������, ������� �������� ����������� ������� �������, � ���������� ���������� �������� ����� �������� � ��������� � ������ ���������� �����. ���� ����� ���� �� ���� �������� ����� ������, ��, ��������� ������, ����������� ��������� ���� ����� � ��������� �� ������ �������� ��������. �������, � �������� ������������� ����� ���������� � �������������� � ������ ��������� ������������ �� �������, � ������ �� ��� �� ��������������� �� �����. ��������� � ����� ������.";

func void HerbBook_Show_Summary2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Potions.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Summary2_1);
};


//================================================================
const string HerbBook_Show_Fruits1_1 = "����� � �����";
const string HerbBook_Show_Fruits1_2 = "��������� ���������� ";
const string HerbBook_Show_Fruits1_3 = "�������� ������ �����, �������������� �� ������, �������� � �����������.";
const string HerbBook_Show_Fruits1_4 = "���� ������� ������ � �������� ��������� �������� � ������������ ���������� ��������� �� ��������. �������, �� ����� ������� �������� ��������� ������� �����, �������������� �� ������������ ��� ���������� �� ����� ������������ ��������� ���������������.";

func void HerbBook_Show_Fruits1(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Apple.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin+15,HerbBook_Right_Margin + 3,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits1_1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,HerbBook_Show_Fruits1_2); 
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits1_3); 
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits1_4);
};
//================================================================
const string HerbBook_Show_Fruits2_1 = "������ ������� �������, ��������� ����� �������� ������, ������� ���� ������� �� ���� ���������� ������. ";
const string HerbBook_Show_Fruits2_2 = "������� ������ �������� ��������, ��������� ��� �� ����, � ������� ��� ���������� ���� � ����. ������ � ����� �����, ������������ ���������� ������� ���������� ������������� � ��������� ������������, �������� ���� � ����� �������, �� ������� ���������� ���������. ";

func void HerbBook_Show_Fruits2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_FireBerry.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin+2,HerbBook_Top_Margin+10,HerbBook_Right_Margin+10,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits2_1);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits2_2);
};

//================================================================
const string HerbBook_Show_Fruits3_1 = "������ ����� ����� �������� �������� �������� ����� �������, ������� � ����� �������. ";
const string HerbBook_Show_Fruits3_2 = "������ �� ���� �������� �� ���� ���������� ������ ����� � ��������� � ���� �� ���������, ������ �� ���������� ��� �������� �������� �� ���������. ���� ����� ������� ������ �� ����� � ���������, ��� ������������� ����� ������� ������� ���������� ����� ��������� � ������.";

func void HerbBook_Show_Fruits3(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Berries.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin + 45,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits3_1);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits3_2);
};

//================================================================
const string HerbBook_Show_Fruits4_1 = "�������� ��������, ���������� ����� ����� �������, ������ ������ � ����������� �� ������� ����. ";
const string HerbBook_Show_Fruits4_2 = "������ ��������� ������ ��� � ������ ����, � ���� ��������, ������� �� ������ �������� ������� ������� �������. ";
const string HerbBook_Show_Fruits4_3 = "�� ���� ��������� ���������� ����, ������� ������ ���������� �� ����� ���� � �����, �� ����� ���������, ��� �������� �������� ����������. ";
const string HerbBook_Show_Fruits4_4 = "� ��� ���� ���������� ������ ��� ��������� �����, �� ���� ���������� ����������� ��������� ���������� ����. ���� ����� ������� ������� � ��������� ����������, �� ����� �������� � ��������� ���������.";

func void HerbBook_Show_Fruits4(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Seraphis.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits4_1);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits4_2);
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits4_3);
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits4_4);
};
//================================================================
const string HerbBook_Show_Fruits5_1 = "����� ���������� ����� - ����� ������� ��� �� ���� ������, ������������ � ��������� ���������������. ";
const string HerbBook_Show_Fruits5_2 = "� ������� �� ����������� ������ �������� ��������, ����� ������� ��� ���������� �������� ������� ��� ���������� ����, ����� ������� ������ �������� �������.";
const string HerbBook_Show_Fruits5_3 = "���� �� ������ ";
const string HerbBook_Show_Fruits5_4 = "� ����� ����, ";
const string HerbBook_Show_Fruits5_5 = "�� �������� ";
const string HerbBook_Show_Fruits5_6 = "�������� �������� ";
const string HerbBook_Show_Fruits5_7 = "�� ����������. ";

func void HerbBook_Show_Fruits5(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_TrollBerry.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits5_1);
	Doc_PrintLine(docID,0," ");
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits5_2);
	Doc_PrintLine(docID,0," ");
	Doc_PrintLine(docID,0,HerbBook_Show_Fruits5_3);
	Doc_PrintLine(docID,0,HerbBook_Show_Fruits5_4);
	Doc_PrintLine(docID,0,HerbBook_Show_Fruits5_5);
	Doc_PrintLine(docID,0,HerbBook_Show_Fruits5_6);
	Doc_PrintLine(docID,0,HerbBook_Show_Fruits5_7);
};
//================================================================
const string HerbBook_Show_Fruits6_1 = "�� � ������ ������� ��������� ������� ������� ��������, ��� ������ ������� �� ���� ����� ��������� ��� ��������� ������� ���� � ���������� ������������ ������. ";
const string HerbBook_Show_Fruits6_2 = "������ �� ������ ������� ����� ����� �� ������ ������� �� �����������. ";
const string HerbBook_Show_Fruits6_3 = "�� ��������� ������, ����� ������� �������� ��������� � �����, �� ��������� ������� �����, ����� �� ����� ������� ��� �����, ����� ������";

func void HerbBook_Show_Fruits6(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits6_1);
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits6_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_Fruits6_3);
};


//================================================================
const string HerbBook_Show_Herbs1_1 = "�������� �����";
const string HerbBook_Show_Herbs1_2 = "��� ������� � ������������� ������ �������� ��������� ����������, ���������� ������ � ������� ���������� ������������. ������ �����-������� ������ �������� ����, � ��������� ������� ���������� �����-���������� �������, ������ ������� � ����� ����� � ����� �������. �����, ��� �������, ������ � ����������, �� ������ ������� � ������ ��� � ������ ������� � � ��������. ���������� ��� ��� ��������������� ��� ��������, ��� �� ����������� �� �� ���������� �������� ������� ������.";

func void HerbBook_Show_Herbs1(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs1_1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs1_2);
};
//================================================================
const string HerbBook_Show_Herbs2_1 = "� ��������� ���� ������ ��������� ������� �������� �����, ���������, ������ ����, ������ ����, ������ (������ ���������  ������ �����), � ����� ������, �� ������������ �������� ������� �� �������, �� ������� �� ����������, � ������ ����� � ��� ���� ������������.";

func void HerbBook_Show_Herbs2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_HealHerb.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin+10,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs2_1);
};
//================================================================
const string HerbBook_Show_Herbs3_1 = "����������� ��������";
const string HerbBook_Show_Herbs3_2 = "��� �����, ����������� � ���������� ��������� ����������, ������� ���������� � ���� �������� ������ �� ������������ ��� �������� ��������� �����������. ";
const string HerbBook_Show_Herbs3_3 = "�������� ��������, ����������� �����, �������� ��������, �������� ����������� � ��������� ����������, �� ������ ������ �� ��������. ������, ���� ���������� ������ ������ � ������ � ��� ���������� �� �������� �������, ������� ����� ������ � ������ �� ������ ��������� �������� ��� ����. ���-�� ������, � ����� ������� �������, � ������������ ��� ��������� ���, �������� � ������������� �����.";

func void HerbBook_Show_Herbs3(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs3_1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs3_2);
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs3_3);
};
//================================================================
const string HerbBook_Show_Herbs4_1 = "�������� ������� ����-";
const string HerbBook_Show_Herbs4_2 = "������� ������������ ";
const string HerbBook_Show_Herbs4_3 = "�������� �������� ";
const string HerbBook_Show_Herbs4_4 = "������ - �������� ";
const string HerbBook_Show_Herbs4_5 = "������� � ������ ";
const string HerbBook_Show_Herbs4_6 = "�������� ��������� ";
const string HerbBook_Show_Herbs4_7 = "������������. ";
const string HerbBook_Show_Herbs4_8 = "������, ����� ������, ";
const string HerbBook_Show_Herbs4_9 = "��������� ��� ������� ";
const string HerbBook_Show_Herbs4_10 = "����� ����� �������� ";
const string HerbBook_Show_Herbs4_11 = "����������. ";
const string HerbBook_Show_Herbs4_12 = "�������� �������� �������� ������, � ������� ���������� �������� ������� ����� ������. �� ���� ����� ����������� ����� ������� ���������, ��������� �� ������� �� ������ �����, �� � �������� ��������� ����.";

func void HerbBook_Show_Herbs4(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_HealRoot.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin+20,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_1);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_2);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_3);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_4);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_5);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_6);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_7);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_8);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_9);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_10);
	Doc_PrintLine(docID,0,HerbBook_Show_Herbs4_11);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs4_12);
};
//================================================================
const string HerbBook_Show_Herbs5_1 = "���������� �����";
const string HerbBook_Show_Herbs5_2 = "������ �������� ��������� ����������, � ����� ��������� ���� ��������, �� �������� �������� ������������. ���� ��� �������� ��������� ��� � ��������������� ���������� ����. �������� ������ �� ����� ��������� ������, ������� � �������. ������ � ������� �������� ��� �������� �������� �������� ������� ������.";

func void HerbBook_Show_Herbs5(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_FireHerb.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs5_1);
	Doc_PrintLine(docID,0,"");
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs5_2);
};
//================================================================
const string HerbBook_Show_Herbs6_1 = "�������� ������� � ������� ����� �������� ������ ����������� ��������, ���� � ������������� �� �������� ������ �������, �������� � ������ ����� - �������, � �������� ������ - ����� �������. ";
const string HerbBook_Show_Herbs6_2 = "��� ������ ��������������� ���������� ���� �������� ������, ������ �� ��������� �� � ����������, ��� ����� ��� ������ �������� ��������, � � �������������. ��, � ������� �� ����� �����, �������� ����� �� ������ � �����, �� � � ������� ���� � ���� �� �������.";

func void HerbBook_Show_Herbs6(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_CrowHerb.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs6_1);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_Herbs6_2);
};


//================================================================
const string HerbBook_Show_FalseMoss1_1 = "������������";
const string HerbBook_Show_FalseMoss1_2 = "������ ������������ ������ �������� ���������� ������������� ��������� ������������. ";
const string HerbBook_Show_FalseMoss1_3 = "�� ������ ������ ��� ������������� ���������� ������� �������, ��, � ������� �� ��������� ����, ����� ������ ����� � ��������� ������. �������, �������� ������������ ���� ���� ��� ��������, ��������� ������ ������ �� ����� �������� ���� �� ���������� ����� ���� � ����, � ����� �� ������ ������ ������, ������ ��������� �������� ��� ������������ ��������� �����.";

func void HerbBook_Show_FalseMoss1(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,HerbBook_Show_FalseMoss1_1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_FalseMoss1_2);
	Doc_PrintLines(docID,0,HerbBook_Show_FalseMoss1_3);
};
//================================================================
const string HerbBook_Show_FalseMoss2_1 = "������ ������������ ���� ����� � �������� ����, ������ �������� �������, ������� � ���� ������� ��������.";
const string HerbBook_Show_FalseMoss2_2 = "�������� �������� ��� �������� ����� ���������. ������ � ��������� ��� �������� ������� �� ���� �������� ��������� � ����� ������������ ��� ������� ��� ���������, ���������� � ������������� ������� �������.";

func void HerbBook_Show_FalseMoss2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_FalseMoss2_1);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_FalseMoss2_2);
};
//================================================================
const string HerbBook_Show_FalseMoss3_1 = "�������� �� ��������� ������������� ������������ - �������� ������. ������ ������ ������� �������� �������� ��������������� ���������� ���� ��� �������, ��� ������������� ���� �������� � �������� �����. ������������ ��������� ����� �������� ������� � ����������� ����� ������ ����, � ��� �������� ���� �������� ���������� � ��� ������. ������������ ��� �������� ������� �������� �����.";

func void HerbBook_Show_FalseMoss3(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_DragonRoot.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin+160,HerbBook_Right_Margin-2,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_FalseMoss3_1);
};
//================================================================
const string HerbBook_Show_Special1_1 = "������ � ����������� ��������";
const string HerbBook_Show_Special1_2 = "� ��� ������ �� �������� �������� � ������� ����������, � ��� ����� � ��, ������������� ������� ������ �� ��������. �������� �������� ��� ����������� ���� � ��������� ������������ �������� � ��������. ������, � �������, ��������� ����, ����� �������������� ���� �� �����, ���������� ������� ������� ������, ���������� ����� � ������� ������, �������� � �������� ��� �� �������� ���������� ������. �� ��� �� �������� ��������������� �� ������, ���������������� ���� �� ��� ������, ������������� ������� �������� �� ��������.";

func void HerbBook_Show_Special1(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_BookHeadline);
	Doc_PrintLines(docID,0,HerbBook_Show_Special1_1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_Special1_2);
};
//================================================================
const string HerbBook_Show_Special2_1 = "�������� ��������� � ���������������� �� �������� ���� ���� ���� ����� �������� ������� ������ ��� ��������-�����. ������ ��� ���������� ������� ����, ��������� �� ��� ����� ������ �������� � ����� �������� �����������. ��� �� ���� ������� ����� �������� ���� ������ ���������� ��������, �� �������� ��������� �������� ������ ���� � ������� ������������ ���������� � ���������.";
const string HerbBook_Show_Special2_2 = "������-�����, ��������� ����� ������ ������, ����������� �������. ��� ����������� � ��������� ����������. �������� �� ����������� � ������������ �������� �������� ���� �� ����������������� ����. � ������� ������������ ����� � ��������� � ������� ������ �������-����� ��������� ���� ������ �� ���������� ����.";

func void HerbBook_Show_Special2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Empty.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Special2_1);
	Doc_PrintLines(docID,0,HerbBook_Show_Special2_2);
};

//================================================================
const string HerbBook_Show_Special3_1 = "����������� ����� ����� ����������� �����, ��������� ������� ������� ��� �������� ������. ";
const string HerbBook_Show_Special3_2 = "��� ����������� ������ �������� �������� ������� � ������� ������ ��������� ��������� �������� ������ ����. �� �������� ��� � ��������� ����� �������� ���� ����� ������. � ���� �������� � ����������� ��� ��������� ���� � ������� �����, ���������� ��������, ���������� � ������������ �����������, � ����� �������� � ����.";

func void HerbBook_Show_Special3(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Crown.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin+10,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_Special3_1);
	Doc_PrintLines(docID,0,HerbBook_Show_Special3_2);
};

//================================================================
const string HerbBook_Show_End_1 = "�������, � ���� ����� �� ���������� ������ �� ��� ���� ������, ����� ������� �������������� �� �����, � �����, �������� ��� ���� ����. �������� ������ �� ���, � ����� � ���� �� �������������, ������ ����� ��������� ������� ������������ ����� ����.";
const string HerbBook_Show_End_2 = "�������,";
const string HerbBook_Show_End_3 = "��������� ��������� �������";

func void HerbBook_Show_End(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"HerbBook_Final.tga",0);
	
	Doc_SetMargins(docID,0,HerbBook_Left_Margin,HerbBook_Top_Margin,HerbBook_Right_Margin,HerbBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_Book);
	Doc_PrintLines(docID,0,HerbBook_Show_End_1);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,HerbBook_Show_End_2);
	Doc_PrintLines(docID,0,HerbBook_Show_End_3);
};


//================================================================
func void HerbBook_Print(var int docID, var int page)
{
	if (Page == 0)	{	HerbBook_Show_Cover(docID);	}	else
	if (Page == 1)	{	HerbBook_Show_Summary(docID);	}	else
	if (Page == 2)	{	HerbBook_Show_Summary2(docID);	}	else
	if (Page == 3)	{	HerbBook_Show_Fruits1(docID);	}	else
	if (Page == 4)	{	HerbBook_Show_Fruits2(docID);	}	else
	if (Page == 5)	{	HerbBook_Show_Fruits3(docID);	}	else
	if (Page == 6)	{	HerbBook_Show_Fruits4(docID);	}	else
	if (Page == 7)	{	HerbBook_Show_Fruits5(docID);	}	else
	if (Page == 8)	{	HerbBook_Show_Fruits6(docID);	}	else
	if (Page == 9)	{	HerbBook_Show_Herbs1(docID);	}	else
	if (Page == 10)	{	HerbBook_Show_Herbs2(docID);	}	else
	if (Page == 11)	{	HerbBook_Show_Herbs3(docID);	}	else
	if (Page == 12)	{	HerbBook_Show_Herbs4(docID);	}	else
	if (Page == 13)	{	HerbBook_Show_Herbs5(docID);	}	else
	if (Page == 14)	{	HerbBook_Show_Herbs6(docID);	}	else
	if (Page == 15)	{	HerbBook_Show_FalseMoss1(docID);	}	else
	if (Page == 16)	{	HerbBook_Show_FalseMoss2(docID);	}	else
	if (Page == 17)	{	HerbBook_Show_FalseMoss3(docID);	}	else
	if (Page == 18)	{	HerbBook_Show_Special1(docID);	}	else
	if (Page == 19)	{	HerbBook_Show_Special2(docID);	}	else
	if (Page == 20)	{	HerbBook_Show_Special3(docID);	}	else

	if (Page == 21)	{	HerbBook_Show_End(docID);	};
	HerbBook_Page = page;
};

//================================================================
func void Use_HerbBook()
{
	if(Npc_IsPlayer(self))
	{
		MultiBook_Start(HerbBook_Page, HerbBook_PageMax, HerbBook_Print);
		if (!Read_HerbBook_Once)	{
			Read_HerbBook_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand * 10);
		};
	};
};

