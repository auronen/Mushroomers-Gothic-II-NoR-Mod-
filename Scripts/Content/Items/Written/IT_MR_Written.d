
const int Value_EarRecipe_Constantino = 500;
const int Value_EarRecipe_Thekla = 20;
const int Value_EarRecipe_Hilda = 50;

instance ItWr_PosterNaked(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_PosterNaked.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PosterNaked;
	scemeName = "MAP";
	description = "����������� ���������� �������.";
};
func void Use_PosterNaked()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"POSTER_Woman.TGA",0);
		Doc_Show(nDocID);
	};
};

//===================================================
instance ItWr_Letter_Vino2Chief(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_Vino2Chief;
	scemeName = "MAP";
	description = name;
	text[2] = "������ ���� ��� ��� ������";
};
func void Use_Letter_Vino2Chief()
{
	if (Npc_IsPlayer(self))	{
		PrintInInventory("� ����! �� � ������. ������ �� ���������.");
	};
};
//===================================================
instance ItWr_Letter_Chief2Halvor(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_Chief2Halvor;
	scemeName = "MAP";
	description = name;
	text[2] = "������� �� �������� ���������.";
};
func void Use_Letter_Chief2Halvor()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLine(nDocID,0,"������,");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"����� ���� �������� �����. ���������� ������ �������� � ������� �����.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"����������� ��� �������� ����� �������� ������ ���������.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� �������");
		Doc_Show(nDocID);
	};
};
//===================================================
instance ItWr_ScoreList(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_ScoreList;
	scemeName = "MAPSEALED";
	description = "���� ���������� ��������";
};
func void Use_Letter_ScoreList()
{
	if (Npc_IsPlayer(self))	{
		B_Show_ScoreList();
	};
};

// ������� =====================================

instance ItWr_EarRecipe_Constantino(C_ITEM)
{
	name = NAME_Recipe;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_EarRecipe_Constantino;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_EarRecipe_Constantino;
	description = "������ �������� �����������";
	text[0] = "�������� �� ������ �������� ���";
	text[1] = "��������� �� �����������.";
	text[3] = "���� ������ �����.";
	text[5] = NAME_Value;	count[5] = value;
};
func void Use_EarRecipe_Constantino()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,50,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"������� �������� �� ������� ��������� ����� (������� ����)");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�����������:");
		Doc_PrintLines(nDocID,0,"������� ���� - 3 ��.");
		Doc_PrintLines(nDocID,0,"�������� (���, ����) - 1 ���.");
		Doc_PrintLines(nDocID,0,"�������� ������� - 1 ��.");
		Doc_PrintLines(nDocID,0,"�������� - 1 ��.");
		Doc_PrintLines(nDocID,0,"����� - 1 ��.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"����� � ����� ������ ������� � ������ ���������. �������� ����� ���� � �������� �� 3 ��� � ������ ���������� �����. ����� ����� ������� ����� (�� ������������, ������!) � ���������� ��� �����.");
		Doc_PrintLines(nDocID,0,"������� �������� ��������� � ��������� ���������� ��� ��������.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"����������: ��������� ��������, ������ ���� � ������� �������. ���������� �� ����� � ����� ��� ������� ����.");
		Doc_Show(nDocID);
	};
};
//--------------------------------------------
instance ItWr_EarRecipe_Thekla(C_ITEM)
{
	name = NAME_Recipe;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_EarRecipe_Thekla;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_EarRecipe_Thekla;
	description = "��� � ����� �� �����";
	text[1] = "������ ������� ������ �������� ���";
	text[3] = "���� ������ �����.";
	text[5] = NAME_Value;	count[5] = value;
	
};
func void Use_EarRecipe_Thekla()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"     ��� � ����� �� �����");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�����-��� �������� � ���� ����� �� 3 ����. ���������� ������ � ��������.");
		Doc_PrintLines(nDocID,0,"��������� �� ��������� ������� ��� �� ���������. ����� �������� �� ���������� �������, ����� � ����. �������� ����� ��������� �������� � ������, ��������, ���������.");
		Doc_PrintLines(nDocID,0,"�������� �������.");
		Doc_Show(nDocID);
	};
};
//--------------------------------------------
instance ItWr_EarRecipe_Hilda(C_ITEM)
{
	name = NAME_Recipe;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_EarRecipe_Hilda;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_EarRecipe_Hilda;
	description = "����������� ����";
	text[1] = "������ ������� ������.";
	text[3] = "���� ������ �����.";
	text[5] = NAME_Value;	count[5] = value;
};
func void Use_EarRecipe_Hilda()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"����������� ����� �������� ���");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"����� �������� �� ������������. � ������� ����� �������� ���� ����, ��� ���� ������ � �������� ������. ��� ������� ������ �������� �������� ��������. �������� �����, ������ ���������. ��������� ��� ����� �� ������. ������� � �������, ������� �� ����!");
		Doc_Show(nDocID);
	};
};

//===================================================
instance ItWr_TuskCertificate(C_Item)
{
	name = "����������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	description = "���������� �� ������� �����";
	text[1] = "����� ��������.";
	text[2] = "����������� ����� ������ ������:";
	text[3] = "�����: 4 � 1/10 ������";
	text[4] = "������: 4 � 1/12 ������";
};

//===================================================
instance ItWr_Letter_Dikar(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_Dikar;
	scemeName = "MAP";
	description = name;
	text[2] = "�������� ������ �� ������";
};
func void Use_Letter_Dikar()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"����������� ����, ������!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� �� ������� ��� �������, ��, ������, � ����� ����������� �� ������ � ��� ������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� ������ ��� ����, �� � ���� �������� ������ �� ������ ��������� ��������, �������� �� ��������� � ��������� ����. ������������ ��������� � �� ���������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"� ����� ���� ���� �� ������ �������� ����� �����, � ������� ��� ���� �����. �������, ��� ���� ����������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"������");
		Doc_Show(nDocID);
	};
};

//===================================================
instance ItWr_HeroPortrait_FromFireDragon(C_ITEM)
{
	name = "��� �����������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_HeroPortrait;
	description = name;
	text[1] = "��������� �����������";
	text[3] = "� �������� ������� �������:";
	text[4] = "�� ������ �� FIRE DRAGON`�";
};

func void Use_HeroPortrait()
{
	if (Npc_IsPlayer(self))	{
		if (C_HeroIs_Elena())	{
			Doc_Open("SCREENSHOT_ELENA.TGA");
		}
		else if (C_HeroIs_Erol())	{
			Doc_Open("SCREENSHOT_EROL.TGA");
		}
		else if (C_HeroIs_Odo())	{
			Doc_Open("SCREENSHOT_ODO.TGA");
		}
		else if (C_HeroIs_Rupert())	{
			Doc_Open("SCREENSHOT_RUPERT.TGA");
		}
		else if (C_HeroIs_Sarah())	{
			Doc_Open("SCREENSHOT_SARAH.TGA");
		}
		else if (C_HeroIs_Talbin())	{
			Doc_Open("SCREENSHOT_TALBIN.TGA");
		}
		else if (C_HeroIs_Till())	{
			Doc_Open("SCREENSHOT_TILL.TGA");
		};
	};
};
