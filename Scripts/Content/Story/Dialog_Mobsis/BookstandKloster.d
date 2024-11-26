
const string Bookstand_Rune_01_S1_1 = "Страница 1";
const string Bookstand_Rune_01_S1_2 = "Рунные камни";
const string Bookstand_Rune_01_S1_3 = "Страница 2";

func void Use_Bookstand_Rune_01_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Rune_01_S1_1);
		Doc_PrintLine(nDocID,0,Bookstand_Rune_01_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,Bookstand_Rune_01_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

const string Bookstand_Rune_02_S1_1 = "Страница 1";
const string Bookstand_Rune_02_S1_2 = "Руны и ингредиенты";
const string Bookstand_Rune_02_S1_3 = "Страница 2";

func void Use_Bookstand_Rune_02_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Rune_02_S1_1);
		Doc_PrintLine(nDocID,0,Bookstand_Rune_02_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,Bookstand_Rune_02_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

const string Bookstand_Innos_01_S1_1 = "Страница 1";
const string Bookstand_Innos_01_S1_2 = "Учение Инноса";
const string Bookstand_Innos_01_S1_3 = "Страница 2";

func void Use_Bookstand_Innos_01_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Innos_01_S1_1);
		Doc_PrintLine(nDocID,0,Bookstand_Innos_01_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,Bookstand_Innos_01_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

const string Bookstand_Innos_02_S1_1 = "Страница 1";
const string Bookstand_Innos_02_S1_2 = "Заповеди Инноса";
const string Bookstand_Innos_02_S1_3 = "Страница 2";

func void Use_Bookstand_Innos_02_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Innos_02_S1_1);
		Doc_PrintLine(nDocID,0,Bookstand_Innos_02_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,Bookstand_Innos_02_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_01_S1_1 = "ПЕРВЫЙ КРУГ";
const string Bookstand_Kreise_01_S1_2 = "Руны 1-го круга и ингредиенты, необходимые для их создания.";
const string Bookstand_Kreise_01_S1_3 = "Свет";
const string Bookstand_Kreise_01_S1_4 = "Золотая монета";
const string Bookstand_Kreise_01_S1_5 = "Огненная стрела";
const string Bookstand_Kreise_01_S1_6 = "Сера";
const string Bookstand_Kreise_01_S1_7 = "Малая молния";
const string Bookstand_Kreise_01_S1_8 = "Горный хрусталь";
const string Bookstand_Kreise_01_S1_9 = "Скелет гоблина";
const string Bookstand_Kreise_01_S1_10 = "Кость гоблина";
const string Bookstand_Kreise_01_S1_11 = "Лечение легких ранений";
const string Bookstand_Kreise_01_S1_12 = "Лечебная трава";
const string Bookstand_Kreise_01_S1_13 = "Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.";
const string Bookstand_Kreise_01_S1_14 = "Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.";
const string Bookstand_Kreise_01_S1_15 = "Только при выполнении этих условий он может приступить к работе за рунным столом.";

func void Use_Bookstand_Kreise_01_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_01_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_5);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_7);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_9);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_10);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_11);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_01_S1_12);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_01_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_01_S1_14);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_01_S1_15);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_02_S1_1 = "ВТОРОЙ КРУГ";
const string Bookstand_Kreise_02_S1_2 = "Руны 2-го круга и ингредиенты, необходимые для их создания.";
const string Bookstand_Kreise_02_S1_3 = "Огненный шар";
const string Bookstand_Kreise_02_S1_4 = "Смола";
const string Bookstand_Kreise_02_S1_5 = "Ледяная стрела";
const string Bookstand_Kreise_02_S1_6 = "Ледяной кварц";
const string Bookstand_Kreise_02_S1_7 = "Вызов волка";
const string Bookstand_Kreise_02_S1_8 = "Шкура волка";
const string Bookstand_Kreise_02_S1_9 = "Кулак ветра";
const string Bookstand_Kreise_02_S1_10 = "Уголь";
const string Bookstand_Kreise_02_S1_11 = "Сон";
const string Bookstand_Kreise_02_S1_12 = "Болотная трава";
const string Bookstand_Kreise_02_S1_13 = "Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.";
const string Bookstand_Kreise_02_S1_14 = "Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.";
const string Bookstand_Kreise_02_S1_15 = "Только при выполнении этих условий он может приступить к работе за рунным столом.";

