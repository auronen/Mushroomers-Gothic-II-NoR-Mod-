
const int T_MEGA = 300;
const int T_MAX = 200;
const int T_HIGH = 120;
const int T_MED = 90;
const int T_LOW = 60;

var int CurrentLevel;

var int HP_Ring_1_Equipped;
var int HP_Ring_2_Equipped;
var int HP_Amulett_Equipped;
var int HP_Artefakt_Effekt;
var int MA_Ring_1_Equipped;
var int MA_Ring_2_Equipped;
var int MA_Amulett_Equipped;
var int MA_Artefakt_Effekt;
var int STR_Ring_1_Equipped;
var int STR_Ring_2_Equipped;
var int STR_Amulett_Equipped;
var int STR_Artefakt_Effekt;
var int LeatherArmor_Equipped;
var int SLDArmor_Equipped;
var int NOVArmor_Equipped;
var int KDFArmor_Equipped;
var int MILArmor_Equipped;
var int MCArmor_Equipped;
var int KDFBelt_Equipped;
var int MILBelt_Equipped;
var int NOVBelt_Equipped;
var int SLDBelt_Equipped;
var int LeatherBelt_Equipped;
var int MCBelt_Equipped;
var int wispskill_level;

var int NpcObsessedByDMT;
var int GhostAttackWarn;
var int SC_FailedToEquipBeliarsWeapon;

var int TheftDexGlob;
var int TheftGoldGlob;
var int Theftdiff;

var int MadKillerCount;

var int Knows_LousHammer;
var int Knows_Schlafhammer;
var int Knows_SchnellerHering;
var int Knows_RuebenSchnaps;
var int Knows_VinoSchnaps;
var int Knows_PiratenSchnaps;
var int Knows_Magierschnaps;
var int Knows_Sumpfkrautschnaps;
var int Knows_Banditenaxt;

var int Knows_Truemmerschlag;
var int Mandibles_Bonus;
var int Knows_Bloodfly;
var int Bloodfly_Bonus;
var int Apple_Bonus;
var int Dunkelpilz_Bonus;


// �������� ===========================================

var int Fish_Bonus;
var int Meat_Bonus;
var int Meat_Bonus_Cnt;

//const int Startup_Once = 0;

var int Competition_Len;
var int Competition_LastDay;

//����� ���������� ��������� ��� ��������� �����������
var int GiveMrmsDay_Elena;
var int GiveMrmsDay_Erol;
var int GiveMrmsDay_Odo;
var int GiveMrmsDay_Rupert;
var int GiveMrmsDay_Sarah;
var int GiveMrmsDay_Talbin;
var int GiveMrmsDay_Till;

var int Wait_AfterDia_H;
var int Wait_AfterDia_M;

var int Talbin_Trade;	//������ ���������� ������� �����
var int Rupert_Trade;	//������ ���������� ������� �����
var int Sarah_Trade;	//���� ������� (����� ��������� ��������)
var int Gorax_Trade_Once;

var int PrayCounter_Innos;
var int PrayCounter_Adanos;
var int PrayCounter_Beliar;

// ������ ------------------------------------------

// ������� ������ �����
var int MIS_GrimbaldOrcs;
	var int MIS_GrimbaldOrcs_FeelBetter;	//��� ������� ������� ����������
	var int MIS_GrimbaldOrcs_Weapon;	//������ ������
	var int MIS_GrimbaldOrcs_GetBow;	//������ ����������� - ������� ���
		const int MIS_GrimbaldOrcs_GetBow_GotIdea	= 10;	//� ���������� ����
		const int MIS_GrimbaldOrcs_GetBow_Planned	= 11;	//��������� ����
		const int MIS_GrimbaldOrcs_GetBow_Ready		= 12;	//������!
		const int MIS_GrimbaldOrcs_GetBow_Go		= 13;	//�����!
		const int MIS_GrimbaldOrcs_GetBow_Return	= 14;	//�������
	var int MIS_GrimbaldOrcs_Timer;	//������������ ��� 5 ���.
	var int MIS_GrimbaldOrcs_DeadCnt;	//������� ����� �����
	var int MIS_GrimbaldOrcs_DeadCnt_Seen;	//������� �� ��� ����� �������� ���������

