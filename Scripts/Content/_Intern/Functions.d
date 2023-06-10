func void Npc_SetToMad(var C_Npc self,var int seconds)
{
};
func void player_victim_is_immortal()
{
	PrintScreen("Copy Protection Error",-1,-1,FONT_Screen,5);
};
//                              GENERAL 

// ���������, ����������� �� � val ��� ����� flags (���������� �)
func int HasFlags(var int val,	var int flags)
{
	if ((val & flags) == flags)
	{ 
		return TRUE;
	};
	return FALSE;
};

// ���������, ���������� �� � val ���� �� ���� ���� �� flags (���������� ���)
func int HasAnyFlags(var int val,	var int flags)
{
	if ((val & flags) != 0)
	{ 
		return TRUE;
	};
	return FALSE;
};

// ���������� ������ �����
func int abs(var int val)
{
	if (val < 0)
	{ 
		return -val;
	};
	return val;
};

// ������� � ����������� x/d
func int div_round(var int x, var int d)
{
	var int Result; Result = x / d;
	if (d / 2 < x % d)	{
		return Result + 1;
	};
	return Result;
};

func string PriceToString(var int value, var int Brackets)
{
	var string Result;
	Result = IntToString(value);
	Result = ConcatStrings(Result, " ���.");
	if (Brackets == TRUE)
	{
		Result = ConcatStrings("(", Result);
		Result = ConcatStrings(Result, ")");
	};
	return Result;
};

func string CS3(var string str1, var string str2, var string str3)
{
	var string Result;
	Result = ConcatStrings(str1, str2);
	Result = ConcatStrings(Result, str3);
	return Result;
};

func string CS5(var string str1, var string str2, var string str3, var string str4, var string str5)
{
	var string Result;
	Result = ConcatStrings(str1, str2);
	Result = ConcatStrings(Result, str3);
	Result = ConcatStrings(Result, str4);
	Result = ConcatStrings(Result, str5);
	return Result;
};

func string B_BuildStrShulden(var int sum)
{
	var string str;
	str = ConcatStrings("��������� ����� (",InttoString(sum));
	str = ConcatStrings(str," ���.)");
	return str;
};
func string C_BuildPriceString(var string str, var int sum)
{
	str = ConcatStrings(str,PriceToString(sum, TRUE));
	return str;
};

// ��������� ��������������� ����� (�������� ������������ �����)
//NS: � ������� �� ����������� �� ����� �������� ���� � �� �� �������� � ����� ����, �.�. ��������� �� ��������� ��� ��������� ������������
// �� ���� ����� ������� ������������������ ��������, ����� ���������� � ���������
// "��������" ������������ � ������ ������ ����� � ��� ������ ����� � ������ ���
var int Random_Seed;

// ����. ����� ��������� ������������������
func int _C_Random_Next(var int Value)
{
	var int New_Value;
	// ���� �������� �� ������ - ����� ��������� �����, �� ����� 16 ��� ������
	if (Value <= 0)
	{
		Value = Hlp_Random(1 << 15) + 1;
	};
	// ��������� ����� ��������� ����� (����� ������� 16 ���)
	New_Value = ((Value * 16807 + 5) & 16776960) >> 8;
	return New_Value;
};

// Max_Value �� ������ ��������� 2^16
func int C_Random(var int Max_Value)
{
	//����� �����
	Random_Seed = _C_Random_Next(Random_Seed);
	// ������ ��� �������������
	if (Max_Value <= 0)
	{
		return 0;
	};
	// ������� � ������ ���������
	return Random_Seed % Max_Value;
};

//========================================

func void B_RemoveEquipped(var C_Npc slf)
// ������� ��� ������������� ������ (Npc_ClearInventory �� �������)
{
	var C_ITEM weapon;
	var int weaponInst;
	if (Npc_HasEquippedMeleeWeapon(slf))	{
		weapon = Npc_GetEquippedMeleeWeapon(slf);
		weaponInst = Hlp_GetInstanceID(weapon);
		Npc_RemoveInvItem(slf,weaponInst);	
	};
	if (Npc_HasEquippedRangedWeapon(slf))	{
		weapon = Npc_GetEquippedRangedWeapon(slf);
		weaponInst = Hlp_GetInstanceID(weapon);
		Npc_RemoveInvItem(slf,weaponInst);	
	};
};

