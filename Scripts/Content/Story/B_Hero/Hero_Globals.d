
//��� �������� �� ���������?
var int MON_Intruder_Once;

// ������ ---------------------------------------------------------

var int Hero_HackChance;
var int Hero_CanSneak;	//������� �������������
var int Hero_Acrobat;	//�� - ������� ���� ������ �����

//��� ������� ����������
var int Hero_Counter_STR;
var int Hero_Counter_DEX;
var int Hero_Counter_MANA;
var int Hero_Counter_H1;
var int Hero_Counter_H2;
var int Hero_Counter_Bow;
var int Hero_Counter_CBow;


// ��������� ------------------------------------------------------

// ���� �� ��
var int HERO_IsSleeping;
var int HERO_SleepGround;
	const int SLEEP_None		= 0;	//���
	const int SLEEP_FireCamp	= 1;	//���� � ������
//	cosnt int SLEEP_Fur			= 2;	//���� �� ����� (�� ���.)

// ����� �����
var int HERO_ACTION_Pickpocket;
	const int PICKPOCKET_Fail		= -1;	// ������
	const int PICKPOCKET_None		= 0;	// ����.
	const int PICKPOCKET_Sleep_Pre	= 1;	// ����� ������
	const int PICKPOCKET_Sleep		= 2;	// �� ���
	//const int PICKPOCKET_Talk		= 3;	// � ���������
// � ���� �������� (ID)
var int HERO_ACTION_Pickpocket_Victim;

//� �������� ���� ������ ����� �������
var int Hero_SwimTime;

//�� - ����������
var int HERO_Imprisoned;
	const int HERO_Imprisoned_City = 1;
	const int HERO_Imprisoned_Farm = 2;
	const int HERO_Imprisoned_Monastery = 3;
	
//� ����� ��� �� ������?
var int HERO_WalkFromCity;

// ������ ������ ����������� �� ���� ��������
var int Hero_RegenHPFromMana;


// ����� �� ------------------------------------------------------

const int PC_Elena_ID	= 1601;
const int PC_Sarah_ID	= 1602;
const int PC_Erol_ID	= 1603;
const int PC_Odo_ID		= 1604;
const int PC_Rupert_ID	= 1605;
const int PC_Talbin_ID	= 1606;
const int PC_Till_ID	= 1607;

const int CMP_Elena_ID	= 1651;
const int CMP_Sarah_ID	= 1652;
const int CMP_Erol_ID	= 1653;
const int CMP_Odo_ID	= 1654;
const int CMP_Rupert_ID	= 1655;
const int CMP_Talbin_ID	= 1656;
const int CMP_Till_ID	= 1657;

// ���-����������� -----------------------------------------------

var int PATRONGOD;
	const int PATRONGOD_Innos = 1;
	const int PATRONGOD_Adanos = 2;
	const int PATRONGOD_Beliar = 3;

// ����� ---------------------------------------------------------

//����������
var int POISON_Foggy_Timer;
	const int POISON_Foggy_Duration = 3*24*60;	//3 �����
var int POISON_DrgTears_Timer;
	const int POISON_DrgTears_Time_Max = 4*60;	//4 ����
	var int POISON_DrgTears_EffectOn;
var int POISON_Stone_Cnt;
	const int POISON_Stone_Cnt_Min = 30;
var int TIMER_AntiFoggy;				//����������� - ������
	var int TIMER_AntiFoggy_Enabled;
	const int TIMER_AntiFoggy_Max = 3*60;	//2 ����
var int POISON_Trident_Timer;
var int POISON_Trident_STR;
var int POISON_Trident_DEX;
	const int POISON_Trident_Step = 10;	//�� 10 ����� ��������������� 1 ��.
	
//������ ������ ����
var int TIMER_NightSparkles;
	var int TIMER_NightSparkles_Enabled;
	const int TIMER_NightSparkles_Max = 30;	//������� �����

//��� ������ � �����������
var int Hero_Knows_Bottle;
var int Hero_Dia_Bottle;

//������� ������� ������
var int MR_Counter[MR_Count];
var int MR_ConstantinoCommentOnce[MR_Count];
//������� ��������� ������
var int MR_Eaten[MR_Count];

//�������� �����������
var int MR_Counter_Elena;
var int MR_Counter_Sarah;
var int MR_Counter_Erol;
var int MR_Counter_Odo;
var int MR_Counter_Rupert;
var int MR_Counter_Talbin;
var int MR_Counter_Till;

//��������� ���������� ������� ��������
var int Cmp_Skill_Elena;
var int Cmp_Skill_Sarah;
var int Cmp_Skill_Erol;
var int Cmp_Skill_Odo;
var int Cmp_Skill_Rupert;
var int Cmp_Skill_Talbin;
var int Cmp_Skill_Till;
	
//���� ��������
var int Competition_Result;
	const int Competition_Result_NONE = 0;
	const int Competition_Result_WON  = 1;
	const int Competition_Result_LOST = 2;
//�� ���� �������� ���� �� ������, � ������� ����������� �� �����
var int Competition_Bonus;
//���� ����������
var int Competition_WinnerScore;
//��� ���������� (id)?
var int Competition_Winner;


