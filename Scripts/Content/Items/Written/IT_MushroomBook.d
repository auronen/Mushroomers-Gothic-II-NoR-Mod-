
instance ItWr_MushroomBook(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	
	visual = "ItWr_Book_Green.3DS";
	material = MAT_LEATHER;
	
	description = "����� ��������";
	text[2] = "����� �������� �����������.";
	text[3] = "��� ���� �� ������ � ������� ��������.";
	
	
	scemeName = "MAP";
	on_state[0] = Use_MushroomBook;
};

const Int MRBook_Top_Margin = 50;
const Int MRBook_Btm_Margin = 50;

var int MRBook_Page;
const int MRBook_PageMax = 27;

//================================================================
const string MRBook_Show_Cover_1 = "            � � � � �";
const string MRBook_Show_Cover_2 = "        � � � � � � � �";
const string MRBook_Show_Cover_3 = "   ����������: �������, Home, End";

func void MRBook_Show_Cover(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"Book_Green_Title.tga",0);
	
	Doc_SetMargins(docID,0,100,205,100,35,1);
	Doc_SetFont(docID,0,FONT_Screen);
	Doc_PrintLine(docID,0,MRBook_Show_Cover_1);
	Doc_PrintLine(docID,0,MRBook_Show_Cover_2);
	Doc_SetFont(docID,0,FONT_ScreenSmall);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,MRBook_Show_Cover_3);
};
//================================================================
const string MRBook_Show_Title_1 = "��� ��������� ";
const string MRBook_Show_Title_2 = "� ���� ���������������";
const string MRBook_Show_Title_3 = "�� �������� ����� � ������";
const string MRBook_Show_Title_4 = "    ����� ��������";
const string MRBook_Show_Title_5 = "                ������ �����������, ���������";
const string MRBook_Show_Title_6 = "                        �� �������� �������������";
const string MRBook_Show_Title_7 = "                         � �������� ������ �������";

func void MRBook_Show_Title(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Title_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Title_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,30,MRBook_Btm_Margin,1);

	Doc_SetMargins(docID,-1,30,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_Calligraphic);
	var string BestName;
	Doc_PrintLine(docID,1,MRBook_Show_Title_1);
	BestName = "������ ";
	if (C_HeroIs_Elena())	{	BestName = ConcatStrings(BestName, "�����");	}	else
	if (C_HeroIs_Erol())	{	BestName = ConcatStrings(BestName, "���������� �����");	}	else
	if (C_HeroIs_Odo())		{	BestName = ConcatStrings(BestName, "���");	}	else
	if (C_HeroIs_Rupert())	{	BestName = ConcatStrings(BestName, "�������");	}	else
	if (C_HeroIs_Sarah())	{	BestName = ConcatStrings(BestName, "����");	}	else
	if (C_HeroIs_Talbin())	{	BestName = ConcatStrings(BestName, "�������");	}	else
	if (C_HeroIs_Till())	{	BestName = ConcatStrings(BestName, "�����");	};
	BestName = ConcatStrings(BestName, ",");
	Doc_PrintLine(docID,1,BestName);
	if (hero.aivar[AIV_Gender] == FEMALE)	{
		BestName = "������ ����� ��������� ������,";
	}
	else	{
		BestName = "������� ����� ��������� ������,";
	};
	Doc_PrintLine(docID,1,BestName);
	Doc_PrintLine(docID,1,MRBook_Show_Title_2);
	Doc_PrintLine(docID,1,MRBook_Show_Title_3);
	Doc_SetFont(docID,1,FONT_BookHeadline);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,MRBook_Show_Title_4);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,MRBook_Show_Title_5);
	Doc_PrintLine(docID,1,MRBook_Show_Title_6);
	Doc_PrintLine(docID,1,MRBook_Show_Title_7);
};
//================================================================
const string MRBook_Show_Summary_1 = "������� ��� ��������, ����������, ������������� ��������, �� ���� ������� �� ��� ������ ������� � ������ ������.";
const string MRBook_Show_Summary_2 = "����� ��������� ���� ����� ��������� ���� ��������. ���� �� ���, ����� ��� ������ � ������, ������ ������� ������� �����. � ������ ����� ���� ���������� �������������.";
const string MRBook_Show_Summary_3 = "������ ������� ������� ������� ������ ����� �� �������� ���� �����, �� ��������������� � ������� ������������� ����������.";
const string MRBook_Show_Summary_4 = "    ��������";
const string MRBook_Show_Summary_5 = "  �����������, ����� ��������� �� ��������� � ��������. � ��, � ������ ����� ����� ���� ���������� � �������. ������������ � ������ �� ����� ������� �� ������ �������, �� � ����������, ��� ������������ � ���������� ����. � ���� ������� �� ����� ��������������, ��������, ����� ����������� �����������.";
const string MRBook_Show_Summary_6 = "  ��������� �������������� ���� ��������� ������������ �� ������������ ������, �������� ����������. ������ ������������ ����� ��������, �������� �������� ����� ���� ������ ����� ������, ���������� ���� �������.";

