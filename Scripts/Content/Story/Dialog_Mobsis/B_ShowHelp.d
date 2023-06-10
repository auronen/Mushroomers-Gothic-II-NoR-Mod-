
const string HELP_START_TOPIC = "������ ����";
const string HELP_START_01 = "�� ��������� ������� ���������� ������� ���������, �� �������� ������ ������ ����. ��� ����������� �� ���� � �������, ��������� ����� ������� � ���� ���������. �� ������ ������ ���� �����, ���� �� ������� ������.";
const string HELP_START_02 = "� ���������� ������� ��� ��������� ���������� � ������� �������� �����������. �� ����� ��������� �� ���� ����.";
const string HELP_START_03 = "����� �� ����� �������� ��������� ���������: ���������� ������, ���������� ���������� � ������. ��������� �������� ������ �� ��������� �������, � ���������� �������� �� ����������.";
const string HELP_START_04 = "����������� � ����� �� ������, ����� ������� ���� ����-�����������. �� ������ ��� ��������� ������ � ������ ���� � ���� ������������ ������������ � ����� �������, �� ������������� ������� �� ����������� ��� �� ���������. � ������� ���� ���� ���� ������� ����� ������, � ��� ��� �������� ��� ����� ����� � ������� �����������.";
const string HELP_START_05 = "�������� ��������� ���������� ������������� � ������ �������. ���� ����� �������������� � ����������� �� ����, ����� ������ �� ������������ � ��� �����. ����� ��������� �������� � ������ ��� �������, ����� ��������������� � ��������.";

var int B_ShowHelp_HeroChoice_Once;
func void B_ShowHelp_HeroChoice()
{
	/*
	var int nDocID;
	B_ShowHelp_HeroChoice_Once = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Log_Paper.tga",0);
	Doc_SetFont(nDocID,-1,FONT_ScreenSmall);
	Doc_SetMargins(nDocID,0,40,40,40,40,1);
	Doc_PrintLines(nDocID,0,HELP_START_01);
	Doc_PrintLines(nDocID,0,HELP_START_02);
	Doc_PrintLines(nDocID,0,HELP_START_03);
	Doc_PrintLines(nDocID,0,HELP_START_04);
	Doc_PrintLines(nDocID,0,HELP_START_05);
	Doc_Show(nDocID);
	//*/
	Log_CreateTopic(HELP_START_TOPIC,LOG_MISSION);
	Log_SetTopicStatus(HELP_START_TOPIC,LOG_Running);
	B_LogEntry_DateTime(HELP_START_TOPIC,LOG_Running, HELP_START_01, FALSE);
	Log_AddEntry(HELP_START_TOPIC, HELP_START_02);
	Log_AddEntry(HELP_START_TOPIC, HELP_START_03);
	Log_AddEntry(HELP_START_TOPIC, HELP_START_04);
	Log_AddEntry(HELP_START_TOPIC, HELP_START_05);
	B_ShowHelp_HeroChoice_Once = TRUE;
};

/*
func void B_ShowHelp_Mushrooms()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Log_Paper.tga",0);
	Doc_SetFont(nDocID,-1,FONT_ScreenSmall);
	Doc_SetMargins(nDocID,0,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"                       �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� � ���� ������ - ���� �������� (�� �� ������������) ������ � ���� ����. ����� ��������� ������� ����������� � ������ ���� � ���������� ����� � �� ��������, � ��� ����� �� ����� ��� ���������. ���� ����� � ��������� - ������� ��� ���� �� ����������, ��� �� ������ ���������� �� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� ����� ������ ����������� �� ��������� ������, ���� � ����, �� ������� ������������ ��������� ��������. ������ ����� ����� ������ ��������. ���� � ����������� � ������ ��������� ����������� �����������.");
	Doc_Show(nDocID);
};
//*/