// ����� ��������
var int MIS_KhorinisPost;
	//���� ��������
	var int MIS_KhorinisPost_Stage_FromVino;
	var int MIS_KhorinisPost_Stage_FromBootlegger;
	var int MIS_KhorinisPost_Stage_FromHalvor;
	var int MIS_KhorinisPost_Stage_FromHakon;
	//���� �������
	var int MIS_KhorinisPost_VinoDelivered;
	var int MIS_KhorinisPost_BootleggerDelivered;
	var int MIS_KhorinisPost_HalvorDelivered;
	var int MIS_KhorinisPost_ValentinoDelivered;
	var int MIS_KhorinisPost_FernandoDelivered;
	var int MIS_KhorinisPost_HakonDelivered;
	var int MIS_KhorinisPost_HaradDelivered;
	
	var int MIS_KhorinisPost_HalvorPayed;	//������� ������ �������� �� �������
	var int MIS_KhorinisPost_HalvorTime100;	//����� ��������� �� 100
	var int MIS_KhorinisPost_HalvorGoWithMe;	//������ ������� ��� � ��������
	var int MIS_KhorinisPost_HalvorFight;	//������� �� ����� (1 ���!)
	var int MIS_KhorinisPost_HalvorGimmePacket;	//������ ����� ������� ����� � ���� ��
	var int MIS_KhorinisPost_HalvorGotPacket;	//������ ������/������� �����
	var int MIS_KhorinisPost_HalvorShareGiven;	//���� ������� ��� ����
	var int MIS_KhorinisPost_HalvorShareDay;	//����� ������ ���� �� ��� ���� ����
	var int MIS_KhorinisPost_HakonTime;	//����� ����� ������ �������� �� ����������
	//�������
	var int MIS_KhorinisPost_FailChief;	//���������� � ����������������
	
// ���������� ������
var int MIS_Cookery;
	var int MIS_Cookery_Eatable;
	var int MIS_Cookery_TheklaTold;
	var int MIS_Cookery_HildaTold;
	var int MIS_Cookery_SagittaTold;
	var int MIS_Cookery_ConstantinoTold;
	var int MIS_Cookery_ConstantinoAsked;	//����������� ������, ��� ����� ���������
	var int MIS_Cookery_ConstantinoSold;	//����������� ������ ������
	var int MIS_Cookery_SagittaAsked;	//�������� � ������� ������
	var int MIS_Cookery_AskSpices;	//���� �������� ����� ������
	var int MIS_Cookery_SpicesGiven;	//���� ������ �����
	var int MIS_Cookery_NSparclesKnown;	//������, ��� ������ ����� ����� ������������ ��� ��������
	var int MIS_Cookery_TheklaTime;	//����� ����� ����������

// ������� �� ����
var int MIS_ThorbenSales;
	
// ��� ������� ���� �����
var int MIS_FellanGoHome;
	var int MIS_FellanGoHome_WifeWaits;	//�����, ��� ����� ���� ����
	var int MIS_FellanGoHome_ToldAttempts;	//������� ��� ����������� ���������
		const int MIS_FellanGoHome_ToldAttempts_Fail = 2;	//������� ��� ����� ����������
	var int MIS_FellanGoHome_BrokenHammerGot_Once;	//����� ��������� �������
	var int MIS_FellanGoHome_YewGot;	//�������� ���
	var int MIS_FellanGoHome_Returned;	//��������!

// ��������� ��������
var int MIS_LostBau;

// �������� �����
var int MIS_MalethWolves;
	var int MIS_MalethWolves_SheepKilled;	//������� ���� ���� �����
	var int MIS_MalethWolves_FeedDay;	//����� � ��������� ��� �������

//� ��� ������?
var int MIS_FindTrocar;

// ---------------------------------------------------------------