func void Use_Bookstand_Kreise_02_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_02_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_5);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_7);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_9);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_10);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_11);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_02_S1_12);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_02_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_02_S1_14);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_02_S1_15);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_03_S1_1 = "ТРЕТИЙ КРУГ";
const string Bookstand_Kreise_03_S1_2 = "Руны 3-го круга и ингредиенты, необходимые для их создания.";
const string Bookstand_Kreise_03_S1_3 = "Лечение средних ранений";
const string Bookstand_Kreise_03_S1_4 = "Лечебное растение";
const string Bookstand_Kreise_03_S1_5 = "Малая огненная буря";
const string Bookstand_Kreise_03_S1_6 = "Смола";
const string Bookstand_Kreise_03_S1_7 = "Сера";
const string Bookstand_Kreise_03_S1_8 = "Создание скелета";
const string Bookstand_Kreise_03_S1_9 = "Кость скелета";
const string Bookstand_Kreise_03_S1_10 = "Страх";
const string Bookstand_Kreise_03_S1_11 = "Черный жемчуг";
const string Bookstand_Kreise_03_S1_12 = "Ледяной блок";
const string Bookstand_Kreise_03_S1_13 = "Ледяной кварц";
const string Bookstand_Kreise_03_S1_14 = "Аквамарин";
const string Bookstand_Kreise_03_S1_15 = "Шаровая молния";
const string Bookstand_Kreise_03_S1_16 = "Горный хрусталь";
const string Bookstand_Kreise_03_S1_17 = "Сера";
const string Bookstand_Kreise_03_S1_18 = "Огненный шар";
const string Bookstand_Kreise_03_S1_19 = "Смола";
const string Bookstand_Kreise_03_S1_20 = "Сера";
const string Bookstand_Kreise_03_S1_21 = "Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.";
const string Bookstand_Kreise_03_S1_22 = "Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.";
const string Bookstand_Kreise_03_S1_23 = "Только при выполнении этих условий он может приступить к работе за рунным столом.";

func void Use_Bookstand_Kreise_03_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_03_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_5);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_6);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_7);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_8);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_9);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_10);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_11);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_12);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_13);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_14);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_15);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_16);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_17);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_18);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_19);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_03_S1_20);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_03_S1_21);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_03_S1_22);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_03_S1_23);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_04_S1_1 = "ЧЕТВЕРТЫЙ КРУГ";
const string Bookstand_Kreise_04_S1_2 = "Руны 4-го круга и ингредиенты, необходимые для их создания.";
const string Bookstand_Kreise_04_S1_3 = "Большой огненный шар";
const string Bookstand_Kreise_04_S1_4 = "Сера";
const string Bookstand_Kreise_04_S1_5 = "Смола";
const string Bookstand_Kreise_04_S1_6 = "Молния";
const string Bookstand_Kreise_04_S1_7 = "Горный хрусталь";
const string Bookstand_Kreise_04_S1_8 = "Ледяной кварц";
const string Bookstand_Kreise_04_S1_9 = "Пробуждение голема";
const string Bookstand_Kreise_04_S1_10 = "Сердце каменного голема";
const string Bookstand_Kreise_04_S1_11 = "Уничтожение нежити";
const string Bookstand_Kreise_04_S1_12 = "Святая вода";
const string Bookstand_Kreise_04_S1_13 = "Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.";
const string Bookstand_Kreise_04_S1_14 = "Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.";
const string Bookstand_Kreise_04_S1_15 = "Только при выполнении этих условий он может приступить к работе за рунным столом.";

