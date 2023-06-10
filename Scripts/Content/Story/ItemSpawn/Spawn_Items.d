
// -----------------------------------------------------------------------
func int B_ReplaseItem(var int OldItem_ptr, var int NewItemInst)
{
	if (!OldItem_ptr)	{return 0;};
	Wld_InsertItem(NewItemInst,"TOT");
	var int NewItem_ptr;	NewItem_ptr = Wld_GetInsertedItem();
	if (!NewItem_ptr)	{	return 0;	};
	MEM_CopyWords(OldItem_ptr+196, NewItem_ptr+196, 16);	//trafo;                     // 0x00C4 zMATRIX4*
	Vob_RemoveFromWorld(OldItem_ptr);
	return NewItem_ptr;
};

// -----------------------------------------------------------------------
func int B_InsertItem_onSP(var int ItemInst, var int SP_Ptr, var int CheckFreeSP)
{
	if (!SP_Ptr)	{return 0;};
	var zCSpawnPoint SP;	SP = _^(SP_Ptr);
	if (CheckFreeSP)	{
		if (!C_CheckItemFreePos(SP.trafoObjToWorld[3],SP.trafoObjToWorld[7],SP.trafoObjToWorld[11]))	{
			return 0;
		};
	};
	//����� ���������
	Wld_InsertItem(ItemInst,SP.name);
	var int itm_ptr;	itm_ptr = Wld_GetInsertedItem();
	if (!itm_ptr)	{	return 0;	};
	var oCItem itm;		itm = _^(itm_ptr);
	MEM_CopyWords(_@(SP.trafoObjToWorld), _@(itm._zCVob_trafoObjToWorld), 16);
	return itm_ptr;
};

// -----------------------------------------------------------------------
//������������� ������� �������� ItemInst �� SP
//intensity - ����������� � % (0..100)
// ���-�� ��������� ��� ������ �� ����� ������������ �������������, ���� �� ������
// ����� ����� math.d
func void Spawn_Items(var int SPptr, var int ItemInst, var int intensity)
{
//	MEM_Debug("Spawn_Item");
	if (!SPptr)	{return;};
	if (intensity <= 0) 	{intensity = Spawn_Intensity_def;};
	//if (intensity > 100) 	{intensity = 100;};
	
	var zCSpawnPoint SP;	SP = _^(SPptr);
	/*MEM_Debug(ConcatStrings("SP.name = ",SP.name));
	MEM_Debug(ConcatStrings("x = ",ToStringf(SP.trafoObjToWorld[3])));
	MEM_Debug(ConcatStrings("y = ",ToStringf(SP.trafoObjToWorld[7])));
	MEM_Debug(ConcatStrings("z = ",ToStringf(SP.trafoObjToWorld[11])));
	MEM_Debug(ConcatStrings("Rmax = ",IntToString(SP.Rmax)));
	MEM_Debug(ConcatStrings("Rmin = ",IntToString(SP.Rmin)));
	MEM_Debug(ConcatStrings("NoPhys = ",IntToString(SP.NoPhys)));*/
	
	
	//������� �������� ������ ������������?
	var int Cnt; Cnt = 1;
	if (SP.Rmax > 0)	{
		if (SP.cnt > 0)	{	// ����. ���-��
			Cnt =  SP.cnt;
		}
		else if (SP.Rmin < SP.Rmax)	{	// ����� ������������ �� ������� ����� ��� ������
			Cnt = 1 + (SP.Rmax - SP.Rmin) / 60;
			if (Hlp_Random(60) < ((SP.Rmax - SP.Rmin) % 60))	{
				Cnt += 1;
			};
		}
		else	{	// ����� ������������ �� ��������� ���������� Rmax
			Cnt = 1 + SP.Rmax / 100;
		};
	};
	
	//MEM_Debug(CS5("Spawn_Items, ", IntToString(Cnt), " on ", SP.name, ""));
	if (Cnt == 0) 	{return;};
	
	var int itm_ptr;
	var int p; var int a;	//zReal	//�������� ���������� ������� ������������ ������
	
	//repeat
	var int loop;	loop = MEM_StackPos.position;
		if (Hlp_Random(100) < intensity)	{	//��������� ������� � �������� ��������������
			itm_ptr = B_InsertItem_onSP(ItemInst, SPptr, SP.NoPhys);
			if (itm_ptr != FALSE)	{
				//itm = _^(itm_ptr);
				if (SP.Rmax > 0)	{	//������������ �� �����/������
					//������������ ������� � �������� �����������
					if (SP.Rmin < SP.Rmax)	{
						p = fracf(Hlp_Random((SP.Rmax - SP.Rmin)*100) + SP.Rmin*100,100);}	//���������� �� ������, 2 ����� ����� ���
					else	{
						p = mkf(SP.Rmax);};
					a = mulf(fracf(Hlp_Random(360), 180), PI);	//���� � ��������
					Vob_MovePolarLocal(itm_ptr, p, a);
					//��� ������� ������������ �� ��������� ���� ������ ��� Y
					Vob_RotateLocalY(itm_ptr, MATH_GradToRad(Hlp_Random(360)));
				};
				if (!SP.NoPhys)	{	//��������� ������, ���� ����
					Vob_ApplyPhysics(itm_ptr);
				};
			};
		};
		Cnt -= 1;
	//until Cnt == 0
	if (Cnt > 0)	{MEM_StackPos.position = loop;};
};

