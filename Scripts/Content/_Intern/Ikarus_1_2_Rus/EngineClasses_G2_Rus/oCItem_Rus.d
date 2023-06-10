class oCItem {
//zCVob {
  //zCObject {
  var int    _vtbl;
  var int    _zCObject_refCtr;
  var int    _zCObject_hashIndex;
  var int    _zCObject_hashNext;
  var string _zCObject_objectName;
  //}
  var int    _zCVob_globalVobTreeNode;
  var int    _zCVob_lastTimeDrawn;
  var int    _zCVob_lastTimeCollected;
  var int    _zCVob_vobLeafList_array;
  var int    _zCVob_vobLeafList_numAlloc;
  var int    _zCVob_vobLeafList_numInArray;
  var int    _zCVob_trafoObjToWorld[16];
  var int    _zCVob_bbox3D_mins[3];
  var int    _zCVob_bbox3D_maxs[3];
  var int    _zCVob_bsphere3D_center[3];
  var int    _zCVob_bsphere3D_radius;
  var int    _zCVob_touchVobList_array;
  var int    _zCVob_touchVobList_numAlloc;
  var int    _zCVob_touchVobList_numInArray;
  var int    _zCVob_type;
  var int    _zCVob_groundShadowSizePacked;
  var int    _zCVob_homeWorld;
  var int    _zCVob_groundPoly;
  var int    _zCVob_callback_ai;
  var int    _zCVob_trafo;
  var int    _zCVob_visual;
  var int    _zCVob_visualAlpha;
  var int    _zCVob_m_fVobFarClipZScale;
  var int    _zCVob_m_AniMode;
  var int    _zCVob_m_aniModeStrength;
  var int    _zCVob_m_zBias;
  var int    _zCVob_rigidBody;
  var int    _zCVob_lightColorStat;
  var int    _zCVob_lightColorDyn;
  var int    _zCVob_lightDirectionStat[3];
  var int    _zCVob_vobPresetName;
  var int    _zCVob_eventManager;
  var int    _zCVob_nextOnTimer;
  var int    _zCVob_bitfield[5];
  var int    _zCVob_m_poCollisionObjectClass;
  var int    _zCVob_m_poCollisionObject;
  
// ��� ���� Items
	VAR INT		id								;										// 0x0120 int
	VAR STRING  name,nameID						;										// 0x0124 zSTRING, 0x0138 zSTRING[5] 
	VAR INT		hp,hp_max						;										// 0x014C int, 0x0150 int

	VAR INT     mainflag,flags					;		//	�������� ���� � ������ �����	0x0154 int, 0x0158 int
	VAR INT		weight,value					;										// 0x015C int, 0x0160 int		
															
	// ��� ������								
	VAR INT		damageType						;		//	��� �����
	VAR	INT		damageTotal						;
	VAR INT		damage			[DAM_INDEX_MAX]	;

	// ��� �����
	VAR INT		wear							;
	VAR INT		protection		[PROT_INDEX_MAX];

	// ��� ����
	VAR INT		nutrition						;		//	������������� - ���������� HP-Steigerung

	// ����������� �������� ��� �������������
	VAR INT		cond_atr		[3]				;
	VAR INT		cond_value		[3]				;

	// ��������, ������� �������� Item
	VAR INT		change_atr		[3]				;
	VAR INT		change_value	[3]				;

	// ������� �������
	VAR int 	magic							;		//	������� ������� ��� "���������� ������"
	VAR int 	on_equip						;		//	������� �������, ����� Item ����������.
	VAR int 	on_unequip						;		//	������� �������, ����� Item ���������.
	VAR int 	on_state		[4]				;		//	
															
	// ��������									
	VAR int 	owner							;		//	�������� : ��� ���������
	VAR INT		ownerGuild						;		//	�������� : �������
	VAR INT		disguiseGuild					;		//	������ ������� ��� ������������

	// 3DS-������
	VAR STRING	visual							;

	// ��������� ���� NSC ��� ��������� ��������
	VAR STRING  visual_change					;		//	���� ASC
	VAR STRING  effect;								//	��������� �������

	VAR INT		visual_skin						;
	
	VAR STRING 	scemeName						;
	VAR INT		material						;	
	// VAR STRING	pfx								;		//	PFX ��� ����������� ������
	VAR INT		munition						;		//	��������� ������
															
	var int 	spell							;			
	var int		range							;			
	
	var int		mag_circle						;
	
	VAR STRING	description						;
	VAR STRING	text			[ITM_TEXT_MAX]	;
	VAR INT		count			[ITM_TEXT_MAX]	;
	
	// ����������� � ���������, �����������, ������ ���� �� ����� 0
	var int	    inv_zbias;								//  ��������� ������ ������� ������� �� ��������� (������������� ����� 100=1)
	var	int		inv_rotx;								//  ������� �� ��� x � ��������
	var int 	inv_roty;								//  ������� �� ��� y � ��������
	var int 	inv_rotz;								//  ������� �� ��� z � ��������
	var int 	inv_animate;							//  item ������ �������������� � ���������

	var int amount;							//int ������� ��������� (� �����)
	var int instanz;						//int ������ �������
	var int c_manipulation;					//int ?
	var int last_manipulation;				//zREAL ?
	var int magic_value;					//int ?
	var int effectVob;						//oCVisualFX*
	var int next;							//oCItem* ��������, ��� ����������� �������
};				