// =======================================================================
	
func int GetHour_Rec(var int h)
{
	if (h <= 0)
	{
		return 0;
	};
	if (Wld_IsTime(h, 0, 0, 0))
	{
		return h;
	};
	var int h0;
	h0 = GetHour_Rec(h - 1);
	return h0;
};	
	
func int C_GetHour()
{
	return GetHour_Rec(23);
};
	
func int GetMinute_Rec(var int h, var int m)
{
	if (m <= 0)
	{
		return 0;
	}
	else if (Wld_IsTime(h, m, 0, 0))
	{
		return m;
	};
	var int m0;
	m0 = GetMinute_Rec(h, m - 1);
	return m0;
};
	
func int C_GetMinute()
{
	var int h;
	h = C_GetHour();
	return GetMinute_Rec(h, 59);
};

func int C_GetMinutesFromStart()
{
	var int h;
	h = C_GetHour();
	return (Wld_GetDay() * 24 + h) * 60 + GetMinute_Rec(h, 59);
};

//����������� ���, ������ ������� ��� h
func int Wld_GetDay_Shifted(var int h)
{
	var int day;	day = Wld_GetDay();
	if (Wld_IsTime(0,0,h,0))	{
		day -= 1;
	};
	return day;
};

//��������� �������: h1:m1 ������ (������) ��� h2:m2?
func int C_TimeLesser(var int h1, var int m1, var int h2, var int m2)
{
	if ((h1 < h2) || ((h1 == h2) && (m1 < m2)))	{
		return TRUE;
	};
	return FALSE;
};

// ------------------------------------------------------------------

// ��������� ����
func void B_SetTime(var int h, var int m)
{
	//����� - ��������� ��� ������������ �������
	var C_NPC slf; slf = Hlp_GetNpc(self);
	var C_NPC oth; oth = Hlp_GetNpc(other);
	// ���� ������, ��� �� ����� - �� ��� ��������
	if(h >= 24)
	{
		Wld_SetTime(h, m);
	}
	// ���� ������ ����� - ���������, �� ����� ��� ��������� �� ������
	else if(Wld_IsTime(0,0,h,m))
	{
		Wld_SetTime(h, m);
	}
	else
	{
		Wld_SetTime(h + 24, m);
	};
	self = Hlp_GetNpc(slf);
	other = Hlp_GetNpc(oth);
};

// ��������� ���� �� ��������� ����� � �����
func void B_SetTimePlus(var int h, var int m)
{
	var int h_target;
	var int m_target;
	// ������� ����� �����
	m_target = m + C_GetMinute();
	// ������� ����� �����, ��������, ��� ����� ����� ����� ������ 60
	h_target = h + C_GetHour() + m_target / 60;
	// �������� ������
	m_target = m_target % 60;
	// ���������� �����
	B_SetTime(h_target, m_target);
};

//====================================================
func void B_InsertNpc(var int npc, var string WP)
{
	var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
	Wld_InsertNpc(npc,WP);
	self = Hlp_GetNpc(self_bkup);
};

//====================================================
func int C_NpcHasGold(var C_NPC npc, var int amount)
{
	if (Npc_HasItems(npc, ItMi_Gold) >= amount)	{
		return TRUE;
	};
	return FALSE;
};

//====================================================
func int C_NpcGetAttitude(var C_NPC slf, var C_NPC oth)
{
	var int Attitude;	Attitude = Npc_GetAttitude(slf,oth);
	if (Attitude > 3)	{
//		MEM_Debug(CS5("Attitude =",IntToString(Attitude),slf.name," other = ",oth.name));
		Attitude = Wld_GetGuildAttitude(slf.guild,oth.guild);
		if (Attitude > 3)	{
//			MEM_Debug(CS5("Wld_Attitude =",IntToString(Attitude),slf.name," other = ",oth.name));
			Attitude = 3;
		};
	};
	return Attitude;
};

//====================================================
func int C_NpcIs(var C_NPC npc, var C_NPC slf)
{
	if (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(slf))	{
		return TRUE;
	};
	return FALSE;
};

