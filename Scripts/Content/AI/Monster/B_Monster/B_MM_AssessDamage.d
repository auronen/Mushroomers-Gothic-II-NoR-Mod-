/**************************************************************************

					���������� ����������� ��������

  ������ self (�) ������������ ���� �� other (��).
  
  �������:

  B_MM_AssessDamage() ������������ ���������� PERC_ASSESSDAMAGE � ����������
� ��. �������� ��� ��������.

  ������� �������: ������� �� ������������. ������� ���������������
��������� ����� (��� ����).
  
  �������� �����������: � ������ ������������� ����� ������� � ���������� 
������ ������ ����������� ������. �������� ����� �������, ������� ����.
  �������� �� (����������) �� �������� ��������, ���� �� �� ����. ������� 
�� �������� �������� �� ���� �� ��������-�����.

  �� ����� �������� ������ ������������ �� ������ ���� ������ �����
������� ���������.
  
***************************************************************************/

func void B_MM_AssessDamage()
{
	B_OnDamage();

	// �������� ���� � �����
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);

	// ���������� ��������� �����
	self.aivar[AIV_MM_Behaviour] = self.aivar[AIV_MM_Behaviour] | BEHAV_AttackPriority;
	
	// ������ ���� ---------------------------------------------------------
	
	// ��� ����������� ������ �� ������� ������
	var C_Npc MagGol;
	var C_Item OthWeap;
	// ���� � ���� ���� �����
	if(Npc_HasItems(other,Holy_Hammer_MIS) > 0)
	{
		// � ���� �� �� ��������, � � ���������� �����
		MagGol = Hlp_GetNpc(MagicGolem);
		Npc_GetInvItem(other,Holy_Hammer_MIS);
		OthWeap = Npc_GetReadiedWeapon(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MagGol)) && (Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item)))
		{
			// �������
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-1000);
			return;
		};
	};
	// ���� � �������� ����� � ������� - ��������
	if((self.guild == GIL_Stoneguardian) && (self.aivar[AIV_EnemyOverride] == TRUE))
	{
		b_awake_stoneguardian(self);
	};
	// ---------------------------------------------------------------------
	
	// ���� � ����������� �������
	if(C_MM_WantToFlee(self,other))
	{
		// ��� � �������
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	
	// ���� �� ��, � � � ��� � �������
	if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		// �� �������� �������� �� ��� ���������
		return;
	};
	// ���� � ������, � �� - ������-���
	if((self.aivar[AIV_MM_REAL_ID] == ID_SKELETON) && (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE))
	{
		// ��������� � �������
		return;
	};	
	
	// ���� � �� ���� �������
	if HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_NoDamageReaction)
	{
		return;	// ������ �� ������
	};
	
	// � ������ ������ ------------------------------------------------------
	
	// ���� � ��� � ������ ��������
	if(Npc_IsInState(self,ZS_MM_Attack))
	{

		// ���� �� �� ���, ���� � �������� �� �����
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			// �� ��� ��, ��� ���� ��� �� �����
			if(self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other))
			{
				// ������������� �� ������ �����
				Npc_SetTarget(self,other);
			}
			// ����� - �� ������ ���� � ������ ���
			else
			{
				// ��������� ���
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID(other);
			};
		};
		// ������ ������ � ������ ������ �� ����
		return;
	};
	
	// �� ������ ����� -----------------------------------------------------
	
	// ������� � �����
	Npc_ClearAIQueue(self);
	Npc_SetTarget(self,other);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_Attack,0,"");
};


