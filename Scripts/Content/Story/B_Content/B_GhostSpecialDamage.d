/**************************************************************************

							����� ��������

  ������� slf (�) ��� �������� ���������� oth (��).
  
  ���� �� �� ����������� � �� ��, �� �� ����� ���� �� �����. �� ����� ����
����� ���� ��������������. ��� ������ �������������� �������� ��������� 
�����.
  
***************************************************************************/

func int B_GhostSpecialDamage(var C_Npc oth,var C_Npc slf)
{
	// ���� � �������
	if(HasFlags(slf.flags, NPC_FLAG_GHOST))
	{
		// ����������� � ����� ������
		Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
		// ���� �� �� ���������� - ��� ������� ����
		if(!HasFlags(oth.flags, NPC_FLAG_IMMORTAL))
		{
			// ���� �� �� ��
			if(Npc_IsPlayer(oth))
			{
				// ����� ���� �����
				Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
			}
			// ����� - �� ��
			else
			{
				// ��������� ������� ��������������
				GhostAttackWarn = GhostAttackWarn + 1;
				// ���� �� ������ 3
				if(GhostAttackWarn < 3)
				{
					// ������� �������� �� �����
					oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS] / 2;
				}
				// �����
				else
				{
					// ����� ��
					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS]);
					AI_PlayAni(oth,"T_DEAD");
				};
			};
		};
		return TRUE;
	};
	return FALSE;
};

