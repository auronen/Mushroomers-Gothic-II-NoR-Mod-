
//� �������� ������ �������� +
var int Bookstand_Report_Page;

func void Use_Bookstand_Report_Page0(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"letters.tga",0);
	Doc_SetFont(docID,-1,FONT_Handwrite);
	Doc_SetMargins(docID,-1,55,50,55,40,1);
	Doc_PrintLine(docID,0,"                ��������");
	Doc_PrintLine(docID,0,"      � ������� � ������� ��������");
	Doc_PrintLine(docID,0,"        ��������� ������ ��������");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"���� ����� ���� ���� �� ���������� �. � �������������� ������ ��������� ��������� � ���������� ���������� (�������) ���������, ���� �������� ��������� ������� �� ������������ ������� ������ ����� � ���������� �� ������������ ����� �������� ����� (���������� ������ � �������).");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"�������������� ������ � ���� ���������� ������� ��������������� ������������ �� ���� ��������� � ������� �� ����� ������������. �������� ����� ���������� � ������ ������������ �������������, ������������� ���� � ���� ��������� �. � �. ���������� � ������.");
	Doc_SetFont(docID, 0, FONT_ScreenSmall);
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"      ����������: �������, Home, End");
	Doc_Show(docID);
};
func void Use_Bookstand_Report_Page1(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"letters.tga",0);
	Doc_SetFont(docID,-1,FONT_Handwrite);
	Doc_SetMargins(docID,-1,55,70,55,40,1);
	Doc_PrintLines(docID,0,"�������������� ���������� �������� � ����������� �������� �������. ���� ������� �������� � ����� ������������ ����� ��������� ����� � ���� ��� ������ ���� ���������. ��������� �������������� ������� �������������, �� �� ��������� �� ��������� ���������� ������� � ����� �� ������, ��� � ��������� ����� ���������.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"��� �������������� ������� �������������� ����� ��������� ����� ������������ ���������� �������� �. �������� �� ���� ��������� ������ �������� �������� (�������) � �������� ����������������� ������� � ������, � ��������� �. � �. �������� ��� ���� ����������� ��� �������.");
	Doc_Show(docID);
};
func void Use_Bookstand_Report_Page2(var int docID)
{
	Doc_SetPages(docID,1);
	Doc_SetPage(docID,0,"letters.tga",0);
	Doc_SetFont(docID,-1,FONT_Handwrite);
	Doc_SetMargins(docID,-1,55,70,55,40,1);
	Doc_PrintLines(docID,0,"������������� ������� ������������ ������� � ����� �������������� ������� � ��������������� ������. ����� �� �������� ������� � ������ �� ��������, � ���������� ���� ������� ������, ������������� � ������.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"� ���������� ����������� ������� ���������� ��������� ��� ������������� �� ����������.");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLine(docID,0,"");
	Doc_PrintLines(docID,0,"�������� ���������");
	Doc_PrintLines(docID,0,"�����");
	Doc_PrintLines(docID,0,"������");
	Doc_SetFont(docID, 0, FONT_ScreenSmall);
	Doc_Show(docID);
};
func void Bookstand_Report_Print(var int docID, var int page)
{
	if (page == 0)	{	Use_Bookstand_Report_Page0(docID);	}	else
	if (page == 1)	{	Use_Bookstand_Report_Page1(docID);	}	else
	if (page == 2)	{	Use_Bookstand_Report_Page2(docID);	};
	Bookstand_Report_Page = page;
};

func void Use_Bookstand_Report_S1()
{
	if(Npc_IsPlayer(self))
	{
		MultiBook_Start(Bookstand_Report_Page, 3, Bookstand_Report_Print);
		if (!Read_Bookstand_Report_Once)	{
			Read_Bookstand_Report_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand * 3);
		};
	};
};

