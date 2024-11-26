
const string Bookstand_01_S1_1 = "��������� �����";
const string Bookstand_01_S1_2 = "���� ��������� ����� ����������� ���� ������� ������ ��������� ������, �� ����� �� �������, ��� �� ����������� ����� ������. ����, ������, �� ������ ��� ������� ����� ������� ����������� � ���� �� ���������� �� ����� �������, �� ������� ������ ��������� ����������� ����� ���������, � �� ���� ��� �� ����� �������� ��� � ����. �� ��������� ������ �� ������ ������ ��������� ������, �� ����� ����� ����������� ����� �����. ";
const string Bookstand_01_S1_3 = "��� ��������� ������ ��������� ���� ������ �������� ���� � �������� ����������. �������������, �� ������ ������ ��� ���������, ������ �� ������� ������ ��� ����� �� ����� ������� ������, ������ ��� ��� ����� ��������� ������� ������ ���� � �������������� � ���������� ����.";
const string Bookstand_01_S1_4 = "������ ���� ������ � ��� ���� � ����.";
const string Bookstand_01_S1_5 = "������ �����";

func void Use_Bookstand_01_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,Bookstand_01_S1_1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,Bookstand_01_S1_2);
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_01_S1_3);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_01_S1_4);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,Bookstand_01_S1_5);
		Doc_Show(nDocID);
	};
};


var int FinalDragonEquipment_Once;

const string FINALDRAGONEQUIPMENT_S1_1 = "... � �������, ��� ���� ����� ������� ���� �� ��������� �������. ������ ��������� ������, ��� �����, ��� �� ������ ���� ����� ��� �������������� �������. ��� �, ���� ��� ������ ��������� ��� ��������� ����� ������ ����, ����� ��� � �����. ��� �������� ������ ���������, ��� � ��� �������� ���������� �������, ����� ������������� � �����. ��� ������ ����� ������ ������ �������� ����� ����������, � ������ ��� ����, ��������� � ���� ������������, ����� ������� ������� � �������� �����.";
const string FINALDRAGONEQUIPMENT_S1_2 = "... � �������� ����������� � ������ ������� ������ ����� ������ ������ ������ ������, ������� �� ������ �����. ������ ������ ��� ���������. � ����������, ��� ��� ���������� ���������� ������ ����������.";
const string FINALDRAGONEQUIPMENT_S1_3 = "� ������� ��������� ���� ������ ��� ������� ���������. ���������� ��������� ����������� � ��� �� ��� ���, ���� �� ��������� ���������.";
const string FINALDRAGONEQUIPMENT_S1_4 = "����� ������, ��������,  ����� ������ ������ ���� � �������� �����. �� ������� ������ ��������� �� � ���� �� ����. � ����� ������ �� �����, � ����������.";
const string FINALDRAGONEQUIPMENT_S1_5 = "����� ������� ���������� �����,  ���������� ������� ���� ������������. ��� ����� ��������� ������ ������ ������ � ��������� ��������� ������ ����. ��� ������ ���� ���� ����� ����������������� � �������.";
const string FINALDRAGONEQUIPMENT_S1_6 = "������ � ������ ������, ��� ����� ������ - ������ ��, ��� �������� ��������� ������������ � ����� ������� ������� '��������� ����'. ��� ��������, ��� ��� ������ ���� ���������, ��� � �����, � ����� ������� �������������� ���� ����������� ������. ";
const string FINALDRAGONEQUIPMENT_S1_7 = "������ ���������� ��������.";
const string FINALDRAGONEQUIPMENT_S1_8 = "����� ������� ������� �� ����� ������� ����������� ��������, ������� ����� ������� �����, ������� � ������ �� ������� �������.";
const string FINALDRAGONEQUIPMENT_S1_9 = "����� ���������� ���, ���������  ���������� ��������, ���� ��� ������ ���� ������� � ��������� �����. 5 ���� ����� ����� ������� ����� ��������������� ������� � ���������.";
const string FINALDRAGONEQUIPMENT_S1_10 = "����������: '�������' �������� ������������� ��������� �������� '�������'.";

func void Use_FINALDRAGONEQUIPMENT_S1()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,FINALDRAGONEQUIPMENT_S1_1);
		Doc_PrintLines(nDocID,0,"");
		if(hero.guild == GIL_KDF)
		{
			//PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE;
			B_LogEntry(TOPIC_TalentRunes,"����������� ��� ���� '������ ������': 1 ������ ����, ������ �� �����");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,FINALDRAGONEQUIPMENT_S1_2);
			Doc_PrintLines(nDocID,1,FINALDRAGONEQUIPMENT_S1_3);
			Doc_PrintLines(nDocID,1,FINALDRAGONEQUIPMENT_S1_4);
			Doc_Show(nDocID);
		}
		else if(hero.guild == GIL_PAL)
		{
			//PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
			PrintScreen(PRINT_LearnPalTeleportSecret,-1,-1,FONT_Screen,2);
			Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry(TOPIC_TalentRunes,"��� �������� ���� ���������� ������������� �����������. ��� ������ ���� ������������ � ������� ������� �����, ����� ������� ���� �� ������ �����.");
			B_LogEntry(TOPIC_TalentRunes,"����������� ��� ���� '��������� ��������': 1 ����� ������");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,FINALDRAGONEQUIPMENT_S1_5);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,FINALDRAGONEQUIPMENT_S1_6);
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
			PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
			PrintScreen(PRINT_LearnSmith,-1,-1,FONT_Screen,2);
			Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
			Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
			B_LogEntry(TOPIC_TalentSmith,"����� �������� ������, ������ ����� ��� ����� ����� �����. � ������ �������� ������� �� � ���� ���������� �����, � ����� ������� ����� �� ����������. ������ ������ �������� ������� ������ ����������, ��������� ������ ������ ��������.");
			B_LogEntry(TOPIC_TalentSmith,"���� � ������� 4 ����� ���� � 5 ������ ��������� �����, � ����� �������� ������ ������ '������ ��������'.");
			B_LogEntry(TOPIC_TalentSmith,"���� � ������� 5 ������ ���� � 5 ������ ��������� �����, � ����� �������� ������� ������ ������ '������ ��������'.");
			//PlayergetsFinalDJGArmor = TRUE;
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,FINALDRAGONEQUIPMENT_S1_7);
			Doc_PrintLines(nDocID,1,FINALDRAGONEQUIPMENT_S1_8);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,FINALDRAGONEQUIPMENT_S1_9);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,FINALDRAGONEQUIPMENT_S1_10);
			Doc_Show(nDocID);
		};
		if(FinalDragonEquipment_Once == FALSE)
		{
//			B_GivePlayerXP(XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};

