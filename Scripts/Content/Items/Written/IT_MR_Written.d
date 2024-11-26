
const int Value_EarRecipe_Constantino = 500;
const int Value_EarRecipe_Thekla = 20;
const int Value_EarRecipe_Hilda = 50;

instance ItWr_PosterNaked(C_Item)
{
	name = "Рисунок";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_PosterNaked.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PosterNaked;
	scemeName = "MAP";
	description = "Изображение обнаженной женщины.";
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
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_Vino2Chief;
	scemeName = "MAP";
	description = name;
	text[2] = "Письмо Вино для его друзей";
};
func void Use_Letter_Vino2Chief()
{
	if (Npc_IsPlayer(self))	{
		PrintInInventory("О боги! Ну и почерк. Ничего не разобрать.");
	};
};
//===================================================
instance ItWr_Letter_Chief2Halvor(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_Chief2Halvor;
	scemeName = "MAP";
	description = name;
	text[2] = "Халвору от торговых партнеров.";
};
const string Letter_Chief2Halvor_1 = "Халвор,";
const string Letter_Chief2Halvor_2 = "Здесь весь обещаный товар. Вырученные деньги оставишь в обычном месте.";
const string Letter_Chief2Halvor_3 = "Передавшему это человеку можно доверить мелкие поручения.";
const string Letter_Chief2Halvor_4 = "Твой партнер";

func void Use_Letter_Chief2Halvor()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLine(nDocID,0,Letter_Chief2Halvor_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Letter_Chief2Halvor_2);
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Letter_Chief2Halvor_3);
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Letter_Chief2Halvor_4);
		Doc_Show(nDocID);
	};
};
//===================================================
instance ItWr_ScoreList(C_Item)
{
	name = "Список";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_ScoreList;
	scemeName = "MAPSEALED";
	description = "Очки участников конкурса";
};
func void Use_Letter_ScoreList()
{
	if (Npc_IsPlayer(self))	{
		B_Show_ScoreList();
	};
};

// РЕЦЕПТЫ =====================================

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
	description = "Рецепт настойки Константино";
	text[0] = "Настойка на грибах “Дамские уши“";
	text[1] = "Эксклюзив от Константино.";
	text[3] = "Надо отдать Грому.";
	text[5] = NAME_Value;	count[5] = value;
};
const string EarRecipe_Constantino_1 = "Грибная настойка на розовом древесном грибе (дамском ушке)";
const string EarRecipe_Constantino_2 = "Ингредиенты:";
const string EarRecipe_Constantino_3 = "Дамское ушко - 3 шт.";
const string EarRecipe_Constantino_4 = "Алкоголь (ром, джин) - 1 бут.";
const string EarRecipe_Constantino_5 = "Огненная крапива - 1 шт.";
const string EarRecipe_Constantino_6 = "Болотник - 1 шт.";
const string EarRecipe_Constantino_7 = "Уголь - 1 шт.";
const string EarRecipe_Constantino_8 = "Грибы и травы слегка размять и залить алкоголем. Положить кусок угля и оставить на 3 дня в темном прохладном месте. После этого извлечь уголь (не использовать, ядовит!) и настаивать еще сутки.";
const string EarRecipe_Constantino_9 = "Готовую настойку процедить и тщательно закупорить для хранения.";
const string EarRecipe_Constantino_10 = "Применение: облегчает похмелье, зубную боль и морскую болезнь. Растирание на грудь и спину при сильном жаре.";

