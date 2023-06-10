/**************************************************************************

  ������� �� slf, ��� ��������� �� � ������ ��������� (������ �������): 
TRUE - �������, FALSE - ���.
 
***************************************************************************/


func int C_NpcIsBotheredByPlayerRoomGuild(var C_Npc slf)
{
	// �������, ��������� ����������
	var int portalguild;
	portalguild = C_GetPlayerPortalGuild();

	// �������, ����
	if((portalguild > GIL_NONE) && (portalguild < GIL_SEPERATOR_HUM) // ���������� ������� �����-�� �������
		&& ((slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild,portalguild) == ATT_FRIENDLY))) // � ��� ��� ��� ������������� �������
	{
		return TRUE;
	};
	
	// ����� �� �������
	return FALSE;
};