func void MRBook_Show_Summary(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Sum_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Sum_R.tga",0);
	
	Doc_SetMargins(docID,0,160,MRBook_Top_Margin + 20,MRBook_Btm_Margin,35,1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLines(docID,0,MRBook_Show_Summary_1);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Summary_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Summary_3);

	Doc_SetMargins(docID,-1,35,MRBook_Top_Margin,150,50,1);
	Doc_SetFont(docID,1,FONT_MRHeadline);
	Doc_PrintLine(docID,1,MRBook_Show_Summary_4);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Summary_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Summary_6);
};
//================================================================
const string MRBook_Show_Intro1_1 = "  �������� �������� ����� �������� ��������� ����� (��������) � ��������� (���� �����).";
const string MRBook_Show_Intro1_2 = "  �������� �������� ���� �������� ���� �����. ��� �������, ��� ������� �� ������ � �����, ���� ���� � ����������. ������ � ����� ����� ���� ��������, ��� � ��������, ��� ����� ������������� ���� �� �����, ��� � ������ ������.";
const string MRBook_Show_Intro1_3 = "  ������ ����� ������������ �������� ����������� ������ �������� ������� ��������, ���� �������� ������ �� ���� �������, ��� �� ����������� ����������� ������� ����� ��������� ����� �����. �� ������ ��� ���� ��������.";
const string MRBook_Show_Intro1_4 = "  ����������� ���� ������ ������������� �� ������ ����� ������ � ����� ����� ��������� �����. ���� ����� ����������� ����� � ������������ �����, ����� �������� ����������, �������� (���������), ������� � ������, ����� ������ �����. � �������� ����� ������ ����� �������� �������� �����, ���������� ����������� � �������� ����������� ����. � ��������� ������, ����� ��� ���������� ��������, ����������� ���� ������������� �� ���� ����������� ������.";

func void MRBook_Show_Intro1(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Intro1_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Intro1_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,35,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLines(docID,0,MRBook_Show_Intro1_1);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Intro1_2);

	Doc_SetMargins(docID,-1,35,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Intro1_3);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Intro1_4);
};
//================================================================
const string MRBook_Show_Intro2_1 = "  ������ ����� �������� ����� ������ ����, �������, ��������, ���������� � ���������� �� � �������. ����� ����� ������� �������� ����������� ��� �������������. �� �������� ������������ ���������� �������, � ����� ���������� ��� ������� ������.";
const string MRBook_Show_Intro2_2 = "  ������� ������ �� ������ �������� ��������. �� ��� ��� �������� �������� ������, ������� �� �������� ����� � ���������, ��� �������� � ��������� ������ ����� ����������. ���� ������� ����� ������� ����������.";
const string MRBook_Show_Intro2_3 = "  ��������� ������ �� ������������� ��������. ������� ������������� ��������� � ����������, � ������� �� ��� ����� ������, ������������ � �������.";
const string MRBook_Show_Intro2_4 = "������� ������ ���������, ����� ������ �������� �� ����, ��� ��� ��� ������. ��� � ��������, ����� ������������ � �����, ���� �� ������ ��������� � ����� ��������� �����, �������� ������ - ��������. ������������ ����� ����� ������� ���������: ����������� �������� - �������. � ��������, � ����� �� �������� �������������.";
const string MRBook_Show_Intro2_5 = "  ������ ����� �� ����� ������ ����������� ������ �������� - ������� ������� � �������. ���� �������� ��������� � �����, �� ����� ������������ ���������� �����. �� ����� ����� ������ ���������� ����.";
const string MRBook_Show_Intro2_6 = "  �� ������� ����� � ����� ������ ������������ ����������, ������ � ����������� � ��������.";

