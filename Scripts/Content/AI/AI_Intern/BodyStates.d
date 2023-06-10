/**************************************************************************

                              ��������� ����
  
  ����� ��������� ��������� ���������� � ��������� ���������.
  ������������ ����� ������������� ��������� � �������� �� ������������.

***************************************************************************/

// ����� -------------------------------------------------------------------

const int BS_FLAG_INTERRUPTABLE		= 1 << 15;		//������� �������� ����� ��������
const int BS_FLAG_FREEHANDS			= 1 << 16;		//���� ��������


// ��������� ---------------------------------------------------------------
/* ������� + ��� ��������� ��������� ����������� ����� */

const int BS_STAND					=  0 + BS_FLAG_INTERRUPTABLE + BS_FLAG_FREEHANDS;		//�����
const int BS_WALK					=  1 + BS_FLAG_INTERRUPTABLE;		//����
const int BS_SNEAK					=  2 + BS_FLAG_INTERRUPTABLE;		//��������
const int BS_RUN					=  3;								//�����
const int BS_SPRINT					=  4;								//������ ����� (��� ����.)
const int BS_SWIM					=  5;								//������
const int BS_CRAWL					=  6;								//������ (��� ����.)
const int BS_DIVE					=  7;								//������
const int BS_JUMP					=  8;								//�������
const int BS_CLIMB					=  9 + BS_FLAG_INTERRUPTABLE;		//����������  (��� ����.)
const int BS_FALL					= 10;								//������
const int BS_SIT					= 11 + BS_FLAG_FREEHANDS;			//����� 
const int BS_LIE					= 12;								//�����
const int BS_INVENTORY				= 13;								//������ ���������
const int BS_ITEMINTERACT			= 14 + BS_FLAG_INTERRUPTABLE;		//�������� � ��������� 
const int BS_MOBINTERACT			= 15;								//�������� � ��������
const int BS_MOBINTERACT_INTERRUPT	= 16 + BS_FLAG_INTERRUPTABLE;		//����������� �������� � �������� 
const int BS_TAKEITEM				= 17;								//����� ������� (��� ����.)
const int BS_DROPITEM				= 18;								//������ ������� (��� ����.)
const int BS_THROWITEM				= 19;								//������� ������� (��� ����.)
const int BS_PICKPOCKET				= 20 + BS_FLAG_INTERRUPTABLE;		//������  (��� ����.)
const int BS_STUMBLE				= 21;								//���������� (��� ����.)
const int BS_UNCONSCIOUS			= 22;								//��� ��������
const int BS_DEAD					= 23;								//����
const int BS_AIMNEAR				= 24;								//���� ������ (�� ���., ��� �������� ��������� BS_STAND)
const int BS_AIMFAR					= 25;								//���� ������ (�� ���.)
const int BS_HIT					= 26 + BS_FLAG_INTERRUPTABLE;		//������� ����  (��� ����.)
const int BS_PARADE					= 27;								//��������� (��� ����.)
const int BS_CASTING				= 28;								//������ ���������� (��� ����.)
const int BS_PETRIFIED				= 29;								//��������� (��� ����.)
const int BS_CONTROLLING			= 30 + BS_FLAG_INTERRUPTABLE;		//������������ ����-�� (��� ����.)
const int BS_MAX					= 31;				//���-�� ��������� ���� (�����.)


//������������ ��������� (��������� ����� 7-14)
const int BS_MOD_HIDDEN				= 1 << 7;		//������� 
const int BS_MOD_DRUNK				= 1 << 8;		//������ (�� ���.)
const int BS_MOD_NUTS				= 1 << 9;		//�������� 
const int BS_MOD_BURNING			= 1 << 10;		//�������
const int BS_MOD_CONTROLLED			= 1 << 11;		//��� ���������
const int BS_MOD_TRANSFORMED		= 1 << 12;		//������������������


//������������� �������� � ��������� �� ����� (�����.)
// ����� ������ - �����,����,�����,����
const string MOB_SIT				= "BENCH,CHAIR,GROUND,THRONE";
// ����� ������ - �������,������� �������,������ �������
const string MOB_LIE				= "BED,BEDHIGH,BEDLOW";
// ����� ���������� - ������,���������� ��������,�������
const string MOB_CLIMB				= "CLIMB,LADDER,RANKE";
// ������ ������������� - �����,�����,������,�������������,�����,������� ������,��������� ������,�����,
//����,���������,������,������ ������
const string MOB_NOTINTERRUPTABLE	= "DOOR,LEVER,TOUCHPLATE,TURWITCH,VWHEEL,CHESTBIG,CHESTSMALL,HERB,IDOL,PAN,SMOKE,INNOS";


//��� ��������� �������� � ��������� �������� ������������
//�����,����������,�����,����,������,�����,�������,������,
//BOOK,BSANVIL,BSCOOL,BSFIRE,BSSHARP,CAULDRON,DRUM,GRAVE,
//���.����,���� ����,������,������� ����,������,�����,�������� ��������
//LAB,ORE,REPAIR,RMAKER,BAUMSAEGE,STOVE,SDW
