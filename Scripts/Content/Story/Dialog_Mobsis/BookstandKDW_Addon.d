
const string Runemaking_KDW_CIRC1_S1_1 = "Круги Воды";
const string Runemaking_KDW_CIRC1_S1_2 = "Руны Воды и ингредиенты, необходимые для их создания.";
const string Runemaking_KDW_CIRC1_S1_3 = "Смерч";
const string Runemaking_KDW_CIRC1_S1_4 = "Крылья кровавой мухи";
const string Runemaking_KDW_CIRC1_S1_5 = "Ледяное копье";
const string Runemaking_KDW_CIRC1_S1_6 = "Ледяной кварц";
const string Runemaking_KDW_CIRC1_S1_7 = "Гейзер";
const string Runemaking_KDW_CIRC1_S1_8 = "Аквамарин";
const string Runemaking_KDW_CIRC1_S1_9 = "Буря";
const string Runemaking_KDW_CIRC1_S1_10 = "Ледяной кварц";
const string Runemaking_KDW_CIRC1_S1_11 = "Крылья кровавой мухи";
const string Runemaking_KDW_CIRC1_S1_12 = "Кулак воды";
const string Runemaking_KDW_CIRC1_S1_13 = "Аквамарин";
const string Runemaking_KDW_CIRC1_S1_14 = "Горный хрусталь";
const string Runemaking_KDW_CIRC1_S1_15 = "Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.";
const string Runemaking_KDW_CIRC1_S1_16 = "Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.";
const string Runemaking_KDW_CIRC1_S1_17 = "Только при выполнении этих условий он может приступить к работе за рунным столом.";

func void Use_Runemaking_KDW_CIRC1_S1()
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
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Runemaking_KDW_CIRC1_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_3);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_4);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_5);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_6);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_7);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_8);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_9);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_10);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_11);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_12);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_13);
		Doc_PrintLine(nDocID,0,Runemaking_KDW_CIRC1_S1_14);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Runemaking_KDW_CIRC1_S1_15);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Runemaking_KDW_CIRC1_S1_16);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Runemaking_KDW_CIRC1_S1_17);
		Doc_Show(nDocID);
	};
};

func void Use_Runemaking_KDW_CIRC2_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC3_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC4_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC5_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC6_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

