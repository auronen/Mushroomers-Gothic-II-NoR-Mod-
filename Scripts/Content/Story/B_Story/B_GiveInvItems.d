/**************************************************************************

  �������� giver ������ taker amount ���� itemInstance. ���������
��������������� �������, ���� ������������ �����.
  ���������� TRUE ���� �������� ��������, FALSE - ���� �� ��������.
  ���� �������� - �� ��, �� �������� ����� ��������, ���� ���� � ���������
�� ��� � ���������.

***************************************************************************/

const int ItemTrans_Max = 11;
var int ItemTrans_items[ItemTrans_Max];
var int ItemTrans_amount[ItemTrans_Max];
var string ItemTrans_text[ItemTrans_Max];
var int ItemTrans_line;
var int ItemTrans_timer;
var int ItemTrans_GoldGiven;

func int C_CanGiveItem(var C_Npc giver,var C_Npc taker, var int itemInstance, var int amount)
{
	// �� ����������
	if ((itemInstance == 0) || (amount <= 0))	{ return FALSE;	};
	if (Npc_IsPlayer(giver) && (Npc_HasItems(giver, itemInstance) < amount))	{ return FALSE;	};
	if (Hlp_GetInstanceID(giver) == Hlp_GetInstanceID(taker))	{ return FALSE;	};
	// � ��������� ������� - ��������
	return TRUE;
};
func string B_BuildItemString(var C_ITEM itm, var int amount)
{
	var string text; text = "";
	// ��� � � ����� ���������� ��������
	if(Hlp_IsItem(itm, ItMi_Gold)) // ������
	{
		ItemTrans_GoldGiven = TRUE;
		if ((amount % 10 == 1) && (amount % 100 != 11)) // ����������� �������� �����
		{
			text = ConcatStrings(IntToString(amount),PRINT_Gold1);	// 1, 21, 101... �������
		}
		else
		{
			text = ConcatStrings(IntToString(amount),PRINT_Gold);		// amount �������
		};
	}
	else // �� ������
	{
		text = itm.description; // �������� ��������
		//���������� ���������� �������� �� name (�����, ������)
		if ((itm.mainflag == ITEM_KAT_DOCS) && (STR_Len(itm.name) < STR_Len(itm.description)))	{
			if (!Hlp_StrCmp(itm.name, STR_Prefix(itm.description, STR_Len(itm.name))))	{
				text = ConcatStrings(" �", text);
				text = ConcatStrings(text, "�");
				text = ConcatStrings(itm.name, text);
			};
		};
		// ���� �������� ��������� ��������� - � ������� ������� �������
		if(amount > 1) 
		{
			text = ConcatStrings(text," (");
			text = ConcatStrings(text,IntToString(amount));
			text = ConcatStrings(text,PRINT_Items);
			text = ConcatStrings(text,")");
		};
	};
	return text;
};

func int _B_ItemsTransaction_Clear()
{
	var int i;	i = 0;
	var int loop;	loop = MEM_StackPos.position;
		MEM_WriteStatArr(ItemTrans_items,i,0);
		MEM_WriteStatArr(ItemTrans_amount,i,0);
		MEM_WriteStatStringArr(ItemTrans_text,i,"");
	i += 1;
	if (i < ItemTrans_Max)	{
		MEM_StackPos.position = loop;
	};
	ItemTrans_GoldGiven = FALSE;
};
func int _B_ItemsTransaction_Timer()
{
	if (ItemTrans_timer == 0)	{
		ItemTrans_line = 0;
	};
	if (ItemTrans_timer >= 0)	{
		ItemTrans_timer -= 1;
	};
};
func int _B_ItemsTransaction_NextLine()
{
	ItemTrans_line += 1;
	if (ItemTrans_line >= ItemTrans_Max)	{
		ItemTrans_line = 0;
	};
};
func void _B_ItemsTransaction_Print(var C_NPC giver, var C_NPC taker, var int yPos_Start,var int time)
{
	ItemTrans_timer = time;
	var int yPos;	yPos = yPos_Start;
	var int xPos;	xPos = -1;
	var string header;
	if (Npc_IsPlayer(giver))	{
		header = PRINT_Addon_gegeben;
	}
	else if (Npc_IsPlayer(taker))	{
		header = PRINT_Addon_erhalten;
	};
	var int i;	i = 0;
	var int j;	j = 0;
	while(i < ItemTrans_Max);
		var string text; text = MEM_ReadStatStringArr(ItemTrans_text, i);
		if (!Hlp_StrCmp(text, ""))	{
			_B_ItemsTransaction_NextLine();
			j += 1;
			if (j == 1)	{
				text = ConcatStrings(header, text);
			};
			AI_PrintScreen(text, xPos, yPos + ItemTrans_line*2, FONT_ScreenSmall, time);
		};
		i += 1;
	end;
	if (ItemTrans_GoldGiven)
	{
		AI_Snd_Play(hero, "Geldbeutel");
	};
};

