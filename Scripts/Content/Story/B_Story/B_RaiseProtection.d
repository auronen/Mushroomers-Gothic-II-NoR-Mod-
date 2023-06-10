

// �������� ������ (���������)
// dam - �����
func void B_RaiseProtection(var C_Npc oth, var int dam, var int points)
{
	var string txt; txt = PRINT_RaiseProt;
	var string sep;	sep = PRINT_RaiseProt_To;
	// �� ���� ������?
	if (HasAnyFlags(dam,DAM_BLUNT | DAM_EDGE))	{		// �������� ������
		oth.protection[PROT_BLUNT] += points;
		oth.protection[PROT_EDGE] += points;
		txt = ConcatStrings(txt, sep);
		txt = ConcatStrings(txt, PRINT_RaiseProt_Edge);
		sep = ", ";
	};
	if (HasFlags(dam,DAM_Point))	{		// ������� ������
		oth.protection[PROT_POINT] += points;
		txt = ConcatStrings(txt, sep);
		txt = ConcatStrings(txt, PRINT_RaiseProt_Point);
		sep = ", ";
	};
	if (HasFlags(dam,DAM_MAGIC))	{		// �����
		oth.protection[PROT_MAGIC] += points;
		txt = ConcatStrings(txt, sep);
		txt = ConcatStrings(txt, PRINT_RaiseProt_Magic);
		sep = ", ";
	};
	if (HasFlags(dam,DAM_FIRE))	{		// �����
		oth.protection[PROT_FIRE] += points;
		txt = ConcatStrings(txt, sep);
		txt = ConcatStrings(txt, PRINT_RaiseProt_Fire);
		sep = ", ";
	};
	
	txt = ConcatStrings(txt, " (+");
	txt = ConcatStrings(txt, IntToString(points));
	txt = ConcatStrings(txt, ")");
	AI_PrintScreen(txt,-1,YPOS_RaiseProt, FONT_ScreenSmall, 3);
};

