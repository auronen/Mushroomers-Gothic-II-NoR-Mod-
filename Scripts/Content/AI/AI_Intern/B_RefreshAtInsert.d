/**************************************************************************

						���������� ��� �������

  ������� B_RefreshAtInsert() ��������� ��������� self ��� ��� ������� � ���.
��� ������������� ��������� ���������� �������.
  
  ���������� �������.  
 
***************************************************************************/

// �������� ���������� ������
func void B_GiveProperWeapon(var C_NPC npc)
{
	var int rnd;
	rnd = Hlp_Random(100);
	AI_EquipBestArmor(self);
	// ������
	if(npc.guild == GIL_MIL)		//��������� (�������)
	{
		if (rnd < 5) && (npc.attribute[ATR_STRENGTH] >= Condition_MilSchwert)
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// ������ ����� - 5%
		}
		else if (rnd < 35) && (npc.attribute[ATR_STRENGTH] >= Condition_MiscSword)
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// ������ ��� - 30%
		}
		else if (rnd < 85)
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// �������� ��� ��������� - 50%
		}
		else
		{
			CreateInvItems(npc,ItMw_1h_Vlk_Axe,1);		// ����� - 15%
		};	
	}
	else if(npc.guild == GIL_PAL)		//��������
	{
		if (rnd < 10)
		{
			CreateInvItems(npc,ItMw_1h_Pal_Sword,1); // ��� �������� - 10%
		}
		else if (rnd < 70)
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// ������ ��� - 60%
		}	
		else
		{
			CreateInvItems(npc,ItMw_2H_Sword_M_01,1);	// ������ ��������� - 30%
		};
	}
	else if(npc.guild == GIL_SLD)		// �������� ��� �������� �� ��������
	{
		if (rnd < 5) && (npc.attribute[ATR_STRENGTH] >= Condition_MiscSword)
		{
			CreateInvItems(npc,ItMw_2h_Sld_Sword,1); // ������ ��������� - 5%
		}
		else if (rnd < 10) && (npc.attribute[ATR_STRENGTH] >= Condition_Sld2hAxe)
		{
			CreateInvItems(npc,ItMw_2h_Sld_Axe,1);	// ������ ������ ����� - 5%
		}	
		else if (rnd < 25) && (npc.attribute[ATR_STRENGTH] >= Condition_Sld1hAxt)
		{
			CreateInvItems(npc,ItMw_1h_Sld_Axe,1);	// ������ ����� - 15%
		}	
		else if (rnd < 40) && (npc.attribute[ATR_STRENGTH] >= Condition_Sld1hSchwert)
		{
			CreateInvItems(npc,ItMw_1h_Sld_Sword,1);	// ������ ��� - 15%
		}	
		else if (rnd < 70)
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// ������ ��� - 30%
		}	
		else
		{
			CreateInvItems(npc,ItMw_1h_MISC_Sword,1);	// ������� ����� - 30%
		};
	}
	else if((npc.guild == GIL_BAU) || (npc.guild == GIL_BAU2))		// �����������
	{
		if (rnd < 50)
		{
			CreateInvItems(npc,ItMw_1h_Bau_Mace,1);	// ������� ����� - 50%
		}
		else
		{
			CreateInvItems(npc,ItMw_1h_Bau_Axe,1);	// ���� - 50%
		};
	}
	else if(npc.guild == GIL_NOV)		//����������
	{
		if (rnd < 60)
		{
			CreateInvItems(npc,ItMw_1h_Bau_Mace,1);	// ������� ����� - 60%
		}
		else
		{
			CreateInvItems(npc,ItMw_1h_Nov_Mace,1);	// ������ ����� - 40%
		};
	}
	else if(npc.guild == GIL_KDF)		//���� ����
	{
		if (rnd < 20)
		{
			CreateInvItems(npc,ItMw_1h_Bau_Mace,1);	// ������� ����� - 20%
		}
		else if (rnd < 70)
		{
			CreateInvItems(npc,ItMw_1h_Nov_Mace,1);	// ������ ����� - 50%
		}
		else
		{
			CreateInvItems(npc,ItMW_Addon_Stab01,1);	// ����� ���� - 30%
		};
	}	
	else // ���� ���������
	{
		// ���� �� ��� � �� ������
		if (!HasFlags(npc.aivar[AIV_Temper], TEMPER_MagicUser) && (npc.guild != GIL_DMT) && (npc.aivar[AIV_Gender] == MALE))
		{
			CreateInvItems(npc,ItMw_1h_Bau_Mace,1); // ������� �����
		};
	};	
};

//������ ������ �������� ����� �� ������� ���� name[0..4]
//���� Index < 0 ��� Index >= 5 - ������ ��������
//Index == 0 �� ������� ���
func void B_SetNameByIndex(var C_NPC slf,var int Index)
{
	if ((Index >= 0) && (Index < 5))	{
		slf.aivar[AIV_NameIndex] = Index;
	};
	//slf.name = MEM_ReadStatStringArr(slf.name,slf.aivar[AIV_NameIndex]);
	//*/
	var oCNpc s;	s = Hlp_GetNpc(slf);
	if (slf.aivar[AIV_NameIndex] == 1)	{	slf.name = s.name_1;	}	else
	if (slf.aivar[AIV_NameIndex] == 2)	{	slf.name = s.name_2;	}	else
	if (slf.aivar[AIV_NameIndex] == 3)	{	slf.name = s.name_3;	}	else
	if (slf.aivar[AIV_NameIndex] == 4)	{	slf.name = s.name_4;	};	
	//*/
};

var int START_DIA_Finished;

func void B_RefreshAtInsert()
{
	B_SetNameByIndex(self,-1);
	//���� ��� ������� � �� ��
	if((self.guild < GIL_SEPERATOR_HUM) && (!Npc_IsPlayer(self)))
	{ 
		//������������ �������� �� ����.
		if (self.attribute[ATR_HITPOINTS] > 0)	{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
		
		/* ������ ������������� ��������� ��������� ������ ������� �� ��������� */
		
		// ���� ������ ��� - ������
		if(Npc_HasEquippedWeapon(self) == FALSE)
		{ 
			B_GiveProperWeapon(self);
		};
		
		//*������ �������� � ������ ����
		if (START_DIA_Finished == FALSE)	{
			if (Npc_CheckInfo(self,1) && (CurrentLevel == NEWWORLD_ZEN) && Hlp_IsValidNpc(hero))
			{
				//START_DIA_Finished = TRUE;
				//Npc_SetTarget(self,hero);
				//AI_StartState(self,ZS_Talk,0,"");
				Npc_SendSinglePerc(hero,self,PERC_ASSESSTALK);
			};
		};
		//*/
	};
	
};