// ��� ����� ��� �������
var int MIS_Odo_Herbs;
	var int MIS_Odo_Herbs_Give_Plant;	//����� �������� ������ �������
	var int MIS_Odo_Herbs_Give_Cnt;		//������� �������� ������
	var int MIS_Odo_Herbs_Give_Price;	//�������� ����������� ��������
	var int MIS_Odo_Herbs_PermCnt;	//������� �������� ������ ��������
	var int MIS_Odo_Herbs_AllCnt;	//������� ����� �������� ��������
	var int MIS_Odo_Herbs_Bonus;	//����� �� �����
	var int MIS_Odo_Herbs_Pay;		//������ �� ������ �� �����, � ������� ������
	var int MIS_Odo_Herbs_Day;		//����� ������ ������ ��� � ���������, ���� �� �������� �����
	var int MIS_Odo_Wine_SecretAsk;		//����� ������ ������ ������������� ����
	var int MIS_Odo_Wine_SecretGot;		//������ ������ ������������� ����
var int MIS_Odo_Wine;
var int MIS_Odo_Straw;
		const int Straw_Price = 0;
		const int Straw_Quality = 1;
		const int Straw_Told = 2;
		const int Straw_Max = 3;
	var int MIS_Odo_Straw_Onar[Straw_Max];
	var int MIS_Odo_Straw_Sekob[Straw_Max];
	var int MIS_Odo_Straw_Bengar[Straw_Max];
	var int MIS_Odo_Straw_Akil[Straw_Max];
	var int MIS_Odo_Straw_Lobart[Straw_Max];
	var int MIS_Odo_Straw_Cnt;
		const int MIS_Odo_Straw_All = 5;
	var int MIS_Odo_Straw_BengarChoosen;
	var int MIS_Odo_Straw_MoneyGiven;

// ������ ����� ���� ������
var int MIS_Talbin_Hunt;
	var int MIS_Talbin_Hunt_ShadowFur;	//�������� ����� ���������
	var int MIS_Talbin_Hunt_ShadowHorn;	//�������� ��� ���������
	var int MIS_Talbin_Hunt_NeedTeacherMandibles;	//����� ��������� ��������� �����
	var int MIS_Talbin_Hunt_CrawlerMandibles;	//�������� ����� �������
	var int MIS_Talbin_Hunt_KeilerGot;	//������ ������� ������
	var int MIS_Talbin_Hunt_KeilerSold;	//������� ������� ������
var int MIS_Talbin_WhiteWolf;
	var int MIS_Talbin_WhiteWolf_LakeTrace;	//����� ����� � ����� ��� ����������
	var int MIS_Talbin_WhiteWolf_Fight;	//����� ����� �����
	var int MIS_Talbin_WhiteWolf_Fur;	//���� ������
	var int MIS_Talbin_WhiteWolf_StairsTrace;	//����� �����
	var int MIS_Talbin_WhiteWolf_Dead;	//����� ������ �����
	var int MIS_Talbin_WhiteWolf_Gaan;	//��������� � ������
	
// ������ � ������, ��� � ������
var int MIS_Rupert_Debts;
	const int Creditor_Hanna	= 0;
	const int Creditor_Matteo	= 1;
	const int Creditor_Jora		= 2;
	const int Creditor_Baltram	= 3;
	const int Creditor_Canthar	= 4;
	const int Creditor_Kardif	= 5;
	const int Creditor_Lehmar	= 6;
	const int Creditor_Cnt	= 7;
	var int MIS_Rupert_Debts_Paid[Creditor_Cnt];	//���� ������� �����
	var int MIS_Rupert_Debts_Lehmar_Sum;	//������� ������ �����
	var int MIS_Rupert_Debts_Lehmar_Day;	//����� ������ �������
	var int MIS_Rupert_Debts_Lehmar_Sword;	//��� ��� ������:
		const int MIS_Rupert_Debts_Lehmar_SwordKnown = 1;	//������
		const int MIS_Rupert_Debts_Lehmar_SwordTold  = 2;	//�������
		const int MIS_Rupert_Debts_Lehmar_SwordGiven = 4;	//������
	
