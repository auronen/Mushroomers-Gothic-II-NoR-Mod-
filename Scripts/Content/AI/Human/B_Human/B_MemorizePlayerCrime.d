/**************************************************************************

						��������� ������������ ��
  
  B_MemorizePlayerCrime	(slf,	taeter,	crime)
  �������� slf (�) ���������� ������������ crime ���������� taeter.
  
  ������ �� ���������� ������������ ��.
   
***************************************************************************/


func void B_MemorizePlayerCrime(var C_Npc slf,var C_Npc taeter,var int crime)
{
	// �� ���������� ������������, ���� ----------------------------------
	
	// ���������� - �� ��
	if(!Npc_IsPlayer(taeter))
	{
		return;
	};
	// ���������� = �� -----v
	
	// � ������
	if(slf.guild == GIL_DMT)
	{
		return;
	};
	
	// Mushroomers ---------------------
	//�������� �������� ������� ������ (���� npc ��� �����)
	if (self.aivar[AIV_Timelapse_EndTime] >= Wld_GetFullTime())	{
		return;
	};
	
	// --------------------------------------------------------------------
	
	// ���� ��� ����� ������ ������������, ��� ��, ������� � ����� ������
	/* ��� � ��� �� ����� ������������ ��: B_GetPlayerCrime = CRIME_NONE */
	if(crime > B_GetPlayerCrime(slf))
	{
		// ��������� ������� ��� ����������� ������������ 
		/* ���� ������������ �� ����, �� ������ ������ �� ������� */
		B_DeletePetzCrime(slf);
		// ��������� ������� ��� ������ ������������
		B_AddPetzCrime(slf,crime);
		// ��������� ��� ������������, ���� ��� ���������� � ������� ��������� ��
		slf.aivar[AIV_NpcSawPlayerCommit] = crime;
		slf.aivar[AIV_NpcSawPlayerCommitDay] = Wld_GetDay();
		slf.aivar[AIV_CrimeAbsolutionLevel] = B_GetCurrentAbsolutionLevel(slf);
	};
};

