
instance DIA_OUT_OldBerny(C_INFO)
{
	npc = OUT_1214_OldBerny;	nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_OUT_OldBerny_MR_Hello_info;
	important = TRUE;
};
func void DIA_OUT_OldBerny_MR_Hello_info()
{
	MIS_Sarah_OldFriends_BernyMet = TRUE;
	AI_Output(self,other,"DIA_OUT_OldBerny_MR_Hello_13_01");	//���...
		AI_Output(other,self,"DIA_OUT_OldBerny_MR_Hello_16_02");	//�����? �����, ��� ��!
	B_GivePlayerXP(XP_Sarah_MetBerny);
	AI_Output(self,other,"DIA_OUT_OldBerny_MR_Hello_13_03");	//(��� ������) ������� ����? �� ������ ��������� ����?
		AI_Output(other,self,"DIA_OUT_OldBerny_MR_Hello_16_04");	//��, �... ���, �����, ������ ����! (������)
		AI_Output(other,self,"DIA_OUT_OldBerny_MR_Hello_16_05");	//� ��� � �� ������ ���������� � �����. � ��� ��������!
	AI_Output(self,other,"DIA_OUT_OldBerny_MR_Hello_13_06");	//����, ����. �� �����, �������. �� ���� ��� ������, ������ ��� ���� �����.
	AI_Output(self,other,"DIA_OUT_OldBerny_MR_Hello_13_07");	//� ���� ����� ��� ��� �������. �� ������� ��.
	AI_Output(self,other,"DIA_OUT_OldBerny_MR_Hello_13_08");	//��� ���� �������. ������...
	B_StartOtherRoutine(self,"REMOVE");
	B_LogEntry_Sarah_OldFriends(TOPIC_Sarah_OldFriends_BernyPrayBeliar2);
	AI_StopProcessInfos(self);
	B_GiveAchievement_Sarah_GhostWhisper();
};
