/**************************************************************************

                                ������
							   
  � ���� ����� ��������� �������� ������ - ��������, �������, ����������,
����� � ��������� ���������������� �������, � ����� ��������� ����������
�������� � ������ �� ����� ������� � �.�.
  ���� "�������" ����������.
  
  ������ �� �������!!!
  
  ��������� �����:
 ������� �������� � ����� 						Constants.d
 ��������� ��									AI\AI_Intern\AI_Constants.d

***************************************************************************/


// ��������� ------------------------------------------------------------------

const int MAX_CHAPTER = 5;	//����. ���-�� ���� (�� ���.)
const int MAX_MISSIO = 5;	//����. ���-�� ����������� ������ (�� ���.)
const int MAX_HITCHANCE = 5;//����������� ������� ������� �������� ������� (=���-�� ����� ������)


// �������� (���) ---------------------------------------------------------------
class C_Npc
{
	var int id;						//���������� ������������
	var string name[5];				//��� (������������ ��� ���), ���. ������ name[0]
	var string slot;				//(��������)
	var string effect;				//��� ����������� �������
	var int npcType;				//��� ��������� ��� �� (=NPCTYPE_x)
	var int flags;					//����� (=NPC_FLAG_x, 0 ���� �����������)
	//
	var int attribute[ATR_INDEX_MAX];//��������
	var int HitChance[MAX_HITCHANCE];//����� �������� ������ ������ (����������� ����. �����)
	var int protection[PROT_INDEX_MAX];//������ �� ������������
	var int damage[DAM_INDEX_MAX];  //������ ��������� ����������� �� �����
	var int damagetype;				//����� ����� �����������
	//
	var int guild;					//������� (=GIL_x)
	var int level;					//������� 
	var func mission[5];			//������ (�� ���.)
	//
	var int fight_tactic;			//������� ��� ��� �� (=FAI_x)
	var int weapon;					//������ (�� ���.)
	//
	var int voice;					//����� ������ (=1..16)
	var int voicePitch;				//����������� ������ (�� ���.)
	//
	var int bodymass;				//����� ���� (�� ���.)
	//
	var func daily_routine;			//������� ���������� ��� (Rtn_x)
	var func start_aistate;			//������� ���������� ��������� �� (=ZS_x)
	//�����������
	var string spawnPoint;			//�����, � ������� ���������, ���� �� ���., ��. ������� Wld_InsertNpcAndRespawn
	var int spawnDelay;				//����� ����� ������� � ������������, ������, ���� �� ���., ��. ������� Wld_InsertNpcAndRespawn
	//�������
	var int senses;					//����� ������ (=SEE_x)
	var int senses_range;			//�������� ���������������� � ��
	//
	var int aivar[100];				//�������� ���������� �� (=AIV_x)
	//
	var string wp;					//�������� � �����
	//����
	var int exp;					//���� (������ � ��)
	var int exp_next;				//���� �� ����. ������ (������ � ��)
	var int lp;						//���� ����� (������ � ��)
	//������
	var int bodyStateInterruptableOverride; //������ �� ���������� �������� ��������� (����������� ���� BS_FLAG_INTERRUPTABLE)
	var int noFocus;				//� ������ �� ���������� ��� � ������� �����
};


// ������ (�� ���.)--------------------------------------------------------------
class C_Mission
{
	var string name;
	var string description;
	var int duration;
	var int important;
	var func offerConditions;
	var func offer;
	var func successConditions;
	var func success;
	var func failureConditions;
	var func failure;
	var func obsoleteConditions;
	var func obsolete;
	var func running;
};

// ������� ----------------------------------------------------------------------
class C_Item
{
	//�����
	var int id;						//���������� ������������� (�� ���.)
	var string name;				//��������
	var string nameID;				//(��������)
	var int hp;						//(�� ���.)
	var int hp_max;					//(�����.) //NS: �� ������������! ����� ���� �������� ����� = 0
	var int mainflag;				//����� ��������� �������� (=ITEM_KAT_x)
	var int flags;					//������ ����� (=ITEM_x)
	var int weight;					//��� (�� ���.)
	var int value;					//���������
	//������
	var int damagetype;				//����� ����� ����������� (=DAM_x)
	var int damageTotal;			//����� �������� �����������
	var int damage[DAM_INDEX_MAX];	//�������� ����������� �� �����
	//���������
	var int wear;					//����� ��� ��������� (=WEAR_x)
	var int protection[PROT_INDEX_MAX]; //������ �� ����������� �� �����
	//����
	var int nutrition;				//������������� (�� ���.)
	//������� ��� �������������
	var int cond_atr[3];			//����� �������� ����� ��� ���������� (=ATR_x), �� ������ 3, � �������� ������ cond_atr[2]
	var int cond_value[3];			//���. �������� ��������� ��� ����������
	//��������� ���������
	var int change_atr[3];			//����� �������� �������� (�� ���., �� ��������), ����������� � on_equip/on_unequip/on_state
	var int change_value[3];		//�� ������� �������� �������� (�� ���., �� ��������), ����������� � on_equip/on_unequip/on_state
	//��� �������
	var func magic;					//����� (��� ����.)
	var func on_equip;				//���������� ��� ���������
	var func on_unequip;			//���������� ��� ������
	var func on_state[4];			//���������� ��� �������������, (�� 4 ������, ��. �����. ��������, ���� ����� 0)
	//��������
	var func owner;					//��������, ���������������� ������ �� ����������� NPC (�� ��� ID)
	var int ownerGuild;				//������� ��������� (=GIL_x)
	var int disguiseGuild;			//��������� ������� (��� ����.)
	//������� ���
	var string visual;				//3D-������ ��������(x.3DS)
	var string visual_change;		//3D-������ �������� �������� (�����) (x.ASC)
	var string effect;				//��� ����������� ������� ��� �������
	var int visual_skin;			//����� ��������
	var string scemeName;			//�������� ����� �������� ������������� ��������
	var int material;				//�������� (=MAT_x)
	//�����
	var int munition;				//��� ������ (������, ���������� ����)
	//�����
	var int spell;					//���������� (=SPL_x)
	var int range;					//������ ��������� (=RANGE_x_)
	var int mag_circle;				//���� �����
	//��������
	var string description;			//�������� �������� � ��������� (����� =name)
	var string text[6];				//������ ������, �������������� � ���������
	var int count[6];				//��������������� ������ ��������
	//������
	var int inv_zbias;				//������� ������ ��� ����������� �������� � ���������
	var int inv_rotx;				//������� ������ �� ��� X ��� ����������� � ���������
	var int inv_roty;				//������� ������ �� ��� Y ��� ����������� � ���������
	var int inv_rotz;				//������� ������ �� ��� Z ��� ����������� � ���������
	var int inv_animate;			//�������� ��� ����������� � ��������� (��� ����.)
};

