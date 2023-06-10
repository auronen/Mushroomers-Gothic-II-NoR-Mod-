
instance DIA_FireDragon_EXIT(DIA_Proto_End)
{
	npc = PC_FireDragon;
};

//=====================================================
instance DIA_FireDragon_Photo(C_INFO)
{
	npc = PC_FireDragon;		nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_FireDragon_Photo_info;
	important = TRUE;
};

func void DIA_FireDragon_Photo_info()
{
	AI_Output(self,other,"DIA_FireDragon_Photo_1");	 //������!
	AI_Output(self,other,"DIA_FireDragon_Photo_2");	 //� ������� ��������� ���� ����������, ������� ������ �������.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_FireDragon_Photo_3m");	 //��-��, �� ���������, ��� �� �����, ��� � ���� ������.
	}
	else	{
		AI_Output(self,other,"DIA_FireDragon_Photo_3f");	 //��-��, �� ���������, ��� �� ������, ��� � ���� ������.
	};
	AI_Output(self,other,"DIA_FireDragon_Photo_4");	 //� ���� � �������� ����� ������, ���������� ���������� ����������, ���-��. 
	AI_Output(self,other,"DIA_FireDragon_Photo_5");	 //���, �����. �����!
	B_GiveInvItems(self,other,ItWr_HeroPortrait_FromFireDragon,1);
	AI_StopProcessInfos(self);
};