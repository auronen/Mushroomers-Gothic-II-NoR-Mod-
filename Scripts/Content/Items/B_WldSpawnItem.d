// ������� ��� ��������� ������� ������ � ��� (�� FP/WP)


//NS - 11/07/13
// �������� �������� ���� PointTemplate_insPointNum (2 �����)
func string C_GetRandomPointName(var string PointTemplate, var int insPointNum)
{
	var string insPoint;
	if (insPointNum < 10)
	{
		insPoint = ConcatStrings(PointTemplate, "_0");
		insPoint = ConcatStrings(insPoint, IntToString(insPointNum));
	}
	else
	{
		insPoint = ConcatStrings(PointTemplate, "_");
		insPoint = ConcatStrings(insPoint, IntToString(insPointNum));
	};
//	MEM_Debug(insPoint);
	return insPoint;
};

//NS - 11/07/13
// ��������� 1 ������� ItemInst � ��������� FP/WP � ��������� PointTemplate_xx
//  ����  MaxNum >= 100, �� MinNum<=xx<=99
//  ����  MinNum < 0, �� 0<=xx<=MaxNum
//  ����  MaxNum < MinNum, �� ������ �� ���������
//  PointTemplate ������� ���������� � ������� ��������
// ���������� TRUE, ���� ������� ��� ��������
func int B_WldSpawnItem(var int ItemInst, var string PointTemplate, var int MinNum, var int MaxNum)
{
	if (MaxNum < MinNum)	{	return FALSE;	};
	if (MinNum < 0)		{	MinNum = 0;	};
	if (MaxNum > 99)	{	MaxNum = MaxNum % 100;	};
	var int RndNum;
	RndNum = Hlp_Random(MaxNum - MinNum + 1) + MinNum;
	Wld_InsertItem(ItemInst, C_GetRandomPointName(PointTemplate, RndNum));
	return TRUE;
};

//NS - 11/07/13
// ��������� Count ��������� ItemInst � ��������� FP/WP � ��������� PointTemplate_xx
// ���, ����� FP/WP �� �����������
//   ������� �� ��, ��� � � ���������� �������
//   +���� Count < 0, ������ �� ���������
//   +���� Count > MaxNum - MinNum + 1 (�� ������� FP/WP), ��� FP/WP ����� ���������
//  ���������� ����� ������� ����������� ���������
// ���� ������� � Ikarus � ��� ���� (����� ��������), ��� ��������
	//  ��������������� ������� - n ��� ���������� ��������� �����
	//  � ���������� ���������� �� ������������ ��������
	func int _RndMin_N(var int min, var int max, var int n)
	{
		var int x_min;	x_min = max;
		var int x;
		//	var string txt;
		//* Ikarus
		//	txt = ConcatStrings("n = ", IntToString(n));
		var int i; i = 0;
		var int loop; loop = MEM_StackPos.position;
		if (i < n) /*while (i < n);*/
		{
			x = Hlp_Random(max - min + 1) + min;
			if (x < x_min)	{	x_min = x;	};
			i += 1;
			MEM_StackPos.position = loop;
		};
		/*end;*/
		/*/ ��������
		if (n <= 1)
		{
			MEM_Debug(ConcatStrings(IntToString(n), " return x"));
			return Hlp_Random(max - min + 1) + min;
		};
		x_min = _RndMin_N(min, max, n - 1);
		x = Hlp_Random(max - min + 1) + min;
		//	txt = ConcatStrings("n = ", IntToString(n));
		//	txt = ConcatStrings(txt, " x = ");
		//	txt = ConcatStrings(txt, IntToString(x));
		if (x < x_min)	{	x_min = x;	};
		//*/
		//MEM_Debug(ConcatStrings(txt, " return x_min"));
		return x_min;
	};
func int B_WldSpawnItems(var int ItemInst, var string PointTemplate, var int MinNum, var int MaxNum, var int Count)
{
	// �������� ������� ������
	if (MaxNum < MinNum)	{	return 0;	};
	if (Count <= 0) 		{	return 0;	};
	if (MinNum < 0)		{	MinNum = 0;	};
	if (MaxNum > 99)	{	MaxNum = MaxNum % 100;	};
	
	// ������� ������� Count - ������ ��������� ��� FP/WP �� �������
	if (Count >= MaxNum - MinNum + 1)
	{
		Wld_InsertItem(ItemInst, C_GetRandomPointName(PointTemplate, MinNum));
		return 1 + B_WldSpawnItems(ItemInst, PointTemplate, MinNum + 1, MaxNum, Count - 1);	
	};
	
	// ����� - ���������� ������ (����������� �� ����) ����� xx
	// � ��������� �� MinNum �� MaxNum - (Count - 1) 
	// ��� �����������, ��� � ��� ��������� ��� (Count - 1) ���� ��� ��������� ���������
	var int RndNum;	RndNum = MinNum;
	//* Ikarus
	var int i; i = Count;
	var int loop; loop = MEM_StackPos.position;
	if (i > 0) /*while (i > 0);*/
	{
		RndNum = _RndMin_N(MinNum, MaxNum - (i - 1), i);
		MinNum = RndNum + 1;
		Wld_InsertItem(ItemInst, C_GetRandomPointName(PointTemplate, RndNum));
		i -= 1;
		MEM_StackPos.position = loop;
	};
	/*end;*/
	return Count;
	/*/ ��������
	//		var string txt;
	//		txt = ConcatStrings("Min = ", IntToString(MinNum));
	//		txt = ConcatStrings(txt, " Max = ");
	//		txt = ConcatStrings(txt, IntToString(MaxNum - (Count - 1)));
	//		MEM_Debug(txt);
	RndNum = _RndMin_N(MinNum, MaxNum - (Count - 1), Count);
	Wld_InsertItem(ItemInst, C_DS_GetRandomPointName(PointTemplate, RndNum));
	// ��������� ������� ��������� (Count - 1) ��������� � ���������� �� ����� ���-��
	return 1 + B_DS_WldSpawnItems(ItemInst, PointTemplate, RndNum + 1, MaxNum, Count - 1);
	//*/
};

