
var int History_1_permanent;
var int History_2_permanent;
var int History_3_permanent;

const string BookstandHistory1_S1_1 = "Путь воина";
const string BookstandHistory1_S1_2 = "Лучшая защита - это хорошее нападение, по крайней мере, когда дело касается зверей. Бесполезно парировать атаки зверей или монстров.";
const string BookstandHistory1_S1_3 = "Лучше всего держать врага на расстоянии при помощи точных, выверенных ударов, а затем нанести неожиданную комбинационную атаку.";
const string BookstandHistory1_S1_4 = "Конечно, только опытные бойцы могут пользоваться комбинациями. Если вы станете мастером боя, вы даже сможете использовать несколько комбинаций.";

func void Use_BookstandHistory1_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,BookstandHistory1_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandHistory1_S1_2);
		Doc_PrintLines(nDocID,0,BookstandHistory1_S1_3);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandHistory1_S1_4);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		History_1_permanent = B_GivePlayerXP_Bookstand(History_1_permanent);
	};
};

const string BookstandHistory2_S1_1 = "Остров";
const string BookstandHistory2_S1_2 = "Портовый город Хоринис находится на острове у побережья королевства Миртана.";
const string BookstandHistory2_S1_3 = "Этот остров известен, прежде всего, своей Долиной рудников. О ней ходят разные слухи, много лет она была закрыта магическим барьером и служила тюрьмой для всех осужденных королевства.";
const string BookstandHistory2_S1_4 = "Таким образом, эта долина стала тюремной колонией, где каторжники глубоко под землей добывали магическую руду.";
const string BookstandHistory2_S1_5 = "Неподалеку от Хориниса находятся несколько ферм, где крестьяне на плодородной почве выращивают пшеницу и репу, а также разводят овец.";
const string BookstandHistory2_S1_6 = "Уже многие поколения самая большая ферма принадлежит лендлорду, который сдает в аренду прилежащие земли другим фермерам.";
const string BookstandHistory2_S1_7 = "В центре острова находится древний монастырь Инноса, возглавляемый магами огня. Они проводят там исследования в области магии и алхимии, а также делают неплохое вино.";

func void Use_BookstandHistory2_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,BookstandHistory2_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandHistory2_S1_2);
		Doc_PrintLines(nDocID,0,BookstandHistory2_S1_3);
		Doc_PrintLines(nDocID,0,BookstandHistory2_S1_4);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandHistory2_S1_5);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandHistory2_S1_6);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandHistory2_S1_7);
		Doc_Show(nDocID);
		History_2_permanent = B_GivePlayerXP_Bookstand(History_2_permanent);
	};
};

const string BookstandHistory3_S1_1 = "Закон на острове";
const string BookstandHistory3_S1_2 = "Когда люди живут вместе, приходится искать способы поддержания мира - будь это монастырь, город или ферма лендлорда.";
const string BookstandHistory3_S1_3 = "Любое преступление против сообщества подлежит наказанию.";
const string BookstandHistory3_S1_4 = "Сообщество запрещает нападать на других, а также ввязываться в уже идущую схватку.";
const string BookstandHistory3_S1_5 = "Воровство также подлежит наказанию. Кроме того под защитой закона также находятся священные животные - овцы.";
const string BookstandHistory3_S1_6 = "Если кто-либо ударит другого или убьет его, правосудие обычно вершится на месте.";
const string BookstandHistory3_S1_7 = "Чтобы избежать подобной судьбы, виновный должен заплатить высокий штраф.";
const string BookstandHistory3_S1_8 = "Во всех местах большого скопления народа, спокойствие поддерживают судьи. До них доходят сведения обо всех преступлениях, и в их обязанность входит вынесение приговора и восстановление порядка.";
const string BookstandHistory3_S1_9 = "Тот, кто стал жертвой преступления или был свидетелем такового, обязан сообщить об этом властям.";

func void Use_BookstandHistory3_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,BookstandHistory3_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,BookstandHistory3_S1_2);
		Doc_PrintLines(nDocID,0,BookstandHistory3_S1_3);
		Doc_PrintLines(nDocID,0,BookstandHistory3_S1_4);
		Doc_PrintLines(nDocID,0,BookstandHistory3_S1_5);
		Doc_PrintLines(nDocID,0," ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,BookstandHistory3_S1_6);
		Doc_PrintLines(nDocID,1,BookstandHistory3_S1_7);
		Doc_PrintLines(nDocID,1,BookstandHistory3_S1_8);
		Doc_PrintLines(nDocID,1,BookstandHistory3_S1_9);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		History_2_permanent = B_GivePlayerXP_Bookstand(History_2_permanent);
	};
};