func void MRBook_Show_Intro2(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Intro2_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Intro2_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLines(docID,0,MRBook_Show_Intro2_1);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Intro2_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Intro2_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Intro2_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Intro2_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Intro2_6);
};
//================================================================
const string MRBook_Show_MR_01_1 = "            ������ ����";
const string MRBook_Show_MR_01_2 = "������ ����";
const string MRBook_Show_MR_01_3 = "��������: ���� ������� ��������, � ������ ������� � ����� ���������, ������� �������. ����� ������-�����, � ���������� ��� ����������� ��������. ����������� ���� ������������, ������.";
const string MRBook_Show_MR_01_4 = "����� ����������� ������ ����� � ����������� ����. ";
const string MRBook_Show_MR_01_5 = "���������������: ���� �� �������� ���������������� ������ �� �������. ������ ����� ������ ����� �����������, � ��� ����� � �������.";
const string MRBook_Show_MR_01_6 = "�����: �������������.";
const string MRBook_Show_MR_01_7 = "��������: �������� �������� ���������. ��� ���������� ������������ �������� ���������� �������. ������� ���������������� �������� � ���������� �������� ��������, ������� ������������.";
const string MRBook_Show_MR_01_8 = "���������� �� ������ ����� ������������ ��� ������������� �����, ���������� ���������� �����������.";

func void MRBook_Show_MR_01(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_MR01_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_MR01_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_MR_01_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLine(docID,0,MRBook_Show_MR_01_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_MR_01_3);
	Doc_PrintLines(docID,0,MRBook_Show_MR_01_4);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_MR_01_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_MR_01_6);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_MR_01_7);
	Doc_PrintLines(docID,1,MRBook_Show_MR_01_8);
};
//================================================================
const string MRBook_Show_MR_02_1 = "           ������ ����";
const string MRBook_Show_MR_02_2 = "���� ��������, ������� ����";
const string MRBook_Show_MR_02_3 = "��������: ������� ���� �� ������� ������� ������� � ������. ������� ������ ��������� ���� �������. ����������� ���� ������������, ������.";
const string MRBook_Show_MR_02_4 = "���������������: ������ ����������� � ����� � ���������� ������, ����� ����������� � �����������. ";
const string MRBook_Show_MR_02_5 = "�����: �������������.";
const string MRBook_Show_MR_02_6 = "��������: ����������� ����������� ����, ��������� �������� ������� ����� ��� ����� ����. �������� ������� �����������. ���������� ������ ��������� ����� �� ������� �����, �� �� ������ ��������.";

func void MRBook_Show_MR_02(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_MR02_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_MR02_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_MR_02_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_MR_02_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_MR_02_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_MR_02_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_MR_02_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_MR_02_6);
};
//================================================================
const string MRBook_Show_Red_1 = "       ������� ������ ����";
const string MRBook_Show_Red_2 = "������, ���������, ���������";
const string MRBook_Show_Red_3 = "��������: ���� ������� �������� � ����-������� ����������� ������� � ������ ����� ������. ����������� ���� ������������, ����� ��� �������.";
const string MRBook_Show_Red_4 = "���������������: ������ �������������. ���� ����� ����������� � ������ ��������, ���� �� �����.";
const string MRBook_Show_Red_5 = "�����: �����.";
const string MRBook_Show_Red_6 = "��������: ������ ������������� � ���� ����� ���������. ��� �� ���� ��������� � ����������. �������� ������� �����������. ���������� � ������� ����������.";

func void MRBook_Show_Red(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Red_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Red_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Red_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Red_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Red_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Red_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Red_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Red_6);
};
//================================================================
const string MRBook_Show_Piny_1 = "            �������� ����";
const string MRBook_Show_Piny_2 = "��������";
const string MRBook_Show_Piny_3 = "  ��������: ��������� ����. ������ � ������ ����������, �� ����� ������-�������. ����� �����, � ��������� ���������� � ������� ������ � ��������. ����������� ���� ������������, �����.";
const string MRBook_Show_Piny_4 = "  ���������������: ���� ����� ������ ����� �����, ��� �� ������� �������������� �������.";
const string MRBook_Show_Piny_5 = "  �����: ����-�����.";
const string MRBook_Show_Piny_6 = "  ��������: ��������. �������� ������ �������� ��������. �������� ������� �����������. ������������ ��� �������������� ���������� ���������� ����� ������� ��������.";

func void MRBook_Show_Piny(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Pin_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Pin_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Piny_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Piny_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Piny_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Piny_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Piny_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Piny_6);
};
//================================================================
const string MRBook_Show_BrownOiler_1 = "           ������ ������";
const string MRBook_Show_BrownOiler_2 = "���������� ������, ����������";
const string MRBook_Show_BrownOiler_3 = "��������: ������ ������� ����������, � ����������� ����������� �������. � ������ ������ ������� ��������� ���� � ����� ������������� ������. ����� ���������, �����. ����������� ���� ������������, ������-������ ��� �����.";
const string MRBook_Show_BrownOiler_4 = "���������������: ���� ����� ������ ��� �����, � ���������� ������, ���� - ��� ������� ���������.";
const string MRBook_Show_BrownOiler_5 = "�����: �����, �����.";
const string MRBook_Show_BrownOiler_6 = "��������: ��������. �������� ������� �����������. ������������ ��� ������������� ���� �� ��������� � �������� �� �����.";