// ���� ��� �������
var int MIS_Till_Pet;
	var int MIS_Till_Pet_Follow;	//������� �� ������
	var int MIS_Till_Pet_Search;	//���� ��� (� �����)
	var int MIS_Till_Pet_RunAway;	//������� ������
	var int MIS_Till_Pet_KnowLost;	//���� �����, ��� ������� ������
	var int MIS_Till_Pet_Found;		//���� ����� ��������
	var int MIS_Till_Pet_SearchBurnTea;		//���� ����� �������� �������
	var int MIS_Till_Pet_CaveReady;	//����������� ������
		const int MIS_Till_Pet_CaveReady_Gobbo1 = 1;	//���������� �� �������� � 1 ������
		const int MIS_Till_Pet_CaveReady_Gobbo2 = 2;	//���������� �� �������� �� 2 ������
		const int MIS_Till_Pet_CaveReady_Straw = 4;	//��������� ������
	var int MIS_Till_Pet_BirthPlace;	//��� ����
		const int MIS_Till_Pet_BirthPlace_Sagitta = 1;	//� �������
		const int MIS_Till_Pet_BirthPlace_Cave = 2;	//� ������
	var int MIS_Till_Pet_ChildBorn;	//������
	var int MIS_Till_Pet_WolfsDead_Cnt;	//������� ����� ������� ������

// ����� ���������� ��������
var int MIS_Elena_Present;
	var int MIS_Elena_Present_TalkedAllMarketOnce;
	var int MIS_Elena_Present_FoundCnt;	//������� ����� ��������� �������
	var int MIS_Elena_Present_ReadyCnt;	//������� ������ ��������� �������
	var int MIS_Elena_Present_CupsCnt;	//������� ������ �������� ��������
	var int MIS_Elena_Present_CupLuteroGot;	//�������� ����� ������
	var int MIS_Elena_Present_LuteroAskedFur;	//������ �������� ����� ���������
	var int MIS_Elena_Present_CupLehmarGot;	//�������� ����� ������
	var int MIS_Elena_Present_KnowsLehmar;	//�����, ��� ����� � ������
	var int MIS_Elena_Present_KardifTold;	//������ ����������� ����� � �������
	var int MIS_Elena_Present_HalvorAsked;	//���������� � �������� ��� �����
	var int MIS_Elena_Present_HalvorPayedDay;	//����� ��������� �������
	var int MIS_Elena_Present_FurGot;	//����� ����� ���������
	var int MIS_Elena_Present_FurReadyTime;	//����� ����� ����� ������
	var int MIS_Elena_Present_ReadyFurGot;	//������� ������� �����
	var int MIS_Elena_Present_BrianTime;	//+3 ��� �������
	var int MIS_Elena_Present_BrianReturn;	//���������� �� ����� ������� � ������� ������ �����
	var int MIS_Elena_Present_WasilyPortraitsDay;	//����� ���� ���� ��������
	var int MIS_Elena_Present_WasiliPortraitGot;	//������� ��� �������
	var int MIS_Elena_Present_KnowsBrahim;	//�����, ��� ������� ����� ����������� ��������
	var int MIS_Elena_Present_BrahimReadyTime;	//����� ������� �������� ��������
	var int MIS_Elena_Present_PortraitsReady;	//�������� ������
	var int MIS_Elena_Present_LehamarAskedCupBack;	//����� ������� ������� ���������� �����
		const int MIS_Elena_Present_Lehamar_Returned = 1;	//������� ���������� ����� ������
		const int MIS_Elena_Present_Lehamar_GotByForce = 2;	//����� ������� ���� ����� �����
		const int MIS_Elena_Present_Lehamar_Mad = 3;	//����� ��������� ��� �� ���
		const int MIS_Elena_Present_Lehamar_Waits = 4;	//��� ����� ������� �����

// ����� ������� ������
var int MIS_Elena_TheklaSoup;

// ����
var int MIS_Sarah_OldFriends;
	var int MIS_Sarah_OldFriends_BernyPray;	//���� ���������� �� �����
	var int MIS_Sarah_OldFriends_BernyMet;	//��������� ������� �����
	var int MIS_Sarah_OldFriends_Count;	//������� ������ ���������
	const int MIS_Sarah_OldFriends_CountAll = 8;	//������� ����� ���� ���������
	var int MIS_Sarah_OldFriends_DeadCount;	//������� ������ (�������� �����)