func void Use_EarRecipe_Constantino()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,50,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,EarRecipe_Constantino_1);
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,EarRecipe_Constantino_2);
		Doc_PrintLines(nDocID,0,EarRecipe_Constantino_3);
		Doc_PrintLines(nDocID,0,EarRecipe_Constantino_4);
		Doc_PrintLines(nDocID,0,EarRecipe_Constantino_5);
		Doc_PrintLines(nDocID,0,EarRecipe_Constantino_6);
		Doc_PrintLines(nDocID,0,EarRecipe_Constantino_7);
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,EarRecipe_Constantino_8);
		Doc_PrintLines(nDocID,0,EarRecipe_Constantino_9);
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,EarRecipe_Constantino_10);
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
	description = "Уши в масле от Теклы";
	text[1] = "Рецепт жареных грибов “Дамские уши“";
	text[3] = "Надо отдать Грому.";
	text[5] = NAME_Value;	count[5] = value;
	
};
const string EarRecipe_Thekla_1 = "     Уши в масле от Теклы";
const string EarRecipe_Thekla_2 = "Грибы-уши замочить в трех водах по 3 часа. Хорошенько отжать и обсушить.";
const string EarRecipe_Thekla_3 = "Растопить на сковороде бараний жир на полпальца. Грибы обжарить до коричневой корочки, снять с огня. Добавить мелко порезаную луковицу и яблоко, посолить, поперчить.";
const string EarRecipe_Thekla_4 = "Подавать горячим.";

func void Use_EarRecipe_Thekla()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,EarRecipe_Thekla_1);
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,EarRecipe_Thekla_2);
		Doc_PrintLines(nDocID,0,EarRecipe_Thekla_3);
		Doc_PrintLines(nDocID,0,EarRecipe_Thekla_4);
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
	description = "Маринованые ушки";
	text[1] = "Рецепт бабушки Хильды.";
	text[3] = "Надо отдать Грому.";
	text[5] = NAME_Value;	count[5] = value;
};
const string EarRecipe_Hilda_1 = "Маринованые грибы “дамские уши“";
const string EarRecipe_Hilda_2 = "Грибы отварить до полумягкости. В горячий отвар добавить меру соли, две меры уксуса и огненный корень. Дно бочонка плотно выстлать дубовыми листьями. Положить грибы, залить маринадом. Поставить под пресс на неделю. Хранить в погребе, маринад не пить!";

func void Use_EarRecipe_Hilda()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,EarRecipe_Hilda_1);
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,EarRecipe_Hilda_2);
		Doc_Show(nDocID);
	};
};

//===================================================
instance ItWr_TuskCertificate(C_Item)
{
	name = "Сертификат";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	description = "Сертификат на кабаньи клыки";
	text[1] = "Выдан Боспером.";
	text[2] = "Подверждает длину клыков кабана:";
	text[3] = "левый: 4 и 1/10 пальца";
	text[4] = "правый: 4 и 1/12 пальца";
};

//===================================================
instance ItWr_Letter_Dikar(C_Item)
{
	name = "Письмо Дикаря";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Letter_Dikar;
	scemeName = "MAP";
	description = name;
	text[2] = "Искателю грибов от Дикаря";
};
const string Letter_Dikar_1 = "Приветствую тебя, путник!";
const string Letter_Dikar_2 = "Если ты читаешь эту записку, то, значит, в своих странствиях ты забрел в мою пещеру.";
const string Letter_Dikar_3 = "Меня сейчас нет дома, но в моем скромном жилище ты можешь переждать ненастье, укрыться от опасности и дождаться утра. Располагайся поудобнее и не стесняйся.";
const string Letter_Dikar_4 = "А чтобы тебе было не скучно коротать здесь время, я оставил для тебя книгу. Надеюсь, она тебе понравится.";
const string Letter_Dikar_5 = "Дикарь";

func void Use_Letter_Dikar()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,100,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,Letter_Dikar_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Letter_Dikar_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Letter_Dikar_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Letter_Dikar_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Letter_Dikar_5);
		Doc_Show(nDocID);
	};
};

//===================================================
instance ItWr_HeroPortrait_FromFireDragon(C_ITEM)
{
	name = "Мое изображение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_HeroPortrait;
	description = name;
	text[1] = "Выполнено скринописью";
	text[3] = "С обратной стороны надпись:";
	text[4] = "На память от FIRE DRAGON`а";
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
