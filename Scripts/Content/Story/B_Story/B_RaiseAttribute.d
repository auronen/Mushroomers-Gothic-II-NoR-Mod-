
func void Print_RaiseAttribute(var string PRINT_LearnString, var int points, var int Y_Pos)
{
	var string concatText; // ���������
	if (points > 0)	{
		concatText = ConcatStrings(PRINT_LearnString,IntToString(points));
		AI_PrintScreen(concatText,XPOS_Left,Y_Pos,FONT_ScreenSmall,4);
	};
};

// ��������� ������� (���������)
func void B_RaiseAttribute(var C_Npc oth,var int attrib,var int points)
{
	// ����� ������� ��������
	if(attrib == ATR_STRENGTH)		// ���� ��� ����
	{
		// ��������� ����, ������� � �������� ��������
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		oth.aivar[REAL_STRENGTH] = oth.aivar[REAL_STRENGTH] + points;
		// ������� ���������
		Print_RaiseAttribute(PRINT_LearnSTR,points,YPOS_RaiseAttr);
	};
	if(attrib == ATR_DEXTERITY)		// ���������� ��� ��������
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
		oth.aivar[REAL_DEXTERITY] = oth.aivar[REAL_DEXTERITY] + points;
		/*if((oth.aivar[REAL_DEXTERITY] >= 90) && (Npc_GetTalentSkill(oth,NPC_TALENT_ACROBAT) == 0))
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
			PrintScreen(PRINT_Addon_AcrobatBonus,-1,55,FONT_Screen,2);
			Hero_Acrobat = TRUE;
		};*/
		Print_RaiseAttribute(PRINT_LearnDEX,points,YPOS_RaiseAttr + 2);
	};
	if(attrib == ATR_MANA_MAX)			// ���������� ��� ����. ����
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA] + points;
		oth.aivar[REAL_MANA_MAX] = oth.aivar[REAL_MANA_MAX] + points;
		Print_RaiseAttribute(PRINT_LearnMANA_MAX,points,YPOS_RaiseAttr + 4);
	};
	if(attrib == ATR_HITPOINTS_MAX)		// ���������� ��� ����. ��������
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		oth.aivar[REAL_HITPOINTS_MAX] = oth.aivar[REAL_HITPOINTS_MAX] + points;
		Print_RaiseAttribute(PRINT_Learnhitpoints_MAX,points,YPOS_RaiseAttr + 6);
	};
};

