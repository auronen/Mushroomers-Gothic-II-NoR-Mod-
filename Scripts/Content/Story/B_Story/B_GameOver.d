/******************************************************************
                            ����� ����
  UNFINISHED: ScoreTable
*******************************************************************/

var int DoExitGame;

// ����� ----------------------------------------
instance PC_GameOver_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_GameOver_End_Condition;
	information = PC_GameOver_End_Info;
	permanent = TRUE;
	description = "��������� ���� (�����)";
};


func int PC_GameOver_End_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_GameOver_Lost) || (PLAYER_MOBSI_PRODUCTION == MOBSI_GameOver_Won))
	{
		return TRUE;
	};
};

func void PC_GameOver_End_Info()
{
	AI_StopProcessInfos(hero);
	Wld_StopEffect("DEMENTOR_FX");
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	DoExitGame = TRUE;
	//����� � �����, ����� ��������
};

//===============================================================

// �� ������� ��������� ����
func void B_GameOver_Lose()
{
		Print_Ext(-1,2,"����� ����.",FONT_Screen,COL_Red,5);
	PC_GameOver_End.npc = Hlp_GetInstanceID(other);
	PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Lost;
	hero.aivar[AIV_INVINCIBLE] = TRUE;
	AI_ProcessInfos(hero);
};

// ��������
func void B_GameOver_Win()
{
		Print_Ext(-1,2,"������!",FONT_Screen,COL_Green,5);
	PC_GameOver_End.npc = Hlp_GetInstanceID(hero);
	PLAYER_MOBSI_PRODUCTION = MOBSI_GameOver_Won;
	hero.aivar[AIV_INVINCIBLE] = TRUE;
	AI_ProcessInfos(hero);
};

