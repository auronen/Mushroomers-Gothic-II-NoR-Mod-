
// — –»ѕ“џ ---- доп. квест от Ќастась—анны

prototype ItWr_Proto_Script(C_Item)
{
    name = "—крипт";
    mainflag = ITEM_KAT_DOCS;    flags = ITEM_MISSION;
    value = 0;
    visual = "ItWr_Scroll_01.3DS";    material = MAT_LEATHER;
    scemeName = "MAP";
    description = "—крипт";
};

//---------------------------------------------
instance ItWr_Script1(ItWr_Proto_Script)
{
    on_state[0] = Use_Script1;
};
const string Script1_1 = "01 instance ItMr_Sunrise(Proto_Mushroom)";
const string Script1_2 = "03     description = У«орьникУ;    //name = description;";
const string Script1_3 = "04     if (!OPT_HideMrNames)    {    name = description;};";
const string Script1_4 = "06     visual = УItMr_Sunrise.3DSУ;";
const string Script1_5 = "08     value = Value_Mr_Sunrise;";
const string Script1_6 = "09     text[5] = NAME_Value;    count[5] = value;";
const string Script1_7 = "11     on_state[0] = Use_Mushroom_Sunrise;";

func void Use_Script1()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,Script1_1);
    Doc_PrintLines(nDocID,0,"02 {");
    Doc_PrintLines(nDocID,0,Script1_2);
    Doc_PrintLines(nDocID,0,Script1_3);
    Doc_PrintLines(nDocID,0,"05 ");
    Doc_PrintLines(nDocID,0,Script1_4);
    Doc_PrintLines(nDocID,0,"07 ");
    Doc_PrintLines(nDocID,0,Script1_5);
    Doc_PrintLines(nDocID,0,Script1_6);
    Doc_PrintLines(nDocID,0,"10 ");
    Doc_PrintLines(nDocID,0,Script1_7);
    Doc_PrintLines(nDocID,0,"12 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script2(ItWr_Proto_Script)
{
    on_state[0] = Use_Script2;
};
const string Script2_1 = "01 //точка дл€ спауна";
const string Script2_2 = "02 class zCSpawnPoint    {";
const string Script2_3 = "03     var string name;    //им€ FP";
const string Script2_4 = "04     var int trafoObjToWorld[16];    //центр";
const string Script2_5 = "05     var int MainFlag;    //тип SP";
const string Script2_6 = "06     var int flags;    //что угодно справочное";
const string Script2_7 = "07     var int Rmax;    //max радиус рассеивани€, см";
const string Script2_8 = "08     var int Rmin;    //min радиус рассеивани€, см";
const string Script2_9 = "09     var int cnt;    //сколько, если <=0, то автоопре-е по площади";
const string Script2_10 = "10     var int NoPhys;    //не примен€ть физику после спауна, =TRUE/FALSE";

func void Use_Script2()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,Script2_1);
    Doc_PrintLines(nDocID,0,Script2_2);
    Doc_PrintLines(nDocID,0,Script2_3);
    Doc_PrintLines(nDocID,0,Script2_4);
    Doc_PrintLines(nDocID,0,Script2_5);
    Doc_PrintLines(nDocID,0,Script2_6);
    Doc_PrintLines(nDocID,0,Script2_7);
    Doc_PrintLines(nDocID,0,Script2_8);
    Doc_PrintLines(nDocID,0,Script2_9);
    Doc_PrintLines(nDocID,0,Script2_10);
    Doc_PrintLines(nDocID,0,"11 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script3(ItWr_Proto_Script)
{
    on_state[0] = Use_Script3;
};
const string Script3_1 = "01 func void SP_SearchItemsList_Cycle(var int Minutes)";
const string Script3_2 = "03     VAR zCVob curVob;";
const string Script3_3 = "04     VAR zCListSort curItem;    curItem = _^(MEM_World.voblist_items);";
const string Script3_4 = "05     // repeat";
const string Script3_5 = "06     var int label;    label = MEM_StackPos.position;";
const string Script3_6 = "07         if (curItem.data)    {";
const string Script3_7 = "08             curVob = _^(curItem.data);";
const string Script3_8 = "09             SP_CheckDeleteItem_DespawnMR(curItem.data, Minutes);";
const string Script3_9 = "11     //until (!curItem.next);";
const string Script3_10 = "12     if (curItem.next)    {";
const string Script3_11 = "13         curItem = _^(curItem.next);";
const string Script3_12 = "14         MEM_StackPos.position = label;";
const string Script3_13 = "17     SP_DeleteVobsFromList();";

func void Use_Script3()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,Script3_1);
    Doc_PrintLines(nDocID,0,"02 {");
    Doc_PrintLines(nDocID,0,Script3_2);
    Doc_PrintLines(nDocID,0,Script3_3);
    Doc_PrintLines(nDocID,0,Script3_4);
    Doc_PrintLines(nDocID,0,Script3_5);
    Doc_PrintLines(nDocID,0,Script3_6);
    Doc_PrintLines(nDocID,0,Script3_7);
    Doc_PrintLines(nDocID,0,Script3_8);
    Doc_PrintLines(nDocID,0,"10        };");
    Doc_PrintLines(nDocID,0,Script3_9);
    Doc_PrintLines(nDocID,0,Script3_10);
    Doc_PrintLines(nDocID,0,Script3_11);
    Doc_PrintLines(nDocID,0,Script3_12);
    Doc_PrintLines(nDocID,0,"15     };");
    Doc_PrintLines(nDocID,0,"16 ");
    Doc_PrintLines(nDocID,0,Script3_13);
    Doc_PrintLines(nDocID,0,"18 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script4(ItWr_Proto_Script)
{
    on_state[0] = Use_Script4;
};
const string Script4_1 = "01 prototype DIA_Proto_End(C_INFO)";
const string Script4_2 = "03     nr = 999;";
const string Script4_3 = "04     condition = DIA_NoCond_cond;";
const string Script4_4 = "05     information = DIA_Proto_End_info;";
const string Script4_5 = "06     description = Dialog_Ende;";
const string Script4_6 = "07     permanent = true;";
const string Script4_7 = "09 func void DIA_Proto_End_info()";
const string Script4_8 = "11     AI_StopProcessInfos(self);";

func void Use_Script4()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,Script4_1);
    Doc_PrintLines(nDocID,0,"02 {");
    Doc_PrintLines(nDocID,0,Script4_2);
    Doc_PrintLines(nDocID,0,Script4_3);
    Doc_PrintLines(nDocID,0,Script4_4);
    Doc_PrintLines(nDocID,0,Script4_5);
    Doc_PrintLines(nDocID,0,Script4_6);
    Doc_PrintLines(nDocID,0,"08 };");
    Doc_PrintLines(nDocID,0,Script4_7);
    Doc_PrintLines(nDocID,0,"10 {");
    Doc_PrintLines(nDocID,0,Script4_8);
    Doc_PrintLines(nDocID,0,"12 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script5(ItWr_Proto_Script)
{
    on_state[0] = Use_Script5;
};
const string Script5_1 = "01 func int _C_Random_Next(var int Value)";
const string Script5_2 = "03     var int New_Value;";
const string Script5_3 = "04     if (Value <= 0)";
const string Script5_4 = "06         Value = Hlp_Random(1 << 15) + 1;";
const string Script5_5 = "08     New_Value = ((Value * 16807 + 5) & 16776960) >> 8;";
const string Script5_6 = "09     return New_Value;";

func void Use_Script5()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,Script5_1);
    Doc_PrintLines(nDocID,0,"02 {");
    Doc_PrintLines(nDocID,0,Script5_2);
    Doc_PrintLines(nDocID,0,Script5_3);
    Doc_PrintLines(nDocID,0,"05     {");
    Doc_PrintLines(nDocID,0,Script5_4);
    Doc_PrintLines(nDocID,0,"07     };");
    Doc_PrintLines(nDocID,0,Script5_5);
    Doc_PrintLines(nDocID,0,Script5_6);
    Doc_PrintLines(nDocID,0,"10 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script6(ItWr_Proto_Script)
{
    on_state[0] = Use_Script6;
};
const string Script6_1 = "01 if (C_HeroIsInNpcsRoom(VLK_414_Hanna))    {";
const string Script6_2 = "02     dh = 1;    dm = Hlp_Random(20);";
const string Script6_3 = "03     Hanna_Paid = -1;";
const string Script6_4 = "04     B_StartOtherRoutine(VLK_494_Attila,'PUNISHMENT');";
const string Script6_5 = "05     AI_Teleport(VLK_494_Attila,Npc_GetNearestWP(hero));";
const string Script6_6 = "06     AI_Snd_Play(hero,'CS_MAM_FI_FL');";
const string Script6_7 = "07     B_Say(hero,hero,'$AARGH_1');";
const string Script6_8 = "08     PrintSleep(PRINT_SleepPain)";
const string Script6_9 = "09     AI_UseMob(self,'BEDHIGH',-1);";

func void Use_Script6()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,Script6_1);
    Doc_PrintLines(nDocID,0,Script6_2);
    Doc_PrintLines(nDocID,0,Script6_3);
    Doc_PrintLines(nDocID,0,Script6_4);
    Doc_PrintLines(nDocID,0,Script6_5);
    Doc_PrintLines(nDocID,0,Script6_6);
    Doc_PrintLines(nDocID,0,Script6_7);
    Doc_PrintLines(nDocID,0,Script6_8);
    Doc_PrintLines(nDocID,0,Script6_9);
    Doc_PrintLines(nDocID,0,"10 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script7(ItWr_Proto_Script)
{
    on_state[0] = Use_Script7;
};
const string Script7_1 = "01 instance PC_NastasSanna(Npc_Default)";
const string Script7_2 = "03    name[0] = 'Ќастась—анна';";
const string Script7_3 = "04     guild = GIL_NONE;";
const string Script7_4 = "05     id = 1616;";
const string Script7_5 = "06     voice = 17;";
const string Script7_6 = "07     npcType = npctype_main;";
const string Script7_7 = "08     B_SetAttributesToChapter(self, 4);";
const string Script7_8 = "09     B_SetFightSkills(self,50);";
const string Script7_9 = "10     B_SetNpcVisual(self,FEMALE,'Hum_Head_SM_BABE9',Face_N_NastasSanna,BodyTexBabe_L,ITAR_Leather_Baby);";
const string Script7_10 = "11     Mdl_SetModelFatness(self, 0.8);";
const string Script7_11 = "12     CreateInvItem(self,ItMw_Schwert1);";
const string Script7_12 = "13     CreateInvItem(self,ItRw_Bow_M_04);";
const string Script7_13 = "14     aivar[AIV_IgnoreFlags] = -1;";
const string Script7_14 = "15     aivar[AIV_Behaviour] = BEHAV_NoDamageReaction | BEHAV_NeverRansack;";
const string Script7_15 = "16     aivar[AIV_Temper] = TEMPER_ToughGuy | TEMPER_ToughGuyNewsOverride | TEMPER_NoFightParker;";
const string Script7_16 = "17     daily_routine = Rtn_Hide1_1616;";

func void Use_Script7()
{
    var int nDocID;
    nDocID = Doc_Create();
    Doc_SetPages(nDocID,1);
    Doc_SetPage(nDocID,0,"Log_Paper.TGA",0);
    Doc_SetMargins(nDocID,-1,20,50,20,50,1);
    Doc_SetFont(nDocID,0,FONT_ScreenSmall);
    Doc_PrintLines(nDocID,0,Script7_1);
    Doc_PrintLines(nDocID,0,"02 {");
    Doc_PrintLines(nDocID,0,Script7_2);
    Doc_PrintLines(nDocID,0,Script7_3);
    Doc_PrintLines(nDocID,0,Script7_4);
    Doc_PrintLines(nDocID,0,Script7_5);
    Doc_PrintLines(nDocID,0,Script7_6);
    Doc_PrintLines(nDocID,0,Script7_7);
    Doc_PrintLines(nDocID,0,Script7_8);
    Doc_PrintLines(nDocID,0,Script7_9);
    Doc_PrintLines(nDocID,0,Script7_10);
    Doc_PrintLines(nDocID,0,Script7_11);
    Doc_PrintLines(nDocID,0,Script7_12);
    Doc_PrintLines(nDocID,0,Script7_13);
    Doc_PrintLines(nDocID,0,Script7_14);
    Doc_PrintLines(nDocID,0,Script7_15);
    Doc_PrintLines(nDocID,0,Script7_16);
    Doc_PrintLines(nDocID,0,"18 };");
    Doc_Show(nDocID);
};
//---------------------------------------------
instance ItWr_Script_Teleport(ItWr_Proto_Script)
{
    description = "—крипт-телепорт";
    on_state[0] = Use_Script_Teleport;
    text[1] = "Ќа листе ровными буквами выведено";
    text[2] = "    AI_Teleport(self,УPC_NASTASSANNAУ);";
    text[4] = "„то бы это значило?";
};
func void Use_Script_Teleport()
{
    AI_Teleport(self,"PC_NASTASSANNA");
};


