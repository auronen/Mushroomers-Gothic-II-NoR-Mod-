

const string OPT_TimePerChar_IniSection = "GAME";
const string OPT_TimePerChar_IniName = "gametextAutoScroll";

//UNFINISHED
//�� ��������. ��������� VIEW_TIME_PER_CHAR �� ����� ���� ����� �� ������ �� �������� ���������,
//���� ��� ��������� �������� � �������, �������� ������������ ��������
func void B_SetDialogSpeed()
{
	if (MEM_GothOptSectionExists(OPT_TimePerChar_IniSection) && MEM_GothOptExists(OPT_TimePerChar_IniSection, OPT_TimePerChar_IniName))	{
		var string opt_value;
		opt_value = MEM_GetGothOpt(OPT_TimePerChar_IniSection, OPT_TimePerChar_IniName);
		VIEW_TIME_PER_CHAR = IntToFloat(STR_ToInt(opt_value));
	};
	MEM_Debug(ConcatStrings("VIEW_TIME_PER_CHAR = ",FloatToString(VIEW_TIME_PER_CHAR)));
};