var int MIS_Sarah_BadHabit;
	var int MIS_Sarah_BadHabit_VatrasAsked;	//�������� ������ � �������
	var int MIS_Sarah_BadHabit_EddaAsked;	//��������� ������ � ����
	var int MIS_Sarah_BadHabit_MoeAsked;	//��������� ������ � ��
	var int MIS_Sarah_BadHabit_MoeTalked;	//�� ��������� � �����
	var int MIS_Sarah_BadHabit_LuciaAsked;	//�������� �����, ��������� �� �� � ����� (�� ��� �� ���� ����)
	var int MIS_Sarah_BadHabit_LuciaTalkTime;	//����� ����� ��������� � �����
	var int MIS_Sarah_BadHabit_NadjaTalkTime;	//����� ���� "�������" (���� �� ������)
	var int MIS_Sarah_BadHabit_SearchPotion;	//���� ��������� (�������� � ������� ��� ���� ���� ���������)
	var int MIS_Sarah_BadHabit_PotionIngredients;	//���� �����������
	var int MIS_Sarah_BadHabit_PotionIngredientsGiven;	//������ �����������
	var int MIS_Sarah_BadHabit_PotionGot;	//�������� �����
	var int MIS_Sarah_BadHabit_NadjaAgreed;	//���� ����������� �������
	var int MIS_Sarah_BadHabit_NadjaPrize;	//��� ��������� � ���� �� ����� (���� 0 - �� ������)
		const int MIS_Sarah_BadHabit_NadjaPrize_Thanks = 1;	//������ �������
		const int MIS_Sarah_BadHabit_NadjaPrize_Gold = 2;	//������
	var int MIS_Sarah_BadHabit_GivePotionDay;	//����� ������ �����
	var int MIS_Sarah_BadHabit_KnowBloodyCough;	//������, ��� ���� ������� ������
	var int MIS_Sarah_BadHabit_SalveGivenDay;	//���� ���� ����������� ����
	

// ����
var int MIS_Erol_Plates;
	var int MIS_Erol_Plates_GivenCnt;	//������� ����� ����� (15 = 13 + 2 �� ������)
	const int MIS_Erol_Plates_Pay = 20;	//������ �� �������� (+ �����)
	const int MIS_Erol_Plates_PaySpecial = 100;	//�� ������ ������� (+ �����, ������)
	var int MIS_Erol_Plates_GivenDay1;	//����� ���� ������ ��������
	var int MIS_Erol_Plates_NumbersSolved;	//������ ������� � �������
	var int MIS_Erol_Plates_AmulFound;	//����� ������ ������� �������
	var int MIS_Erol_Plates_AmulWorks;	//���������, ��� ������ �������� ����� ��������������
	var int MIS_Erol_Plates_AmulReady;	//������ ������ �������
	var int MIS_Erol_Plates_GoldFound;	//����� ������� ��������
	var int MIS_Erol_Plates_GoldGiven;	//������ ������� ��������
	var int MIS_Erol_Plates_SilverFound;	//����� ���������� ��������
	var int MIS_Erol_Plates_SilverPieceFound;	//����� ������� ���������� ��������
	var int MIS_Erol_Plates_SilverFull;	//������ ���������� �������� �������
	var int MIS_Erol_Plates_SilverFull_Day;	//����� ������ ������� ���������� �������� �������
	

//������������ --------------
var int ADMIS_NS_Found;	//������� ��� �����

// ���������� -------------------------------
var int City_Schulden;	//����� �� ������������ � ������
var int Farms_Schulden;	//����� �� ������������ �� ������
var int Monastery_Schulden;	//����� �� ������������ � ���������
var int Hero_ThrowOut_Monastery;	//�� ���������� �� ���������

// ������ -----------------------------------

var int TEACH_Neoras;	//������ ���� ������ �����

