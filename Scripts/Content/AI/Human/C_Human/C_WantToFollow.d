

// ����� �� slf (�) ����������� �� oth (��), ���� ��� � ����
func int C_WantToFollowInWater(var C_NPC slf, var C_NPC oth)
{
	// ���� �� ������ ��� ������, � � �� ���� ����� � ����
	if ((C_BodyStateContains(oth,BS_SWIM) || C_BodyStateContains(oth,BS_DIVE))
		&& (!HasFlags(slf.aivar[AIV_MM_Behaviour], BEHAV_FollowInWater)))
	{
		return FALSE; // �� ����
	};
	
	return TRUE;
};