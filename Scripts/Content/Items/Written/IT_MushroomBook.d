
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
func void MRBook_Show_Cover(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"Book_Green_Title.tga",0);
	
	Doc_SetMargins(docID,0,100,205,100,35,1);
	Doc_SetFont(docID,0,FONT_Screen);
	Doc_PrintLine(docID,0,"            � � � � �");
	Doc_PrintLine(docID,0,"        � � � � � � � �");
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
	Doc_PrintLine(docID,0,"   ����������: �������, Home, End");
};
//================================================================
func void MRBook_Show_Title(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Title_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Title_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,30,MRBook_Btm_Margin,1);

	Doc_SetMargins(docID,-1,30,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_Calligraphic);
	var string BestName;
	Doc_PrintLine(docID,1,"��� ��������� ");
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
	Doc_PrintLine(docID,1,"� ���� ���������������");
	Doc_PrintLine(docID,1,"�� �������� ����� � ������");
	Doc_SetFont(docID,1,FONT_BookHeadline);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"    ����� ��������");
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"                ������ �����������, ���������");
	Doc_PrintLine(docID,1,"                        �� �������� �������������");
	Doc_PrintLine(docID,1,"                         � �������� ������ �������");
};
//================================================================
func void MRBook_Show_Summary(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Sum_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Sum_R.tga",0);
	
	Doc_SetMargins(docID,0,160,MRBook_Top_Margin + 20,MRBook_Btm_Margin,35,1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLines(docID,0,"������� ��� ��������, ����������, ������������� ��������, �� ���� ������� �� ��� ������ ������� � ������ ������.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"����� ��������� ���� ����� ��������� ���� ��������. ���� �� ���, ����� ��� ������ � ������, ������ ������� ������� �����. � ������ ����� ���� ���������� �������������.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"������ ������� ������� ������� ������ ����� �� �������� ���� �����, �� ��������������� � ������� ������������� ����������.");

	Doc_SetMargins(docID,-1,35,MRBook_Top_Margin,150,50,1);
	Doc_SetFont(docID,1,FONT_MRHeadline);
	Doc_PrintLine(docID,1,"    ��������");
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  �����������, ����� ��������� �� ��������� � ��������. � ��, � ������ ����� ����� ���� ���������� � �������. ������������ � ������ �� ����� ������� �� ������ �������, �� � ����������, ��� ������������ � ���������� ����. � ���� ������� �� ����� ��������������, ��������, ����� ����������� �����������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  ��������� �������������� ���� ��������� ������������ �� ������������ ������, �������� ����������. ������ ������������ ����� ��������, �������� �������� ����� ���� ������ ����� ������, ���������� ���� �������.");
};
//================================================================
func void MRBook_Show_Intro1(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Intro1_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Intro1_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,35,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLines(docID,0,"  �������� �������� ����� �������� ��������� ����� (��������) � ��������� (���� �����).");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  �������� �������� ���� �������� ���� �����. ��� �������, ��� ������� �� ������ � �����, ���� ���� � ����������. ������ � ����� ����� ���� ��������, ��� � ��������, ��� ����� ������������� ���� �� �����, ��� � ������ ������.");

	Doc_SetMargins(docID,-1,35,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"  ������ ����� ������������ �������� ����������� ������ �������� ������� ��������, ���� �������� ������ �� ���� �������, ��� �� ����������� ����������� ������� ����� ��������� ����� �����. �� ������ ��� ���� ��������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  ����������� ���� ������ ������������� �� ������ ����� ������ � ����� ����� ��������� �����. ���� ����� ����������� ����� � ������������ �����, ����� �������� ����������, �������� (���������), ������� � ������, ����� ������ �����. � �������� ����� ������ ����� �������� �������� �����, ���������� ����������� � �������� ����������� ����. � ��������� ������, ����� ��� ���������� ��������, ����������� ���� ������������� �� ���� ����������� ������.");
};
//================================================================
func void MRBook_Show_Intro2(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Intro2_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Intro2_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLines(docID,0,"  ������ ����� �������� ����� ������ ����, �������, ��������, ���������� � ���������� �� � �������. ����� ����� ������� �������� ����������� ��� �������������. �� �������� ������������ ���������� �������, � ����� ���������� ��� ������� ������.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  ������� ������ �� ������ �������� ��������. �� ��� ��� �������� �������� ������, ������� �� �������� ����� � ���������, ��� �������� � ��������� ������ ����� ����������. ���� ������� ����� ������� ����������.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  ��������� ������ �� ������������� ��������. ������� ������������� ��������� � ����������, � ������� �� ��� ����� ������, ������������ � �������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"������� ������ ���������, ����� ������ �������� �� ����, ��� ��� ��� ������. ��� � ��������, ����� ������������ � �����, ���� �� ������ ��������� � ����� ��������� �����, �������� ������ - ��������. ������������ ����� ����� ������� ���������: ����������� �������� - �������. � ��������, � ����� �� �������� �������������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  ������ ����� �� ����� ������ ����������� ������ �������� - ������� ������� � �������. ���� �������� ��������� � �����, �� ����� ������������ ���������� �����. �� ����� ����� ������ ���������� ����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  �� ������� ����� � ����� ������ ������������ ����������, ������ � ����������� � ��������.");
};
//================================================================
func void MRBook_Show_MR_01(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_MR01_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_MR01_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"            ������ ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLine(docID,0,"������ ����");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ���� ������� ��������, � ������ ������� � ����� ���������, ������� �������. ����� ������-�����, � ���������� ��� ����������� ��������. ����������� ���� ������������, ������.");
	Doc_PrintLines(docID,0,"����� ����������� ������ ����� � ����������� ����. ");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ���� �� �������� ���������������� ������ �� �������. ������ ����� ������ ����� �����������, � ��� ����� � �������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �������������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: �������� �������� ���������. ��� ���������� ������������ �������� ���������� �������. ������� ���������������� �������� � ���������� �������� ��������, ������� ������������.");
	Doc_PrintLines(docID,1,"���������� �� ������ ����� ������������ ��� ������������� �����, ���������� ���������� �����������.");
};
//================================================================
func void MRBook_Show_MR_02(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_MR02_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_MR02_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"           ������ ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"���� ��������, ������� ����");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ������� ���� �� ������� ������� ������� � ������. ������� ������ ��������� ���� �������. ����������� ���� ������������, ������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ������ ����������� � ����� � ���������� ������, ����� ����������� � �����������. ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �������������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ����������� ����������� ����, ��������� �������� ������� ����� ��� ����� ����. �������� ������� �����������. ���������� ������ ��������� ����� �� ������� �����, �� �� ������ ��������.");
};
//================================================================
func void MRBook_Show_Red(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Red_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Red_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"       ������� ������ ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"������, ���������, ���������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ���� ������� �������� � ����-������� ����������� ������� � ������ ����� ������. ����������� ���� ������������, ����� ��� �������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ������ �������������. ���� ����� ����������� � ������ ��������, ���� �� �����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ������ ������������� � ���� ����� ���������. ��� �� ���� ��������� � ����������. �������� ������� �����������. ���������� � ������� ����������.");
};
//================================================================
func void MRBook_Show_Piny(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Pin_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Pin_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"            �������� ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"��������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  ��������: ��������� ����. ������ � ������ ����������, �� ����� ������-�������. ����� �����, � ��������� ���������� � ������� ������ � ��������. ����������� ���� ������������, �����.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"  ���������������: ���� ����� ������ ����� �����, ��� �� ������� �������������� �������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  �����: ����-�����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  ��������: ��������. �������� ������ �������� ��������. �������� ������� �����������. ������������ ��� �������������� ���������� ���������� ����� ������� ��������.");
};
//================================================================
func void MRBook_Show_BrownOiler(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Oil_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Oil_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"           ������ ������");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"���������� ������, ����������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ������ ������� ����������, � ����������� ����������� �������. � ������ ������ ������� ��������� ���� � ����� ������������� ������. ����� ���������, �����. ����������� ���� ������������, ������-������ ��� �����.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ���� ����� ������ ��� �����, � ���������� ������, ���� - ��� ������� ���������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �����, �����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ��������. �������� ������� �����������. ������������ ��� ������������� ���� �� ��������� � �������� �� �����.");
};
//================================================================
func void MRBook_Show_Stone(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Stn_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Stn_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"          ������������ ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"�������, �������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ������-����� ��� ������-���������� ���� ���������� �����. ����� ����������� �����������. ������ ���� ���������� ��������� ������, �� �� ����� ������. ����������� ���� ������������, ������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: �������� ������������ � ������, �� ����� � ���������� �����. ����� ��������� ��������� ��������. ����� ��������� �������� �� 2-3 �����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �������������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ��������. ��������������� ���������� � ���������� ����. ��� ������������ � ������� ����������� ����� ������� ������������ �������. �������� � ����� ����� ��������� ������ ��������� �����.");
};
//================================================================
func void MRBook_Show_Governor(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Gov_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Gov_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"        �������������� ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"����������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ������� ���� � ���������� �������. ����������� ���� ������������, �����. ����� �����, � ������ ��������� ����������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"��������� ������������� �������� �����. ���  ������� � �������� ������ � ����� ��������� ����������� ���������� ����� ������ �� ������������ �������� �������� ��������. �������� � ������� ������ ����������� �� �����������, �� �������� ����������� ������ ����������� �� ������. ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"���������������: ������ � ������� ������ ��������, �� � ��������� �� �������� � ������ ��������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: ����� ����-�����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ��������. �������� ������� �����������. ���������� �������, ��� ���, ��� ����� ����� 28 ����� ������, ����� ������� ������� �����������. � ������� ����������� �� ������������.");
};
//================================================================
func void MRBook_Show_Sunrise(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Snr_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Snr_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"            ������ ������");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"�������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ������ ��� ��������� ���� ������������� ����� � ��������� ������. ������ � ����� �������. �� ������ ����� ����� ������ ������� ��� ���������� ������. ����������� ���� ����������, ������ � ������� � ������ �����.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ��������� ����� �������. ������ ��������������� �� �������� ������������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �����-����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: �������-��������. � ����� ���� �������� ��������, �� �������� ��������� ����������. ��� ������� ��������� ���������� ������ ����� ��������������.");
};
//================================================================
func void MRBook_Show_Foggy(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Fog_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Fog_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"            ����� ������");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"��������, ���������� ����");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ����� ������������� ���� �� ������-����������� ���������. ����� � ������ �������. ����������� ���� ����������. ������� � � ����� ������ �����, ��� ������ ������. ��� ���������� ������ ������� � ����������� �� �����, ����� ������������ � �����.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ������ � ������ ����� ������, ��� ������������ �����. ����� ����� ��������� �� ���������, �������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ����������! �������� ������� ����������, ���������������� ��������������� � ��������� ������, �� ��������� ������ �����.");
	Doc_PrintLines(docID,1,"� ������� ����������, ���� ��� ������������� ����.");
};
//================================================================
func void MRBook_Show_LadysEar(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Ear_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Ear_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"      ��������� ������� ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"������� ����");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"  ��������: ������� ������������� ����, ������ ��������� ���������� ������������ ���. ����������� ���� ����������, ����� ����������, �����������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"  ���������������: ������ �� �������� � ����, ���� ����� ������. ������� ��������� ������� ������ ������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  �����: ����-������ �����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"  ��������: �������-��������. � ����� ���� �������� ���������� �����������, �� �� ���� ������ �������� ��������� ��������.");
};
//================================================================
func void MRBook_Show_Keil(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_KL_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_KL_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"             ������� ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"��������, ��������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ����� ������� ���� ��������, ����� �������. ��������� ���� ����� �������� ��������� ��� ��������� �������, � ������ �� �������� �������� � ���������. � �������� ����� ������ ���������� � ����� ������, ����� ������, ����. ");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,140,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"� ������� 4-7 ���� �� ������ ���������� ������� ������ ����� � ��� ������������. ������� ������ ������, ��������, ������������ - �������, �������������. ����� �����. ����������� ���� ���������, ����������, ���������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"���������������: ������ � ������ ��������, ����� ����� ������������. � ��� �� ������ ����� ������� ����� ������, ��-�� ���� ���� ���� ������ ������������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: ����-�����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ������������� ������ ������� �������������� �����, ��������� �������� ���� ��������. ������������ ����� ���������� ������� �������� � ������ ��� �������� ��������.");
};
//================================================================
func void MRBook_Show_Bottle(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Btl_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Btl_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"        ����������� �������");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"����������, ���������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ����� ����� �� ����� ���������� ������ �������, � ������ - ���������� ������� ������. ����� �������, ����� �� �����. ����������� ���� �����������, ����� ��������� � ���� �����, ������� ���������� ��� ����������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ������ �� �����, �� ����� ����������� �������������. ����� ����������� � �������� ����������, ������ �����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �����-�����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: �������� ������ ����� �����. ������ �������� ����������, � ��� ������������ � ������� ����������� - ������� ����. � ������� ����������� ��� ����� �����, �� ��������.");
	
	Hero_Knows_Bottle = TRUE;
};
//================================================================
func void MRBook_Show_Trident(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Tri_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Tri_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"        ���������� ��������");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"��������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ������������ �����  ��������� ������� ����. ����������� ���� ������ ���� ���� ������. ������ ����������, ���������� �����. ����� ����-�������.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"                     ����������� ����,");
	Doc_PrintLine(docID,0,"                     �������� ��������� ");
	Doc_PrintLine(docID,0,"                     � ��������, �������-");
	Doc_PrintLine(docID,0,"                     ������ �� ����");
	Doc_PrintLine(docID,0,"                     ����������� ������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ���� ��������� � ����� � ������ ��������, �� � ����� ������ ��� ����� ��������� ��� ������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: ����-�����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: �������-��������, � ����� ���� �������� �������� � �������� �����������. ��� ������������ � ���� ��������� ���������� �� ����� ���� ����� � ���� �����. � ������� ������������ ��� ������������� ��� �������� ����� � �������, ��� � ����.");
};
//================================================================
func void MRBook_Show_Branch(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Brch_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Brch_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"           ��������� ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"��������, ��������� ����");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ����, ����������� ����� ������. ���� ����� ����-������� ��� ����-����������, ����� ������� � ���������. ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,0,"����������� ���� �������, ");
	Doc_PrintLine(docID,0,"��������� �������� ������ ");
	Doc_PrintLine(docID,0,"�����.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ����������� ���������� �����, � ������� ����� ��� �������� ����������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: ����-�����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ��������, ����� ���������� ����. �������� ������� ������ ��������, �� ������� ������� ������� ��� ������� ��������.");
};
//================================================================
func void MRBook_Show_DragonTears(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Drg_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Drg_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"           ��������� �����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ���� � ���� ���������� ����� ��� ������� ������� �� ������ ����� �����. � ��������� ����� ������ ��������� ��������� �������������� ������, � ������� ��� �������� � ������������ � �����. ����� ��� �������� ������������� ��� ������ ����������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ����������� �����, � ������� � ��������, ������ �����������, ������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �����-�����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ������! ����� � ����� ��������� ����� � ���� ��� ��������� �� ���� �������� ������� �����������. ���-��� ��������� ����� ����� �������� � ���������� ������. ������������ ��� ������������� ����������������� ����, � ����� ����� - ��� ��������� �������� �������� �����.");
};
//================================================================
func void MRBook_Show_NightSparcles(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Nsp_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Nsp_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"             ������ �����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ��������� ����, ����� ������ � ������. ������-��������� ����� �� ����� ������ �����. � ������� �������� �������� �������. ����� ����� ������ ������ �������� �� 10-15 ����.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ��� ����� ������ ������ �����! ��� ��������� �� ��� ���������� ����� ����������, ��������� ����-������� �����. ����� ����� �� ���� � ���������� ������� ��������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: ����-�����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ������ ������������ ����! ������������ ��� ������������� ���� �������� ����� � �����. � ���������, ������� ����� ��� �������� �������������. � ����� ���� �������� ������ �������� ��������. ������� ������������� � �������� ��������, ��������� ����� ���������� �������. �������� ���������� ���� ������ - ��������� ���������� � ���������������!");
	if (MIS_Cookery_AskSpices && !MIS_Cookery_SpicesGiven && !MIS_Cookery_NSparclesKnown)	{
		B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_NSparklesKnown);
		MIS_Cookery_NSparclesKnown = TRUE;
	};
};
//================================================================
func void MRBook_Show_GoldPlate(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Gld_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Gld_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"              ������� ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"������� �����");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ������� ���������� ���� ������������ �����, ���������-������� ��� ���������� ����� � �������� �������� � �������� �������. ����� �����������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ����������� � ������ � ������� ������������� ���������� �������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: ������ �����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ����������� ������ � ������ ����. ��� �� ���� ��������� ���� ������ �������� ������, �� ����� ������� ������� ��� ���������� ����� � �������. ��������� ����� ����� �������� ������� ���������, ��������� �������� � ��������������. ������ ������� �������� ���������� ������� ����������.");
};
//================================================================
func void MRBook_Show_Ivy(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Ivy_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Ivy_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"             ������ ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"��������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ��������� ���� � ����� ������ � �����-���������� �������. �� ����� ����� ������ �� 2-4 �����. ������ ������� ����������, ���������� ������������, ���� ����� ���������� �����. ����������� ���� ���������, �����.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ������ ���� ����������� ������������� �� ������ � ������, ����� �������� �����. ��� ����� ����� � � ������, � � ����� ���������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �����-����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: � ����� ���� ����������� �� ��������� �������, �� � ����� � ������� ������ �������� ���������� ����������.");
};
//================================================================
func void MRBook_Show_Violet(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Vlt_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Vlt_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"         ���������� �������");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"��������� �������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ��������� ���� ����-����������� ������. ������ ����������, ����� ������, �� �� ����� �������, � ��������� ������� �� ��������. � ������� ��������� ������ ��������. ����������� ���� ������������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ��������� �� ������ ���������: �������� ��������, ����, ������ ����������. ������������ ���������� ��� ����������� �����, ������� ��������� � ������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �������������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: �������� ����! �� � ���� ������ ������ ����������� � ����, ���� ��������� ������� �������� � ���������� ������. ������������ ��� ������������� ���������� ����.");
};
//================================================================
func void MRBook_Show_Gray(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Gray_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Gray_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"            ����� �������");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"�������� �������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ������� ������ ����, ������������ ������ ������. ������ ���������� �����, ����������� ���� ������������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ����� ������� ������ �����������, � ����� � ������ ������, ��� ������� �������� � � �������, ������ �������� ��������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �������������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: �������� ����! �������� ��������������, �������, �����, ������������, ������ ������ ����� ������������ � ������� ����������� �������. � ������� ����������� ���������. ������� ������������� � ������� ��� ������������ ����, �������, �� ���������.");
};
//================================================================
func void MRBook_Show_Idle(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Idle_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Idle_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"     ������� � ����� �������");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ��� ����� ������ ������ ������� ����� �������.");
	Doc_PrintLines(docID,0,"����� �����, ������� � ����� ������. ������ ������� ��� ���������������, � ������� ��������� ������ ����. ����������� ���� ������������, �����.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ������� ����� ����������� � �������, ���� - � ���� ��������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �������������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ����������� �� �������� ������, ����� ����� ������ �������� � ����������� � �����. ����������. �������� ������ ����������, ����������� ������ ����������.");
};
//================================================================
func void MRBook_Show_Polypore(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_MR_Baum_L.tga",0);
	Doc_SetPage(docID,1,"Book_MR_Baum_R.tga",0);
	
	Doc_SetMargins(docID,0,150,MRBook_Top_Margin,40,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,0,FONT_MRHeadline);
	Doc_PrintLine(docID,0,"           ��������� ����");
	Doc_SetFont(docID,0,FONT_MR);
	Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLines(docID,0,"��������� �����");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��������: ������ �����-���� ��������� �����. ������ ������ �������, �������������, ����� ������� � ������� ��� ���������� ��������. ����������� ���� ���������, �������, ���� �� �����, ��� � ��� ������.");

	Doc_SetMargins(docID,-1,40,MRBook_Top_Margin,150,MRBook_Btm_Margin,1);
	Doc_SetFont(docID,1,FONT_MR);
	Doc_PrintLines(docID,1,"���������������: ��������� �����, ��� ������� �� ��������, ������������ �� ������� ��������, ��� �����, ��� � ����������. � ������� �� ������� ������, ��������� ������ � ������� ����������� �������, ������ ���������� �������� ���. �������������, ��� ��� ������� �� ����������� � �������� ������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�����: �������������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��������: ������ ��������� ������ ����������, �� ���������� ������ ����� � ����� �������������� ��� ������������ �����.");
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