var int OldShepherd_MaxCheese;	//������� �������� ���� ���� ������ ������
var int OldShepherdSheeps_Dead_Cnt;	//������� ������� ���� � ������� ������� (�� ����� ��������)
var int MonasterySheep_Dead_Cnt;	//������� ������� ���� � ��������� (�� ����� ��������)
var int Vino_Search;	//������ �������� ����� ����
var int Vino_Smelled;	//������!
var int Vino_Found;	//�������!
var int Vino_Sleep_Day;	//� ����� ���� ���� ���������
var int NastasSanna_Scripts_Cnt;	//������� ������� ��������
var int MalethWolf_Dead_Cnt;	//������� ����� ������ ��� ������
var int MalethSheep_Dead_Cnt;	//������� ������� ���� ������
var int THORBEN_Discount;	//������ �������� ������� ������
var int Matteo_LeatherArmorBabe_Day;	//����� ����� ����� ������� ������
var int Matteo_LeatherArmorGiven;	//������ ��� ����� ������� ������
var int Bosper_BeltBought;	//��� ������ � ������� ���� �� �������
var int Engrom_Follows;	//������� �� ������ �� ��
var int Engrom_ArmHurt;	//� ������� ����� �����
var int Engrom_ArmHurt_Day;	//� ������ ���
var int Engrom_ArmHurt_Hour;	//� ����
var int Orlan_Room_Got;	//����� ������� � ������� ������� ������
var int Fishers_Rain_Day;	//����� ����� �����, ������������� �������
var int Fishers_Rain_Started;	//�����, ������������� �������, ��� ������� + ���������
var int Ulf_Beer_Count;	//������� ���� ����� ����
var int Odo_Bless_Innos_Once;	//�������������� �� ��������
var int Pedro_NotHungryDay;	//����� ����� �������� (1 ���)
var int Pedro_FedDay;	//����� ������� � ��������� ��� + 1, ����� �������� �� 0
var int Pedro_FedCnt;	//������� ��� �������, ��� �� ��� ���
var int Peck_PayDay;	//�� ����� ���� ��������� ���� �� ����������
var int Peck_Training_Running;	//���� ����������
var int Peck_WrongTraining;	//�������������� �� ��������� ������ ����������
var int Moe_Sign;	//��� ��� ������ "����������� ��������"
var int Rengaru_Hocus;	//������� ����� "��������"
var int Harad_TradeNugget;	//�����, ��� ����� �������� ����
var int Harad_TradeNugget_Cnt;	//������� ��� �������
var int Brian_KnifeSell;	//������ ����� ������� ���
var int Wasili_LutikStory_Part;	//����� ����� ������� ��� ������ ������������
var int Thekla_Feed_Day;	//����� ������ � �����
var int Thekla_MrSoup_Day;	//����� � ����� ���� ������� ���
var int Edda_Feed;	//���� �������� ������� �����
var int Kardif_TellRumors;	//������ ������������ �����
var int Hanna_Paid;
var int Carl_PickAxeReady_Time;	//����� ����� ������ ����� ��� �����
var int Fellan_ChestKeyGot;	//�������� ���� �� ������� �������
var int Sagitta_BigHeal;	//������� ����� ���� �����, ����� ��������� ��
var int Ulf_WannaBeer;	//���� ����� ���� �� ��� � ������������� �� ������
var int Rupert_Binge;	//������ ���������� �������� � �������
var int Matteo_ClothWear_Counter;	//������� ������� ��������� � ������
var int Trocar_InsertKeiler;	//�������� ������ �������
var int Harad_Rupert_Smith_Time;	//����� ����� ����� ������ ���
var int Harad_Rupert_Smith_SpendTime;	//��� ������ ������� ������� � ������
var int Rupert_LiedSong;	//������� �������, ��� ����������� ���� �������
var int Rupert_LiedGold;	//������� �������, ��� ����������� ���������� ����� � ������
var int Bromor_Paid;	//��������� ������� �� ������
var int Vanja_Ready;	//���� ������
var int Vino_HidePlace;	//��� �������� ����
var int Erol_Graves_GotPlates;	//���� ������� ��������
var int Mika_MayGuard;	//����� ������ ����
var int Mika_Guard_Active;	//���� ��������
var int Mika_Guard_EndTime;	//�� ������ ����?

//����� ���������
var int DIA_Bartok_TellTales;	//1 ����� (��������� �������)
	var int Tale_CursedHunter_Once;
var int DIA_Trocar_TellTales;	//3 ����� � ���� (�����, ����� ��������, �������� ������) + 1 � �������
	var int Tale_Wargs_Once;
	var int Tale_WhiteShadowbeast_Once;
	var int Tale_RatKing_Once;
	var int Tale_WhiteWolf_Once;
var int DIA_Farim_TellTales;	//1 ����� (������� ������)
	var int Tale_SeaDragon_Once;
var int DIA_Grimbald_TellTales;	//1 ����� (��������� ������)
	var int Tale_SpeakingHarpy_Once;
