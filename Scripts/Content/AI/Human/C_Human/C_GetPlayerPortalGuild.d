/***************************************************************************
						��������� ���������

  C_GetPlayerPortalGuild() - � ��������� ����� ������� ��������� �� � ������
������
  C_GetFormerPlayerPortalGuild() - � ��������� ����� ������� ��������� �� ��
�����.
  C_GetNpcPortalGuild(npc) - � ��������� ����� ������� ��������� ������ npc.
  
  ����������:
    GIL_ROOMNONE	- ��������� ��������, �� ������ ��������� �� �����������,
		���� ���������, ����� ����� ����, � ������� ��� �������; �� �� �� ������
	GIL_OUTDOOR		- ������� ��� (�����), ����� ������ ���
	GIL_NONE		- �� ���., � ��������� ����� ���� � �����, � ����� ���������
	GIL_PUBLIC		- ������������ �����, ����� �������, �� ����� ������ ������;
		�� �� ����� �������
	GIL_DUNGEON		- ���������� ����������, �����, ��������� ����; �����������
	GIL_CAVE		- ������������ ������, ��������, ���������
	������			- ��������� ����������� ���������� �������, ������� �
		����� ���� ����� ������ ����� ������� ��� ������������� ��
 
***************************************************************************/

// ����� ������� ����������� ���������, � ������� ��������� ��
func int C_GetPlayerPortalGuild()
{
	// ���� � ��������� ���� ���������� ��������
	var C_NPC owner;
	owner = Wld_GetPlayerPortalOwner();
	if (Hlp_IsValidNpc(owner))
	{
		// ���� �������� ��� ��� ���, � �� ���� �� ��� �������� ��� ���� � ����
		if (!Npc_IsDead(owner) && (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom) || (owner.npcType == NPCTYPE_FRIEND)))
		{
			return GIL_ROOMNONE;		// ��� �����
		};
		// ���� �� ������� ��������� ���������� (�������� ��������� ���� ����� ������ ���������)
		if (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom_Public))
		{
			return GIL_PUBLIC;			// ���������
		};
		// ���� � ��������� ��� �������
		if (owner.guild == GIL_NONE)
		{
			return GIL_ROOMNONE;		// ��� �����
		};
		// ����� ����������� ��� �������
		return owner.guild;	
	};
	
	// ���� ��� ��������� - ����������� �������� 
	//NS: ����� �������� ��������, Wld_GetPlayerPortalGuild ������ ���������� -1
	var int OwnerGuild;
	OwnerGuild = Wld_GetPlayerPortalGuild();
	if (OwnerGuild == GIL_NONE)
	{
		return GIL_OUTDOOR;
	};
	if (OwnerGuild == -1)
	{
		return GIL_ROOMNONE;
	};
	return OwnerGuild;
};


// ����� ������� ����������� ���������, � ������� ��������� ��
func int C_GetFormerPlayerPortalGuild()
{
	var C_NPC owner;
	owner = Wld_GetFormerPlayerPortalOwner();
	if (Hlp_IsValidNpc(owner))
	{
		if (!Npc_IsDead(owner) && (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom) || (owner.npcType == NPCTYPE_FRIEND)))
		{
			return GIL_ROOMNONE;
		};
		if (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom_Public))
		{
			return GIL_PUBLIC;
		};
		if (owner.guild == GIL_NONE)
		{
			return GIL_ROOMNONE;
		};
		return owner.guild;	
	};
	var int OwnerGuild;
	OwnerGuild = Wld_GetFormerPlayerPortalGuild();
	if (OwnerGuild == GIL_NONE)
	{
		return GIL_OUTDOOR;
	};
	if (OwnerGuild == -1)
	{
		return GIL_ROOMNONE;
	};
	return OwnerGuild;
};

// ����� ������� ����������� ���������, � ������� ��������� npc
func int C_GetNpcPortalGuild(var C_NPC npc)
{
	var C_NPC owner;
	owner = Npc_GetPortalOwner(npc);
	if (Hlp_IsValidNpc(owner))
	{
		// ������ ���������� ��������� ������ �� ��!
		if (C_NpcIsHero(npc) && !Npc_IsDead(owner)
			&& (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom) || (owner.npcType == NPCTYPE_FRIEND)))
		{
			return GIL_ROOMNONE;
		};
		if (HasFlags(owner.aivar[AIV_IgnoreFlags], IGNORE_PortalRoom_Public))
		{
			return GIL_PUBLIC;
		};
		if (owner.guild == GIL_NONE)
		{
			return GIL_ROOMNONE;
		};
		return owner.guild;	
	};
	var int OwnerGuild;
	OwnerGuild = Npc_GetPortalGuild(npc);
	if (OwnerGuild == GIL_NONE)
	{
		return GIL_ROOMNONE;
	};
	if (OwnerGuild == -1)
	{
		return GIL_OUTDOOR;
	};
	return OwnerGuild;
};

// ��������� �� �� � ����, ������������� npc
func int C_HeroIsInNpcsRoom(var C_NPC npc)
{
	if (!Hlp_IsValidNpc(npc))	{return FALSE;};
	var C_NPC RoomOwner;	RoomOwner = Wld_GetPlayerPortalOwner();
	if (Hlp_GetInstanceID(RoomOwner) == Hlp_GetInstanceID(npc))	{
		return TRUE;
	};
	return FALSE;
};

//
func string Wld_GetPlayerPortalName()
{
	var oCPortalRoomManager PortalMen;	PortalMen = _^(MEM_Game.portalman);
	return MEM_ReadString(PortalMen.curPlayerPortal);
};
//�������� �� npc ���������� ���������, � ������� ��������� ��
func int C_IsPlayerInNpcRoom(var C_NPC slf)
{
	//���������
	var C_NPC owner;
	owner = Wld_GetPlayerPortalOwner();
	//����?
	if (Hlp_IsValidNpc(owner))	{
		//���������?
		if (C_NpcIs(owner,slf))		{
			return TRUE;		// ��
		};
	};
	return FALSE;
};
