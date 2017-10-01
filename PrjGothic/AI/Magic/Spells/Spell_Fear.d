
const int SPL_Cost_Fear = 50;
const int SPL_TIME_Fear = 5;

instance Spell_Fear(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_Fear(var int manaInvested)
{
	return Spell_Logic_Proto(SPL_Cost_Fear);
};

func void Spell_Cast_Fear()
{
	AI_SetNpcsToState(self,ZS_MagicFlee,1000);
	Spell_Cast_Proto(SPL_Cost_Fear);
	self.aivar[AIV_SelectSpell] += 1;
};

