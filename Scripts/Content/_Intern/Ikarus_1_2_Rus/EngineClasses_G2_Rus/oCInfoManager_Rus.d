class oCInfoChoice
{
    var string Text    ;   //zSTRING 
    var int Function;      //int     //������ �������    
};

//----------------------------------
//  oCInfo
//----------------------------------

/* ��������!!!

� ������� �� C_NPC � C_ITEM, C_INFO ��������� 
�� �� ����������� ������� ������, � ������ �� ����.
��, ��� ���������� MEM_InstGetOffset, ������������� � C_INFO
���������� �� ����� ��������������� ������ oCInfo, 
� ����� ������������� � ��� C_INFO.
����� �������� oCInfo, ����� ������� 4 + 4 + 20 = 28 ����! */

const int oCInfo_C_INFO_Offset = 28;

class oCInfo {
    //��������: ������ "name" � "told" �������� � ����������!
    
    var int _vtbl;                  //������� �������

    var int next;                   //oCInfo*
    var string name;                //zSTRING

    //��������:
    //struct Tpd {
        var int npc         ;       //int
        var int nr          ;       //int
        var int important   ;       //zBOOL   
        var int conditions  ;       //int   
        var int information ;       //int   
        var string description ;       //zSTRING
        var int trade       ;       //zBOOL   
        var int permanent   ;       //zBOOL   
    //} pd;

    var int told        ;           //zBOOL  //��� ���������� (��, ��� ���������� Npc_KnowsInfo)
    var int _instance   ;           //int    //������ ������� oCInfo � �������.
    
    //�������� ������:
    //zCList< oCInfoChoice > listChoices;
        var int listChoices_data;   //oCInfoChoice*
        var int listChoices_next;   //zCList< oCInfoChoice >*
};

class oCInfoManager {
    var int _vtbl;                  //��������� �� ������� �������                                           
    
    //������ ���� oCInfos. ������������ �� ...? ��� �������� ���� ���������.
    //zCListSort< oCInfo > infoList;    
        var int infoList_compare;   //int (*Compare)(oCInfo *ele1,oCInfo *ele2);
        var int infoList_data;      //oCInfo*
        var int infoList_next;      //zCListSort< oCInfo >*
        
    //������.
    var int p;                      //zCParser*
};

class oCInformationManager 
{
    /*
    typedef
    enum zEInformationManagerMode
    {
        INFO_MGR_MODE_IMPORTANT ,
        INFO_MGR_MODE_INFO      ,
        INFO_MGR_MODE_CHOICE    ,
        INFO_MGR_MODE_TRADE
    }
    zTInfoMgrMode; */

    var string LastMethod           ;  //zSTRING                         
    var int DlgStatus               ;  //zCViewDialogChoice*    //��� View. ��������, ������ ����������� �� ������
    var int DlgTrade                ;  //oCViewDialogTrade*     //��� View. ��������, ������ ����������� �� ������
    var int DlgChoice               ;  //zCViewDialogChoice*    //��� View. ��������, ������ ����������� �� ������
    var int Npc                     ;  //oCNpc*                       
    var int Player                  ;  //oCNpc*                       
    var int Info                    ;  //oCInfo*                         
    var int IsDone                  ;  //zBOOL                //== InfoManager_HasFinished         
    var int IsWaitingForEnd         ;  //zBOOL                         
    var int IsWaitingForScript      ;  //zBOOL                         
    var int IsWaitingForOpen        ;  //zBOOL                         
    var int IsWaitingForClose       ;  //zBOOL                         
    var int IsWaitingForSelection   ;  //zBOOL                         
    var int MustOpen                ;  //zBOOL                         
    var int IndexBye                ;  //int                                
    var int ImportantCurrent        ;  //int                                
    var int ImportantMax            ;  //int                                
    var int Mode                    ;  //zTInfoMgrMode           
};