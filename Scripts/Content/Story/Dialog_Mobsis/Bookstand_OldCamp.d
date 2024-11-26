
const string Bookstand_Milten_03_S1_1 = "Поздно.";
const string Bookstand_Milten_03_S1_2 = "Обрушение этой старой шахты вызвало сильное недовольство рудных баронов.";
const string Bookstand_Milten_03_S1_3 = "Гомеш похож на пороховую бочку, которая вот-вот взорвется.";
const string Bookstand_Milten_03_S1_4 = "Корристо";
const string Bookstand_Milten_03_S1_5 = "Он думает, что в обрушении шахты виноват этот новый парень. Да, конечно, мне он тоже кажется странным. И лучше ему больше здесь не показываться.";
const string Bookstand_Milten_03_S1_6 = "Корристо";
const string Bookstand_Milten_03_S1_7 = "Гомеш готов со злости разнести все вокруг, и мне кажется, я знаю, что он планирует. Мы должны предупредить Магов Воды, пока еще не слишком поздно.";
const string Bookstand_Milten_03_S1_8 = "Корристо";
const string Bookstand_Milten_03_S1_9 = "Возможно, нам удастся избежать катастрофы. Невыносимо думать о том, что произойдет, если шахта ...";

func void Bookstand_Milten_03_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Milten_03_S1_1);
		Doc_PrintLines(nDocID,0,Bookstand_Milten_03_S1_2);
		Doc_PrintLines(nDocID,0,Bookstand_Milten_03_S1_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Milten_03_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Milten_03_S1_5);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Milten_03_S1_6);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Milten_03_S1_7);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,Bookstand_Milten_03_S1_8);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Milten_03_S1_9);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Milten_02_S1_1 = "Я позволил себе устроиться здесь немного комфортнее. Кто бы мог подумать, что однажды я останусь единственным магом в лагере?";
const string Bookstand_Milten_02_S1_2 = "Ну, не могу сказать, что я рад возвращению. На самом деле, мне очень хочется убраться отсюда.";
const string Bookstand_Milten_02_S1_3 = "Этой экспедиции не суждено увенчаться успехом.";
const string Bookstand_Milten_02_S1_4 = "Старатели ушли вчера. Они взяли с собой Диего - не удивлюсь, если он сбежит.";
const string Bookstand_Milten_02_S1_5 = "Не думаю, что ему понравится махать киркой.";
const string Bookstand_Milten_02_S1_6 = "Ну, а я использую свободное время для более углубленного изучения алхимии.";
const string Bookstand_Milten_02_S1_7 = "Милтен";

func void Bookstand_Milten_02_S1()
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
		Doc_PrintLines(nDocID,0,Bookstand_Milten_02_S1_1);
		Doc_PrintLines(nDocID,0,Bookstand_Milten_02_S1_2);
		Doc_PrintLines(nDocID,0,Bookstand_Milten_02_S1_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Milten_02_S1_4);
		Doc_PrintLines(nDocID,1,Bookstand_Milten_02_S1_5);
		Doc_PrintLines(nDocID,1,Bookstand_Milten_02_S1_6);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,Bookstand_Milten_02_S1_7);
		Doc_Show(nDocID);
	};
};

func void Bookstand_Milten_01_S1()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		Document = Doc_CreateMap();
		Doc_SetPages(Document,1);
		Doc_SetPage(Document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
		Doc_Show(Document);
	};
};

const string Bookstand_Engor_01_S1_1 = "Запасы";
const string Bookstand_Engor_01_S1_2 = "Мы нашли кое-что - ничего полезного. Список прилагается:";
const string Bookstand_Engor_01_S1_3 = "3 ящика старья";
const string Bookstand_Engor_01_S1_4 = "8 ящиков ржавых железяк";
const string Bookstand_Engor_01_S1_5 = "4 ящика с разбитыми доспехами";
const string Bookstand_Engor_01_S1_6 = "5 ящиков (вонючих) кожи и шкур";
const string Bookstand_Engor_01_S1_7 = "2 ящика с кирками";
const string Bookstand_Engor_01_S1_8 = "3 ящика с инструментами";
const string Bookstand_Engor_01_S1_9 = "16 ящиков с камнями (руды там почти нет)";
const string Bookstand_Engor_01_S1_10 = "1 ящик с ржавыми лезвиями";
const string Bookstand_Engor_01_S1_11 = "4 ящика с разбитой посудой";
const string Bookstand_Engor_01_S1_12 = "56 бочек с водой";
const string Bookstand_Engor_01_S1_13 = "1 ящик с чем-то липким (что бы там ни было, оно сгнило)";
const string Bookstand_Engor_01_S1_14 = "Энгор";

func void Bookstand_Engor_01_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Engor_01_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Engor_01_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Engor_01_S1_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Engor_01_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Engor_01_S1_5);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Engor_01_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_7);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_8);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_9);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_10);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_11);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_12);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Engor_01_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,Bookstand_Engor_01_S1_14);
		Doc_Show(nDocID);
	};
};

