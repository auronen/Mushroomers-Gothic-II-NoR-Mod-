/**************************************************************************

						���������� ������ �������

  �������� self (�) �������, ��� other (��) ������ ������.
  
  B_AssessDrawWeapon()  ���������� TRUE, ���� � ������� � ��������� �������
�� ���������� ������ ZS_ReactToWeapon, ���� ��� - FALSE. ������������ 
���������� PERC_DRAWWEAPON � ���������� � �������� ��� ���������� ��.

  ������� �������: ������� �� ���������� ������.

***************************************************************************/


func int B_AssessDrawWeapon()
{
	//�� �����������, ���� -------------------------------------------------
	// �� �� � ������ �������� (��������� ����� ��� �� ���� ����� ��������)
	if(Npc_IsInFightMode(other,FMODE_NONE))
	{
		return FALSE;
	};
	
	// �� ������
	if ((Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG) || (Npc_GetHeightToNpc(self,other) > PERC_DIST_DIALOG))
	{
		return FALSE;
	};
	
	// ���� �� ������ ���������, ��� �� ������ ������
	if(!C_NpcIsBotheredByWeapon(self,other))
	{
		return FALSE;
	};
	
	// � ��� �����������
	if(Npc_IsInState(self,ZS_ReactToWeapon))
	{
		return FALSE;
	};
	
	// � �������� �� ��� ����� �����
	if(Npc_IsInState(self,ZS_ObservePlayer) && Npc_WasInState(self,ZS_WatchFight))
	{
		return FALSE;
	};
	
	// � ��� �� ������ ����
	if(!Npc_CanSeeNpc(self,other))
	{
		return FALSE;
	};
	
	//�� ���������� ����� ��������
	if(Npc_HasReadiedRangedWeapon(other)
		&& ((Npc_GetDistToWP(other,"NW_CITY_HABOUR_KASERN_SHOOT") < 500) || (Npc_GetDistToWP(other,"NW_CITY_HABOUR_KASERN_17") < 500)))	{
		return FALSE;
	};
	
	//� ��������� ������� ------------------------------------------------
	
	// �������� ������ �������� � ����������
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	// ����������� �� ������ �������
	AI_StartState(self,ZS_ReactToWeapon,0,"");	// ���������� ������������, ��� ����
	return TRUE;
};

