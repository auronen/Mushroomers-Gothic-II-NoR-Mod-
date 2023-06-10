const int Value_Ri_Acrobat = 750;
const int Value_HP_Regen = 900;
const int HP_RegenFromMana = 5;

prototype Proto_Ring(C_ITEM)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};
//===========================================
instance ItRi_Acrobat(Proto_Ring)
{
	value = Value_Ri_Acrobat;
	visual = "ItRi_Dex_Strg_01.3ds";
	on_equip = Equip_ItRi_Acrobat;
	on_unequip = UnEquip_ItRi_Acrobat;
	description = "������ ��������";
	text[2] = "�����: ����������.";
	text[3] = "���������� ��������: 30.";
	text[5] = NAME_Value;
	count[5] = value;
};

func void Equip_ItRi_Acrobat()
{
	if (Npc_IsPlayer(self))	{
		if (Hero_Acrobat)	{
			PrintScreen("� � ��� ������ ��� ����.",-1,-1,FONT_Screen,2);
		}
		else if (hero.attribute[ATR_DEXTERITY] < 30)	{
			PrintScreen(PRINT_DEXTERITY_MISSING,-1,-1,FONT_Screen,2);
		}
		else
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,1);
			PrintScreen(PRINT_Addon_AcrobatBonus,-1,-1,FONT_Screen,2);
		};
	};
};

func void UnEquip_ItRi_Acrobat()
{
	if (Npc_IsPlayer(self))	{
		if (!Hero_Acrobat && Npc_GetTalentSkill(self,NPC_TALENT_ACROBAT))	{
			Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,0);
			PrintScreen(PRINT_Addon_AcrobatDebonus,-1,-1,FONT_Screen,2);
		};
	};
};

//===========================================
instance ItRi_HP_Regen(Proto_Ring)
{
	value = Value_HP_Regen;
	visual = "ItRi_Prot_Fire_01.3ds";
	on_equip = Equip_ItRi_HP_Regen;
	on_unequip = UnEquip_ItRi_HP_Regen;
	description = "������ �� ������";
	text[2] = "���������� ��������������� ��������,";
	text[3] = "�������� ����.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Equip_ItRi_HP_Regen()
{
	//self.attribute[ATR_REGENERATEHP] += 1;
	Hero_RegenHPFromMana = TRUE;
};
func void UnEquip_ItRi_HP_Regen()
{
	//self.attribute[ATR_REGENERATEHP] -= 1;
	Hero_RegenHPFromMana = FALSE;
};

func void B_HeroRegenFromMana(var int period)
{
	if (Hero_RegenHPFromMana && period > 0)	{
		// ���� ������ � ���� ����
		if ((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])	&& (hero.attribute[ATR_MANA] > 0))	{
			var int Mana_Cost;	Mana_Cost = period;
			//�� ������ ������� ����
			if (Mana_Cost > hero.attribute[ATR_MANA])	{
				Mana_Cost = hero.attribute[ATR_MANA];
			};
			// HP_RegenFromMana � ������
			var int HP_regen;	HP_regen = HP_RegenFromMana * Mana_Cost;
			//�� ������ ������������ ��������
			if (HP_regen > hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS])	{
				HP_regen = hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS];
				Mana_Cost = (HP_regen + HP_RegenFromMana - 1) / HP_RegenFromMana;
			};
			hero.attribute[ATR_HITPOINTS] += HP_regen;
			hero.attribute[ATR_MANA] -= Mana_Cost;
		};
	};
};
