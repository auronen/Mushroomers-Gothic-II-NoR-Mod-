
// ����������������, ��� ����������������� �������� ???
func void B_MM_DeSynchronize() //����. - int �� void
{
	// �������� �� �����, ��� �� 1 �������
	var int msec;
	msec = Hlp_Random(1500); 
	AI_Waitms(self,msec);//??? �� ��������
	var float sec;	sec = castFromIntf(fracf(msec,1500));
	AI_Wait(self,sec);
};

