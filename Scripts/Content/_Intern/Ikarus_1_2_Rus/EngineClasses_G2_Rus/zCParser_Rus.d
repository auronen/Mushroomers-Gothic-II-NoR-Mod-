//#################################################################
//
//  1.) zCParser
//  2.) zCPar_Symbol
//  3.) ������ �������
//
//#################################################################

//************************************
//      1.) zCParser
//************************************

//�������� �������:
const int zCParser_symtab_table_array_offset        = 24; //0x18
const int zCParser_sorted_symtab_table_array_offset = 36; //0x24
const int zCParser_stack_offset                     = 72; //0x48
const int zCParser_stack_stackPtr_offset            = 76; //0x4C

class zCParser {
    var int msgfunc;                                    //void (__cdecl * msgfunc)( zSTRING );
    
    // *** Vars ***
    //zCArray <zCPar_File *>    file;                   // ������ ������������ ������
        var int file_array;                             //0x0004 zCPar_File**
        var int file_numAlloc;                          //0x0008 int
        var int file_numInArray;                        //0x000C int
    
    //zCPar_SymbolTable     symtab;                     // ������� �������� 
        var int symtab_preAllocatedSymbols;             //0x0010 zCPar_Symbol*
        var int symtab_nextPreAllocated;                //0x0014 int
        
        //zCArray<zCPar_Symbol*>    table;
            var int symtab_table_array;                 //0x0018 zCPar_Symbol**
            var int symtab_table_numAlloc;              //0x001C int
            var int symtab_table_numInArray;            //0x0020 int
        
        //zCArraySort<int>      tablesort;
            var int symtab_tablesort_array;             //0x0024 int*
            var int symtab_tablesort_numAlloc;          //0x0028 int
            var int symtab_tablesort_numInArray;        //0x002C int
            var int symtab_tablesort_compare;           //0x0030 int (*Compare)(const int* ele1,const int* ele2)
        
        var int lastsym;                                //0x0034 zCPar_Symbol*
        var int firstsym;                               //0x0038 zCPar_Symbol*
    
    //zCPar_StringTable     stringtab;                  // ��� ������
        //zCArray <zSTRING *> array;
            var int stringtab_array_array;              //0x003C zString**
            var int stringtab_array_numAlloc;           //0x0040 int
            var int stringtab_array_numInArray;         //0x0044 int
    
    //zCPar_Stack               stack;                  //������� ������, � ������� ������������� ���
        var int stack_stack;                            //0x0048 zBYTE*  // ������ �����
        var int stack_stackptr;                         //0x004C zBYTE* oder zWORD* oder int* //������� ������� � �����
        var int stack_stacklast;                        //0x0050 zBYTE* oder zWORD* oder int*
        var int stack_stacksize;                        //0x0054 int //������ ����� � ������
    
    //zCPar_DataStack           datastack;              //���� ������
        var int datastack_stack[/*zMAX_SYM_DATASTACK*/ 2048];     //0x0058 //����� ����. �� ��� ���������� �������������, ��� �� �����.
        var int datastack_sptr;                                   //0x085C int
    
    var int _self;                                      //zCPar_Symbol*
    
    //������ �����������, ������������ ��������������� ��� ��������:
    var string fname;                                   //zSTRING
    var string mainfile;                                //zString
    var int compiled;                                   //zBOOL                 
    var int treesave;                                   //zBOOL                 
    var int datsave;                                    //zBOOL                 
    var int parse_changed;                              //zBOOL 
    var int treeload;                                   //zBOOL 
    var int mergemode;                                  //zBOOL                 
    var int linkingnr;                                  //int   
    var int linec;                                      //int
    var int line_start;                                 //int
    var int ext_parse;                                  //zBOOL
    var int pc_start;                                   //char*
    var int pc;                                         //char*
    var int oldpc;                                      //char*
    var int pc_stop;                                    //char*
    var int oldpc_stop;                                 //char*
    var int params;                                     //zBOOL
    var int in_funcnr;                                  //int
    var int in_classnr;                                 //int
    var int stringcount;                                //int
    var int in_func;                                    //zCPar_Symbol*
    var int in_class;                                   //zCPar_Symbol*
    var int error;                                      //zBOOL 
    var int stop_on_error;                              //zBOOL
    var int errorline;                                  //int  
    var int prevword_index[16];                         //char*
    var int prevline_index[16];                         //int              
    var int prevword_nr;                                //int              
    var string aword;                                   //zSTRING       
    var int _instance;                                  //int              
    var int instance_help;                              //int
    var int progressBar;                                //zCViewProgressBar*
    var int tree;                                       //zCPar_TreeNode*
    var int treenode;                                   //zCPar_TreeNode*
    var int win_code;                                   //zCView*
    var int debugmode;                                  //zBOOL
    var int curfuncnr;                                  //int  //������� �������
    var int labelcount;                                 //int
    var int labelpos;                                   //int*
    
