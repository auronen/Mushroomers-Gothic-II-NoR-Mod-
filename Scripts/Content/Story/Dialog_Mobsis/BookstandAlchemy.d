
var int ALchemy_1_permanent;
var int ALchemy_2_permanent;
var int ALchemy_3_permanent;

const string BookstandALCHEMY1_S1_1 = "Зелья магической силы";
const string BookstandALCHEMY1_S1_2 = "и ингредиенты";
const string BookstandALCHEMY1_S1_3 = "Эссенция маны";
const string BookstandALCHEMY1_S1_4 = "2 огненные крапивы";
const string BookstandALCHEMY1_S1_5 = "Экстракт маны";
const string BookstandALCHEMY1_S1_6 = "2 огненные травы";
const string BookstandALCHEMY1_S1_7 = "Эликсир маны";
const string BookstandALCHEMY1_S1_8 = "2 огненных корня";
const string BookstandALCHEMY1_S1_9 = "Для работы на алхимическом столе необходима мензурка.";
const string BookstandALCHEMY1_S1_10 = "Чтобы сварить любое лечебное зелье или зелье, усиливающее магическую силу, необходим особый ингредиент и растение:";
const string BookstandALCHEMY1_S1_11 = "Луговой горец";
const string BookstandALCHEMY1_S1_12 = "Чтобы сварить зелье, оказывающее перманентное воздействие на тело или дух, необходимо определенное растение:";
const string BookstandALCHEMY1_S1_13 = "Царский щавель";

func void Use_BookstandALCHEMY1_S1()
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
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_1);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_3);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_5);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_7);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY1_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY1_S1_9);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY1_S1_10);
		Doc_PrintLine(nDocID,1,BookstandALCHEMY1_S1_11);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY1_S1_12);
		Doc_PrintLines(nDocID,1,BookstandALCHEMY1_S1_13);
		Doc_Show(nDocID);
		Alchemy_1_permanent = B_GivePlayerXP_Bookstand(Alchemy_1_permanent);
	};
};

const string BookstandALCHEMY2_S1_1 = "Лечебные зелья";
const string BookstandALCHEMY2_S1_2 = "и ингредиенты";
const string BookstandALCHEMY2_S1_3 = "Лечебная эссенция";
const string BookstandALCHEMY2_S1_4 = "2 лечебные травы";
const string BookstandALCHEMY2_S1_5 = "Лечебный экстракт";
const string BookstandALCHEMY2_S1_6 = "2 лечебных растения";
const string BookstandALCHEMY2_S1_7 = "Лечебный эликсир";
const string BookstandALCHEMY2_S1_8 = "2 лечебных корня";
const string BookstandALCHEMY2_S1_9 = "Для работы на алхимическом столе необходима мензурка.";
const string BookstandALCHEMY2_S1_10 = "Чтобы сварить любое лечебное зелье или зелье, усиливающее магическую силу, необходим особый ингредиент и растение:";
const string BookstandALCHEMY2_S1_11 = "Луговой горец";
const string BookstandALCHEMY2_S1_12 = "Чтобы сварить зелье, имеющее перманентное действие на тело или дух, необходимо определенное растение:";
const string BookstandALCHEMY2_S1_13 = "Царский щавель";

func void Use_BookstandALCHEMY2_S1()
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
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_1);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_3);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_5);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_7);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY2_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY2_S1_9);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY2_S1_10);
		Doc_PrintLine(nDocID,1,BookstandALCHEMY2_S1_11);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY2_S1_12);
		Doc_PrintLines(nDocID,1,BookstandALCHEMY2_S1_13);
		Doc_Show(nDocID);
		Alchemy_2_permanent = B_GivePlayerXP_Bookstand(Alchemy_2_permanent);
	};
};

const string BookstandALCHEMY3_S1_1 = "Зелья, дающие перманентные изменения";
const string BookstandALCHEMY3_S1_2 = "и ингредиенты";
const string BookstandALCHEMY3_S1_3 = "Эликсир ловкости";
const string BookstandALCHEMY3_S1_4 = "1 гоблинская ягода";
const string BookstandALCHEMY3_S1_5 = "Зелье скорости";
const string BookstandALCHEMY3_S1_6 = "1 снеппер-трава - для этого зелья необходим не царский щавель, а луговой горец.";
const string BookstandALCHEMY3_S1_7 = "Эликсир силы";
const string BookstandALCHEMY3_S1_8 = "1 драконий корень";
const string BookstandALCHEMY3_S1_9 = "Эликсир жизни";
const string BookstandALCHEMY3_S1_10 = "1 лечебный корень";
const string BookstandALCHEMY3_S1_11 = "Эликсир духа";
const string BookstandALCHEMY3_S1_12 = "1 огненный корень";
const string BookstandALCHEMY3_S1_13 = "Применение этих рецептов - высшее алхимическое искусство. Все они требуют царского щавеля.";
const string BookstandALCHEMY3_S1_14 = "Зелье скорости варить значительно легче, частично потому, что для него не требуется царского щавеля.";

func void Use_BookstandALCHEMY3_S1()
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
		Doc_PrintLines(nDocID,0,BookstandALCHEMY3_S1_1);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_3);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_5);
		Doc_PrintLines(nDocID,0,BookstandALCHEMY3_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_7);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandALCHEMY3_S1_9);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_10);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandALCHEMY3_S1_11);
		Doc_PrintLine(nDocID,0,BookstandALCHEMY3_S1_12);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY3_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandALCHEMY3_S1_14);
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		Alchemy_3_permanent = B_GivePlayerXP_Bookstand(Alchemy_3_permanent);
	};
};