// ---------------------------------------------------------------------

//�������� �� ���� VOB-�� �� ������
//����. ������ SP_Delete_List
func void SP_DeleteVobsFromList()
{
	if (!SP_Delete_List[0])	{	return;};
	var zCListHead LH; LH = _^(_@(SP_Delete_List));
	if (!LH.list)	{	return;	};
	var zCList list;	
//	var C_ITEM itm;
//	var zCVob Vob;
	//repeat
	var int loop;	loop = MEM_StackPos.position;
		list = _^(LH.list);
		if (list.data != 0 && Hlp_Is_oCItem(list.data))	{
			//Vob = _^(list.data);
			//MEM_Debug(ConcatStrings("SP_DeleteVobsFromList: ",Vob._zCObject_objectName));
			Vob_RemoveFromWorld(list.data);
//			itm = _^(list.data);
//			Wld_RemoveItem(itm);
		};
		LH.list = list.next;
		MEM_Free(_@(list));
		LH.len -= 1;
	//until !LH.list
	if (LH.list)	{
		MEM_StackPos.position = loop;
	};
	//LH.list = 0;
	//LH.len = 0;
};

// �������� � ��� ����� �� ������
	//Listptr - ��������� �� ������ ������
	//ItemInst - ���� ���������
	//Intensity - ����� ������� SP � ������� ���������
	//Period - ������ ���� ���������� ������ (� ������� �������)
	//Phase - ������� ����� ����� ��������� ��� ���������
func void _Spawn_ItemsByList(var int Listptr, var int ItemInst, var int Intensity, var int Period, var int Phase)
{
//	MEM_Debug("_Spawn_ItemsByList");
	if (!Listptr)	{return;};
	var zCList SPList; SPList = _^(Listptr);
	var int loop;	loop = MEM_StackPos.position;
	if (SPList.data)	{
		if ((Hlp_Random(Period) < Phase) || (Phase < 0))	{
			Spawn_Items(SPList.data, ItemInst, Intensity);
		};
	};
	if (SPList.next)	{
		SPList = _^(SPList.next);
		MEM_StackPos.position = loop;
	};
};


// ---------------------------------------------------------------------

// ����� �� ������� �� ���� ������� ��� ������ ����
// �������� ��� �������� ����������� � ������ SP_Delete_List
func void SP_CheckDeleteItem_Start(var int ItmPtr)
{
	if (!Hlp_Is_oCItem(ItmPtr))	{return;};
	var oCItem itm;	itm = _^(ItmPtr);
	
	// �������
	if (Hlp_IsItem(itm, ItMi_Addon_Shell_01) || Hlp_IsItem(itm, ItMi_Addon_Shell_02))
	{
		if (Hlp_Random(100) >= 20)	//������������� ��������
		{
			_LH_Add(_@(SP_Delete_List), ItmPtr);
		};
	};
	
	//UNFINISHED ��������
	
};
