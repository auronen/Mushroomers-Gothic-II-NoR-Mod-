
var int Animals_1_permanent;
var int Animals_2_permanent;
var int Animals_3_permanent;

const string BookstandAnimals1_S1_1 = "Охота и трофеи";
const string BookstandAnimals1_S1_2 = "С каждого зверя или животного можно получить трофеи,  преумножающие славу и благосостояние опытного охотника.";
const string BookstandAnimals1_S1_3 = "Опытный охотник знает все о трофеях жертвы и как получить их.";
const string BookstandAnimals1_S1_4 = "Изъятие зубов";
const string BookstandAnimals1_S1_5 = "Зубы - это оружие многих зверей и животных. Если вы знаете, как изъять их у вашей жертвы, то волков, снепперов, мракорисов, болотных акул и троллей можно считать лучшими целями.";
const string BookstandAnimals1_S1_6 = "Снятие шкур";
const string BookstandAnimals1_S1_7 = "Талантливые и опытные охотники высоко ценятся, у них всегда много шкур - овец, волков и мракорисов, например.";
const string BookstandAnimals1_S1_8 = "Очень опытные охотники могут также снимать шкуры с болотных акул и луркеров.";
const string BookstandAnimals1_S1_9 = "Изъятие когтей";
const string BookstandAnimals1_S1_10 = "Это искусство применимо ко всем типам ящеров, снепперам, луркерам и мракорисам.";

func void Use_BookstandAnimals1_S1()
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
		Doc_PrintLine(nDocID,0,BookstandAnimals1_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandAnimals1_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandAnimals1_S1_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandAnimals1_S1_4);
		Doc_PrintLines(nDocID,0,BookstandAnimals1_S1_5);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,BookstandAnimals1_S1_6);
		Doc_PrintLines(nDocID,1,BookstandAnimals1_S1_7);
		Doc_PrintLines(nDocID,1,BookstandAnimals1_S1_8);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,BookstandAnimals1_S1_9);
		Doc_PrintLines(nDocID,1,BookstandAnimals1_S1_10);
		Doc_Show(nDocID);
		Animals_1_permanent = B_GivePlayerXP_Bookstand(Animals_1_permanent);
	};
};

const string BookstandAnimals2_S1_1 = "Охота и трофеи";
const string BookstandAnimals2_S1_2 = "С каждого зверя или животного можно получить трофеи,  преумножающие славу и благосостояние опытного охотника.";
const string BookstandAnimals2_S1_3 = "Кровавые мухи";
const string BookstandAnimals2_S1_4 = "Чтобы выпотрошить этих летающих дьяволов, необходимо обладать двумя навыками.";
const string BookstandAnimals2_S1_5 = "У них можно вырезать крылья и жала.";
const string BookstandAnimals2_S1_6 = "Оба этих навыка используются опытными охотниками для добывания трофеев.";
const string BookstandAnimals2_S1_7 = "Полевые хищники и краулеры атакуют при помощи мандибул. Мандибулы краулеров";
const string BookstandAnimals2_S1_8 = "особенно ценятся, так как они содержат железы, повышающие магическую силу.";
const string BookstandAnimals2_S1_9 = "Однако, их следует использовать аккуратно, так как человеческий организм постепенно становится невосприимчив к ним.";
const string BookstandAnimals2_S1_10 = "Панцири краулеров также весьма популярны. Из них можно изготавливать доспехи.";

func void Use_BookstandAnimals2_S1()
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
		Doc_PrintLine(nDocID,0,BookstandAnimals2_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandAnimals2_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandAnimals2_S1_3);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandAnimals2_S1_4);
		Doc_PrintLines(nDocID,0,BookstandAnimals2_S1_5);
		Doc_PrintLines(nDocID,0,BookstandAnimals2_S1_6);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandAnimals2_S1_7);
		Doc_PrintLines(nDocID,1,BookstandAnimals2_S1_8);
		Doc_PrintLines(nDocID,1,BookstandAnimals2_S1_9);
		Doc_PrintLines(nDocID,1,BookstandAnimals2_S1_10);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
		Animals_2_permanent = B_GivePlayerXP_Bookstand(Animals_2_permanent);
	};
};

const string BookstandAnimals3_S1_1 = "Охота и трофеи";
const string BookstandAnimals3_S1_2 = "С каждого зверя или животного можно получить трофеи,  преумножающие славу и благосостояние опытного охотника.";
const string BookstandAnimals3_S1_3 = "Огненный ящер";
const string BookstandAnimals3_S1_4 = "Этот зверь - ящер, изрыгающий огонь, который может убить любого в пределах нескольких шагов от этой твари.";
const string BookstandAnimals3_S1_5 = "Только те, кто обладает защитой от огня, могут охотиться на этих созданий и добывать их ценные языки.";
const string BookstandAnimals3_S1_6 = "Мракорис";
const string BookstandAnimals3_S1_7 = "Мракорис - это древний зверь, предпочитающий уединение и живущий под покровом леса.";
const string BookstandAnimals3_S1_8 = "Этих созданий осталось очень мало, и поэтому они не представляют особой опасности для людей, если только те не забредут на территорию их охоты.";
const string BookstandAnimals3_S1_9 = "Рог мракориса считается ценным охотничьим трофеем. Но чтобы заполучить его, охотник";
const string BookstandAnimals3_S1_10 = "должен уметь правильно вырезать рог.";

func void Use_BookstandAnimals3_S1()
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
		Doc_PrintLine(nDocID,0,BookstandAnimals3_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandAnimals3_S1_2);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,BookstandAnimals3_S1_3);
		Doc_PrintLines(nDocID,0,BookstandAnimals3_S1_4);
		Doc_PrintLines(nDocID,0,BookstandAnimals3_S1_5);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,BookstandAnimals3_S1_6);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandAnimals3_S1_7);
		Doc_PrintLines(nDocID,1,BookstandAnimals3_S1_8);
		Doc_PrintLines(nDocID,1,BookstandAnimals3_S1_9);
		Doc_PrintLines(nDocID,1,BookstandAnimals3_S1_10);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		Animals_3_permanent = B_GivePlayerXP_Bookstand(Animals_3_permanent);
	};
};

