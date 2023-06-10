
// ������� NPC

func void B_RemoveNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	// ���� ��������� NPC ����������
	if(Hlp_IsValidNpc(npc))
	{
		// ����� ��� �����
		npc.flags = 0;
		// ����������� ��� � "���������"
		AI_Teleport(npc,"TOT");
		B_StartOtherRoutine(npc,"TOT");
		// ���� �� ��� ��� - �����
		if (!Npc_IsDead(npc))
		{
			Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		};
	};
};