    //zCList <zSTRING>*     add_funclist;
        var int add_funclist_data;                      //zString*
        var int add_funclist_next;                      //zCList<zSTRING>*
                                                        
    var string add_filename;                            //zSTRING                          
    var int add_created;                                //zBOOL
};

//######################################################
//
//  2.) zCPar_Symbol
//
//######################################################

const int zCPar_Symbol_bitfield_ele         = ((1 << 12) - 1) <<  0; //����� ��������� (��� ��������)
const int zCPar_Symbol_bitfield_type        = ((1 <<  4) - 1) << 12; //��. ������ enum ����
const int zCPar_Symbol_bitfield_flags       = ((1 <<  6) - 1) << 16; //��. ������ enum ����
const int zCPar_Symbol_bitfield_space       = ((1 <<  1) - 1) << 22;

/*
enum {  zPAR_TYPE_VOID,     zPAR_TYPE_FLOAT,        zPAR_TYPE_INT, 
        zPAR_TYPE_STRING,   zPAR_TYPE_CLASS,        zPAR_TYPE_FUNC,     
        zPAR_TYPE_PROTOTYPE,zPAR_TYPE_INSTANCE  }; */
        
const int zPAR_TYPE_VOID        = 0 << 12;
const int zPAR_TYPE_FLOAT       = 1 << 12;
const int zPAR_TYPE_INT         = 2 << 12;
const int zPAR_TYPE_STRING      = 3 << 12;
const int zPAR_TYPE_CLASS       = 4 << 12;
const int zPAR_TYPE_FUNC        = 5 << 12;
const int zPAR_TYPE_PROTOTYPE   = 6 << 12;
const int zPAR_TYPE_INSTANCE    = 7 << 12;

/*
enum {  zPAR_FLAG_CONST     = 1,zPAR_FLAG_RETURN = 2,   zPAR_FLAG_CLASSVAR=4,
        zPAR_FLAG_EXTERNAL  = 8,zPAR_FLAG_MERGED =16 };*/
        
const int zPAR_FLAG_CONST       =  1 << 16;
const int zPAR_FLAG_RETURN      =  2 << 16;
const int zPAR_FLAG_CLASSVAR    =  4 << 16;
const int zPAR_FLAG_EXTERNAL    =  8 << 16;
const int zPAR_FLAG_MERGED      = 16 << 16;

const int zCParSymbol_content_offset                = 24; //0x18
const int zCParSymbol_offset_offset                 = 28; //0x1C

class zCPar_Symbol {
    var string name;                        //0x0000 zSTRING        //��� ������� �� ��������
    var int next;                           //0x0014 zCPar_Symbol*  //������, ���������� �������. �������� �����������, ����� ���� ������� ��������.
    
    //�������� �������: ��������� ��� ������� ���
    var int content;                        //0x0018 void* ��� int* ��� float* ��� zSTRING* ��� int ��� float. ��� �������/���������/����������: ��������� �����. � ��������� �������: ������ ��� ��������� �� ������.
    var int offset;                         //0x001C �������� ����� ������� // ������ ��������� // ������������ �������� �������
    
    var int bitfield;                       //0x0020 ��. ����
    var int filenr;                         //0x0024
    var int line;                           //0x0028
    var int line_anz;                       //0x002C
    var int pos_beg;                        //0x0030
    var int pos_anz;                        //0x0034
    
    var int parent;                         //0x0038 zCPar_Symbol*  // ������ �� ������
};

//----------------------------------
//  3.) ������ �������
//----------------------------------

/* ��������� ����� ��� �������� �� ����� ������, � ��������� ����������. 
 * ��������� ���������� ������� � ���� ������. */
        
//������� ���������:
const int zPAR_OP_PLUS      = 0;            //"+" 0x00
const int zPAR_OP_MINUS     = 1;            //"-" 0x01
const int zPAR_OP_MUL       = 2;            //"*" 0x02
const int zPAR_OP_DIV       = 3;            //"/" 0x03
const int zPAR_OP_MOD       = 4;            //"%" 0x04
const int zPAR_OP_OR        = 5;            //"|" 0x05
const int zPAR_OP_AND       = 6;            //"&" 0x06
const int zPAR_OP_LOWER     = 7;            //"<" 0x07
const int zPAR_OP_HIGHER    = 8;            //">" 0x08

//����������:
const int zPAR_OP_IS        = 9;            //"=" 0x09 //�������� i1, i2 �� ����� � ��������� i1 = i2. i1 ������ ���� �������.
                                                  