func int B_ItemsTransaction(var C_Npc giver,var C_Npc taker)
{
	//������������� - ������������� ��������� ����� �� ���������� �������������
	NpcInv_UnpackAllItems(giver);
	NpcInv_UnpackAllItems(taker);
	
	var int given;	given = 0;
	ItemTrans_GoldGiven = FALSE;
	
	var int itemInstance;
	var int amount;
	var string text;
	
	// �������� �������� � ��������� ������ � ���������
	var int i;	i = 0;
	var int loop;	loop = MEM_StackPos.position;
		itemInstance = MEM_ReadStatArr(ItemTrans_items, i);
		amount = MEM_ReadStatArr(ItemTrans_amount, i);
		if (C_CanGiveItem(giver, taker, itemInstance, amount))	{
			Npc_RemoveInvItems(giver, itemInstance, amount);
			//����� ������������ ���������� item!
			CreateInvItems(taker, itemInstance, amount);
			text = B_BuildItemString(item, amount);
			MEM_WriteStatStringArr(ItemTrans_text, i, text);
			given += 1;
			//�� ����� ��������: ��, ������������, ������ � ��������� ��������. ������� NPC �� ������� ��� ���� ��� ����
			if (!(Npc_IsPlayer(taker) || HasFlags(taker.flags,NPC_FLAG_IMMORTAL) || HasFlags(item.flags, ITEM_MISSION) || Hlp_IsItem(item, ItMi_Gold)))	{
				Npc_RemoveInvItems(taker, itemInstance, amount);
			};
		};
	i += 1;
	if (i < ItemTrans_Max)	{
		MEM_StackPos.position = loop;
	};
	
	//������� ����� �� ����� � ����������� ��������
	if (given > 0) 	{
		if (!C_BodyStateContains(giver, BS_SIT))	{
			AI_PlayAni(giver,"T_TRADEITEM");
		};
		if (!InfoManager_HasFinished() && (Npc_IsPlayer(giver) || Npc_IsPlayer(taker)))	{
			//AI_Output(hero,self,"XXX");	//
			AI_WaitTillEnd(self,hero);
			AI_WaitTillEnd(hero,self);
		};
		_B_ItemsTransaction_Print(giver, taker, YPOS_ItemGiven, 2 + given);
	};
	
	
	//������� ��������
	_B_ItemsTransaction_Clear();
	
	if (given > 0) 	{
		return TRUE;
	};
	return FALSE;
};

