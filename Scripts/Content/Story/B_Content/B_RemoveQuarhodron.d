/**************************************************************************

                            ������������ ��������
  
  �������� ��������, ���� ������ �� �����.
  ���������� � ZS_Ghost.

***************************************************************************/

var int B_RemoveBerny_Once;

// �������� ��������
func void B_RemoveGhost() //����. - int �� void
{
	if(C_NpcIs(self,OUT_1214_OldBerny) && !B_RemoveBerny_Once)
	{
		AI_Teleport(OUT_1214_OldBerny,"TOT");
		B_RemoveNpc(OUT_1214_OldBerny);
		Snd_Play("MFX_GhostVoice");
		Snd_Play("MFX_Firestorm_Cast");
		B_RemoveBerny_Once = TRUE;
	};	
};