//��������� �� ���� ��������                     
const int zPAR_OP_LOG_OR        = 11;       //"||"0x0B
const int zPAR_OP_LOG_AND       = 12;       //"&&"0x0C
const int zPAR_OP_SHIFTL        = 13;       //"<<"0x0D
const int zPAR_OP_SHIFTR        = 14;       //">>"0x0E
const int zPAR_OP_LOWER_EQ      = 15;       //"<="0x0F
const int zPAR_OP_EQUAL         = 16;       //"=="0x10
const int zPAR_OP_NOTEQUAL      = 17;       //"!="0x11
const int zPAR_OP_HIGHER_EQ     = 18;       //">="0x12
const int zPAR_OP_ISPLUS        = 19;       //"+="0x13
const int zPAR_OP_ISMINUS       = 20;       //"-="0x14
const int zPAR_OP_ISMUL         = 21;       //"*="0x15
const int zPAR_OP_ISDIV         = 22;       //"/="0x16

/* ������� ���������, ����������, ����� ������ ���� �������� �� �����.
   ��������� ����� ���������� � ����. */
const int zPAR_OP_UNARY         = 30;             
const int zPAR_OP_UN_PLUS       = 30;       //"+" 0x1E
const int zPAR_OP_UN_MINUS      = 31;       //"-" 0x1F
const int zPAR_OP_UN_NOT        = 32;       //"!" 0x20
const int zPAR_OP_UN_NEG        = 33;       //"~" 0x21
const int zPAR_OP_MAX           = 33;           

//�����: ��������� ������ (��� ��������)
const int zPAR_TOK_BRACKETON    = 40;
const int zPAR_TOK_BRACKETOFF   = 41;   
const int zPAR_TOK_SEMIKOLON    = 42;
const int zPAR_TOK_KOMMA        = 43;
const int zPAR_TOK_SCHWEIF      = 44;
const int zPAR_TOK_NONE         = 45;

const int zPAR_TOK_FLOAT        = 51;
const int zPAR_TOK_VAR          = 52;           
const int zPAR_TOK_OPERATOR     = 53;

/* ��� ������� (�� ���������, ��������� - ���� �������)
 * ��������� ������� ������ ������ �������� ����� ����.
 * ������ ������� ������� ������ �� ������ ������. */
const int zPAR_TOK_RET          = 60; //0x3C    //return
const int zPAR_TOK_CALL         = 61; //0x3D    //������� ������. ��������: ���� ������, 4 ����� ������ � �����
const int zPAR_TOK_CALLEXTERN   = 62; //0x3E    //������� �����. ��������: ������� ������, 4 �����
const int zPAR_TOK_POPINT       = 63; //0x3F    //�� ���.
const int zPAR_TOK_PUSHINT      = 64; //0x40    //�������� ����� ��������� � ���� ������. ��������: ��������, 4 �����
const int zPAR_TOK_PUSHVAR      = 65; //0x41    //�������� ���������� � ���� ������. ��������: ������ ������� ����������, 4 �����
const int zPAR_TOK_PUSHSTR      = 66; //0x42    //�� ���.
const int zPAR_TOK_PUSHINST     = 67; //0x43    //�������� ��������� � ���� ������. ��������: ������ ������� ���������, 4 �����
const int zPAR_TOK_PUSHINDEX    = 68; //0x44    //�� ���.
const int zPAR_TOK_POPVAR       = 69; //0x45    //�� ���.
const int zPAR_TOK_ASSIGNSTR    = 70; //0x46    //������������. ����� v1, v2 �� ����� � ��������� v1 = v2
const int zPAR_TOK_ASSIGNSTRP   = 71; //0x47    //������������. ����� v1, v2 �� ����� � ��������� v1 = v2
const int zPAR_TOK_ASSIGNFUNC   = 72; //0x48    //������������. ����� v1, v2 �� ����� � ��������� v1 = v2
const int zPAR_TOK_ASSIGNFLOAT  = 73; //0x49    //������������. ����� v1, v2 �� ����� � ��������� v1 = v2
const int zPAR_TOK_ASSIGNINST   = 74; //0x4A    //������������. ����� v1, v2 �� ����� � ��������� v1 = v2
const int zPAR_TOK_JUMP         = 75; //0x4B    //����������� ������� � ����� �������. ��������: ����� ��� ��������, 4 �����
const int zPAR_TOK_JUMPF        = 76; //0x4C    //�������� b �� ����� � ������������ �������, ���� b == 0. ��������: ����� ��������, 4 ����� (�����: "jump if false". ��� ������� "if")

const int zPAR_TOK_SETINSTANCE  = 80; //0x50    //��������: ������ �������, 4 �����. ������ ���������. ����� ������: "��������� ������� ���������"

