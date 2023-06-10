/**************************************************************************

						�������� ������ �������

  �������� �� slf �������� �� ��, ��� � oth (��) ������ (���������) �������:
TRUE - ��������, FALSE - ���.
  
  �������� �����������: ������������ � �������, ����� ������ ����.
 
***************************************************************************/


func int C_PlayerHasFakeGuild(var C_Npc slf,var C_Npc oth)
{
	//� ���� ���������: ���� ������� �� ������ ��
	return FALSE;
	
	// ���������� ���������� 
	var C_Item itm;		// ������/����� ��
	itm = Npc_GetEquippedArmor(oth);
	
	// ����� �� ��������, ���� --------------------------------------------
	
	// ���� ������� �� �������� ����� ��� ������ �������
	if(HasAnyFlags(slf.aivar[AIV_IgnoreFlags], IGNORE_Armor | IGNORE_FakeGuild))
	{
		return FALSE;
	};
	
	// � ���� �� ��� � ��� �������
	if ((self.npcType == NPCTYPE_FRIEND) || (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return FALSE;
	};
	
	// � �� ������ �����
	if(C_NpcIsGateGuard(self) == TRUE)
	{
		return FALSE;
	};
	
	// � ���� ��� �������
	if(self.guild == GIL_NONE)
	{
		return FALSE;
	};
	
	// �� �� ���� ----------------------------------------------------------
	
	if(Npc_HasEquippedArmor(oth) == FALSE)
	{
		return FALSE;					// �� �������� �� ��� ��������
	}
	
	// �� ���� -------------------------------------------------------------
	
	// ���� �� � ����� �������
	else if(slf.guild == oth.guild || Wld_GetGuildAttitude(slf.guild, oth.guild) == ATT_FRIENDLY)
	{
		// ��������, ����
		/* ����� �� ������������� ������� �� */
		
		// � ���� ��� �������, � �� �� � ������ ����������/�����������/��������
		if((oth.guild == GIL_NONE)
			&& !((Hlp_IsItem(itm,ITAR_Vlk_L) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_Vlk_M) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_Vlk_H) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_Bau_L) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_Bau_M) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)))
		{
			return TRUE;
		}
		// �� ��������� � �� ���� � ����� ���������
		else if((oth.guild == GIL_MIL)
			&& !((Hlp_IsItem(itm,ITAR_Mil_L) == TRUE)
				|| (Hlp_IsItem(itm,ItAr_MIL_M) == TRUE)))
		{
			return TRUE;
		}
		// �� ������� � �� ����� ������ ��������
		else if((oth.guild == GIL_PAL)
			&& !((Hlp_IsItem(itm,ItAr_PAL_M) == TRUE)
				|| (Hlp_IsItem(itm,ItAr_PAl_H) == TRUE)))
		{
			return TRUE;
		}
		// �� ������� � �� ����� ����� �������� ��� ������ �� ������� ��������
		else if((oth.guild == GIL_SLD)
			&& !((Hlp_IsItem(itm,ItAr_Sld_L) == TRUE) 
				|| (Hlp_IsItem(itm,itar_sld_M) == TRUE) 
				|| (Hlp_IsItem(itm,ItAr_Sld_H) == TRUE)
				|| (Hlp_IsItem(itm,ITAR_DJG_Crawler) == TRUE)))
		{
			return TRUE;
		}
		// �� ��������� � �� ����� ������ ����������
		else if((oth.guild == GIL_NOV)
			&& !((Hlp_IsItem(itm,ItAr_NOV_L) == TRUE)))
		{
			return TRUE;
		}
		// �� ��� ���� � �� ����� ������ ���� ����
		else if((oth.guild == GIL_KDF)
			&& !((Hlp_IsItem(itm,ItAr_KDF_L) == TRUE)
				|| (Hlp_IsItem(itm,ItAr_KDF_H) == TRUE)))
		{
			return TRUE;
		}
		
		// ������ ������������� �������
		else
		{
			return FALSE;
		};
	};
	
	// �� � ������ ��������
	return FALSE;					// �� �������� �������� �� ������ ��
};