func void MRBook_Show_BrownOiler(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Oil_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Oil_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_BrownOiler_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_BrownOiler_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_BrownOiler_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_BrownOiler_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_BrownOiler_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_BrownOiler_6);
};
//================================================================
const string MRBook_Show_Stone_1 = "          ������������ ����";
const string MRBook_Show_Stone_2 = "�������, �������";
const string MRBook_Show_Stone_3 = "��������: ������-����� ��� ������-���������� ���� ���������� �����. ����� ����������� �����������. ������ ���� ���������� ��������� ������, �� �� ����� ������. ����������� ���� ������������, ������.";
const string MRBook_Show_Stone_4 = "���������������: �������� ������������ � ������, �� ����� � ���������� �����. ����� ��������� ��������� ��������. ����� ��������� �������� �� 2-3 �����.";
const string MRBook_Show_Stone_5 = "�����: �������������.";
const string MRBook_Show_Stone_6 = "��������: ��������. ��������������� ���������� � ���������� ����. ��� ������������ � ������� ����������� ����� ������� ������������ �������. �������� � ����� ����� ��������� ������ ��������� �����.";

func void MRBook_Show_Stone(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Stn_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Stn_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Stone_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Stone_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Stone_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Stone_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Stone_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Stone_6);
};
//================================================================
const string MRBook_Show_Governor_1 = "        �������������� ����";
const string MRBook_Show_Governor_2 = "����������";
const string MRBook_Show_Governor_3 = "��������: ������� ���� � ���������� �������. ����������� ���� ������������, �����. ����� �����, � ������ ��������� ����������.";
const string MRBook_Show_Governor_4 = "��������� ������������� �������� �����. ���  ������� � �������� ������ � ����� ��������� ����������� ���������� ����� ������ �� ������������ �������� �������� ��������. �������� � ������� ������ ����������� �� �����������, �� �������� ����������� ������ ����������� �� ������. ";
const string MRBook_Show_Governor_5 = "���������������: ������ � ������� ������ ��������, �� � ��������� �� �������� � ������ ��������.";
const string MRBook_Show_Governor_6 = "�����: ����� ����-�����.";
const string MRBook_Show_Governor_7 = "��������: ��������. �������� ������� �����������. ���������� �������, ��� ���, ��� ����� ����� 28 ����� ������, ����� ������� ������� �����������. � ������� ����������� �� ������������.";

func void MRBook_Show_Governor(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Gov_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Gov_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Governor_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Governor_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Governor_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Governor_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Governor_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Governor_6);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Governor_7);
};
//================================================================
const string MRBook_Show_Sunrise_1 = "            ������ ������";
const string MRBook_Show_Sunrise_2 = "�������";
const string MRBook_Show_Sunrise_3 = "��������: ������ ��� ��������� ���� ������������� ����� � ��������� ������. ������ � ����� �������. �� ������ ����� ����� ������ ������� ��� ���������� ������. ����������� ���� ����������, ������ � ������� � ������ �����.";
const string MRBook_Show_Sunrise_4 = "���������������: ��������� ����� �������. ������ ��������������� �� �������� ������������.";
const string MRBook_Show_Sunrise_5 = "�����: �����-����.";
const string MRBook_Show_Sunrise_6 = "��������: �������-��������. � ����� ���� �������� ��������, �� �������� ��������� ����������. ��� ������� ��������� ���������� ������ ����� ��������������.";

func void MRBook_Show_Sunrise(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Snr_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Snr_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Sunrise_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Sunrise_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Sunrise_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Sunrise_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Sunrise_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Sunrise_6);
};
//================================================================
const string MRBook_Show_Foggy_1 = "            ����� ������";
const string MRBook_Show_Foggy_2 = "��������, ���������� ����";
const string MRBook_Show_Foggy_3 = "��������: ����� ������������� ���� �� ������-����������� ���������. ����� � ������ �������. ����������� ���� ����������. ������� � � ����� ������ �����, ��� ������ ������. ��� ���������� ������ ������� � ����������� �� �����, ����� ������������ � �����.";
const string MRBook_Show_Foggy_4 = "���������������: ������ � ������ ����� ������, ��� ������������ �����. ����� ����� ��������� �� ���������, �������.";
const string MRBook_Show_Foggy_5 = "�����: �����.";
const string MRBook_Show_Foggy_6 = "��������: ����������! �������� ������� ����������, ���������������� ��������������� � ��������� ������, �� ��������� ������ �����.";
const string MRBook_Show_Foggy_7 = "� ������� ����������, ���� ��� ������������� ����.";

