/**************************************************************************

							������� ������
 
  B_SelectWeapon	(slf,	oth)
  �������� slf (�) �������� ������ ��� �������� � oth.
���������� � �������� ZS_x, ��������� �� ���������.
  
  ������ ����� �������, �������� ������� ��� ������� ���� �� ������.
  ����������� �������� ������ ���������� ������ ������ (����� B_SelectSpell).
  ������ �������� ��� �������� �� ������� ���, ������ ���� slf ����� �����
oth. �� ���� � slf ��� ������ �������� ���, �� �� ����� ��������� ���, ��� 
����, ���������� �� ����.
  
***************************************************************************/


func void B_SelectWeapon(var C_Npc slf,var C_Npc oth)
{
	// ���������� �� ������ ������ ------------------------------------------
	
	// ���� �� ������, ������ ��� ������
	if(C_BodyStateContains(slf,BS_FALL)
		|| C_BodyStateContains(slf,BS_SWIM)
		|| C_BodyStateContains(slf,BS_DIVE))
	{
		return;
	};
	
	// ���������� ����� -----------------------------------------------------
		
	// ���� � ������ ���������� ��� ����� //PB: ��� �����, ��������� � ������
	if(B_SelectSpell(slf,oth))
	{
		return;  // ��� ����������� ������, ��������� ������
	};
	
	// ��������� ��� ����� ---------------------------------------------------
	
	// ������� ����� �� ������� ���, ����	
	// ���� � �������� ������ �� �����
	if(Npc_IsInFightMode(slf,FMODE_MAGIC))
	{
		// ������ ������
		B_RemoveWeapon(slf);
		// ������� ������ �������� ���
		AI_ReadyMeleeWeapon(slf);
		return;
	};
	
	// �������� ������� ������ -----------------------------------------------
	
	// �������� ������ �������� ���, ����	
	// � ��� �������� � ������������ �������
	if(Npc_IsInFightMode(slf,FMODE_FAR))
	{
		// � �� ���������� ������ ��� � ���� ��� ������ �������� ���
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER)
			|| !Npc_HasEquippedMeleeWeapon(slf))
		{
			return;
		};
	};
	
	// �������� ������ �������� ���, ����
	// � ��� �������� � ������� �������� ���
	if(Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		// � �� ���������� ������ ��� � ���� ��� ������ �������� ���
		if((Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER)
			|| !Npc_HasEquippedRangedWeapon(slf))
		{
			return;
		};
	};
	
	// ������� ������ ---------------------------------------------------------
	
	// �� ������� ���
	// ���� � ���� ��� ���� � �� ���������� ������
	if(Npc_HasEquippedMeleeWeapon(slf) && (Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER))
	{
		// ���� ����, �������� ������
		B_RemoveWeapon(slf);
		// ������� ������ �������� ���
		AI_ReadyMeleeWeapon(slf);
		return;
	};
		
	// �� ������� ���
	// ���� � ���� ��� ����, � �� ���������� ������, � � ��� ���� �����
	if(Npc_HasEquippedRangedWeapon(slf) && ((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER) || !Npc_HasEquippedMeleeWeapon(slf)) && C_NpcHasAttackReasonToKill(slf))
	{
		//MEM_Debug("B_SelectWeapon Ready Far");
		// ���� ����, �������� ������
		B_RemoveWeapon(slf);
		// ������� ������ �������� ���
		AI_ReadyRangedWeapon(slf);
		return;
	};
	
	// ������� ������ --------------------------------------------------------
	
	// ���� � ��� �� ��������
	if(Npc_IsInFightMode(slf,FMODE_NONE))
	{
		//MEM_Debug("B_SelectWeapon No Fight Yet");
		// ���� � �������� ��� �������� ��� - ������� ���
		if(Npc_HasEquippedRangedWeapon(slf) && ((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER) || !Npc_HasEquippedMeleeWeapon(slf)) && C_NpcHasAttackReasonToKill(slf))
		{
			//MEM_Debug("B_SelectWeapon Ready Far");
			AI_ReadyRangedWeapon(slf);
			return;
		};
		// ���� � �������� ��� �������� ��� - ������ ������ �������� ���
		if(Npc_HasEquippedMeleeWeapon(slf))
		{
			//MEM_Debug("B_SelectWeapon Ready Melee");
			AI_ReadyMeleeWeapon(slf);
			return;
		};
		//MEM_Debug("B_SelectWeapon Ready Fist");
		// ���� ������ ���, ����� ������� �� �������
		AI_ReadyMeleeWeapon(slf);
		return;
	};
};