func int B_GiveInvItems(var C_Npc giver,var C_Npc taker, var int itemInstance, var int amount)
{
	/*������������� - ������������� ��������� ����� �� ���������� �������������
	NpcInv_UnpackAllItems(giver);
	NpcInv_UnpackAllItems(taker);

	// �� ���������� ------------------------------------------------------
	
	// ���� ������ �����
	if (Npc_IsPlayer(giver))
	{
		// � � ���� ��� ������� ���-��
		if(amount > Npc_HasItems(giver,itemInstance))
		{
			return FALSE; // �� ����������
		};
	};
	
	// ���� ������ �� ���� �������� ��� �������� ������ ����
	if ((amount <= 0) || (Hlp_GetInstanceID(giver) == Hlp_GetInstanceID(taker)))
	{
		return TRUE; // ������� �������� ��������
	};
	
	// �������� �������� --------------------------------------------------
	
	Npc_RemoveInvItems(giver, itemInstance, amount);
	//����� ������������ ���������� item!
	CreateInvItems(taker, itemInstance, amount);
	
	// ��������� ----------------------------------------------------------
	
	var string concatText;
	var int posY;
	
	// ��� � � ����� ���������� ��������
	if(itemInstance == ItMi_Gold) // ������
	{
		posY = YPOS_ItemTaken;
		if ((amount % 10 == 1) && (amount % 100 != 11)) // ����������� �������� �����
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_Gold1);	// 1, 21, 101... �������
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_Gold);		// amount �������
		};
		AI_Snd_Play(hero, "Geldbeutel");
	}
	else // �� ������
	{
		posY = YPOS_ItemTaken;
		concatText = item.name; // �������� ��������
		// ���� �������� ��������� ��������� - � ������� ������� �������
		if(amount > 1) 
		{
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,IntToString(amount));
			concatText = ConcatStrings(concatText,PRINT_Items);
			concatText = ConcatStrings(concatText,")");
		};
	};
	
	// ����������� ����������
	if (Npc_IsPlayer(giver)) // ����� ����� 
	{
		concatText = ConcatStrings(PRINT_Addon_gegeben, concatText);
	}
	else  // ����� ������� 
	{
		concatText = ConcatStrings(PRINT_Addon_erhalten, concatText);
	};
	
	// ������� �����
	if (C_NpcIs(hero,giver) || C_NpcIs(hero,taker))	{
		//AI_WaitTillEnd(hero, self);
		//AI_Wait(hero,0.1);
		//AI_Snd_Play(hero,"XXX");
		AI_Output(hero,self,"XXX");	//
		//if (GiveInvItem_Time || (GiveInvItem_Giver != Hlp_GetInstanceID(giver)))
		//{
			if (!C_BodyStateContains(giver, BS_SIT))	{
				AI_PlayAni(giver,"T_TRADEITEM");
			};
		//};
		//AI_PrintS(giver,concatText);
		AI_PrintScreen(concatText,-1,posY + 2 * GiveInvItem_Line,FONT_ScreenSmall,2);
		//GiveInvItem_Giver = Hlp_GetInstanceID(giver);
	};
	
	GiveInvItem_Line += 1;
	if (GiveInvItem_Line > 5)
	{
		GiveInvItem_Line = 0;
	};
	
	//�� ����� ��������: ��, ������������, ������ <= 150. ������� NPC �� ������� ��� ���� ��� ����
	if (!(Npc_IsPlayer(taker) || HasFlags(taker.flags,NPC_FLAG_IMMORTAL) || ((itemInstance == ItMi_Gold) && (amount <= 100)) || HasFlags(item.flags, ITEM_MISSION)))	{
		Npc_RemoveInvItems(taker, itemInstance, amount);
	};
	//*/
	
	
	ItemTrans_items[0] = itemInstance;
	ItemTrans_amount[0] = amount;
	return B_ItemsTransaction(giver, taker);
};

func void B_TradeItems(var C_Npc seller,var C_Npc buyer, var int itemInstance, var int amount, var int price)
{
	if (amount < 0) {
		amount = Npc_HasItems(seller,itemInstance);
	};
	if (B_GiveInvItems(seller, buyer, itemInstance, amount))	{
		B_GiveInvItems(buyer, seller, ItMi_Gold, amount*price);
	};
};


func int B_GiveGold(var C_Npc giver,var C_Npc taker, var int amount)
{
	return B_GiveInvItems(giver, taker, ItMi_Gold, amount);
};


