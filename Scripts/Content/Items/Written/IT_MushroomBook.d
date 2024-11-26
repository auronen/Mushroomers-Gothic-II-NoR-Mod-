
instance ItWr_MushroomBook(C_Item)
{
	name = "Книга";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	
	visual = "ItWr_Book_Green.3DS";
	material = MAT_LEATHER;
	
	description = "Грибы Хориниса";
	text[2] = "Книга алхимика Константино.";
	text[3] = "Это приз за победу в грибном конкурсе.";
	
	
	scemeName = "MAP";
	on_state[0] = Use_MushroomBook;
};

const Int MRBook_Top_Margin = 50;
const Int MRBook_Btm_Margin = 50;

var int MRBook_Page;
const int MRBook_PageMax = 27;

//================================================================
const string MRBook_Show_Cover_1 = "            Г р и б ы";
const string MRBook_Show_Cover_2 = "        Х о р и н и с а";
const string MRBook_Show_Cover_3 = "   Управление: СТРЕЛКИ, Home, End";

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
const string MRBook_Show_Title_1 = "Сей экземпляр ";
const string MRBook_Show_Title_2 = "в знак признательности";
const string MRBook_Show_Title_3 = "за развитие науки о грибах";
const string MRBook_Show_Title_4 = "    Грибы Хориниса";
const string MRBook_Show_Title_5 = "                Писано Константино, алхимиком";
const string MRBook_Show_Title_6 = "                        из квартала ремесленников";
const string MRBook_Show_Title_7 = "                         в портовом городе Хоринис";

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
	BestName = "вручаю ";
	if (C_HeroIs_Elena())	{	BestName = ConcatStrings(BestName, "Елене");	}	else
	if (C_HeroIs_Erol())	{	BestName = ConcatStrings(BestName, "почтенному Эролу");	}	else
	if (C_HeroIs_Odo())		{	BestName = ConcatStrings(BestName, "Одо");	}	else
	if (C_HeroIs_Rupert())	{	BestName = ConcatStrings(BestName, "Руперту");	}	else
	if (C_HeroIs_Sarah())	{	BestName = ConcatStrings(BestName, "Саре");	}	else
	if (C_HeroIs_Talbin())	{	BestName = ConcatStrings(BestName, "Талбину");	}	else
	if (C_HeroIs_Till())	{	BestName = ConcatStrings(BestName, "Тиллу");	};
	BestName = ConcatStrings(BestName, ",");
	Doc_PrintLine(docID,1,BestName);
	if (hero.aivar[AIV_Gender] == FEMALE)	{
		BestName = "лучшей среди сборщиков грибов,";
	}
	else	{
		BestName = "лучшему среди сборщиков грибов,";
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
const string MRBook_Show_Summary_1 = "Грибной мир Хориниса, несомненно, заслуживающий внимания, до сего момента не был широко освещен в трудах ученых.";
const string MRBook_Show_Summary_2 = "Число изученных ныне видов достигает двух десятков. Одни из них, такие как мясные и темные, хорошо знакомы простым людям. О других знают лишь искушенные исследователи.";
const string MRBook_Show_Summary_3 = "Данный трактат призван пролить толику света на свойства этих видов, их распространение и способы практического применения.";
const string MRBook_Show_Summary_4 = "    Введение";
const string MRBook_Show_Summary_5 = "  Традиционно, грибы разделяют на съедобные и ядовитые. И те, и другие могут найти свое применение в алхимии. Содержащийся в грибах яд может служить не только отравой, но и лекарством, при употреблении в правильной дозе. В иных случаях яд можно нейтрализовать, например, путем длительного отваривания.";
const string MRBook_Show_Summary_6 = "  Некоторые невежественные люди полностью отказываются от употребления грибов, опасаясь отравления. Немало способствует этому суеверие, согласно которому грибы суть ночные цветы смерти, порождение тьмы Белиара.";

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
const string MRBook_Show_Intro1_1 = "  Типичное строение гриба включает подземную часть (грибницу) и надземную (тело гриба).";
const string MRBook_Show_Intro1_2 = "  Полезным является лишь плодовое тело гриба. Как правило, оно состоит из шляпки и ножки, хотя есть и исключения. Шляпка и ножка могут быть цельными, как у трубачей, или легко отделяющимися друг от друга, как у темных грибов.";
const string MRBook_Show_Intro1_3 = "  Долгое время единственным способом размножения грибов считался перенос грибницы, пока мастером Микели не было открыто, что из рассыпаемой перезрелыми грибами “пыли“ вырастают новые грибы. Он назвал эту пыль “спорами“.";
const string MRBook_Show_Intro1_4 = "  Спороносный слой обычно располагается на нижней части шляпки и может иметь различную форму. Чаще всего встречаются грибы с пластинчатым слоем, также выделяют складчатый, пористый (трубчатый), гладкий и другие, более редкие формы. В процессе роста шляпка гриба зачастую изменяет форму, постепенно раскрываясь и открывая спороносный слой. У некоторых грибов, таких как трехглавый сумочник, спороносный слой располагается на всей поверхности шляпки.";

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
const string MRBook_Show_Intro2_1 = "  Другие грибы содержат споры внутри тела, которое, созревая, взрывается и рассеивает их в воздухе. Такие грибы принято называть “пыльниками“ или “курильщиками“. На Хоринисе произрастает бутылочный пыльник, а также уникальный вид “ночная искра“.";
const string MRBook_Show_Intro2_2 = "  Природа грибов во многом остается загадкой. До сих пор остается открытым вопрос, следует ли относить грибы к растениям, или выделять в отдельную группу живых организмов. Иные считают грибы мягкими минералами.";
const string MRBook_Show_Intro2_3 = "  Последнюю версию мы категорически отрицаем. Обладая поверхностным сходством с минералами, в отличие от них грибы растут, размножаются и умирают.";
const string MRBook_Show_Intro2_4 = "Подобно другим существам, жизнь грибов основана на воде, без нее они гибнут. Как и растения, грибы произрастают в почве, либо на других растениях и имеют подземную часть, подобную корням - грибницу. Размножаются грибы также подобно растениям: мельчайшими семенами - спорами. И растения, и грибы не способны передвигаться.";
const string MRBook_Show_Intro2_5 = "  Однако грибы не имеют других характерных частей растений - зеленых листьев и цветков. Если растения нуждаются в свете, то грибы предпочитают затененные места. По вкусу грибы больше напоминают мясо.";
const string MRBook_Show_Intro2_6 = "  Мы отнесем грибы к общей группе тайнобрачных организмов, наряду с лишайниками и полипами.";

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
const string MRBook_Show_MR_01_1 = "            Темный гриб";
const string MRBook_Show_MR_01_2 = "Адский гриб";
const string MRBook_Show_MR_01_3 = "Описание: Гриб средних размеров, с темной шляпкой в форме полусферы, фактура гладкая. Ножка светло-серая, с желтоватым или зеленоватым оттенком. Спороносный слой пластинчатый, темный.";
const string MRBook_Show_MR_01_4 = "Имеет характерный резкий запах и горьковатый вкус. ";
const string MRBook_Show_MR_01_5 = "Распространение: Один из наиболее распространенных грибов на острове. Темные грибы растут почти повсеместно, в том числе в пещерах.";
const string MRBook_Show_MR_01_6 = "Сезон: круглогодично.";
const string MRBook_Show_MR_01_7 = "Свойства: Обладает целебным действием. При регулярном употреблении повышает магическую энергию. Имеются неподтвержденные сведения о негативных побочных эффектах, включая галлюцинации.";
const string MRBook_Show_MR_01_8 = "Концентрат из шляпки гриба используется для приготовления зелий, повышающих магические способности.";

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
const string MRBook_Show_MR_02_1 = "           Мясной гриб";
const string MRBook_Show_MR_02_2 = "Пища рудокопа, рабский хлеб";
const string MRBook_Show_MR_02_3 = "Описание: Крупный гриб со светлой гладкой шляпкой и ножкой. Диаметр шляпки достигает двух ладоней. Спороносный слой пластинчатый, темный.";
const string MRBook_Show_MR_02_4 = "Распространение: Растет повсеместно в сырых и затененных местах, часто встречается в подземельях. ";
const string MRBook_Show_MR_02_5 = "Сезон: круглогодично.";
const string MRBook_Show_MR_02_6 = "Свойства: Чрезвычайно питательный гриб, способный заменить буханку хлеба или кусок мяса. Побочные эффекты отсутствуют. Существует рецепт целебного зелья из мясного гриба, но со слабым эффектом.";

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
const string MRBook_Show_Red_1 = "       Красный лесной гриб";
const string MRBook_Show_Red_2 = "Болтун, пустозвон, краснобай";
const string MRBook_Show_Red_3 = "Описание: Гриб средних размеров с ярко-красной бархатистой шляпкой и ровной белой ножкой. Спороносный слой пластинчатый, белый или розовый.";
const string MRBook_Show_Red_4 = "Распространение: Широко распространен. Чаще всего встречается в лесных массивах, реже на лугах.";
const string MRBook_Show_Red_5 = "Сезон: осень.";
const string MRBook_Show_Red_6 = "Свойства: Широко употребляется в пищу после обработки. Сам по себе безвкусен и бесполезен. Побочные эффекты отсутствуют. Применение в алхимии неизвестно.";

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
const string MRBook_Show_Piny_1 = "            Сосновый гриб";
const string MRBook_Show_Piny_2 = "Сосновик";
const string MRBook_Show_Piny_3 = "  Описание: Небольшой гриб. Шляпка в центре коричневая, по краям светло-зеленая. Ножка белая, с небольшим утолщением и следами вольвы в середине. Спороносный слой пластинчатый, белый.";
const string MRBook_Show_Piny_4 = "  Распространение: Чаще всего растет возле сосен, или на светлых проветриваемых полянах.";
const string MRBook_Show_Piny_5 = "  Сезон: лето-осень.";
const string MRBook_Show_Piny_6 = "  Свойства: Съедобен. Обладает слабым целебным эффектом. Побочные эффекты отсутствуют. Используется как второстепенный ингредиент нескольких зелий разного свойства.";

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
const string MRBook_Show_BrownOiler_1 = "           Масляк еловый";
const string MRBook_Show_BrownOiler_2 = "Коричневый масляк, звездчатка";
const string MRBook_Show_BrownOiler_3 = "Описание: Шляпка плоская коричневая, с характерной маслянистой пленкой. В центре бывает заметен рыжеватый узор в форме шестиконечной звезды. Ножка неширокая, белая. Спороносный слой пластинчатый, светло-желтый или белый.";
const string MRBook_Show_BrownOiler_4 = "Распространение: Чаще всего растет под елями, в затененных местах, реже - под другими деревьями.";
const string MRBook_Show_BrownOiler_5 = "Сезон: осень, весна.";
const string MRBook_Show_BrownOiler_6 = "Свойства: Съедобен. Побочные эффекты отсутствуют. Используется для приготовления мази от бородавок и настойки от кашля.";

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
const string MRBook_Show_Stone_1 = "          Каменевидный гриб";
const string MRBook_Show_Stone_2 = "Каменка, шаровик";
const string MRBook_Show_Stone_3 = "Описание: Светло-серый или светло-коричневый гриб шаровидной формы. Ножка практически отсутствует. Внешне гриб напоминает небольшой камень, но он очень легкий. Спороносный слой пластинчатый, темный.";
const string MRBook_Show_Stone_4 = "Распространение: Открытые пространства и пещеры, на земле и каменистой почве. Плохо переносит соседство растений. Часто вырастает группами по 2-3 штуки.";
const string MRBook_Show_Stone_5 = "Сезон: круглогодично.";
const string MRBook_Show_Stone_6 = "Свойства: Съедобен. Восстанавливает физические и магические силы. При употреблении в больших количествах может вызвать расстройство желудка. Пластины и споры гриба усиливают эффект некоторых зелий.";

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
const string MRBook_Show_Governor_1 = "        Губернаторский гриб";
const string MRBook_Show_Governor_2 = "Губернатор";
const string MRBook_Show_Governor_3 = "Описание: Крупный гриб с коричневой шляпкой. Спороносный слой пластинчатый, белый. Ножка белая, с хорошо заметными воротником.";
const string MRBook_Show_Governor_4 = "Интересно происхождение названия гриба. Его  “шляпа“ с широкими полями и белый “воротник“ чрезвычайно напоминали наряд одного из губернаторов Хориниса прошлого столетия. Сведения о деяниях самого губернатора не сохранились, но название “губернатор“ прочно сохранилось за грибом. ";
const string MRBook_Show_Governor_5 = "Распространение: Растет в крупных лесных массивах, но в отдалении от деревьев и других растений.";
const string MRBook_Show_Governor_6 = "Сезон: конец лета-осень.";
const string MRBook_Show_Governor_7 = "Свойства: Съедобен. Побочные эффекты отсутствуют. Существует легенда, что тот, кто съест ровно 28 таких грибов, может увидеть призрак губернатора. В алхимии практически не используется.";

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
const string MRBook_Show_Sunrise_1 = "            Желтый трубач";
const string MRBook_Show_Sunrise_2 = "Зорьник";
const string MRBook_Show_Sunrise_3 = "Описание: Желтый или рыжеватый гриб воронковидной формы с неровными краями. Шляпка и ножка цельные. На шляпке видны более темные красные или коричневые кольца. Спороносный слой складчатый, одного с шляпкой и ножкой цвета.";
const string MRBook_Show_Sunrise_4 = "Распространение: Восточная часть острова. Растет преимущественно на открытом пространстве.";
const string MRBook_Show_Sunrise_5 = "Сезон: осень-зима.";
const string MRBook_Show_Sunrise_6 = "Свойства: Условно-съедобен. В сыром виде повышает ловкость, но вызывает небольшое отравление. При должной обработке негативный эффект можно нейтрализовать.";

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
const string MRBook_Show_Foggy_1 = "            Белый трубач";
const string MRBook_Show_Foggy_2 = "Туманник, призрачный гриб";
const string MRBook_Show_Foggy_3 = "Описание: Белый воронковидный гриб со светло-коричневыми чешуйками. Ножка и шляпка цельные. Спороносный слой складчатый. Крупнее и с более ровным краем, чем желтый трубач. При созревании быстро чернеет и распадается на части, будто растворяется в земле.";
const string MRBook_Show_Foggy_4 = "Распространение: Растет в низких сырых местах, где скапливается туман. Часто можно встретить на кладбищах, болотах.";
const string MRBook_Show_Foggy_5 = "Сезон: осень.";
const string MRBook_Show_Foggy_6 = "Свойства: Несъедобен! Вызывает стойкое отравление, сопровождающееся головокружением и провалами памяти, но летальные случаи редки.";
const string MRBook_Show_Foggy_7 = "В алхимии бесполезен, даже для приготовления ядов.";

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
const string MRBook_Show_LadysEar_1 = "      Древесный розовый гриб";
const string MRBook_Show_LadysEar_2 = "Дамское ушко";
const string MRBook_Show_LadysEar_3 = "  Описание: Розовый асимметричный гриб, шляпка отдаленно напоминает человеческое ухо. Спороносный слой складчатый, слабо выраженный, красноватый.";
const string MRBook_Show_LadysEar_4 = "  Распространение: Растет на деревьях и пнях, реже среди корней. Изредка вырастает большая группа грибов.";
const string MRBook_Show_LadysEar_5 = "  Сезон: лето-начало осени.";
const string MRBook_Show_LadysEar_6 = "  Свойства: Условно-съедобен. В сыром виде понижает магические способности, но на этих грибах делаются некоторые настойки.";

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
const string MRBook_Show_Keil_1 = "             Кабаний гриб";
const string MRBook_Show_Keil_2 = "Кабанчик, желтобок";
const string MRBook_Show_Keil_3 = "Описание: Самый крупный гриб Хориниса, очень плотный. Созревший гриб может спокойно выдержать вес взрослого мужчины, а шляпка по размерам сравнима с табуретом. У молодого гриба шляпка шаровидная и имеет темный, почти черный, цвет. ";
const string MRBook_Show_Keil_4 = "В течение 4-7 дней на шляпке образуется крупное желтое пятно и она раскрывается. Молодая шляпка мягкая, мясистая, раскрывшаяся - твердая, одеревеневшая. Ножка белая. Спороносный слой трубчатый, желтоватый, слизистый.";
const string MRBook_Show_Keil_5 = "Распространение: Растет в густом подлеске, часто среди папоротников. В тех же местах часто водятся дикие кабаны, из-за чего сбор этих грибов затрудняется.";
const string MRBook_Show_Keil_6 = "Сезон: лето-осень.";
const string MRBook_Show_Keil_7 = "Свойства: Употребляются только молодые нераскрывшиеся грибы, способные повысить силу человека. Раскрывшиеся грибы становятся слишком твердыми и теряют все полезные качества.";

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
const string MRBook_Show_Bottle_1 = "        Хоринисский пыльник";
const string MRBook_Show_Bottle_2 = "Бутылочник, курильщик";
const string MRBook_Show_Bottle_3 = "Описание: Ножка гриба по форме напоминает желтую бутылку, а шляпка - коричневую круглую пробку. Ножка плотная, белая на срезе. Спороносный слой отсутствует, споры заключены в теле гриба, которое взрывается при созревании.";
const string MRBook_Show_Bottle_4 = "Распространение: Растет на земле, на слабо притененных пространствах. Часто встречается в зарослях кустарника, вблизи дорог.";
const string MRBook_Show_Bottle_5 = "Сезон: осень-весна.";
const string MRBook_Show_Bottle_6 = "Свойства: Съедобна только ножка гриба. Шляпка вызывает отравление, а при употреблении в больших количествах - снижает силу. В алхимии применяются обе части гриба, но отдельно.";

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
const string MRBook_Show_Trident_1 = "        Трехглавый сумочник";
const string MRBook_Show_Trident_2 = "Трезубец";
const string MRBook_Show_Trident_3 = "Описание: Представляет собой  сросшийся тройной гриб. Центральный гриб обычно выше двух других. Шляпки коричневые, конической формы. Ножка бело-голубая.";
const string MRBook_Show_Trident_4 = "                     Спороносный слой,";
const string MRBook_Show_Trident_5 = "                     сумчатый находится ";
const string MRBook_Show_Trident_6 = "                     в складках, располо-";
const string MRBook_Show_Trident_7 = "                     женных по всей";
const string MRBook_Show_Trident_8 = "                     поверхности шляпок.";
const string MRBook_Show_Trident_9 = "Распространение: Чаще вырастает в горах и лесных массивах, но в общем случае его можно встретить где угодно.";
const string MRBook_Show_Trident_10 = "Сезон: лето-осень.";
const string MRBook_Show_Trident_11 = "Свойства: Условно-съедобен, в сыром виде вызывает слабость и дрожание конечностей. Для употребления в пищу требуется отваривать не менее двух часов в трех водах. В алхимии используется для приготовления как целебных мазей и настоек, так и ядов.";

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
const string MRBook_Show_Branch_1 = "           Ветвистый гриб";
const string MRBook_Show_Branch_2 = "Веточник, кустистый гриб";
const string MRBook_Show_Branch_3 = "Описание: Гриб, имитирующий ветку дерева. Цвет имеет бело-зеленый или бело-коричневый, более светлый у основания. ";
const string MRBook_Show_Branch_4 = "Спороносный слой гладкий, ";
const string MRBook_Show_Branch_5 = "покрывает верхушки каждой ";
const string MRBook_Show_Branch_6 = "ветки.";
const string MRBook_Show_Branch_7 = "Распространение: Встречается достаточно редко, в высокой траве или зарослях кустарника.";
const string MRBook_Show_Branch_8 = "Сезон: лето-осень.";
const string MRBook_Show_Branch_9 = "Свойства: Съедобен, имеет кисловатый вкус. Наиболее полезны темные верхушки, из которых готовят вытяжку для лечения суставов.";

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
const string MRBook_Show_DragonTears_1 = "           Драконовы слезы";
const string MRBook_Show_DragonTears_2 = "Описание: Гриб в виде нескольких синих или голубых шариков на тонкой белой ножке. У незрелого гриба шарики наполнены слизистой полупрозрачной массой, у зрелого она высыхает и превращается в споры. Тогда при малейшем прикосновении все шарики взрываются.";
const string MRBook_Show_DragonTears_3 = "Распространение: Встречается редко, в светлых и открытых, хорошо продуваемых, местах.";
const string MRBook_Show_DragonTears_4 = "Сезон: весна-осень.";
const string MRBook_Show_DragonTears_5 = "Свойства: Ядовит! Слизь и споры разъедают плоть и даже при попадании на кожу вызывают сильное раздражение. Два-три съеденных гриба могут привести к летальному исходу. Используется для приготовления быстродействующих ядов, в малых дозах - для ускорения эффектов целебных мазей.";

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
const string MRBook_Show_NightSparcles_1 = "             Ночные искры";
const string MRBook_Show_NightSparcles_2 = "Описание: Маленький гриб, менее пальца в высоту. Красно-оранжевый шарик на белой ложной ножке. В темноте светится красными искрами. Такие грибы всегда растут группами по 10-15 штук.";
const string MRBook_Show_NightSparcles_3 = "Распространение: Эти грибы растут только ночью! При попадании на них солнечного света взрываются, рассеивая ярко-красные споры. Можно найти на пнях и поваленных стволах деревьев.";
const string MRBook_Show_NightSparcles_4 = "Сезон: лето-осень.";
const string MRBook_Show_NightSparcles_5 = "Свойства: Ценный алхимический гриб! Используется для приготовления ряда целебных зелий и мазей. К сожалению, слишком редок для широкого использования. В сыром виде обладает слабым целебным эффектом. Изредка употребляется в качестве приправы, поскольку имеет островатый привкус. Подобное применение этих грибов - настоящее варварство и расточительство!";

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
const string MRBook_Show_GoldPlate_1 = "              Золотая чаша";
const string MRBook_Show_GoldPlate_2 = "Царское блюдо";
const string MRBook_Show_GoldPlate_3 = "Описание: Крупный чашевидный гриб неправильной формы, золотисто-желтого или оранжевого цвета с крупными голубыми и красными пятнами. Ножка отсутствует.";
const string MRBook_Show_GoldPlate_4 = "Распространение: Встречается в местах с высокой концентрацией магической энергии.";
const string MRBook_Show_GoldPlate_5 = "Сезон: начало осени.";
const string MRBook_Show_GoldPlate_6 = "Свойства: Чрезвычайно редкий и ценный гриб. Сам по себе оказывает лишь слабый целебный эффект, но может служить основой для сильнейших зелий и настоек. Обработка этого гриба является сложным процессом, требующим терпения и внимательности. Только опытные алхимики добиваются нужного результата.";

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
const string MRBook_Show_Ivy_1 = "             Сонный гриб";
const string MRBook_Show_Ivy_2 = "Плющевик";
const string MRBook_Show_Ivy_3 = "Описание: Небольшой гриб с белой ножкой и желто-коричневой шляпкой. Из одной точки растет по 2-4 гриба. Шляпка сначала шаровидная, постепенно раскрывается, края могут загибаться вверх. Спороносный слой трубчатый, белый.";
const string MRBook_Show_Ivy_4 = "Распространение: Сонный гриб встречается исключительно на скалах и камнях, среди зарослей плюща. Его можно найти и в городе, и в дикой местности.";
const string MRBook_Show_Ivy_5 = "Сезон: осень-зима.";
const string MRBook_Show_Ivy_6 = "Свойства: В сыром виде практически не оказывает эффекта, но в смеси с луговом горцем образует сильнейшее снотворное.";

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
const string MRBook_Show_Violet_1 = "         Фиолетовая поганка";
const string MRBook_Show_Violet_2 = "Белиарова поганка";
const string MRBook_Show_Violet_3 = "Описание: Одиночный гриб ярко-фиолетового окраса. Шляпка коническая, ножка тонкая, но не очень длинная, с оранжевой полосой по середине. В темноте испускает слабое мерцание. Спороносный слой пластинчатый.";
const string MRBook_Show_Violet_4 = "Распространение: Вырастает на гнилой древесине: погибших деревьях, пнях, старых постройках. Используется рудокопами для определения балок, которые нуждаются в замене.";
const string MRBook_Show_Violet_5 = "Сезон: круглогодично.";
const string MRBook_Show_Violet_6 = "Свойства: Ядовитый гриб! Ни в коем случае нельзя употреблять в пищу, даже небольшой кусочек приводит к мгновенной смерти. Используется для приготовления сильнейших ядов.";

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
const string MRBook_Show_Gray_1 = "            Серая поганка";
const string MRBook_Show_Gray_2 = "Пещерная поганка";
const string MRBook_Show_Gray_3 = "Описание: Высокий тонкий гриб, равномерного серого окраса. Шляпка конической формы, спороносный слой пластинчатый.";
const string MRBook_Show_Gray_4 = "Распространение: Серые поганки растут повсеместно, в сырых и темных местах, под корнями деревьев и в пещерах, всегда большими группами.";
const string MRBook_Show_Gray_5 = "Сезон: круглогодично.";
const string MRBook_Show_Gray_6 = "Свойства: Ядовитый гриб! Вызывает головокружение, тошноту, озноб, галлюцинации, причем эффект может продолжаться в течение длительного времени. В больших количествах смертелен. Изредка употребляется в алхимии для изготовления ядов, дешевых, но нестойких.";

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
const string MRBook_Show_Idle_1 = "     Красный и синий пустырь";
const string MRBook_Show_Idle_2 = "Описание: Эти грибы всегда растут большой общей группой.";
const string MRBook_Show_Idle_3 = "Ножка белая, длинная и полая внутри. Шляпка плоская или полусферическая, в темноте испускает слабый свет. Спороносный слой пластинчатый, белый.";
const string MRBook_Show_Idle_4 = "Распространение: Пустыри часто встречаются в пещерах, реже - в тени деревьев.";
const string MRBook_Show_Idle_5 = "Сезон: круглогодично.";
const string MRBook_Show_Idle_6 = "Свойства: Практически не содержат мякоти, после сбора быстро высыхают и рассыпаются в труху. Несъедобен. Вызывает слабое отравление, смертельные случаи неизвестны.";

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
const string MRBook_Show_Polypore_1 = "           Древесный гриб";
const string MRBook_Show_Polypore_2 = "Древесный полип";
const string MRBook_Show_Polypore_3 = "Описание: Лишены каких-либо признаков ножки. Шляпка сверху твердая, одеревеневшая, цвета желтого с зеленым или коричневым оттенком. Спороносный слой трубчатый, плотный, того же цвета, что и вся шляпка.";
const string MRBook_Show_Polypore_4 = "Распространение: Древесные грибы, как следует из названия, произрастают на стволах деревьев, как живых, так и поваленных. В отличие от обычных грибов, древесные растут в течение длительного времени, иногда нескольких десятков лет. Примечательно, что они никогда не соседствуют с дамскими ушками.";
const string MRBook_Show_Polypore_5 = "Сезон: круглогодично.";
const string MRBook_Show_Polypore_6 = "Свойства: Мякоть древесных грибов несъедобна, но высушенная хорошо горит и может использоваться для изготовления трута.";

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