func void MRBook_Show_Foggy(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Fog_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Fog_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Foggy_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Foggy_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Foggy_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Foggy_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Foggy_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Foggy_6);
	Doc_PrintLines(docID,1,MRBook_Show_Foggy_7);
};
//================================================================
const string MRBook_Show_LadysEar_1 = "      ��������� ������� ����";
const string MRBook_Show_LadysEar_2 = "������� ����";
const string MRBook_Show_LadysEar_3 = "  ��������: ������� ������������� ����, ������ ��������� ���������� ������������ ���. ����������� ���� ����������, ����� ����������, �����������.";
const string MRBook_Show_LadysEar_4 = "  ���������������: ������ �� �������� � ����, ���� ����� ������. ������� ��������� ������� ������ ������.";
const string MRBook_Show_LadysEar_5 = "  �����: ����-������ �����.";
const string MRBook_Show_LadysEar_6 = "  ��������: �������-��������. � ����� ���� �������� ���������� �����������, �� �� ���� ������ �������� ��������� ��������.";

func void MRBook_Show_LadysEar(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Ear_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Ear_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_LadysEar_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_LadysEar_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_LadysEar_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_LadysEar_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_LadysEar_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_LadysEar_6);
};
//================================================================
const string MRBook_Show_Keil_1 = "             ������� ����";
const string MRBook_Show_Keil_2 = "��������, ��������";
const string MRBook_Show_Keil_3 = "��������: ����� ������� ���� ��������, ����� �������. ��������� ���� ����� �������� ��������� ��� ��������� �������, � ������ �� �������� �������� � ���������. � �������� ����� ������ ���������� � ����� ������, ����� ������, ����. ";
const string MRBook_Show_Keil_4 = "� ������� 4-7 ���� �� ������ ���������� ������� ������ ����� � ��� ������������. ������� ������ ������, ��������, ������������ - �������, �������������. ����� �����. ����������� ���� ���������, ����������, ���������.";
const string MRBook_Show_Keil_5 = "���������������: ������ � ������ ��������, ����� ����� ������������. � ��� �� ������ ����� ������� ����� ������, ��-�� ���� ���� ���� ������ ������������.";
const string MRBook_Show_Keil_6 = "�����: ����-�����.";
const string MRBook_Show_Keil_7 = "��������: ������������� ������ ������� �������������� �����, ��������� �������� ���� ��������. ������������ ����� ���������� ������� �������� � ������ ��� �������� ��������.";

func void MRBook_Show_Keil(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_KL_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_KL_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Keil_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Keil_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Keil_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,140,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Keil_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Keil_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Keil_6);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Keil_7);
};
//================================================================
const string MRBook_Show_Bottle_1 = "        ����������� �������";
const string MRBook_Show_Bottle_2 = "����������, ���������";
const string MRBook_Show_Bottle_3 = "��������: ����� ����� �� ����� ���������� ������ �������, � ������ - ���������� ������� ������. ����� �������, ����� �� �����. ����������� ���� �����������, ����� ��������� � ���� �����, ������� ���������� ��� ����������.";
const string MRBook_Show_Bottle_4 = "���������������: ������ �� �����, �� ����� ����������� �������������. ����� ����������� � �������� ����������, ������ �����.";
const string MRBook_Show_Bottle_5 = "�����: �����-�����.";
const string MRBook_Show_Bottle_6 = "��������: �������� ������ ����� �����. ������ �������� ����������, � ��� ������������ � ������� ����������� - ������� ����. � ������� ����������� ��� ����� �����, �� ��������.";

func void MRBook_Show_Bottle(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Btl_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Btl_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Bottle_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Bottle_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Bottle_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Bottle_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Bottle_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Bottle_6);
	
	Hero_Knows_Bottle = TRUE;
};
//================================================================
const string MRBook_Show_Trident_1 = "        ���������� ��������";
const string MRBook_Show_Trident_2 = "��������";
const string MRBook_Show_Trident_3 = "��������: ������������ �����  ��������� ������� ����. ����������� ���� ������ ���� ���� ������. ������ ����������, ���������� �����. ����� ����-�������.";
const string MRBook_Show_Trident_4 = "                     ����������� ����,";
const string MRBook_Show_Trident_5 = "                     �������� ��������� ";
const string MRBook_Show_Trident_6 = "                     � ��������, �������-";
const string MRBook_Show_Trident_7 = "                     ������ �� ����";
const string MRBook_Show_Trident_8 = "                     ����������� ������.";
const string MRBook_Show_Trident_9 = "���������������: ���� ��������� � ����� � ������ ��������, �� � ����� ������ ��� ����� ��������� ��� ������.";
const string MRBook_Show_Trident_10 = "�����: ����-�����.";
const string MRBook_Show_Trident_11 = "��������: �������-��������, � ����� ���� �������� �������� � �������� �����������. ��� ������������ � ���� ��������� ���������� �� ����� ���� ����� � ���� �����. � ������� ������������ ��� ������������� ��� �������� ����� � �������, ��� � ����.";

