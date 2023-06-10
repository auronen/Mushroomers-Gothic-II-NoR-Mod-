
// ������ ������� �� (����� �� ������������ ������)
func void B_Hero_SetTalents()
{
	Log_CreateTopic(TOPIC_Sleep,LOG_NOTE);
	if (C_HeroIs_Odo())	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAlchemy,"����� ������� �����, ��� ����� ������ �������� � ����������� ��� ����� ����� �����������. �� ���� ������������, � ���� ����������� ����� �� ����� ��������, ���� � ���� ������ �������� � ��������� � �������.");
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ����': 2 �������� ������� � 1 ������� �����.");
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� '����� ���������': 1 �������-����� � 1 ������� �����");
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Odo);
	}
	else if (C_HeroIs_Erol())	{
		player_talent_takeanimaltrophy[TROPHY_Teeth] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_BFSting] = TRUE;
		Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"� ����:");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...�������� ����.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...�������� ���� � �������� ���.");
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Erol);
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Orlan);
	}
	else if (C_HeroIs_Till())	{
		player_talent_takeanimaltrophy[TROPHY_BFWing] = TRUE;
		Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"� ����:");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...�������� ������ � �������� ���.");
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Till);
	}
	else if (C_HeroIs_Talbin())	{
		player_talent_takeanimaltrophy[TROPHY_Teeth] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_Claws] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_Fur] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_Heart] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_ShadowHorn] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_ReptileSkin] = TRUE;
		player_talent_takeanimaltrophy[TROPHY_KeilerTusk] = TRUE;
		Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"� ����:");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...������� ����� � �������� � ��������.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...�������� ����.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...������� �����.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...�������� ��� ���������.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...�������� ������ ���������� �������.");
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...��������� ����� ������. ��� ����� ������� ������ ����� ��������� ����������: �������� �� ���, �������� 1,5 ���� � ������ ����, ������� ������� � �������� ������� � ��������� �������� ����� �����.");
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Talbin);
	}
	else if (C_HeroIs_Sarah())	{
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_CityHotel);
	}
	else if (C_HeroIs_Elena())	{
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Elena);
		Hero_Acrobat = TRUE;
	}
	else if (C_HeroIs_Rupert())	{
		Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Rupert);
		Hero_Acrobat = TRUE;
	};
	Log_AddEntry(TOPIC_Sleep,TOPIC_Sleep_Firecamp);
};
