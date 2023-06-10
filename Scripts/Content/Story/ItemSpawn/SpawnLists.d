
// ������ ========================================================================================

//����� ��� ������
class zCSpawnPoint	{
	var string name;	//��� FP
	var int trafoObjToWorld[16];	//�����
	
	var int MainFlag;	//��� SP (� ����� ������ ���������, ��� � ��� ������ (��.����)
	var int flags;	//��� ������ ����������
	
	var int Rmax;	//max ������ �����������, ��
	var int Rmin;	//min ������ �����������, ��
	// ���� Rmax == 0, ����� ���� ����� � ������ � �������������, Rmin ������������
	// ���� Rmin >= Rmax, �� ����������� ���� �� ����� ���������� Rmax
	var int cnt;	//�������, ���� <=0, �� ��������-� �� �������. ��������� �. ���� Rmax > 0
	var int NoPhys;	//�� ��������� ������ ����� ������, =TRUE/FALSE
};

//������ ������
class zCListHead {
	var int list;	//zCList *	//��� ������
	var int len;	//����� ������
};

// ���������� � ��������� ========================================================================

const int zCSpawnPoint_Size = 108;	//=20 + 16*4 + 2*4 + 4 + 3*4
const int zCListHead_Size = 8;


// ������� =======================================================================================

// ��� zCListHead ------------------------------------------------------
//internal
func void _LH_Add(var int LHptr, var int data)	//zCListHead *, T*
{
	if (!LHptr || !data)	{	return;};
	var zCListHead LH; LH = _^(LHptr);
	var zCList list;	list = _^(MEM_Alloc(zCListHead_Size));
	list.data = data;
	list.next = LH.list;
	LH.list = _@(list);
	LH.len += 1;
};
//internal
func void _LH_Clear(var int LHptr, var int DeleteData)	//zCListHead *
{
	if (!LHptr)	{	return;};
	var zCListHead LH; LH = _^(LHptr);
	if (!LH.list)	{	return;};
	var zCList list;	list = _^(LH.list);
	var int loop;	loop = MEM_StackPos.position;
		LH.list = list.next;
		if (DeleteData && (list.data != 0))	{MEM_Free(list.data);};
		MEM_Free(_@(list));
	if (LH.list)
	{
		list = _^(LH.list);
		MEM_StackPos.position = loop;
	};
	LH.list = 0;
	LH.len = 0;
};
//internal
func int _LH_Del(var int LHptr, var int index)	//zCListHead *, int
{
	if (!LHptr || !LH.list || (index < 0))	{	return FALSE;};
	var zCListHead LH; LH = _^(LHptr);
	if (index >= LH.len)	{	return FALSE;};
	var zCList list;	list = _^(LH.list);
	if (index == 0)	{
		LH.list = list.next;
		LH.len -= 1;
		MEM_Free(list.data);
		MEM_Free(_@(list));
		return TRUE;
	};
	var int i;	i = 0;
	var int loop;	loop = MEM_StackPos.position;
	if (i + 1 == index)	{
		var zCList delitem;	delitem = _^(list.next);
		list.next = delitem.next;
		LH.len -= 1;
		MEM_Free(delitem.data);
		MEM_Free(_@(delitem));
		return TRUE;
	};
	//loop
	if (list.next)
	{
		list = _^(list.next);
		MEM_StackPos.position = loop;
	};
	return FALSE;
};

//---------------------------------------------------------------
func int _Spawn_MR_GetListHead(var int SP_MR_Flag)
{
	if (SP_MR_Flag * 2 >= MR_Lists_DoubleLen)	{
//		MEM_Debug(ConcatStrings("_Spawn_MR_GetListStart: Wrong list index = ", IntToString(SP_MR_Flag)));
		return 0;
	};
	return (_@(SP_MR_Lists) + SP_MR_Flag * 8);
};

func int _Spawn_MR_GetListStart(var int SP_MR_Flag)
{
	if (SP_MR_Flag * 2 >= MR_Lists_DoubleLen)	{
//		MEM_Debug(ConcatStrings("_Spawn_MR_GetListStart: Wrong list index = ", IntToString(SP_MR_Flag)));
		return 0;
	};
//	MEM_Debug(ConcatStrings("_Spawn_MR_GetListStart: List index = ", IntToString(SP_MR_Flag)));
	return MEM_ReadStatArr(SP_MR_Lists, SP_MR_Flag * 2);
};

//---------------------------------------------------------------
//������� ����� ������� (�� ������ ����������)
func void SP_ClearAllLists()
{
	var int i;	i = 0;
	var int loop;	loop = MEM_StackPos.position;
	if (i < MR_Count)	{
		_LH_Clear(_@(SP_MR_Lists) + i * 8, TRUE);
		i += 1;
		MEM_StackPos.position = loop;
	};
	_LH_Clear(_@(SP_Delete_List), FALSE);
	_LH_Clear(_@(SP_FOOD_List), TRUE);
};

