/**************************************************************************

							�������� �������
	
	�������� �����.
	������: 2 ����, 4 �����, ���� ��������, ���� ���������� ��������.
	
	���������: ��������� �������� ������� �����.
  
***************************************************************************/

prototype Mst_Default_DragonSnapper(C_Npc)
{
	name[0] = "�������� �������";
	guild = GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID] = ID_DRAGONSNAPPER;
	level = 40;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_Behaviour] = BEHAV_ThreatenBeforeAttack + BEHAV_FollowInWater + BEHAV_Packhunter;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_DragonSnapper()
{
	Mdl_SetVisual(self,"DragonSnapper.mds");
	Mdl_SetVisualBody(self,"Razor_Demon_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DragonSnapper(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_Teeth,2);
	CreateInvItems(self,ItAt_Claw,4);
	CreateInvItems(self,itat_LurkerSkin,1);
	CreateInvItems(self,ItAt_DrgSnapperHorn,2);
};


