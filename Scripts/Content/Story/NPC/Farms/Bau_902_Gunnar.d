
instance BAU_902_Gunnar(Npc_Default)
{
	name[1] = "������";
	name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 902;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart03,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_902;
	aivar[AIV_TheftDex] = 45;
	CreateInvItems(self, ItMi_Gold, 70);
};


func void Rtn_Start_902()
{
	TA_Smalltalk(8,0,19,59,"NW_BIGFARM_STABLE_OUT_01"); //BAU_921_Bauer
	TA_Sit_Chair(19,59,8,0,"NW_BIGFARM_STABLE_01");
};