func void MRBook_Show_Trident(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Tri_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Tri_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Trident_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Trident_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Trident_3);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,MRBook_Show_Trident_4);
	Doc_PrintLine(docID,0,MRBook_Show_Trident_5);
	Doc_PrintLine(docID,0,MRBook_Show_Trident_6);
	Doc_PrintLine(docID,0,MRBook_Show_Trident_7);
	Doc_PrintLine(docID,0,MRBook_Show_Trident_8);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Trident_9);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Trident_10);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Trident_11);
};
//================================================================
const string MRBook_Show_Branch_1 = "           ��������� ����";
const string MRBook_Show_Branch_2 = "��������, ��������� ����";
const string MRBook_Show_Branch_3 = "��������: ����, ����������� ����� ������. ���� ����� ����-������� ��� ����-����������, ����� ������� � ���������. ";
const string MRBook_Show_Branch_4 = "����������� ���� �������, ";
const string MRBook_Show_Branch_5 = "��������� �������� ������ ";
const string MRBook_Show_Branch_6 = "�����.";
const string MRBook_Show_Branch_7 = "���������������: ����������� ���������� �����, � ������� ����� ��� �������� ����������.";
const string MRBook_Show_Branch_8 = "�����: ����-�����.";
const string MRBook_Show_Branch_9 = "��������: ��������, ����� ���������� ����. �������� ������� ������ ��������, �� ������� ������� ������� ��� ������� ��������.";

func void MRBook_Show_Branch(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Brch_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Brch_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Branch_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Branch_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Branch_3);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,0,MRBook_Show_Branch_4);
	Doc_PrintLine(docID,0,MRBook_Show_Branch_5);
	Doc_PrintLine(docID,0,MRBook_Show_Branch_6);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Branch_7);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Branch_8);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Branch_9);
};
//================================================================
const string MRBook_Show_DragonTears_1 = "           ��������� �����";
const string MRBook_Show_DragonTears_2 = "��������: ���� � ���� ���������� ����� ��� ������� ������� �� ������ ����� �����. � ��������� ����� ������ ��������� ��������� �������������� ������, � ������� ��� �������� � ������������ � �����. ����� ��� �������� ������������� ��� ������ ����������.";
const string MRBook_Show_DragonTears_3 = "���������������: ����������� �����, � ������� � ��������, ������ �����������, ������.";
const string MRBook_Show_DragonTears_4 = "�����: �����-�����.";
const string MRBook_Show_DragonTears_5 = "��������: ������! ����� � ����� ��������� ����� � ���� ��� ��������� �� ���� �������� ������� �����������. ���-��� ��������� ����� ����� �������� � ���������� ������. ������������ ��� ������������� ����������������� ����, � ����� ����� - ��� ��������� �������� �������� �����.";

func void MRBook_Show_DragonTears(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Drg_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Drg_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_DragonTears_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_DragonTears_2);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_DragonTears_3);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_DragonTears_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_DragonTears_5);
};
//================================================================
const string MRBook_Show_NightSparcles_1 = "             ������ �����";
const string MRBook_Show_NightSparcles_2 = "��������: ��������� ����, ����� ������ � ������. ������-��������� ����� �� ����� ������ �����. � ������� �������� �������� �������. ����� ����� ������ ������ �������� �� 10-15 ����.";
const string MRBook_Show_NightSparcles_3 = "���������������: ��� ����� ������ ������ �����! ��� ��������� �� ��� ���������� ����� ����������, ��������� ����-������� �����. ����� ����� �� ���� � ���������� ������� ��������.";
const string MRBook_Show_NightSparcles_4 = "�����: ����-�����.";
const string MRBook_Show_NightSparcles_5 = "��������: ������ ������������ ����! ������������ ��� ������������� ���� �������� ����� � �����. � ���������, ������� ����� ��� �������� �������������. � ����� ���� �������� ������ �������� ��������. ������� ������������� � �������� ��������, ��������� ����� ���������� �������. �������� ���������� ���� ������ - ��������� ���������� � ���������������!";