// ����� ---------------------------------------------------------------------------
/* �������� ��� ������ ��������� ������ � AI\AI_Intern\Focus.d */
class C_Focus
{
	//� ������ - ��������
	var float npc_longrange;		//��������� (��� ������)
	var float npc_range1;			//�����. ��������	
	var float npc_range2;			//����. ��������
	var float npc_azi;				//������
	var float npc_elevdo;			//����. ���� ������� (�������) (����,	>0)	
	var float npc_elevup;			//���. ���� ������� (�������) (�����, <0)
	var int npc_prio;				//��������� ��������� ���������
	//� ������ - �������
	var float item_range1;			//�����. ��������	
	var float item_range2;			//����. ��������
	var float item_azi;				//������
	var float item_elevdo;			//����. ���� ������� (�������) (����,	>0)	
	var float item_elevup;			//���. ���� ������� (�������) (�����, <0)
	var int item_prio;				//��������� ��������� ��������
	//� ������ - ������
	var float mob_range1;			//�����. ��������
	var float mob_range2;			//����. ��������
	var float mob_azi;				//������
	var float mob_elevdo;			//����. ���� ������� (�������) (����,	>0)
	var float mob_elevup;			//���. ���� ������� (�������) (�����, <0)
	var int mob_prio;				//��������� ��������� �������
};


// ������ --------------------------------------------------------------------
/* ����� �������
   ��. ����� Story\Dialoge\ � Story\Dialog_Mobsis\ */
class C_Info
{
	var int npc;				//��� ������� (ID)
	var int nr;					//����� ������� (��� �� ������, ��� ���� � ������ ��������� ������ �����)
	var int important;			//���� �������� (=TRUE/FALSE) - ���� ����������, �������� ��� ��������� � ��
	var func condition;			//�������, ��� ���������� �������� ���������� ������ (��� ������� = ��� ������� + _Condition)
	var func information;		//����� ������ ������� � ���, ��� ��� ���� ���������� (��� ������� = ��� ������� + _Info)
	var string description;		//�����, ������������� � ������ ���������
	var int trade;				//������ ��� �������� (=TRUE/FALSE)
	var int permanent;			//���������� ������, �� �������� ����� ��������� (=TRUE/FALSE)
};


// ������� �� ������� (�� ���.) -----------------------------------------------------
class C_ITEMREACT
{
	var int npc;
	var int trade_item;
	var int trade_amount;
	var int requested_cat;
	var int requested_item;
	var int requested_amount;
	var func reaction;
};


// ���������� ------------------------------------------------------------------------
/* ��� ���������� ������� � AI\Magic\Spells\ ����� �������� �� 
   AI\Magic\C_Spell_Proto.d.
   �� ������ � ��������� ���. */
class C_Spell
{
	var float time_per_mana;			//�����, ����������� ��� �������������� ����, � ��
	var int damage_per_level;			//���� �� ������� ��������������
	var int damagetype;					//��� ����������� (=DAM_x)
	var int spellType;					//��� ���������� (=SPELL_GOOD|SPELL_NEUTRAL|SPELL_BAD)
	var int canTurnDuringInvest;		//����� �� ����������� �� ����� �������������� ���� (=TRUE/FALSE)
	var int canChangeTargetDuringInvest;//����� �� ������� ���� �� ����� �������������� ���� (=TRUE/FALSE)
	var int isMultiEffect;				//������������� ������, �� ����� ��� ���� ���������� =0
	var int targetCollectAlgo;			//���� ���������� (=TARGET_COLLECT_x)
	var int targetCollectType;			//��� ���� (=TARGET_TYPE_x), � �������� ������ TARGET_TYPE_NPCS
	var int targetCollectRange;			//��������� �������� � ��
	var int targetCollectAzi;			//���� ������� (��������. ���� �����)
	var int targetCollectElev;			//���� ������� (����. ���� �����)
};



instance self(C_Npc)	// ��� - �������� ��������
{
};
instance other(C_Npc)	//������ - ���, � ��� �������� �������� ���������������
{
};
instance victim(C_Npc)	//������ - ������ ���� �� ��������������, ������ �������
{
};
instance item(C_Item)	//������� (� ������)
{
};
instance hero(C_Npc)	//����� (��, �����)
{
};




