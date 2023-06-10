
instance ItWr_Krypta_Garon(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Krypta_Garon;
	scemeName = "MAP";
	description = name;
	text[3] = "���������� ���������� �����.";
};


func void Use_Krypta_Garon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ����� ������. � ������ ������� �������� ������� �� ���� �����.");
	Doc_PrintLines(nDocID,0,"�������, ��� ����������, ��� � ��� �����. �� ���-����� ���� ��� ��� �������� � ������ ������ �����.");
	Doc_PrintLines(nDocID,0,"������ ������� �� �������. ��������� ������� ������� ���������, ������ �� ���� �������� �� ���� ���������.");
	Doc_PrintLines(nDocID,0,"������ � ��� ������ �� ��� ��������������. � �� ���� ������, ��� ����� ������������ ��� ������ ��� ����� ����� ����.");
	Doc_PrintLines(nDocID,0,"� ����� ��� ������ � ���� ������. �� � �� ������, ������� �� ��� �������� � ����� �������. �������, � ���� ��� ������ � �������, ��� ���-������ ������ ��.");
	Doc_PrintLines(nDocID,0,"������. ������� ���� �������� ���������� �� ��������� ���. ������ ����� �� ���������.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"�� ������ ����� ���� ����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                                 ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItMi_PowerEye(C_Item)
{
	name = "���� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