//������ ���������� �������. ��������, ���� �������� ���������.
const int zPAR_TOK_SKIP         = 90;
const int zPAR_TOK_LABEL        = 91;
const int zPAR_TOK_FUNC         = 92;
const int zPAR_TOK_FUNCEND      = 93;
const int zPAR_TOK_CLASS        = 94;
const int zPAR_TOK_CLASSEND     = 95;
const int zPAR_TOK_INSTANCE     = 96;
const int zPAR_TOK_INSTANCEEND  = 97;
const int zPAR_TOK_NEWSTRING    = 98;

//��� ���������� � ����� ��������.
const int zPAR_TOK_FLAGARRAY      = zPAR_TOK_VAR | 128; //�� ������������!
const int zPAR_TOK_PUSH_ARRAYVAR  = zPAR_TOK_FLAGARRAY + zPAR_TOK_PUSHVAR; //����� 4-������� ������ �� �����. ����� 1 ���� ������� ������� �� �����. �������� ��������������� ������� ������� � ������ �����.

/* ��. ����� ���� ����:
 * http://forum.worldofplayers.de/forum/showthread.php?p=13086904&#post13086904
 * ��� � ������������, ��� ��������� �������� ������. */
 
const string PARSER_TOKEN_NAMES[246] = {
    "zPAR_OP_PLUS          ",
    "zPAR_OP_MINUS         ",
    "zPAR_OP_MUL           ",
    "zPAR_OP_DIV           ",
    "zPAR_OP_MOD           ",
    "zPAR_OP_OR            ",
    "zPAR_OP_AND           ",
    "zPAR_OP_LOWER         ",
    "zPAR_OP_HIGHER        ",
    "zPAR_OP_IS            ",
    "[INVALID_TOKEN]       ",
    "zPAR_OP_LOG_OR        ",
    "zPAR_OP_LOG_AND       ",
    "zPAR_OP_SHIFTL        ",
    "zPAR_OP_SHIFTR        ",
    "zPAR_OP_LOWER_EQ      ",
    "zPAR_OP_EQUAL         ",
    "zPAR_OP_NOTEQUAL      ",
    "zPAR_OP_HIGHER_EQ     ",
    "zPAR_OP_ISPLUS        ",
    "zPAR_OP_ISMINUS       ",
    "zPAR_OP_ISMUL         ",
    "zPAR_OP_ISDIV         ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "zPAR_OP_UNARY         ",
    "zPAR_OP_UN_PLUS       ",
    "zPAR_OP_UN_MINUS      ",
    "zPAR_OP_UN_NOT        ",
    "zPAR_OP_UN_NEG        ",
    "zPAR_OP_MAX           ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "zPAR_TOK_BRACKETON    ",
    "zPAR_TOK_BRACKETOFF   ",
    "zPAR_TOK_SEMIKOLON    ",
    "zPAR_TOK_KOMMA        ",
    "zPAR_TOK_SCHWEIF      ",
    "zPAR_TOK_NONE         ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "zPAR_TOK_FLOAT        ",
    "zPAR_TOK_VAR          ",
    "zPAR_TOK_OPERATOR     ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "zPAR_TOK_RET          ",
    "zPAR_TOK_CALL         ",
    "zPAR_TOK_CALLEXTERN   ",
    "zPAR_TOK_POPINT       ",
    "zPAR_TOK_PUSHINT      ",
    "zPAR_TOK_PUSHVAR      ",
    "zPAR_TOK_PUSHSTR      ",
    "zPAR_TOK_PUSHINST     ",
    "zPAR_TOK_PUSHINDEX    ",
    "zPAR_TOK_POPVAR       ",
    "zPAR_TOK_ASSIGNSTR    ",
    "zPAR_TOK_ASSIGNSTRP   ",
    "zPAR_TOK_ASSIGNFUNC   ",
    "zPAR_TOK_ASSIGNFLOAT  ",
    "zPAR_TOK_ASSIGNINST   ",
    "zPAR_TOK_JUMP         ",
    "zPAR_TOK_JUMPF        ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "zPAR_TOK_SETINSTANCE  ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "zPAR_TOK_SKIP         ",
    "zPAR_TOK_LABEL        ",
    "zPAR_TOK_FUNC         ",
    "zPAR_TOK_FUNCEND      ",
    "zPAR_TOK_CLASS        ",
    "zPAR_TOK_CLASSEND     ",
    "zPAR_TOK_INSTANCE     ",
    "zPAR_TOK_INSTANCEEND  ",
    "zPAR_TOK_NEWSTRING    ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "zPAR_TOK_FLAGARRAY    ",  
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "[INVALID_TOKEN]       ",
    "zPAR_TOK_PUSH_ARRAYVAR" };