func void Use_Bookstand_Kreise_04_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_04_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_4);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_5);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_6);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_7);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_9);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_10);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_11);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_04_S1_12);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_04_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_04_S1_14);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_04_S1_15);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_05_S1_1 = "ПЯТЫЙ КРУГ";
const string Bookstand_Kreise_05_S1_2 = "Руны 5-го круга и ингредиенты, необходимые для их создания.";
const string Bookstand_Kreise_05_S1_3 = "Ледяная волна";
const string Bookstand_Kreise_05_S1_4 = "Ледяной кварц";
const string Bookstand_Kreise_05_S1_5 = "Аквамарин";
const string Bookstand_Kreise_05_S1_6 = "Большая огненная буря";
const string Bookstand_Kreise_05_S1_7 = "Сера";
const string Bookstand_Kreise_05_S1_8 = "Огненный язык";
const string Bookstand_Kreise_05_S1_9 = "Вызов демона";
const string Bookstand_Kreise_05_S1_10 = "Сердце демона";
const string Bookstand_Kreise_05_S1_11 = "Лечение тяжелых ранений";
const string Bookstand_Kreise_05_S1_12 = "Лечебный корень";
const string Bookstand_Kreise_05_S1_13 = "Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.";
const string Bookstand_Kreise_05_S1_14 = "Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.";
const string Bookstand_Kreise_05_S1_15 = "Только при выполнении этих условий он может приступить к работе за рунным столом.";

func void Use_Bookstand_Kreise_05_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_05_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_4);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_5);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_6);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_7);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_9);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_10);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_11);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_05_S1_12);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_05_S1_13);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_05_S1_14);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_05_S1_15);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Kreise_06_S1_1 = "ШЕСТОЙ КРУГ";
const string Bookstand_Kreise_06_S1_2 = "Руны 6-го круга и ингредиенты, необходимые для их создания.";
const string Bookstand_Kreise_06_S1_3 = "Огненный дождь";
const string Bookstand_Kreise_06_S1_4 = "Смола";
const string Bookstand_Kreise_06_S1_5 = "Сера";
const string Bookstand_Kreise_06_S1_6 = "Огненный язык";
const string Bookstand_Kreise_06_S1_7 = "Дыхание смерти";
const string Bookstand_Kreise_06_S1_8 = "Уголь";
const string Bookstand_Kreise_06_S1_9 = "Черный жемчуг";
const string Bookstand_Kreise_06_S1_10 = "Волна смерти";
const string Bookstand_Kreise_06_S1_11 = "Кость скелета";
const string Bookstand_Kreise_06_S1_12 = "Черный жемчуг";
const string Bookstand_Kreise_06_S1_13 = "Армия тьмы";
const string Bookstand_Kreise_06_S1_14 = "Кость скелета";
const string Bookstand_Kreise_06_S1_15 = "Черный жемчуг";
const string Bookstand_Kreise_06_S1_16 = "Сердце каменного голема";
const string Bookstand_Kreise_06_S1_17 = "Сердце демона";
const string Bookstand_Kreise_06_S1_18 = "Сморщивание монстра";
const string Bookstand_Kreise_06_S1_19 = "Кость гоблина";
const string Bookstand_Kreise_06_S1_20 = "Клык тролля";
const string Bookstand_Kreise_06_S1_21 = "Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.";
const string Bookstand_Kreise_06_S1_22 = "Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.";
const string Bookstand_Kreise_06_S1_23 = "Только при выполнении этих условий он может приступить к работе за рунным столом.";

func void Use_Bookstand_Kreise_06_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_Kreise_06_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_3);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_4);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_5);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_7);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_8);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_9);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_10);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_11);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_12);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_13);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_14);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_15);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_16);
		Doc_PrintLine(nDocID,0,Bookstand_Kreise_06_S1_17);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,Bookstand_Kreise_06_S1_18);
		Doc_PrintLine(nDocID,1,Bookstand_Kreise_06_S1_19);
		Doc_PrintLine(nDocID,1,Bookstand_Kreise_06_S1_20);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_06_S1_21);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_06_S1_22);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_Kreise_06_S1_23);
		Doc_Show(nDocID);
	};
};

const string Bookstand_Rules_01_S1_1 = "Страница 1";
const string Bookstand_Rules_01_S1_2 = "Правила";
const string Bookstand_Rules_01_S1_3 = "Страница 2";

func void Use_Bookstand_Rules_01_S1()
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
		Doc_PrintLine(nDocID,0,Bookstand_Rules_01_S1_1);
		Doc_PrintLine(nDocID,0,Bookstand_Rules_01_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,Bookstand_Rules_01_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