var int DIA_Engrom_TellTales;	//1 ����� (������ �����) - � ����, ����� �������
	var int Tale_DrunkKeil_Once;
var int Listen_Tale_Count;
const int Listen_Tale_Count_All = 6;
const int Listen_Tale_Count_Elena = 4;	//�������
	var int Tale_Ritters_Once;
	var int Tale_Dragons_Once;
	var int Tale_Ruins_Once;
	var int Tale_Lutik_Once;
var int BloodwinSnow_KillPlayer; //��������� ���������� ����������
var int ACHIEV_SnowStudio_Counter; //������� ������� �����
//�����
var int Read_MRBook_Once;
var int Read_HerbBook_Once;
var int Read_CourtCase_Once;
var int Read_Shipbuilding_Once;
var int Read_Bookstand_Report_Once;
var int Read_OldLetter_Godo2Berta_Once;
var int Read_OakBranch_Once;
var int Read_BiographyBartosLaran_Once;
var int Read_SmithGuide_Once;
var int Read_SunExtract_Once;
var int Read_OnAlchemy_Once;	//������ ���!
var int Read_UnderInnosEye_Once;
var int Read_HorsePlague_Once;
var int Read_AboutDragons_Once;
var int Read_Books_Count;
const int Read_Books_Count_All = 13;
var int Read_BooksOld_Count;
const int Read_BooksOld_Count_All = 9;

var int Dyrian_HasBook; //���� ������� ������


// ����� -----------------------------------------------

//����������� ������ � % �� ���������
const int Spawn_Intensity_min = 10;
const int Spawn_Intensity_mid = 20;
const int Spawn_Intensity_max = 30;
const int Spawn_Intensity_def = 20;

//� ����� FP ������������� ��� ������ ��� ������ � �������
//SP_<���>[...][_RBx][_RSy][_CNTz][_NP][...],	x,y - min � max ������� � ��
const string SP_pref = "SP_"; const int SP_pref_len = 3;
const string Rmax_pref = "RB"; const int Rmax_pref_len = 2;
const string Rmin_pref = "RS"; const int Rmin_pref_len = 2;
const string Cnt_pref = "CNT"; const int Cnt_pref_len = 3;
const string NoPhys_name = "NP";

// --------------------------------------
// ��� ������ <���> ::= MR<��� �����>
const string SP_MR_pref = "MR"; const int SP_MR_pref_len = 2;

