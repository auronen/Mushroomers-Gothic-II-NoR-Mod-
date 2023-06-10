
const int Value_FaithfulnessCup = 350;

// ======================================
instance ItMi_Packet_Halvor(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Packet_Halvor;
	description = name;
	text[2] = "����� � �������� ��� �������.";
};
func void Use_Packet_Halvor()
{
	if (Npc_IsPlayer(self))	{
		if (MIS_KhorinisPost == LOG_Running)	{
			PrintInInventory("����� ������ ���� ����� �������.");
			CreateInvItems(self,ItMi_Packet_Halvor,1);
		}
		else {
			B_PlayerFindItem(ItMi_Nugget,3);
			B_PlayerFindItem(ItAt_SharkSkin,1);
			B_PlayerFindItem(ItRi_ValentinosRing,1);
		};
	}
	else	{
		CreateInvItems(self,ItMi_Nugget,3);
		CreateInvItems(self,ItAt_SharkSkin,1);
		CreateInvItems(self,ItRi_ValentinosRing,1);
	};
};

// =============== ����� ����� - ������� �� ����������� ==================

// ======================================
instance ItMi_Vatras_AmulScroll(C_Item)
{
	name = "������ � �����������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	weight = 1;
	value = 0;
	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Vatras_AmulScroll;
	description = "������ � ����������� �������";
	text[1] = "���������� �������� � ����e ������,";
	text[2] = "����� �������� ������ ������.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_Vatras_AmulScroll()
{
	if (Npc_IsPlayer(self))	{
		//����� ������
		if ((Npc_GetDistToWP(self,"NW_LITTLESTONEHENDGE_02") < PERC_DIST_DIALOG)	//������
			|| (Npc_GetDistToWP(self,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_BIGFARM_01") < PERC_DIST_DIALOG)	//�����
			|| (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_04") < PERC_DIST_DIALOG)	//������
			|| (Npc_GetDistToWP(self,"NW_FOREST_PATH_62_ORNA") < PERC_DIST_DIALOG))	//� ����
		{
			//������ �� ������?
			if (!Npc_HasItems(self,ItAm_MR_WispDetector_Uncharged))	{
				PrintInInventory("��� ����� ������, ����� ��� ��������.");
				CreateInvItem(self,ItMi_Vatras_AmulScroll);
			}
			else if (!Npc_HasItems(self,ItMi_Nugget))	{
				PrintInInventory("��� ����� ����� ���������� ����.");
				CreateInvItem(self,ItMi_Vatras_AmulScroll);
			}
			else	{
				//�������!
				Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
				Npc_RemoveInvItem(self, ItAm_MR_WispDetector_Uncharged);
				Npc_RemoveInvItem(self, ItMi_Nugget);
				CreateInvItem(self,ItAm_MR_WispDetector_Charged);
				B_LogEntry(TOPIC_Erol_Plates,TOPIC_Erol_Plates_AmulCharged);
				Wld_InsertNpc(Wisp,"FP_ROAM_NW_TROLLAREA_LAKE_05");
				Wld_InsertNpc(Wisp,"FP_ROAM_NW_FOREST_PATH_63_UP_01");
			};
		}
		else	{
			PrintInInventory("���������� ����� �������� � ����� ������.");
			CreateInvItem(self,ItMi_Vatras_AmulScroll);
		};
	};
};


// =============== ����� ����� - ���������� �������� ==================

// ����� �������� ======================================
prototype Proto_ItMi_FaithfulnessCup(C_Item)
{
	name = "����� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FaithfulnessCup;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "����� ������������� ����������� �������� � ��������.";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItMi_FaithfulnessCup_01(Proto_ItMi_FaithfulnessCup)
{
	text[2] = "��� ������ ����� �� ����.";
};

instance ItMi_FaithfulnessCup_02(Proto_ItMi_FaithfulnessCup)
{
	text[2] = "��� ������ ����� �� ����.";
};

// ���������� ����� ��������� ======================================
instance ItAt_ShadowFur_Dressed(C_Item)
{
	name = "����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_ShadowFur;
	visual = "ItAt_ShadowFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "����� ����������� ��������.";
	text[2] = "�������� ������� �� ������ ������.";
	text[5] = NAME_Value;
	count[5] = value;
};

// ������ � ���������� ======================================
prototype Proto_ItMi_PortraitRings(C_Item)
{
	name = "������ � ����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_FaithfulnessCup;
	visual = "ItMi_Elena_Rings.3DS";
	material = MAT_METAL;
	scemeName = "MAP";
	description = name;
	text[1] = "�� ���������� ������� ����� ������������� �����: ���� � �����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};
instance ItMi_PortraitRings_Empty(Proto_ItMi_PortraitRings)
{
	text[2] = "� ������ ����� �������� �������� ���������.";
	on_state[0] = Use_PortraitRings_Empty;
};
func void Use_PortraitRings_Empty()
{
	if (Npc_IsPlayer(self))	{
		var int RingsID;	RingsID = Doc_Create();
		Doc_SetPages(RingsID,1);
		Doc_SetPage(RingsID,0,"ElenaRings_Empty.TGA",1);
		Doc_Show(RingsID);
	};
};

instance ItMi_PortraitRings(Proto_ItMi_PortraitRings)
{
	text[2] = "������ ������.";
	on_state[0] = Use_PortraitRings;
};
func void Use_PortraitRings()
{
	if (Npc_IsPlayer(self))	{
		var int RingsID;	RingsID = Doc_Create();
		Doc_SetPages(RingsID,1);
		Doc_SetPage(RingsID,0,"ElenaRings_Portraits.TGA",1);
		Doc_Show(RingsID);
	};
};
// ������� ======================================
instance ItMi_PortraitOnarMaria(C_Item)
{
	name = "������ �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Elena_Portrait.3DS";
	material = MAT_METAL;
	scemeName = "MAP";
	on_state[0] = Use_PortraitOnarMaria;
	description = "������� ����� � �����";
	text[2] = "�������� � ���������.";
	text[3] = "� ���� ���� �������� ���.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
};
func void Use_PortraitOnarMaria()
{
	if (Npc_IsPlayer(self))	{
		var int RingsID;	RingsID = Doc_Create();
		Doc_SetPages(RingsID,1);
		Doc_SetPage(RingsID,0,"Elena_Portrait.TGA",1);
		Doc_Show(RingsID);
	};
};
// ������� ======================================
instance ItMi_PortraitOnarMariaDouble(C_Item)
{
	name = "��������� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Elena_PortraitsDouble.3DS";
	material = MAT_METAL;
	scemeName = "MAPSEALED";
	on_state[0] = Use_PortraitOnarMariaDouble;
	description = "�������� ����� � �����";
	text[2] = "�������� ����� �������� � ���� �����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
};
func void Use_PortraitOnarMariaDouble()
{
	if (Npc_IsPlayer(self))	{
		if (Npc_HasItems(self,ItMi_PortraitRings_Empty))	{
			Npc_RemoveInvItem(self,ItMi_PortraitRings_Empty);
			CreateInvItem(self,ItMi_PortraitRings);
			B_LogEntry_Elena_PresentGot(TOPIC_Elena_Present_PortretsInserted);
			B_GivePlayerXP(XP_Elena_PortretsInserted);
			Use_PortraitRings();
		}
		else	{
			var int RingsID;	RingsID = Doc_Create();
			Doc_SetPages(RingsID,1);
			Doc_SetPage(RingsID,0,"Elena_PortraitsDouble.TGA",1);
			Doc_Show(RingsID);
			CreateInvItem(self,ItMi_PortraitOnarMariaDouble);
		};
	};
};

// ��������� ����� ======================================
instance ItMi_AntismokingPotion(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItPo_Mana_01.3ds";
	material = MAT_GLAS;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = "��������� �����";
	text[1] = "��� ����� ������ ������ ����";
	text[2] = "�������� ���� �� ���������.";
	value = 1500;
	text[5] = NAME_Value;
	count[5] = value;
	//inv_zbias = 70;
};
// ����������� ���� ======================================
instance ItMi_BuildUpSalve(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_Salve.3ds";
	material = MAT_GLAS;
	description = "����������� ����";
	text[1] = "��������� ������������.";
	text[2] = "������ ������ ���� �� �����";
	value = 100;
	text[5] = NAME_Value;
	count[5] = value;
};


