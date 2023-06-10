//#################################################################
//
//  ��������� Ini-������: zCOption
//
//#################################################################

/*
    ��� ��� "��������� ��������" ������� ��������, ��� ������������
    ���������� ������ "���������". ���� ������ �� ��� ������,
    ��������� �������� ������ �����������.
    
    �������, ��� ����������� ����� �� ������������.
*/

//************************************
//  zCOptions - ��� ���������
//  ������� � ini-������.
//************************************

const int NUM_ENTRIES = 26;

class zCOption {
    var int _vbtl;
    var int m_bReadTemp;            //zBOOL //��������� "���������" �������� ������ ��������

    //zCArray<zCOptionSection*> sectionList; //�������, �� ������� ������� ini-����
        var int sectionList_array;
        var int sectionList_numAlloc;
        var int sectionList_numInArray;
    
    var int directory[NUM_ENTRIES];      //zFILE*   //��� �������, ��� ���� ���.
    var string dir_string[NUM_ENTRIES];  //zSTRING //��� �������, ��� ���� ���.
    var string commandline;              //zSTRING //zCOptions ����� �������� �� ��������� ������.
};

class zCOptionSection { 
    var string secName;                 //zSTRING //��� �������. ����., "GAME"

    //zCArray<zCOptionEntry*> entryList; //��������� � ���� ������.
        var int entryList_array;
        var int entryList_numAlloc;
        var int entryList_numInArray;
};

const int sizeof_zCOptionSection = /* sizeof_zString */ 20 + 12;

class zCOptionEntry {   
    var int changed;            //zBOOL     //�� ������������?
    
    //zCArray <EntryChangeHandler> ccbList; //������� ������, ������� ������� �������������, ���� �������� ���������. ���������� ���������� ��� ��������������.
        var int ccbList_array;
        var int ccbList_numAlloc;
        var int ccbList_numInArray;

    // Variable-Data    
    var string varName;        //zSTRING    //��� ����������
    var string varValue;       //zSTRING    //�������� ���������� (��� �������������� � ���� �����)
    var string varValueTemp;   //zSTRING    //��������� �������� ����������. ��. ����. ����������, ��������� � ���� ������.
    var int varFlag;           //int        //����� ����������. �� �������, ����� ��� �������-������ ��������� ������.
};

const int sizeof_zCOptionEntry = 5*4 + 3 * 20;