func void MRBook_Show_NightSparcles(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Nsp_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Nsp_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_NightSparcles_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_NightSparcles_2);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_NightSparcles_3);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_NightSparcles_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_NightSparcles_5);
	if (MIS_Cookery_AskSpices && !MIS_Cookery_SpicesGiven && !MIS_Cookery_NSparclesKnown)	{
		B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_NSparklesKnown);
		MIS_Cookery_NSparclesKnown = TRUE;
	};
};
//================================================================
const string MRBook_Show_GoldPlate_1 = "              ������� ����";
const string MRBook_Show_GoldPlate_2 = "������� �����";
const string MRBook_Show_GoldPlate_3 = "��������: ������� ���������� ���� ������������ �����, ���������-������� ��� ���������� ����� � �������� �������� � �������� �������. ����� �����������.";
const string MRBook_Show_GoldPlate_4 = "���������������: ����������� � ������ � ������� ������������� ���������� �������.";
const string MRBook_Show_GoldPlate_5 = "�����: ������ �����.";
const string MRBook_Show_GoldPlate_6 = "��������: ����������� ������ � ������ ����. ��� �� ���� ��������� ���� ������ �������� ������, �� ����� ������� ������� ��� ���������� ����� � �������. ��������� ����� ����� �������� ������� ���������, ��������� �������� � ��������������. ������ ������� �������� ���������� ������� ����������.";

func void MRBook_Show_GoldPlate(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Gld_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Gld_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_GoldPlate_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_GoldPlate_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_GoldPlate_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_GoldPlate_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_GoldPlate_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_GoldPlate_6);
};
//================================================================
const string MRBook_Show_Ivy_1 = "             ������ ����";
const string MRBook_Show_Ivy_2 = "��������";
const string MRBook_Show_Ivy_3 = "��������: ��������� ���� � ����� ������ � �����-���������� �������. �� ����� ����� ������ �� 2-4 �����. ������ ������� ����������, ���������� ������������, ���� ����� ���������� �����. ����������� ���� ���������, �����.";
const string MRBook_Show_Ivy_4 = "���������������: ������ ���� ����������� ������������� �� ������ � ������, ����� �������� �����. ��� ����� ����� � � ������, � � ����� ���������.";
const string MRBook_Show_Ivy_5 = "�����: �����-����.";
const string MRBook_Show_Ivy_6 = "��������: � ����� ���� ����������� �� ��������� �������, �� � ����� � ������� ������ �������� ���������� ����������.";

func void MRBook_Show_Ivy(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Ivy_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Ivy_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Ivy_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Ivy_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Ivy_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Ivy_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Ivy_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Ivy_6);
};
//================================================================
const string MRBook_Show_Violet_1 = "         ���������� �������";
const string MRBook_Show_Violet_2 = "��������� �������";
const string MRBook_Show_Violet_3 = "��������: ��������� ���� ����-����������� ������. ������ ����������, ����� ������, �� �� ����� �������, � ��������� ������� �� ��������. � ������� ��������� ������ ��������. ����������� ���� ������������.";
const string MRBook_Show_Violet_4 = "���������������: ��������� �� ������ ���������: �������� ��������, ����, ������ ����������. ������������ ���������� ��� ����������� �����, ������� ��������� � ������.";
const string MRBook_Show_Violet_5 = "�����: �������������.";
const string MRBook_Show_Violet_6 = "��������: �������� ����! �� � ���� ������ ������ ����������� � ����, ���� ��������� ������� �������� � ���������� ������. ������������ ��� ������������� ���������� ����.";

func void MRBook_Show_Violet(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Vlt_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Vlt_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Violet_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Violet_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Violet_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Violet_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Violet_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Violet_6);
};
//================================================================
const string MRBook_Show_Gray_1 = "            ����� �������";
const string MRBook_Show_Gray_2 = "�������� �������";
const string MRBook_Show_Gray_3 = "��������: ������� ������ ����, ������������ ������ ������. ������ ���������� �����, ����������� ���� ������������.";
const string MRBook_Show_Gray_4 = "���������������: ����� ������� ������ �����������, � ����� � ������ ������, ��� ������� �������� � � �������, ������ �������� ��������.";
const string MRBook_Show_Gray_5 = "�����: �������������.";
const string MRBook_Show_Gray_6 = "��������: �������� ����! �������� ��������������, �������, �����, ������������, ������ ������ ����� ������������ � ������� ����������� �������. � ������� ����������� ���������. ������� ������������� � ������� ��� ������������ ����, �������, �� ���������.";

func void MRBook_Show_Gray(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Gray_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Gray_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Gray_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Gray_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Gray_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Gray_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Gray_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Gray_6);
};
//================================================================
const string MRBook_Show_Idle_1 = "     ������� � ����� �������";
const string MRBook_Show_Idle_2 = "��������: ��� ����� ������ ������ ������� ����� �������.";
const string MRBook_Show_Idle_3 = "����� �����, ������� � ����� ������. ������ ������� ��� ���������������, � ������� ��������� ������ ����. ����������� ���� ������������, �����.";
const string MRBook_Show_Idle_4 = "���������������: ������� ����� ����������� � �������, ���� - � ���� ��������.";
const string MRBook_Show_Idle_5 = "�����: �������������.";
const string MRBook_Show_Idle_6 = "��������: ����������� �� �������� ������, ����� ����� ������ �������� � ����������� � �����. ����������. �������� ������ ����������, ����������� ������ ����������.";