//================================================================
//�� ����� +
func void Use_Shipbuilding_S1()
{
	if(Npc_IsPlayer(self))
	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
		Doc_SetMargins(nDocID,0,275,40,30,40,1);
		Doc_SetFont(nDocID,0,FONT_ManuscriptHeadline);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"������������");
		Doc_PrintLine(nDocID,0,"* * * * * * * *");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,0,FONT_Manuscript);
		Doc_PrintLines(nDocID,0,"������ ��� ������� �� ������������� �������� �����, �������� �������� ���������� ��� ���������� � ����������� ������, � ����� ��������� � ����������� ���������.");
		Doc_SetMargins(nDocID,-1,30,30,275,30,1);
		Doc_SetFont(nDocID,1,FONT_Manuscript);
		Doc_PrintLines(nDocID,1,"���������� ������� ����� ������ ����, � �������� �������� ������ � ���������. ������, ���� ���� ���������� �� ������ ������ ���������� ������, �������� ��������� ��� ������ ����� ������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��� ���������� ��, ������ � ������� ����� ����� ������ � ����� �� ��������� ���������� ��������� ������ �����, ���������� �� ����� ������ �������. �� ��� �� �������� ������ � �����, ���� ��� ��� �������� � ������ ���.");
		Doc_Show(nDocID);
		if (!Read_Shipbuilding_Once)	{
			Read_Shipbuilding_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};
//================================================================
//� �������� � ������� ������� +
func void Use_CourtCase_S1()
{
	if (Npc_IsPlayer(self))	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetMargins(nDocID,-1,70,60,50,70,1);
		Doc_SetFont(nDocID,0,FONT_Handwrite);
		Doc_PrintLines(nDocID,0,"�������� �����, 36 ��� �� ����, ���������� ���������, ������ �������� �������� ��������, ���������� � ����������� ���������� ����, ����������������� ��� ����������� ��������� ����������. �����, �������� ���������� ��� ���������� ����������, ��������, ������ ������� ��������, �� ������������ �������� ������ �������, ������������ ������� � ��������� �������.");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� ����������� ��������� �������� ����������� ���������� � ���������� �������, ���������� �����������. ����� ��������������� � �������� �����, �������, �������� ������ ���������� ������ ������ II ���������� �� ����������� ������� � �������� ����������...");
		Doc_Show(nDocID);
		if (!Read_CourtCase_Once)	{
			Read_CourtCase_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};

//================================================================
//� ���� ������� +
func void Use_HorsePlague_S1()
{
	if(Npc_IsPlayer(self))
	{
		var int nDocID;
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
		Doc_SetMargins(nDocID,0,275,40,30,40,1);
		Doc_SetFont(nDocID,0,FONT_ManuscriptHeadline);
		Doc_PrintLines(nDocID,0,"������� ����");
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"������� ���� ��������� �� �������� � ��������� ������ I. �� ��� �� ������� ������� ��� ������, ������ � ������� ����� ����. ����� ��� ������������ �� �������, � � ��� ��� ���������� ������ � ����������� ��������� ��������� ������. ������� ������ �� ���� ������� ������ �� ����. �������, ��� ���� ������� ����������� ������ � �����-�� ������� �������� �� �������.");
		Doc_SetMargins(nDocID,-1,30,30,275,30,1);
		Doc_SetFont(nDocID,1,FONT_ManuscriptHeadline);
		Doc_PrintLines(nDocID,1,"������ ���");
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"������ ��� ���������� � ������ ������ ���������� ���� ��� � ��� ��� ��� ��������. ���������� �� ���� ���������� ������� � ������, ����� ����� �� ������ ������� ��������� � ������ � ������� ����������� ���. ��������� ���, ��� ��� �����, ������� ��� ������ ������� �� ������������. ���������, ��� ������ ��� �������� ������. ");
		Doc_Show(nDocID);
		if (!Read_HorsePlague_Once)	{
			Read_HorsePlague_Once = TRUE;
			B_GiveAchievement_Librarian();
			B_GivePlayerXP(XP_Bookstand);
		};
	};
};