// ---------------------------------------------------------------------
//����������� ��� SP � ������ ��� ���� ���, ��� �����
func int SP_Analyze(var string SPName, var int trafoObjToWorld_ptr)
{
	var zString zStr; zStr = _^(_@s(SPName));
	if (zStr.len <= SP_pref_len)	{return 0;};
	if (!Hlp_StrCmp(STR_Prefix(SPName,SP_pref_len),SP_pref))	{return 0;};
	
//	MEM_Debug(ConcatStrings("SP_Analyze: ", SPName));
	var zCSpawnPoint NewSP;	NewSp = _^(MEM_Alloc(zCSpawnPoint_Size));	//�������� SP
	NewSP.name = SPName;
	MEM_CopyWords(trafoObjToWorld_ptr, MEM_GetIntAddress(NewSP.trafoObjToWorld), 16);
	NewSP.MainFlag = 0;	NewSP.flags = 0;
	NewSP.Rmax = 0;	NewSP.Rmin = 0;	NewSP.NoPhys = 0;
	
	var int cSep; cSep = STR_GetCharAt("_", 0);
	
	var int currTokStart; currTokStart = zStr.ptr + SP_pref_len;	//������ ������� ���������, ���������� �������
	var int strEnd; strEnd = zStr.ptr + zStr.len;	//����� ������
	var int walker; walker = currTokStart;			//�������
	var string subStr;	subStr = "";				//���������
	var zString zsubStr;	zsubStr = _^(_@s(subStr));
	var int n;	n = 0;		//����� ���������, ������ - ������ ���
	
	var int loop2;	var int i;	var int char;//��� ��������� ������
	//repeat
	var int loop1; loop1 = MEM_StackPos.position;
	
//	MEM_Debug(ConcatStrings(ConcatStrings(IntToString(walker)," < "), IntToString(strEnd)));
	if ((walker == strEnd || MEM_ReadByte(walker) == cSep) && (walker != currTokStart)){
//		MEM_Debug("subStr found");
		//�������� ���������
		subStr = "";
		zsubStr.res = walker - currTokStart;
		zsubStr.ptr = MEM_Alloc(zsubStr.res + 2) + 1;
		zsubStr.len = zsubStr.res;
		MEM_CopyBytes(currTokStart, zsubStr.ptr, zsubStr.len);
		currTokStart = walker + 1;
		n += 1;
//		MEM_Debug(ConcatStrings("subStr = ", subStr));
		// ��������� ���������
		if (zsubStr.len > 1)	{
		if (n == 1)	{	//��� ���
			if (Hlp_StrCmp(Str_Prefix(subStr,SP_MR_pref_len),SP_MR_pref))	{	//����
				NewSP.MainFlag = SP_MR;
				i = 0;
				loop2 = MEM_StackPos.position;
				//while
				if(i < MR_Count)	{
					if (Hlp_StrCmp(subStr,
							ConcatStrings(SP_MR_pref,MEM_ReadStatStringArr(SP_MR_Abbr, i))))	{
						NewSP.flags = i;
						i = MR_Count;
					};
					i += 1;
					MEM_StackPos.position = loop2;
				};
				//end while
			}
			else if (Hlp_StrCmp(subStr,SP_Food_name))	{	//���
				NewSP.MainFlag = SP_FOOD;
			};
		}
		else	//��� �� ���
		{
			//� ��� ��������� �����
			if (NewSP.MainFlag == SP_FOOD)	{
				i = 0;
				loop2 = MEM_StackPos.position;
				//while
				if(i < SP_Food_Flag_Names_Count)	{
					if (Hlp_StrCmp(subStr,MEM_ReadStatStringArr(SP_Food_Flag_Names, i)))	{
						NewSP.flags = NewSP.flags | (1 << i);
					};
					i += 1;
					MEM_StackPos.position = loop2;
				};
				//end while
			};
			//Rmax - ����� ����� ����� ��������
			if (zsubStr.len > Rmax_pref_len)	{
				if (Hlp_StrCmp(STR_Prefix(subStr,Rmax_pref_len),Rmax_pref))	{
					i = Rmax_pref_len; NewSP.Rmax = 0;
					loop2 = MEM_StackPos.position;
					//while
					if (i < zsubStr.len)	{ char = MEM_ReadByte(zsubStr.ptr + i);
					if (char >= 48) && (char <= 57) { // 0..9
						NewSP.Rmax = NewSP.Rmax * 10 + (char - 48); //���������� ��������� �����
						i += 1;
						MEM_StackPos.position = loop2;
					};
					};
					//end while
				};
			};
			//Rmin - ����� ����� ����� ��������
			if (zsubStr.len > Rmin_pref_len)	{
				if (Hlp_StrCmp(STR_Prefix(subStr,Rmin_pref_len),Rmin_pref))	{
					i = Rmin_pref_len; NewSP.Rmin = 0;
					loop2 = MEM_StackPos.position;
					//while
					if (i < zsubStr.len)	{ char = MEM_ReadByte(zsubStr.ptr + i);
					if (char >= 48) && (char <= 57) { // 0..9
						NewSP.Rmin = NewSP.Rmin * 10 + (char - 48); //���������� ��������� �����
						i += 1;
						MEM_StackPos.position = loop2;
					};
					};
					//end while
				};
			};
			//CNT - ����� ����� ����� ��������
			if (zsubStr.len > Cnt_pref_len)	{
				if (Hlp_StrCmp(STR_Prefix(subStr,Cnt_pref_len),Cnt_pref))	{
					i = Cnt_pref_len; NewSP.cnt = 0;
					loop2 = MEM_StackPos.position;
					//while
					if (i < zsubStr.len)	{ char = MEM_ReadByte(zsubStr.ptr + i);
					if (char >= 48) && (char <= 57) { // 0..9
						NewSP.cnt = NewSP.cnt * 10 + (char - 48); //���������� ��������� �����
						i += 1;
						MEM_StackPos.position = loop2;
					};
					};
					//end while
				};
			};
			//NoPhys
			if (Hlp_StrCmp(subStr,NoPhys_name))	{
				NewSP.NoPhys = TRUE;
			};
			// ��������� ��������� - �����, ������ �� ����
		};
		};
	};
	
	walker += 1;
	//until !(walker <= strEnd)
	if (walker <= strEnd) {
		MEM_StackPos.position = loop1;
	};
	
	return _@(NewSP);
};


