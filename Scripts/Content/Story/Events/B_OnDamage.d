
func void B_OnDamage_Arrows()
{
	//���� �� ���������?
	if (!Npc_HasReadiedRangedWeapon(other) && !Npc_IsPlayer(other))	{	return;	};
	var C_ITEM weapon;	weapon = Npc_GetReadiedWeapon(other);
	if (weapon.munition != 0)	{
		if (Hlp_Random(100) < 50)	{
			CreateInvItem(self, weapon.munition);
		};
	};
};


func void B_OnDamage()
{
	//���� ��� ��������. ����� �������� ����� cast
	if (Npc_IsPlayer(other) && !Npc_IsInFightMode(hero,FMODE_MAGIC))	{
		B_HeroCountUsage();
	};
	//����� �����/������ ����� ������� � �����
	B_OnDamage_Arrows();
};