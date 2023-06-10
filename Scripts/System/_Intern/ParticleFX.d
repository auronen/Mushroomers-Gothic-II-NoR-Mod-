
class C_PARTICLEFX
{
	// ��������� ������ �� ������� ----------------------------------
	// ���-�� ������
	var float	ppsValue;		// ������/���.
	// ��������������� ���-�� ������
	var string	ppsScaleKeys_s;	// ���� �� ppsValue � ������ �������
	// ��������� � �����
	var int		ppsIsLooping;	// =0|1
	// ����������
	var int		ppsIsSmooth;	// =0|1
	// �������� ��������������� ppsScaleKeys_s
	var float	ppsFps;
	// ???
	var string	ppsCreateEm_s;
	var float	ppsCreateEmDelay;
	
	// ���������������� ������������� ������ ------------------------
	// ����� �����������, �� ������� ��������� �������
	var string	shpType_s;		// ="point,line,box,circle,sphere,mesh"
	// ������ �� ��������� ��������� �� ��������� �����������
	var string	shpFor_s;		// ="world,object"
	// ������ �������� ��������� ������� ��������� ��������� ���������
	var string	shpOffsetVec_s;	// ="x y z"
	// ������������� ���������� ������ �� �����������
	var string	shpDistribType_s;	// ="RAND,UNIFORM,WALK"
	// �������� ����������� �� ����������� ��������� ���������
	var float	shpDistribWalkSpeed;
	// ������ �� ������� ��������� �� ���� ������� ����������� (1) ��� ������ �� ���� (0)
	var int		shpIsVolume;	// =0|1
	// ������ ���������� �����������
	var string	shpDim_s;
	// ��� ����� ����������� 
	var string	shpMesh_s;		// ="name.3ds"
	// ������������ �� ��������� ����������� ������ � ����������� ���������
	var int		shpMeshRender_b;	// =0|1
	// ��������������� ����������� �� �������
	var string	shpScaleKeys_s;
	var int		shpScaleIsLooping;
	var int		shpScaleIsSmooth;
	var float	shpScaleFps;
	
	// �������� ������ ----------------------------------------------
	// ����������� ������ �������
	var string	dirMode_s;			// ="NONE,RAND,DIR,TARGET,MESH"
	// � ���� ��������� ���� ������
	var string	dirFor_s;			// ="world,object"
	// dirMode_s = "TARGET"
	var string	dirModeTargetFor_s;	// ="world,object"
	var string	dirModeTargetPos_s;	// ="x y z"
	// dirMode_s = "DIR"
	var float	dirAngleHead;		// [0..359]
	var float	dirAngleHeadVar;	// [0..179]
	var float	dirAngleELev;		// [-90..90]
	var float	dirAngleELevVar;	// [-90..90]
	// ������� �������� � 
	var float	velAvg;
	// ��������� �������� ������ ������
	var float	velVar;
	
	// ����� ����� ������ -------------------------------------------
	// ������� �����
	var float	lspPartAvg;
	// ���������
	var float	lspPartVar;
	
	// ����� ������ -------------------------------------------------
	// ������ ���������� � ������������� ������� ��������� ����
	var string	flyGravity_s;	// ="x y z"
	// ������� ������ ��� ������������
	var int		flyColldet_b;	// =0|1|2|3|4
	// 0 � �������� �� ������������ �� ����������
	// 1 � ���������� ���������
	// 2 � ���������� ���������
	// 3 � ��������� �������� �������
	// 4 � �������� �������
	
	// ������������ ������ ------------------------------------------
	// ��� ����� ������������ ������
	var string	visName_s;			// ="NAME.TGA|.3DS"
	// � ����� ����������� ����� ������������� ��������� ������
	var string	visOrientation_s;	// ="NONE,VELO,VELO3D"
	// ��� �������� ������������ ��������
	var int		visTexIsQuadPoly;
	// �������� �������� ������
	var float	visTexAniFps;
	// ������ �� ��������������� �������� ������ �� ��������� ������
	var int		visTexAniIsLooping;
	// ���� ������, RGB
	var string	visTexColorStart_s;	// =[0..255,0..255,0..255]
	var string	visTexColorEnd_s;	// =[0..255,0..255,0..255]
	// ������ ������
	var string	visSizeStart_s;		// ="x y"
	var float	visSizeEndScale;	// ���� �� visSizeStart_s
	// ����� ������� ������
	var string	visAlphaFunc_s;	// ="NONE,BLEND,ADD,MUL"
	var float	visAlphaStart;	// =[0..255]
	var float	visAlphaEnd;	// =[0..255]
	
	// ������ -------------------------------------------------------
	// ������������ ���������� ������
	var float	trlFadeSpeed;
	var string	trlTexture_s;
	var float	trlWidth;
	// ����� �� ������
	var float	mrkFadeSpeed;
	var string	mrkTexture_s;
	var float	mrkSize;
	// ??? �������� �� �������� ������ �����-���� ������� �������� ��� ������� (��������, �����)
	var string	flockMode;		// ������� "WIND", "ARMOR_XARDAS.asc"
	var float	flockStrength;
	// �������� ���������� ��������� ������ ������� � ����� ���������
	var int		useEmittersFor;
	// ��������� ����������, � ������� PFX �����������
	var string	timeStartEnd_s;		// ="���_������, ���_�����"
	// PFX ����� ���� ����������, �.�. � ��� ������� �������� �������� �������
	var int		m_BisAmbientPfx;	// =0|1
};

