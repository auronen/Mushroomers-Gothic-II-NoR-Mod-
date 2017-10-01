
const int SPL_COST_MasterOfDisaster = 60;
const int SPL_DAMAGE_MasterOfDisaster = 300;

instance Spell_MasterOfDisaster(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_MasterOfDisaster;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_MasterOfDisaster(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_COST_MasterOfDisaster);
};

func void Spell_Cast_MasterOfDisaster()
{
	Spell_Cast_Proto(SPL_COST_MasterOfDisaster);
	self.aivar[AIV_SelectSpell] += 1;
};

