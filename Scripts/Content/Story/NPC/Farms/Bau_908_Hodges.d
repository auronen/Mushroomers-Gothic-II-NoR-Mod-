
instance BAU_908_Hodges(Npc_Default)
{
	name[1] = "������";
	name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 908;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMw_1h_Bau_Axe,1);
	CreateInvItems(self,ItMw_1h_Vlk_Axe,1);
	CreateInvItems(self,ItMw_1H_Mace_L_04,1);
	CreateInvItems(self,ItMw_1h_Sld_Axe,1);
	CreateInvItems(self,ItMw_1h_Sld_Sword,1);
	CreateInvItems(self,ItMw_Schwert,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_NormalBart01,BodyTex_L,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_908;
	aivar[AIV_TheftDex] = 15;
	CreateInvItems(self, ItMi_Gold, 10);
};


func void Rtn_Start_908()
{
	TA_Stand_Drinking(7,0,19,0,"NW_BIGFARM_PATH_HODGES");
	TA_Sleep(19,0,7,0,"NW_BIGFARM_STABLE_SLEEP_02");
};



