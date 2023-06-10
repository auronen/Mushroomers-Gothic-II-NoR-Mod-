
//(C) ������ 2016

//--------------------------------------------
//� �������� �������� +
instance ItWr_OldLetter_Godo2Berta(C_ITEM)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_OldLetter_Godo2Berta;
	description = name;
	text[1] = "(������� � �������� ��������)";
};
func void Use_OldLetter_Godo2Berta()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,1);
		Doc_SetPage(docID,0,"letters.TGA",0);
		Doc_SetMargins(docID,-1,60,100,60,70,1);
		Doc_SetFont(docID,0,FONT_Book);
		Doc_PrintLines(docID,0,"����� �����!");
		Doc_PrintLines(docID,0,"");
		Doc_PrintLines(docID,0,"� ����� ������� ������ �� ����������, ���� ���� ���������� �� ������. �������� � ��������, ��� ���� ������� � �����-������ ��������� �������. �� ����� ��� ����� - � �������� � ������ �������� �� � ������ �� ������������ � ������. ���� �������, ��� ��, ���� � ����� �����, �� ��� ��������� ������ ����������� �����������. ��� ���, ��� ��������, ��� ��� ��� ������� ���� ������, ����� � ������� ������. � ����� ������ � ������� � ������ �������, � ��, �������, ���������.");
		Doc_PrintLines(docID,0,"");
		Doc_PrintLines(docID,0,"");
		Doc_PrintLines(docID,0,"���� ����.");
		Doc_Show(docID);
		if (!Read_OldLetter_Godo2Berta_Once)	{
			Read_OldLetter_Godo2Berta_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//� ����� �� ����� +
instance ItWr_MR_OakBranch(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������� �����";
	text[2] = "(�������������� ��������)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_OakBranch;
};
func void Use_OakBranch()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,2);
		Doc_SetPage(docID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(docID,1,"Book_Brown_R.tga",0);
		Doc_SetMargins(docID,0,275,30,25,30,1);
		Doc_SetFont(docID,0,FONT_Calligraphic);
		Doc_PrintLine(docID,0,"  ������� �����");
		Doc_PrintLine(docID,0,"& & & & & & & & & & & & ");
		Doc_SetFont(docID,0,FONT_MR);
		Doc_PrintLine(docID,0,"");
		Doc_PrintLines(docID,0,"...��� ��, ������ ������� ����������, ������������ ������� ���������, ������� ��� ����� ������ �������, ������� ��������� ������. � ����� �������� ���������� ��������� �� ������� ��������� � ���������� ������ �����. �� ������� ���, ����� ������� ���������� ������ ����������� ������ ������������.");
		Doc_SetMargins(docID,-1,25,40,275,30,1);
		Doc_SetFont(docID,1,FONT_MR);
		Doc_PrintLine(docID,1,"");
		Doc_PrintLines(docID,1,"� �������� ������ ������� ��, ������������, ������� ��������� ��������, �� ������ ������. �����, ����� � ��������� ������, ����� ������� ��������� ����������� �� ��������� ��������, �� ���������� ����� ������, � �������� �������� ��� ��� � ������. ������ �������� �� ������� �� ����, � ���, ����� ������� ������������, ������ ���. ��� �� ���� � ������� �� ����� �����, ���� ����� �������� ����� ����� �� ������...");
		Doc_Show(docID);
		if (!Read_OakBranch_Once)	{
			Read_OakBranch_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//� �������� � ������ ��� ������ �������� +
instance ItWr_MR_BiographyBartosLaran(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "��������� ������� ����������";
	text[2] = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_BiographyBartosLaran;
};
func void Use_BiographyBartosLaran()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,2);
		Doc_SetPage(docID,0,"Book_RED_L.tga",0);
		Doc_SetPage(docID,1,"Book_RED_R.tga",0);
		Doc_SetMargins(docID,0,275,40,30,40,1);
		Doc_SetFont(docID,0,FONT_BookHeadline);
		Doc_PrintLines(docID,0,"��������� ������� ����������");
		Doc_PrintLine(docID,0,"~~~~~~~~~~~~~~~~");
		Doc_SetFont(docID,0,FONT_Book);
		Doc_PrintLines(docID,0,"������ ��������� (1176-1228 ����) �������� ��� ����� ��������� ������ ��������� � �����, ������� � ��������������. � ������� ���� ����� �������������, ������ � ��������� ���� � ��������, � ������� ������� � ������� ����� ��������.");
		Doc_SetMargins(docID,-1,30,30,275,30,1);
		Doc_SetFont(docID,1,FONT_Book);
		Doc_PrintLines(docID,1,"� ������ �������� �������� � ������ �����, ��� ���������� ��� ����� ������ � �������� ���������� ����� ��� �������.");
		Doc_PrintLines(docID,1,"������ ����������� ���������, ������������, ������� ������ � ����������� � ������� ����. ����� �� ����� ��������� �����, ���������� ��� ������ �� �����. ���� ����� ����������, ��� ������ ��� ������ �� ������. ������ ������� ��������, ��� ��� �������� ��� ����� ������� �����, ����������� ������� �������.");
		Doc_Show(docID);
		if (!Read_BiographyBartosLaran_Once)	{
			Read_BiographyBartosLaran_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//�� ������ ��� �������� ������ +
instance ItWr_MR_SmithGuide(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "����������� �������";
	text[2] = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_SmithGuide;
};
func void Use_SmithGuide()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,2);
		Doc_SetPage(docID,0,"Book_Wood_L.tga",0);
		Doc_SetPage(docID,1,"Book_Wood_R.tga",0);
		Doc_SetMargins(docID,0,275,20,30,20,1);
		Doc_SetFont(docID,0,FONT_BookHeadline);
		Doc_PrintLine(docID,0,"");
		Doc_PrintLines(docID,0,"����������� �������");
		Doc_PrintLine(docID,0,"");
		Doc_SetFont(docID,0,FONT_Book);
		Doc_PrintLines(docID,0,"������ ��� ���������� ������ ������� ���������� �����, ����� ��� ��������� ����� ������ ������. ���� �������� ��� ���������� �� ������� ��������, �������� ��������� ����������, � ���� - �������.");
		Doc_SetMargins(docID,-1,30,20,275,20,1);
		Doc_SetFont(docID,1,FONT_Book);
		Doc_PrintLines(docID,1,"������ ������� �� ��� ���, ���� ������ � �������� �� �� ������ ������� ������������� ������. ����� ���� ������ � ����� ������ ��� ������� ���� � ������������ ��� ���������� � ����� ���, ���� ����� �� �������. ������� ���������� ������ � ������� ���������� ����, ���� ������ ���������� � ��� ������� ����.");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLines(docID,1,"�������, ��� ��������� ���� �������� ���� ������ � ����� ��� ����� �����. �� ��������� � ������ ����� ������ ������.");
		Doc_Show(docID);
		if (!Read_SmithGuide_Once)	{
			Read_SmithGuide_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//� ������� +
instance ItWr_MR_SunExtract(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "�������� ������";
	text[1] = "(����������� �� ���������)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_SunExtract;
};
func void Use_SunExtract()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,2);
		Doc_SetPage(docID,0,"Book_RED_L.tga",0);
		Doc_SetPage(docID,1,"Book_RED_R.tga",0);
		Doc_SetMargins(docID,0,275,40,30,40,1);
		Doc_SetFont(docID,0,FONT_BookHeadline);
		Doc_PrintLines(docID,0,"�������� ������");
		Doc_PrintLines(docID,0,"");
		Doc_SetFont(docID,0,FONT_Book);
		Doc_PrintLines(docID,0,"������� �����, ����� �� ������, ����������������� �� ������ ����������� ������, �������� ��� ���������, �� � ���������. ������ ������� ����, ������������� � ����� ��������� - ���� �� �������� ������� �� ���� �������.");
		Doc_SetMargins(docID,-1,30,30,275,30,1);
		Doc_SetFont(docID,1,FONT_Book);
		Doc_PrintLines(docID,1,"��� ������� �������� ���� ������ ����� ������ ����� ������ � ������� ���������, ��������� � ����� ��������� ���� � ��������� � ������ ���������. ����������� ������ � ������ ����� � ���, ��������� ������ ���. ����� ������� ��� � ������ ������� ����� � ������ � ������, ���������� � ����� �����. ���� ��� ���� ������ ������ ��������� � �������, ��������������� � ���� ����������� ������� �������� �����.");
		Doc_Show(docID);
		if (!Read_SunExtract_Once)	{
			Read_SunExtract_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//� ��������� +
instance ItWr_MR_OnAlchemy(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "�� �������";
	text[1] = "(�������)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_OnAlchemy;
};
func void Use_OnAlchemy()
{
	if (Npc_IsPlayer(self))	{
		var int docID;
		docID = Doc_Create();
		Doc_SetPages(docID,2);
		Doc_SetPage(docID,0,"Book_MAGE_L.tga",0);
		Doc_SetPage(docID,1,"Book_MAGE_R.tga",0);
		Doc_SetMargins(docID,0,275,40,30,40,1);
		Doc_SetFont(docID,0,FONT_BookHeadline);
		Doc_PrintLine(docID,0,"�� �������");
		Doc_PrintLines(docID,0,"");
		Doc_SetFont(docID,0,FONT_Book);
		Doc_PrintLines(docID,0,"������ ���� ������������ ����� ����������� � ���, ����� ���������������� ������ � ������������ ������� � ����. ���������� ��������, �������� ������������� ��, �������� �� ������ �������, ���������� � ������. ");
		Doc_SetMargins(docID,-1,30,40,275,40,1);
		Doc_SetFont(docID,1,FONT_Book);
		Doc_PrintLines(docID,1,"� ����� �������, �� ���� ���������, ��������, � ���� ����� �� ���� ������ ��� �� �� ����, �������� �������� ��������. ��� ���� � ���� ��������, ����������� ���� � ���������� ������ � �������� ����������, ������������ � ����, ��� ����� ������ ������ � ����� �����.");
		Doc_Show(docID);
		if (!Read_OnAlchemy_Once)	{
			Read_OnAlchemy_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//--------------------------------------------
//�� ����� +
instance ItWr_MR_UnderInnosEye(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 350;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "��� ���� ������";
	text[2] = "(�������������� �������)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_UnderInnosEye;
};
var int UnderInnosEye_Page;
const int UnderInnosEye_Page_Max = 10;
const string UnderInnosEye_Text[UnderInnosEye_Page_Max] =
{
	"",
	"",
	"���� ���� �������, ����� ��� ��� ������� ��������� ������ � ��������� ������ ������. ������ ��� ��� ������������ ���, ��� ����� � ����, ������� ������ �����, ���� ����� ����������, ������ �������� �������� ��� ����� � ���. �� ���, ����� ����, ���������� ��������, ��� � ������, ����� ����� � ������, ����� �������� �������. � ������ ��� ��� �� ����� ��������� ������ ������, ��� �� ��� - �������� ����������.",
	"������� ��� �� ��������� ���, �������������� �� ������� ����� �� �������� ����. ��� ����� ������� �����, ����������� �� ������� ������� ���������, �������, ��������� � ���������� ������.",
	"��� �������� ���� ��������� ����� �������� �������. � �������� �� ����� ���������� ����, �� ��� - ���� ����� ����� �������� ������. �� ������ ���� ������� ������ ��������, �� ������� ����������� ����������� �������, ������� � ������. ���������, �������, ���� ��������� ���������� ������.",
	"� ������ ����� ��� ��������� � ������������ ����. ���� ���� ��������� ���������� ����� �������� ��������, � ������ �����, ������� ��� ����� ��������� ���������, ������� ������������ ��� ����������. � ��� ������������ ������: ����� �� �� ������ ����������� ������� ������ �����������, ������� �������, ����� ������� � ������� ������ �������. �� ����� �� ���� ������� � ��� ������ �� ���.",
	"� ��� ���� ���������� �������� �� ��������� ������ ����� �������, ������������� � ���-������� �� ������������ ���������. ������ ��� ������� ������, �������� � ������ ������. ��������� ���� ������ �����������, ������� �� �������� ������� �������� � ������������� ��������� �����. ����� �� � �������� ����� ����� ������������ � �������.",
	"�� ����� ����������� ���� ���������� ������ ������ ���������. ���� �� ��� ��������, ������ ������� � ������� ������. ������ ������������, ��� ��������� �� ���� �������� ����, ����������� ������ ����� ��������� ����������, �������� ������� ��������, ��������, ������� ������������ ��� ���� ������.",
	"������ ������� �������� �������� ������������ ���������� ���� � ������. �� ��� ����� ����� �� �����, ��� ����� ���������������, � �� �������� ��������� �� ��� ������� �� ���� ����, ��� � ����� ��������. �� ������ ������, ��� ������� �� ��������, ��� ��� �������.",
	"� ������� �� ����� ������� � ����� ����� ������ �������. �� ����� ��� ���� �������������� ���������� ���������� ������, ��� ����� ��� - ������������ � ����, ��� ������� ������ ���������� ����. ������ ������� ������� �� �����, ����������� ������. �� ����� ����� �� ����� �� ���������� �����, �� �������� �������� �������..."
};
func void UnderInnosEye_Print(var int docID, var int page)
{
	MEM_Debug(IntToString(page));
	var string txt;
	Doc_SetPages(docID, 2);
	Doc_SetPage(docID,0,"Book_MAGE_L.tga",0);
	Doc_SetPage(docID,1,"Book_MAGE_R.tga",0);
	//�������� �����
	Doc_SetMargins(docID, 0, 275, 35, 25, 40, 1);
	//��������� �� 1 ��������
	if (page == 0)	{
		Doc_SetFont(docID,1,FONT_ManuscriptHeadline);
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"       *  *  *");
		Doc_PrintLine(docID,1,"   ��� ���� ������");
		Doc_PrintLine(docID,1,"");
		Doc_SetFont(docID,1,FONT_Manuscript);
		Doc_PrintLine(docID,1,"  �������������� �������");
		Doc_SetFont(docID,1,FONT_ManuscriptHeadline);
		Doc_PrintLine(docID,1,"       *  *  *");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"");
		Doc_SetFont(docID, 1, FONT_ScreenSmall);
		Doc_PrintLine(docID,1,"               ����������:");
		Doc_PrintLine(docID,1,"         �������, Home, End");
	}
	else	{
		Doc_SetFont(docID, 0, FONT_Manuscript);
		txt = MEM_ReadStatStringArr(UnderInnosEye_Text, page * 2);
		if (page > 0)	{
			Doc_PrintLine(docID,0,CS3("�        ~", IntToString(page * 2 + 1), "~"));
			Doc_PrintLine(docID,0,"");
		};
		Doc_PrintLines(docID, 0, txt);
		//�������� ������
		Doc_SetMargins(docID, 1, 25, 35, 275, 40, 1);
		Doc_SetFont(docID, 1, FONT_Manuscript);
		if (page < UnderInnosEye_Page_Max / 2 - 1)	{
			Doc_PrintLine(docID,1,CS3("         ~", IntToString(page * 2 + 2), "~        �"));
			Doc_PrintLine(docID,1,"");
		}
		else	{
			Doc_PrintLine(docID,1,CS3("         ~", IntToString(page * 2 + 2), "~"));
			Doc_PrintLine(docID,1,"");
		};
		txt = MEM_ReadStatStringArr(UnderInnosEye_Text, page * 2 + 1);
		Doc_PrintLines(docID, 1, txt);
	};
	UnderInnosEye_Page = page;
};
func void Use_UnderInnosEye()
{
	if (Npc_IsPlayer(self))	{
		MultiBook_Start(UnderInnosEye_Page, UnderInnosEye_Page_Max / 2, UnderInnosEye_Print);
		if (!Read_UnderInnosEye_Once)	{
			Read_UnderInnosEye_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand * UnderInnosEye_Page_Max / 2);
		};
	};
};


//--------------------------------------------
//� ������ +
instance ItWr_MR_AboutDragons(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 450;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "� ��������";
	text[2] = "����������� ��������� ���";
	text[3] = "� ������������ ������� �� �������";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_AboutDragons;
};

var int AboutDragons_Page;
const int AboutDragons_PagesCount = 10;

func void Use_AboutDragons()
{
	if (Npc_IsPlayer(self))	{
		MultiBook_Start(AboutDragons_Page, AboutDragons_PagesCount, AboutDragons_Print);
		if (!Read_AboutDragons_Once)	{
			Read_AboutDragons_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand * AboutDragons_PagesCount);
		};
	};
};

func void AboutDragons_SetMerginsL(var int docID)
{
	Doc_SetMargins(docID, 0, 170, 45, 40, 45, 1);
};
func void AboutDragons_SetMerginsR(var int docID)
{
	Doc_SetMargins(docID, 1, 40, 45, 170, 45, 1);
};
func void AboutDragons_PrintPageN(var int docID, var int pageN)
{
	const string padding = "              ";
	var string txt;	txt = CS3(padding, IntToString(pageN), padding);
	if (pageN % 2 == 0)	{
		if (pageN != (AboutDragons_PagesCount - 1) * 2)	{
			txt = ConcatStrings(txt, "�");//->
		};
		Doc_SetFont(docID,1,FONT_Manuscript);
		Doc_PrintLine(docID,1,txt);
		Doc_PrintLine(docID,1,"");
	}
	else	{
		txt = ConcatStrings("�", txt);//<-
		Doc_SetFont(docID,0,FONT_Manuscript);
		Doc_PrintLine(docID,0,txt);
		Doc_PrintLine(docID,0,"");
	};
};

func void AboutDragons_Print_Cover(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"Book_Dragon_Title.tga",0);
	
	Doc_SetMargins(docID,0,100,150,100,35,1);
	Doc_SetFont(docID,0,FONT_Screen);
	Doc_PrintLine(docID,0,"    �   � � � � � � � �");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_SetFont(docID,0,FONT_ScreenSmall);
	Doc_PrintLine(docID,0,"   ����������: �������, Home, End");
};
func void AboutDragons_Print_P01(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Pic_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,2);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"������������ �������� �����, ��� ������� ��������� - ���� ���� �� ����������������� ���������� ����������. � ������� � ����������� ������� ������ � ����� �������� �������, ����� ����� �������������� ������������� ������, � �������� �, �����������, � ���� �����.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLine(docID,1,"");
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLine(docID,1,"��������� ������� �����������, ");
	Doc_PrintLine(docID,1,"��� ���� ������ �����.");
	Doc_PrintLine(docID,1,"59 ��� �� ������ ����� �����.");
};
func void AboutDragons_Print_P02(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,3);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"���������� ��� ������� �� ������� �����, ��� ��������� �����, ���������� ����������� ����, � ���� ��������� � ����� ��������� ������, � ���� ������. ������ �� ���� ��������������� ��� �� � ����� ����������� ��������� �� �������.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"������� �������� ������ ���������� � ����� ������ �������� ������ ��������. ");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,4);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"�����, ��� ������ ����� � ������� ������, ��� ������� �������, �������, ������, ������� ����� ����� ���������� � ��������, � ������ �������� �����, � ��� ���� ���������, ��� ���� �������� ������� � � ��� ������� ������.");
	Doc_PrintLines(docID,1,"������ ��������� �������� ���� � ������ ������� ������, ������ �������� ��������, �������, ��� ���� ���������� ���������� ����� ����� ������-���������� ������ ����� � ���� �����, � ������ �� ����� ��������� ������ ������ �������� �������. � ��� ��� ��������� �� �������� ���� ���������, �������� �� ��� �� ���������.");
};
func void AboutDragons_Print_P03(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,5);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"���� ��������, ��� ��� ���� ���������, ������ ������� ������. � �������� ������ �����, ��� �������� �������� � �������� ������ �������, ��� ���������� ������ ��������� �������� �������. ������� ��� � ��� ������, �������� � ������� �����, � ���������� ����������� ������ �����, ������������ �� ���������� ����������� ����. ��� ��� ��� �����, ������ ����� ������.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,6);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"����� �������� ����� ����� �����������, � ����� ���������� �����, �� ������ ��������. ��������, ������� �� ����� ������ ��������� ���� � ������, ������� ������������� �������. ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"������ ���������, ��� ����� ��������� ����� ������ �������, ������������� �� ����� �������. �� ���� ����������� �� ������ �������� � ���������.");
};
func void AboutDragons_Print_P04(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,7);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"�������, �������� � ����� ��������� ����� � ���������� ��������, ��� � �� �� �����. � ����� ������ ������ ���������, ��� ������� ����� ���� �������. ������ ������ �������, ��� ��� ������� ����� �������� ���� ��� ������ �����. � ���� ������ ���������, ����� ����� ������� ������, ������ ����. ���� �� ���� � ����� �������� �������� ������ ������, ��� ������� ����� ����������� ������� � � ���� ������ ����������� �������-������ ��� ��������� �������.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,8);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"�� ������������, �� ����������� ���� ����������� ��������� �� ��������������. �� �������, ��� ��� ����������, ���� ����� ���������� ������. �� ��� ������ ����, ��� �� �������� ����� ���������� ���������� ������, ��� ����� ������� ���������� �� ���������� ����������� �������. ������ �� ����� ������ �� � �����, �� ���� ��� ��������� ����� ���� � ������.");
};
func void AboutDragons_Print_P05(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Pic_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,9);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"������ ������� �����, ������� ��������� � �������������� ��������������� ����������. ������ ������� ������ ��������� � ������ � ������ ������ � ������, � �� � � ����� �����. �� ��� ��� �������� �� ���, ��� ������� �������� ������������ �������� ������������ �����. ");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"������ ������������ � ���� ���, ���� ���������, ��� �������� ������������ �������� � ������ ������� ��������, ��������� ��� �������� ������ ��� �������� �����.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,10);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"�� ��-�� ���������� ��������� ������� �����, ��������������� ��� ��������. ��������, ��� �������� ������� � ��������� � ������� �������.");
};
func void AboutDragons_Print_P06(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,11);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"� ����������� ��������, � ����� � ���, �������� �� ��� ����� ��� ����, �������� ����. ���������� ����� ���������� ������, ��� ������� ����������� ����, �� ������� � ��������� �� ���������. ��� ���������� �������, ����� � ����� ������ ��������� �������� �������� ��������� ���, �� ��� � ��� ����� ��� �� ����� � �������� �� �����. ��, ��� �������, �������� �������� ���� ����� ������� ������������ ������.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,12);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"��� �������, � ���� ���� ���� � ������ ������ � �������, ������� �����������. �� ��� ������� ��������, ��� �������� ������ ����� ��� ����� ����� �������� �� ���� �� �� ���� �����. ������� ����� ������������, ��� ����� ������� � �������� ����� ���� ������������ ���� ��, ��� �������� �� ����� ������ �������. �� ��, ��� ���� ��������� ����������� ���� �������� ��� ������, ������� �� �����, � ���� ����� � ������� ���������� ����������.");
};
func void AboutDragons_Print_P07(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,13);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"����� ������ ��������� ����� ������������� �������, ��� ����� �� ���� ����� � ����� ������. ����� �� ��� ����� ������� �� ���������, ������� �� ����� � ������ ���, ��� ��������� ����������� � �������� �������, ������������ ��������� �����. �������� ��� ��������� ����������� �����������. ");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"����� ��� ���� ����� ����, ��� ����� ��������� ���� ����������� �� ��������� ���, � ��� ���� �� ������ ���� �� ����� ��� ��� ����������� ������, � �� ��������� ���������� ���������, ������� ������������ ���������� ��� ������� � ��������. ");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,14);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"��������, �������� ����������� ����� ������� �� ��������, ���� ���� ���� ������ ���������� ����� ������ �����. ");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"�� �� ����� ���� � ������������ ����������, ������� �� ������� �� ������ � �����, ��� ��� ����������� ����������� ����� ��������. ��� ���������, ������������ ����������, ��� ������, ��� ������ �� �������� �������� � ���� � �������, � ������� ������, � ������ �������� ����������� ��������� � ��������. � ���� ������� ���� �� ��������������� ��������� ���������� ������ �������.");
};
func void AboutDragons_Print_P08(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,15);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"�������� �� ���������� ������������� ����� ��������, ��� ������ ���������� �������, ��� ��� �������� ������� � ����� ����. ������ ������, ������ ��� �������� � ����������� ������� � ��������, �������� � ��� � ������ �����. ���� ����� ���������� ������� �������� ������ � ���� �� ������, �� ����� ��������� �������� �������� ������ �� ������� ���� � �����.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,16);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"�������� ������ ��� �������� ���������� ������. ����� ������������� ����������, ������� � ������, ��� ��� �������� ������� ������ �����. ������� ��������� �������� � �������� �����, ���� ���� ��� ���� �����-������ ������� ���������� ��������, ����������� ������� �����. ����� ����������� �������� ������ ��� - ������ ����� �������, ��� �������� � ��������� �� ��������, ���� � ������� ����������� � ������ �������.");
};
func void AboutDragons_Print_P09(var int docID)
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Dragon_Mid_L.tga",0);
	Doc_SetPage(docID,1,"Book_Dragon_Mid_R.tga",0);
	
	AboutDragons_SetMerginsL(docID);
	AboutDragons_PrintPageN(docID,17);
	Doc_SetFont(docID,0,FONT_Manuscript);
	Doc_PrintLines(docID,0,"���������� �� ������� ������? �� ������ �� ���������� �����, �� ������� � ��������. � ���� ����� ������� �� �����������. �� ����������, ���� ��� ���������� ����������, ����������� ���� ������ �������, ���� ������������. � ������ ������� ������������� �� ���, ��� �������� �������, ����� ���� ����� ���. ��������, ��� ������� �������.");
	
	AboutDragons_SetMerginsR(docID);
	AboutDragons_PrintPageN(docID,18);
	Doc_SetFont(docID,1,FONT_Manuscript);
	Doc_PrintLines(docID,1,"����� ����, �� �������� ������� �����, �, �����, ��� ����������� ���� �������� ������ � �� ���� �� � ���� ������ ����, ��������� ����� � ����� �������� � ��������.");
	Doc_PrintLine(docID,1,"");
	Doc_PrintLines(docID,1,"��� �� �� �� ����, ������� ���� ��� �� �����������.");
};

func void AboutDragons_Print(var int docID, var int page)
{
	if (page == 0)	{	AboutDragons_Print_Cover(docID);	}	else
	if (page == 1)	{	AboutDragons_Print_P01(docID);	}	else
	if (page == 2)	{	AboutDragons_Print_P02(docID);	}	else
	if (page == 3)	{	AboutDragons_Print_P03(docID);	}	else
	if (page == 4)	{	AboutDragons_Print_P04(docID);	}	else
	if (page == 5)	{	AboutDragons_Print_P05(docID);	}	else
	if (page == 6)	{	AboutDragons_Print_P06(docID);	}	else
	if (page == 7)	{	AboutDragons_Print_P07(docID);	}	else
	if (page == 8)	{	AboutDragons_Print_P08(docID);	}	else
	if (page == 9)	{	AboutDragons_Print_P09(docID);	};
	AboutDragons_Page = page;
};
