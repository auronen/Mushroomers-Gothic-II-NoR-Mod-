
func int B_TeachPlayerTalentAlchemy(var C_Npc slf,var C_Npc oth,var int potion)
{
	/* LP �� ������������!
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_ALCHEMY,potion);
	// ���� � ���������� ������������ ����� ��������
	if(C_NotEnoughLP(slf,oth,kosten))
	{
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	//*/
	Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogNote(TOPIC_TalentAlchemy,"����� ������� �����, ��� ����� ������ �������� � ����������� ��� ����� ����� �����������. �� ���� ������������, � ���� ����������� ����� �� ����� ��������, ���� � ���� ������ �������� � ��������� � �������.");
	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '�������� ��������': 2 �������� ����� � 1 ������� �����.");
		PrintScreen(PRINT_LearnAlchemy_Health_01,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '��������� ���������': 2 �������� �������� � 1 ������� �����.");
		PrintScreen(PRINT_LearnAlchemy_Health_02,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '��������� ��������': 2 �������� ����� � 1 ������� �����.");
		PrintScreen(PRINT_LearnAlchemy_Health_03,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '�������� ����': 2 �������� ������� � 1 ������� �����.");
		PrintScreen(PRINT_LearnAlchemy_Mana_01,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '��������� ����': 2 �������� ����� � 1 ������� �����.");
		PrintScreen(PRINT_LearnAlchemy_Mana_02,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '�������� ����': 2 �������� ����� � 1 ������� �����");
		PrintScreen(PRINT_LearnAlchemy_Mana_03,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '����� ���������': 1 �������-����� � 1 ������� �����");
		PrintScreen(PRINT_LearnAlchemy_Speed,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '�������� ����': 1 �������� ������ � 1 ������� ������.");
		PrintScreen(PRINT_LearnAlchemy_Perm_STR,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '�������� ��������': 1 ���������� ����� � 1 ������� ������.");
		PrintScreen(PRINT_LearnAlchemy_Perm_DEX,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '�������� ����': 1 �������� ������ � 1 ������� ������.");
		PrintScreen(PRINT_LearnAlchemy_Perm_Mana,-1,-1,FONT_ScreenSmall,2);
	};
	if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		B_LogNote(TOPIC_TalentAlchemy,"����������� ��� '�������� �����': 1 �������� ������ � 1 ������� ������.");
		PrintScreen(PRINT_LearnAlchemy_Perm_Health,-1,-1,FONT_ScreenSmall,2);
	};
	return TRUE;
};

