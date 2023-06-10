
// ������ �� ������ slf (�) ��������� oth (��)
func int C_MM_WantToFlee (var C_NPC slf, var C_NPC oth)
{
	// �� ������ -------------------------------------------------------------------
		
	// ���� ������ �������
	if (!Hlp_IsValidNpc(oth) || !Hlp_IsValidNpc(slf))
	{
		/* DEBUG INFO
		PrintSelfVsOther("No enemy. No fright.");
		//*/
		return FALSE; // �� � �� �������
	};
	
	// ���� � ����� -
	if (slf.attribute[ATR_HITPOINTS] == 0)
	{
		/* DEBUG INFO
		PrintSelfVsOther("I'm dead! How can I flee?");
		//*/
		return FALSE; // �� ��� ��� ��� �����
	};
	
	// ���� � � ������� ��
	if (slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		/* DEBUG INFO
		PrintSelfVsOther("I'm with hero! I can't flee");
		//*/
		return FALSE; // ������ �� �����!
	};
	
	// ���� � ������
	if (HasFlags(slf.aivar[AIV_Temper], TEMPER_ToughGuy)) 
	{
		/* DEBUG INFO
		PrintSelfVsOther("Tough guys never flee");
		//*/
		return FALSE; // �� �����
	};
	
	// ���� � ��� ��� ������� ����
	if ((slf.guild > GIL_SEPERATOR_ORC) ||	C_NpcIsEvil(slf)) 
	{
		/* DEBUG INFO
		PrintSelfVsOther("Evil monsters and orcs never flee");
		//*/
		return FALSE; // �� �����
	};
	
	// ���� �� ������
	if (HasFlags(oth.aivar[AIV_Temper], TEMPER_NoFightParker))
	{
		/* DEBUG INFO
		PrintSelfVsOther("He never fights. No reason to flee");
		//*/
		return FALSE; // �� �����
	};
	
	// ������ ----------------------------------------------------------------------
	
	// ���� � ������
	if (HasFlags(slf.aivar[AIV_Temper], TEMPER_NoFightParker))
	{
		/* DEBUG INFO
		PrintSelfVsOther("I never fight, so I'd better flee");
		//*/
		return TRUE; // �����
	};	
	
	// ���� �� �� ���� ��������
	if (C_PredatorFoundPrey(oth, slf))
	{
		/* DEBUG INFO
		PrintSelfVsOther("I'm his prey! Flee only!");
		//*/
		return TRUE; // �����
	};	
	
	// ���� � ������, � � ���� ����� �������
	if ((slf.guild == GIL_GOBBO) && Npc_HasItems(oth,ItPo_MR_AntiGobbo))
	{
		/* DEBUG INFO
		PrintSelfVsOther("Burntea! Run, gobbo, run!");
		//*/
		return TRUE; // �����
	};	

	//� ���������� ����� - �� �������
	if (MR_Opts_MM_Flee == MR_Opts_MM_Flee_Never)
	{
		return FALSE;
	};
	

	//� ���������� ����� - ������ �������
	if (MR_Opts_MM_Flee == MR_Opts_MM_Flee_Always)
	{
		if ((100 * slf.attribute[ATR_HITPOINTS] / slf.attribute[ATR_HITPOINTS_MAX] < 20)
			 || (oth.attribute[ATR_HITPOINTS_MAX] > 10 * slf.attribute[ATR_HITPOINTS_MAX]))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	
	// � ��������� ������� -----v
	
	// �����������, ��� � ��������� � ����� 
	var int p; // � %
	/* DEBUG INFO
	var string txt;
	//*/
	
	//������ �� � �����
	//p = (slf.attribute[ATR_HITPOINTS_MAX] / slf.attribute[ATR_HITPOINTS] - 2) * 2;
	p = (20 - slf.attribute[ATR_HITPOINTS] * 20 / slf.attribute[ATR_HITPOINTS_MAX]);
	/* DEBUG INFO
	txt = IntToString(p);
	PrintSelfVsOther(txt);
	//*/
	
	// ������� � ������� �� ��� ���������
	if (Npc_IsPlayer(oth))	{	//������ ��� ��. NPCvNPC ������ �������� - ???
		p = p + (Npc_GetComrades(oth) - Npc_GetComrades(slf)) * 10;	
	};
	
	/* DEBUG INFO
	txt = ConcatStrings(txt, " + (");
	txt = ConcatStrings(txt, IntToString(Npc_GetComrades(oth)));
	txt = ConcatStrings(txt, "-");
	txt = ConcatStrings(txt, IntToString(Npc_GetComrades(slf)));
	txt = ConcatStrings(txt, " )*10");
	//*/
	
	// ���� �� �����������
	if (oth.attribute[ATR_HITPOINTS_MAX] > 10 * slf.attribute[ATR_HITPOINTS_MAX])
	{
		p = p + 20; // ���� ������� ����
		/* DEBUG INFO
		txt = ConcatStrings(txt, " + 20");
		//*/
	};
	
	// ���� �� ������ �����
	if (oth.attribute[ATR_HITPOINTS] < oth.attribute[ATR_HITPOINTS_MAX] / 10)
	{
		p = p - 20; // ���� ������� ����
		/* DEBUG INFO
		txt = ConcatStrings(txt, " - 20");
		//*/
	};
	
	// ���� � ����
	if (slf.fight_tactic == FAI_MONSTER_COWARD)
	{
		p = p + 10; // ���� ������� ����
		/* DEBUG INFO
		txt = ConcatStrings(txt, " + 10");
		//*/
	};

	// ���� �� ��� (� �-�� ���)
	if (C_NpcIsEvil(oth))
	{
		p = p + 10; // ���� ������� ����
		/* DEBUG INFO
		txt = ConcatStrings(txt, " + 10");
		//*/
	};
	
	/* DEBUG INFO
	txt = ConcatStrings(txt, " = ");
	txt = ConcatStrings(txt, IntToString(p));
	//*/
	
	// ������� � ������� � ���������� ������������
	if (Hlp_Random(100) < p)
	{
		/* DEBUG INFO
		txt = ConcatStrings(txt, "\nI'll better flee...");
		PrintSelfVsOther(txt);
		//*/
		return TRUE;
	};
	
	/* DEBUG INFO
	PrintSelfVsOther(txt);
	//*/
	
	// ����� - �� �����
	return FALSE;
};