func void MRBook_Show_Idle(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Idle_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Idle_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Idle_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Idle_2);
	Doc_PrintLines(docID,0,MRBook_Show_Idle_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Idle_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Idle_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Idle_6);
};
//================================================================
const string MRBook_Show_Polypore_1 = "           ��������� ����";
const string MRBook_Show_Polypore_2 = "��������� �����";
const string MRBook_Show_Polypore_3 = "��������: ������ �����-���� ��������� �����. ������ ������ �������, �������������, ����� ������� � ������� ��� ���������� ��������. ����������� ���� ���������, �������, ���� �� �����, ��� � ��� ������.";
const string MRBook_Show_Polypore_4 = "���������������: ��������� �����, ��� ������� �� ��������, ������������ �� ������� ��������, ��� �����, ��� � ����������. � ������� �� ������� ������, ��������� ������ � ������� ����������� �������, ������ ���������� �������� ���. �������������, ��� ��� ������� �� ����������� � �������� ������.";
const string MRBook_Show_Polypore_5 = "�����: �������������.";
const string MRBook_Show_Polypore_6 = "��������: ������ ��������� ������ ����������, �� ���������� ������ ����� � ����� �������������� ��� ������������ �����.";

func void MRBook_Show_Polypore(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Baum_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Baum_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,MRBook_Show_Polypore_1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,MRBook_Show_Polypore_2);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,MRBook_Show_Polypore_3);

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,MRBook_Show_Polypore_4);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Polypore_5);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,MRBook_Show_Polypore_6);
};
/*
//================================================================
func void MRBook_Show_Template(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Green_L.tga",0);
	Doc_SetPage(docID,1,"Book_Green_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"                             ");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  ");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"  ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  ");
};
//*/

//================================================================
func void MRBook_Print(var int docID, var int page)
{
	if (Page == 0)	{	MRBook_Show_Cover(docID);	}	else
	if (Page == 1)	{	MRBook_Show_Title(docID);	}	else
	if (Page == 2)	{	MRBook_Show_Summary(docID);	}	else
	if (Page == 3)	{	MRBook_Show_Intro1(docID);	}	else
	if (Page == 4)	{	MRBook_Show_Intro2(docID);	}	else
	
	if (Page == 5)	{	MRBook_Show_MR_01(docID);	}	else
	if (Page == 6)	{	MRBook_Show_MR_02(docID);	}	else
	if (Page == 7)	{	MRBook_Show_Red(docID);	}	else
	if (Page == 8)	{	MRBook_Show_Piny(docID);	}	else
	if (Page == 9)	{	MRBook_Show_BrownOiler(docID);	}	else
	if (Page == 10)	{	MRBook_Show_Stone(docID);	}	else
	if (Page == 11)	{	MRBook_Show_Governor(docID);	}	else
	if (Page == 12)	{	MRBook_Show_Sunrise(docID);	}	else
	if (Page == 13)	{	MRBook_Show_Foggy(docID);	}	else
	if (Page == 14)	{	MRBook_Show_LadysEar(docID);	}	else
	if (Page == 15)	{	MRBook_Show_Keil(docID);	}	else
	if (Page == 16)	{	MRBook_Show_Bottle(docID);	}	else
	if (Page == 17)	{	MRBook_Show_Trident(docID);	}	else
	if (Page == 18)	{	MRBook_Show_Branch(docID);	}	else
	if (Page == 19)	{	MRBook_Show_DragonTears(docID);	}	else
	if (Page == 20)	{	MRBook_Show_Ivy(docID);	}	else
	if (Page == 21)	{	MRBook_Show_NightSparcles(docID);	}	else
	if (Page == 22)	{	MRBook_Show_GoldPlate(docID);	}	else
	if (Page == 23)	{	MRBook_Show_Violet(docID);	}	else
	if (Page == 24)	{	MRBook_Show_Gray(docID);	}	else
	if (Page == 25)	{	MRBook_Show_Idle(docID);	}	else
	if (Page == 26)	{	MRBook_Show_Polypore(docID);	};
	MRBook_Page = page;
};

//================================================================
func void Use_MushroomBook()
{
	if(Npc_IsPlayer(self))
	{
		MultiBook_Start(MRBook_Page, MRBook_PageMax, MRBook_Print);
		if (!Read_MRBook_Once)	{
			Read_MRBook_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand * 30);
		};
	};
};