//MainFlag
const int SP_MR	= 1;
//flag
const int MR_01				= 0;	//411
const int MR_02				= 1;	//344
const int MR_Stone			= 2;	//142
const int MR_Sunrise		= 3;	//76
const int MR_Foggy			= 4;	//21		!!!
const int MR_Piny			= 5;	//done 156
const int MR_Red			= 6;	//350
const int MR_Bottle			= 7;	//77
const int MR_BrownOiler		= 8;	//done 467
const int MR_Oyster			= 9;	//done 67
const int MR_Governor		= 10;	//81
const int MR_Keil			= 11;	//89
const int MR_Branch			= 12;	//81
const int MR_LadysEar		= 13;	//done 91
const int MR_Trident		= 14;	//48		!!!
const int MR_NightSparkles	= 15;	//done 70
const int MR_DragonTears	= 16;	//59
const int MR_Heart			= 17;	//done 5
const int MR_GoldPlate		= 18;	//done 5
const int MR_Ivy			= 19;	//done 54
const int MR_Violet			= 20;	//32
const int MR_Count		= 21;
const int MR_Lists_DoubleLen = 2 * MR_Count;
//<��� �����>
const string SP_MR_Abbr[MR_Count] = {	
	"01",
	"02",
	"STN",
	"SNR",
	"FOG",
	"PIN",
	"RED",
	"BTL",
	"OIL",
	"SEA",
	"GOV",
	"KL",
	"BRCH",
	"EAR",
	"TRI",
	"NSP",
	"DRG",
	"HRT",
	"GLD",
	"IVY",
	"VLT"
};
const string MR_Names[MR_Count] = {	
	"������ ����",
	"���� ��������",
	"�������",
	"�������",
	"��������",
	"��������",
	"������",
	"����������",
	"������",
	"����������",
	"����������",
	"��������",
	"��������",
	"������� ����",
	"��������",
	"������ �����",
	"��������� �����",
	"����-������",
	"������� ����",
	"��������",
	"��������� �������"
};
//��������� ������ ��� �����������, � ��������� ������ ����
const int MR_Price[MR_Count] = {	
	10,	//"01",
	15,	//"02",
	4,	//"STN",
	9,	//"SNR",
	0,	//"FOG",
	5,	//"PIN",
	2,	//"RED",
	12,	//"BTL",
	8,	//"OIL",
	10,	//"SEA",
	12,	//"GOV",
	24,	//"KL",
	30,	//"BRCH",
	4,	//"EAR",
	14,	//"TRI",
	60,	//"NSP",
	80,	//"DRG",
	250,	//"HRT",
	100,	//"GLD",
	11,	//"IVY",
	50	//"VLT"
};
// ������ � ������ ��� ����� ������ �����������
// � �������� ����� ����������� ���� �� MR_Price
const string TOPIC_ConstantinoMushrooms_Comment[MR_Lists_DoubleLen] = 
{
	"�� ������ ����� ����������� �������� �� ", " �������.",	//"01",
	"������ ���� ����������� ������ � ", " ������� �����.",	//"02",
	"�� ������� ����� �������� ", " �������.",	//"STN",
	"�������, ������� ����������� ������ ������� ��������, ����� ", " �������.",	//"SNR",
	"�������� ����������� �� �������������. � �� ��������� ��� �� ����...","",	//"FOG",
	"�������� ���� ����� ������ ", " �������.",	//"PIN",
	"������� ������ ����������� �� �����, �� �� ��� �� ���� �� ���� �� ", " �������.",	//"RED",
	"���� ����������� - ", " �������.",	//"BTL",
	"���������� ������, ��� ������ ��� �����, ����� ����� ", " �������.",	//"OIL",
	"��� ������� ����� ����, ������� ����������� ������� �� �����. ��� ����������. �� �������� �� ��� ��� 100 �������, �� �� ���� ����� ������ �� ", ".",	//"SEA",
	"������� ���������� ������� �� ", " �������.",	//"GOV",
	"����������� ����� �������� ������ ������� ������� �����, �� ���� �� ", " �������.",	//"KL",
	"����������� ������ ������ �� �������� ", " �������.",	//"BRCH",
	"������� ������� ��� �� ����� ����� �����������, �� ������ ������ ", " �������.",	//"EAR",
	"�������� ����������� �������������, �� �� ������. �� �������� ", " ������� �� �����.",	//"TRI",
	"������ ����� - ���������, �� ������. �� ������ ������ ����������� ����� �������� ", " �������.",	//"NSP",
	"����� ��������� ����� ����� ����� ", " �������.",	//"DRG",
	"�� ������ � ��������� ����-������ � ���� �������� ����� ", " �������. ����������� ��� ����� �������.",	//"HRT",
	"������� ���� - ����� ������ ����, �� ����� ", " �������.",	//"GLD",
	"�������� ����� ������� ����������� �� ", " �������.",	//"IVY",
	"�������� ���������� ������� ����� ������, ", " �������."	//"VLT"
};
//*/

//������
const int SP_MR_Lists[MR_Lists_DoubleLen] =	{
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0,
	0,0
};
const int SP_FOOD_List[2] = {0,0};	//������ ����� �� ��� ���

// --------------------------------------

var int SP_NightSparkles_Night;

// --------------------------------------
// ��� ��� <���> ::= FOOD
const string SP_Food_name = "FOOD";
//MainFlag
const int SP_Food	= 2;
//flag
const int SP_Food_Rich = 1;	
const int SP_Food_Tavern = 2;
const int SP_Food_Poor = 4; 
const int SP_Food_Bau = 8;
const int SP_Food_Flag_Names_Count = 4;
const string SP_Food_Flag_Names[SP_Food_Flag_Names_Count] = {	
	"RICH",
	"TAVERN",
	"POOR",
	"BAU"
};
//������ �� �����������, ����� � ������ ���� (�����: �������� ������� VobTree ��� ��� ������!)

//������ ����, ��� ����� �������
var int SP_Delete_List[2];	//zCListHead <oCItem>



