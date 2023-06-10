/**************************************************************************

							���������� �����

  ������ self (�) ������ ���� other (��).
  
  ������� �������: ���������� � �������.

***************************************************************************/

func void B_MM_AssessBody()
{
	// �� ���� -------------------------------------------------------------
	// ���� � ���
	if(self.guild > GIL_SEPERATOR_ORC)
	{
		return;
	};
	// ���� ��� ������� ������ �� ���������
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	// ���� ��� ���� ������ �������, � �� ������
	if(HasFlags(self.aivar[AIV_MM_Behaviour], BEHAV_AttackPriority))
	{
		return;
	};
	// ���� � ��� �� ��
	if(!C_WantToEat(self,other))
	{
		return;
	};
	// ���� � � ��������� ����� � ��� ���� ������ �� ��� ��� � ����
	if(Npc_IsInState(self,ZS_MM_Attack))
	{
		var C_Npc stoerenfried;
		stoerenfried = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		if((Npc_GetDistToNpc(stoerenfried,self) <= FIGHT_DIST_MONSTER_ATTACKRANGE) 
			|| (Npc_GetDistToNpc(stoerenfried,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE) 
			|| (Npc_GetDistToNpc(stoerenfried,self) < Npc_GetDistToNpc(self,other) / 2))
		{
			return;
		};
	};
	// � ������ ������� -----v
	// �������� ��������� �������� � ������ ����
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_EatBody,0,"");
};

