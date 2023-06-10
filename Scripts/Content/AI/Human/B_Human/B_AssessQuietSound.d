/**************************************************************************

						���������� ������ �����
 
  �������� self (�) ������� ���� other (��). ������� ������ �� ��.

  B_AssessQuietSound() ���������� ��� ������ ��������� ���������� 
PERC_ASSESSQUIETSOUND. �������� ��������� ���������� ����� � ���������.

  ������� �������: ������ ������� �� ��.

  �������� �����������: ���� �� �������� � �������, �� ������� �� ��������
�� ���� ��������.

***************************************************************************/


func void B_AssessQuietSound()
{
	// �� �������� ��������, ���� ------------------------------------------
	
	// ��� ������ ���
	if(!Hlp_IsValidNpc(other))
	{
		return;
	};
	
	// �� ������� ������ (��� �����)
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	
	// �� � ���������, �� �� �� ������ ����� (�������� ���������� �� ���������)
	if((C_GetPlayerPortalGuild() != GIL_OUTDOOR) && (Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT))
	{
		return;
	};
	
	// � ����������� �� ���� � ���������
	if(B_AssessEnterRoom())
	{
		return;
	};
	
	//NS - � � ���������, � �� (��) - ���
	if((C_GetPlayerPortalGuild() == GIL_OUTDOOR) && (C_GetNpcPortalGuild(self) != GIL_OUTDOOR))
	{
		return;
	};
	
	// � ������� ������ ��� �������
	if(C_NpcIsGateGuard(self) || HasFlags(self.aivar[AIV_Behaviour], BEHAV_Hidden))
	{
		return;
	};
	
	//���� � ������, �� �� ���� ���
	//if (Npc_IsInState(self,ZS_AimTo))	{
	//	return;
	//};
	if (C_NpcIs(self,OUT_1210_Grimbald) && !self.aivar[AIV_TalkedToPlayer])	{
		AI_StartState(self,ZS_AimTo,1,"");
		return;
	};

	// �� �� ����� � � ���� ��� ������ ��������� ��� ��
	if((C_NpcGetAttitude(self,other) != ATT_HOSTILE) && (Npc_CheckInfo(self,1) == FALSE))
	{
		return;
	};
	
	// � �� ���� �������� �����
	if(Npc_CanSeeSource(self))
	{
		return;
	};
	
	// �� ���� ��������� ������� --------------------------------------------------
	
	// ���������� ������ ��������
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	// ������ ������� �� ��
	AI_StartState(self,ZS_ObservePlayer,1,"");
};

