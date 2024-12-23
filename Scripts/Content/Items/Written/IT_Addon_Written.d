
instance ITWr_Addon_Hinweis_02(C_Item)
{
	name = "������ ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_02;
	scemeName = "MAP";
	description = name;
	text[0] = "� ������� � ���������� ������";
};


const string Hinweis_02_1 = "�����,";
const string Hinweis_02_2 = "�� ������ � �������. ��������, ��� ����� �������� �����.";
const string Hinweis_02_3 = "�� ��� ��� ���� - ���� �� ����� ������ ������ � ���.";
const string Hinweis_02_4 = "��� ������ ���, ������ ������� ���� ��.";
const string Hinweis_02_5 = "����";

func void Use_Hinweis_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,Hinweis_02_1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,Hinweis_02_2);
	Doc_PrintLines(nDocID,0,Hinweis_02_3);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,Hinweis_02_4);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,Hinweis_02_5);
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Health_04(C_Item)
{
	name = "������ ��������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = "������ ��������";
	text[2] = "��� ������������� ����� �������� �����";
	text[3] = "���������� ������ ������� ��������� ��������.";
	text[5] = NAME_Value;
	count[5] = value;
};


const string Heilrezept_04_1 = "�������� ��������� �����:";
const string Heilrezept_04_2 = "��������� ���� ������� ����� � ��� �������� ��������.";
const string Heilrezept_04_3 = "���������� � ������ �������� ������� ��������� ��������.";
const string Heilrezept_04_4 = "��� ����� ����� ������� ������ �������, ������� ������ ��������� ��������.";

func void Use_Heilrezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"����� ���������� ����� 1 ������� ����� � 3 �������� ��������.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,Heilrezept_04_1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,Heilrezept_04_2);
	Doc_PrintLines(nDocID,0,Heilrezept_04_3);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,Heilrezept_04_4);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Mana_04(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Manarezept_04;
	scemeName = "MAP";
	description = "������ ����";
	text[2] = "��� ������������� ����� �������� �����";
	text[3] = "���������� ������ ������� �������� ����.";
	text[5] = NAME_Value;
	count[5] = value;
};


const string Manarezept_04_1 = "�������� ����� ����:";
const string Manarezept_04_2 = "��������� ���� ������� ����� � ��� �������� ����.";
const string Manarezept_04_3 = "���������� � ������ �������� ������� �������� ����.";
const string Manarezept_04_4 = "��� ����� ����� ������� ������ �������, ������� ������ �������� ����.";

func void Use_Manarezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"����� ���������� ����� 1 ������� ����� � 3 �������� ����.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,Manarezept_04_1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,Manarezept_04_2);
	Doc_PrintLines(nDocID,0,Manarezept_04_3);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,Manarezept_04_4);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Lou_Rezept(C_Item)
{
	name = "������ ������ ��";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 70;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept;
	scemeName = "MAP";
	description = name;
	text[0] = "������ ������ ��";
};


const string LouRezept_1 = "������ ������ ��";
const string LouRezept_2 = "����������� ��� ������������� ������:";
const string LouRezept_3 = "�������� ������� ����, ��� ���� � ������� �������� �����.";
const string LouRezept_4 = "�������� ����������� ��� �������� �����.";
const string LouRezept_5 = "��������� ��� � �������, �������� ���� � ����������.";
const string LouRezept_6 = "�����.";
const string LouRezept_7 = "������, ������������ ��� ���� ������, ������������, ��� ����� �� ������ ����������� ����� �����!";

func void UseLouRezept()
{
	var int nDocID;
	Knows_LousHammer = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,LouRezept_1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,LouRezept_2);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,LouRezept_3);
	Doc_PrintLines(nDocID,0,LouRezept_4);
	Doc_PrintLines(nDocID,0,LouRezept_5);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,LouRezept_6);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,LouRezept_7);
	Doc_Show(nDocID);
};


instance ITWr_Addon_Lou_Rezept2(C_Item)
{
	name = "������ �������� ������ ��";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[0] = "������ �������� ������ ��";
};


const string LouRezept2_1 = "������� ����� ��";
const string LouRezept2_2 = "�������� ����� �� � ���������� ��� ��� ���.";
const string LouRezept2_3 = "���� ������� �������� ����������� ������ ����� ������� �������.";
const string LouRezept2_4 = "���� �� ��� ��������� ��������, �� ������� �� ��������� � ���� �������� �����.";

func void UseLouRezept2()
{
	var int nDocID;
	Knows_Schlafhammer = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,LouRezept2_1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,LouRezept2_2);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,LouRezept2_3);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,LouRezept2_4);
	Doc_Show(nDocID);
};


instance ITWr_Addon_Piratentod(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[0] = "������ ������� �������.";
};


const string RezeptPiratentod_1 = "������� �������";
const string RezeptPiratentod_2 = "����� ��� ��������� ������";
const string RezeptPiratentod_3 = "��� ������, ���������� ������� ����. �������� ������� ���� � ������ ����.";
const string RezeptPiratentod_4 = "��� ������ �������� ������ ������, ������ ���� � �������� �����";
const string RezeptPiratentod_5 = "�������������� �������-�����.";
const string RezeptPiratentod_6 = "���������! ��� ����� �������� ����� ������� ��������.";

func void UseRezeptPiratentod()
{
	var int nDocID;
	Knows_SchnellerHering = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,RezeptPiratentod_1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,RezeptPiratentod_2);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,RezeptPiratentod_3);
	Doc_PrintLines(nDocID,0,RezeptPiratentod_4);
	Doc_PrintLines(nDocID,0,RezeptPiratentod_5);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,RezeptPiratentod_6);
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance Fakescroll_Addon(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Addon_AxtAnleitung(C_Item)
{
	name = "���������� ������������ ����������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[0] = "���������� ������������ ������� ������� ������.";
};


const string AxtAnleitung_1 = "���������� �����";
const string AxtAnleitung_2 = "���������� �����";
const string AxtAnleitung_3 = "���� ����� ����� �������� �����, �������� � �������� ���������� ����.";
const string AxtAnleitung_4 = "���������� ��� ����� ����������� ����� �����.";
const string AxtAnleitung_5 = "���� ����� ���� � ��� ���� �����, �������� ��� ��������� �� �����.";
const string AxtAnleitung_6 = "��������� ���� � ���� ������ �� ������ �� ����������.";
const string AxtAnleitung_7 = "����� ����� ����� ����� � ������� ������������ ����.";

func void UseAxtAnleitung()
{
	var int nDocID;
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		Knows_Banditenaxt = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,AxtAnleitung_1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,AxtAnleitung_2);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,AxtAnleitung_3);
	Doc_PrintLines(nDocID,0,AxtAnleitung_4);
	Doc_PrintLines(nDocID,0,AxtAnleitung_5);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,AxtAnleitung_6);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,AxtAnleitung_7);
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_Map_AddonWorld(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_AddonWorld;
	description = "������� ������ ������.";
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_AddonWorld()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_AddonWorld);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld.tga",TRUE);
	Doc_SetLevel(Document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};

