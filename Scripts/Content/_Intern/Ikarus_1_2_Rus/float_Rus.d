//#################################################################
//
//  32-������ (�������� IEEE 754) ����� � ��������� �������
//  (������������) ��� Daedalus:
//      �������������� ������ �� 26.11.2008:
// http://forum.worldofplayers.de/forum/threads/500080-Instrumentarium-Floats
//
//  ��� ������ ��������� ������������ ���������, �� ���������� 
//  ����������� ���������� ��� ����� � ��������� �������.
//  ��� ��� ��� ������ ������� � ������.
//
//  ��������� Ikarus.
//
//  ��������� 6.4.2012:
//    - ������� �� Ikarus
//    - ��������� castFromIntf � castToIntf
//
//  ������� �� ������� ����: ������������ /*NS*/
//
//#################################################################


/*####################################
//      ������� ��������
//####################################

//*********************
//  �������������
//*********************

������� � ���� �������� ����� ��������� �������� � ������� � ��������� ������� (������������). � �������� ���������� ��� ������������ ����� ������ ������� 32-��������� ����� int (integer).
"�� ��������" �������������� ������� ����� ������ � ������������� ������� �����������, ��� ��� ������������ ������������� ������ ���������� �������� ������.
������� ���������� ����� ��������, ��� ������� � ����, ��������� ��������� ����� � ������������ ����� ������������ ����� ����� ������. ���� ������������ ����� �������������� ��� �����, ��� � ������� ��� ������������ ����� ���������� ����� ��������, ��� ��������, � ������ ������ ��������� ������ ������. 

//************************************
//  ��������������
//************************************

����� �������� � ������������� �����, �� ���������� ������� �������������. ����� ������������ ������� mkf � fracf, ������ �� ������� �� ������ ����� �������� ��������������� ������������, � ������ ���� ��������� �� ������� ���� ����� �����.
����� ����� ������������ ����� ����� ����������, ��������, �������� � ������. ����� ��������� ������� ���������� ����������� �����.
��� �������� ��������� ���������� ������������ ������� ge, g, l, le (������ ���������� >=, >, <, <=).
����� ������������ ����� ����� �������������� ������� � ����� � ������� truncf � roundf.

//************************************
//  ����� �������
//************************************

������������ "func float" � "var float", ��� ���� �������, ����������� (��� ������ ��� ����� �������� ������). ����� ������ ������������ ������ ��� �������������� �����.
��� ����������� ������� ����� ����������� ��������� ������ � ������������ ����������:

mkf    = make float
truncf = truncate float
roundf = round float
addf   = add floats
subf   = subtract floats
negf   = negate float
mulf   = multiply floats
divf   = divide floats
invf   = inverse float
gf     = greater
gef    = greater or equal
lf     = lower
lef    = lower or equal
sqrtf  = square root of float
printf = print float

*************** ��������������� ******************
func float mkf (var int x) //������� ������������ ����� �� ������.
func int truncf (var float x) //�������� ������������ �������� �� ������, ���������� ������� �����. ���������� ����� �����. (��� -1.5 ������� -1.0, � �� -2)
func int roundf (var float x) //����������� ������������ ����� � ������, �������� ���. ���������� ����� �����.

**************** �������� ************************
func float addf (var float x, var float y) //���������� x � y � ���������� ���������.
func float subf (var float x, var float y) //�������� y �� x � ���������� ���������.
func float negf (var float x) //���������� �����, ��������������� � x (�.�. -x).

**************** ��������� ***********************
func float mulf (var float x, var float y) //�������� x �� y � ���������� ���������
func float divf (var float x, var float y) //����� x �� y � ���������� ���������.
func float invf (var float x) //���������� �����, �������� � x, �.�. 1/x. ���� x = 0, ��������� ������.
func float fracf (var int p, var int q) //���������� ��������� ������� p/q ��� ����������� �����. ������������ divf(mkf(p), mkf(q))

**************** �������� ��������� **************
func int gf (var float x, var float y) //���� x > y ���������� TRUE, ����� FALSE
func int gef (var float x, var float y) //���� fur x >= y ���������� TRUE, ����� FALSE
func int lef (var float x, var float y) //���� fur x <= y ���������� TRUE, ����� FALSE
func int lf (var float x, var float y) //���� fur x < y ���������� TRUE, ����� FALSE

**************** ������ **************************
func float sqrf  (var float x) //���������� ������� ����� x
func float sqrtf (var float x) //���������� ���������� ������ �� x
func string toStringf(var float x) //���� ��������� ������������� ����� x, ����. "12.345"

**************** Casts ************************
� Daedalus ���� ���� �����������, ����� ������������ "var float".
����� floats � ������� ����� ������� � Floats ������������� � ������ Daedalus, � ��������, ���� ��� �������.

func float castFromIntf(var int   f) //����������� float � ������� ����� ������� � ������ Daedalus
func int   castToIntf  (var float f) //����������� float � ������� Daedalus  � ������ ����� �������

��� �������, � �������� �����, ������ �� ������. ��� "����������" ������ ����� �������� ��������� ���� ������.
� ����� ������� ��������� � ������������ �������� ����� ������� ���������� ����� ��� float.

//************************************
//  ������
//************************************

���������� 5 ��������, ������� ����� ������������ ��� ����������/��������������� ����� �����:

FLOATNULL = 0
FLOATEINS = 1
FLOATHALB = 0.5
PI = 3.1415...
E = 2.7182...

//************************************
//  �������
//************************************

��������� ������� ��������� ����� �������� � ���.�� � ���������� ����������� ��������.
��������� ���������� ��� ����� �����.

func int CylinderVolume (var int radius, var int height) {
    var int radiusf, var int heightf;
    radiusf = mkf (radius);
    heightf = mkf (height);

    //V = r * PI * h

    var int resultf;
    resultf = mulf (radiusf, radiusf);
    resultf = mulf (resultf, PI);
    resultf = mulf (resultf, h);

    return roundf (resultf);
};

��������� ������� ��������� �������� � ������� ��� �� �����. ��������� ��������� �������

func void reply () {
    var int foo;

    foo = mulf (mkf (1337), PI);
    printf (divf (foo, mkf (100)));

    //(1337*PI)/100 � ������������ ��������� ����� 42. ;-)
	//NS: ���, ���, ������ � ������� single. ��� ����� ������ ��������, ������� ��� � 3 ����� ����� �������
};

��������� ������� ��������� ��������� ���������. �� � ����� ������ �� �������� "ERROR".

func void floattest()
{
    var int halb; var int eins; var int zwei;	//NS: 0.5, 1, 2
    var int null;	//NS: 0
    var int minuseins; var int minuszwei;	//NS: -1, -2

    halb = invf (mkf (2));
    eins = mkf (1);
    zwei = mkf (2);
    null = mkf (0);
    minuseins = mkf (-1);
    minuszwei = mkf (-2);

    if (gf (zwei,eins))           {} else { print ("ERROR!"); };
    if (gf (eins,null))           {} else { print ("ERROR!"); };
    if (lf (minuseins,null))      {} else { print ("ERROR!"); };
    if (lf (minuszwei,minuseins)) {} else { print ("ERROR!"); };
    if (gf (halb,minuseins))      {} else { print ("ERROR!"); };
    if (lf (halb,zwei))           {} else { print ("ERROR!"); };
    if (lef (null,null))          {} else { print ("ERROR!"); };
    if (gef (null,null))          {} else { print ("ERROR!"); };
};

//************************************
//  ����������� � ��������� �����
//************************************

***********  ������ ������������ *****************
�� ��� ����� ��������������� �� ���������� ��������� +, -, * ��� / � ������������ ������. ��� ��� ����������. � ������ ������, ��������� ������ ������. ����������� addf, subf, mulf � divf, ��� �������� ����.
���� �� ������ ���������� ������������� ������������ �����, ��������, ������ ��� ������������� ������������, ����� ������������ ��������� ��������� (>, <, <= >=). ���� �� �� �������, ����� ����������� ��������������� �������.
����������, ������������ ������� �� �������� ��� ����� �����. ������ sqrtf (4) �� ����� 2, � ������ �����������, ��������� ��� ����� 81 � ���� ������! ����� ������� ���������� ������ �� 4, ����� ������� ���: roundf(sqrtf(mkf(4))). ����� ��������� 2.

*********** ����������� ������������� ************
�������� ������������� ������������ ����� ������ ����������, ������� ������� � 4 ����� ����� ������� ����� ���������� ����������� ����������. ��� �������� ����� ������� ��� ����� ��������� �����.
���� ������� ������������ � ����������� ��� ������������ �����. ��������, ����� ������ ���������� ��������� ������������ ����� �� ���������, �� ��-�� ����������� ���������� ���������� ���, ��� ��� �����, ������� ���������� ������ ���� ����� ���� �����, ������� �����������. � ���� ������ ����� ���������, ����� �� ������� ����� ����� ����� ������� ������ ��������� ����� �������� (������������ �������� ������).

*/

//#################################################################
//
//  �������
//
//#################################################################

const int FLOAT_SIGN_MASK = 1 << 31;

const int FLOATNULL = 0;
const int FLOATEINS = 1065353216; //vz 0, exp 0 (also char 127), mt 1.0
const int FLOATONE  = FLOATEINS;  //�� ��
const int FLOATHALB = 1056964608; //vz 0, exp -1 (also char 126), mt 1.0
const int FLOATHALF = FLOATHALB;  //�� ��

const int PI = 1078530011;
const int E =  1076754516;

/* ��������� ������� �������� ��� ����������. */
const int FLTINT_trunc_code[9] = { -2082109099, 2111375596, 1166763774, 1712108798, -637778551, 1842939973, -128066564, -1946260007, -1010173883 };
const int FLTINT_mul_code  [3] = { -639268523, 1306004549, 12830984 };
const int FLTINT_div_code  [3] = { -639268523, 2111310917, 12830984 };
const int FLTINT_add_code  [3] = { -639268523, 1171786821, 12830984 };
const int FLTINT_mk_code   [2] = { -605714091, -1010235323 };

/* ��������������� �������: */
func int _FLT_Build_Func(var int codePtr, var int param1Ptr, var int param2Ptr, var int retValIsFloat, var int resultPtr) {
    CALL_Open();
    if (param2Ptr) {
        CALL_IntParam(param2Ptr);
    };
    if (param1Ptr) {
        CALL_IntParam(param1Ptr);
    };
    if (retValIsFloat) {
        CALL_RetValIsFloat();
    };
    CALL_PutRetValTo(resultPtr);
    CALL__cdecl(codePtr);
    return CALL_Close();
};

//************************************
//      ���������:
//************************************

func int mkf (var int x) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_mk_code), _@(x), 0, 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int truncf (var int x) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_trunc_code), _@(x), 0, 0, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int addf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_add_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int mulf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_mul_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int divf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_div_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

//************************************
//  ���������� � ������� � ���������� �����
//************************************

func int sqrf(var int f) {
    return mulf(f,f);
};

func int sqrtf(var int f) {
    const int sqrtf_G1 = 7757593; //0x765F19
    const int sqrtf_G2 = 8123917; //0x7BF60D
    
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(MEMINT_SwitchG1G2(sqrtf_G1, sqrtf_G2),
                               _@(f), 0, 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

//************************************
//  ����� ����������� 5
//  ��������� ��������������� �������:
//************************************

func int negf (var int x) {
    if (x < 0) { return x & (~FLOAT_SIGN_MASK); }
    else       { return x |   FLOAT_SIGN_MASK ; };
};

func int absf (var int x) {
    return x & (~FLOAT_SIGN_MASK);
};

func int subf (var int x, var int y) {
    return addf(x, negf(y));
};

func int roundf (var int x) {
    if (x < 0) {
        return truncf(subf(x, FLOATHALB));
    } else {
        return truncf(addf(x, FLOATHALB));
    };
};

func int invf (var int x) {
    return divf(FLOATEINS, x);
};

/* ������� orcwarriorPL �� ����! */
func int fracf (var int p, var int q) {
    if (!q) {
        MEM_Error("fracf: Denominator is 0.");
    };
    return divf(mkf(p), mkf(q));
};

 /* ���������� */
func int sqrtf_approx(var int f) { return sqrtf(f); };

//************************************
//  �������� ���������
//************************************

func int gf (var int x, var int y) {
    var int isnegX; isnegX = x & FLOAT_SIGN_MASK;
    var int isnegY; isnegY = y & FLOAT_SIGN_MASK;

    if (isNegX && isNegY) { //��� �������������
        if (x < y) {
            return TRUE;
        };
    }
    else {
        if (x > y) {
            return TRUE;
        };
    };

    return FALSE;
};

func int gef (var int x, var int y) {
    if (x == y) { return true; };
    return gf (x,y);
};

func int lef (var int x, var int y) {
    return !gf(x,y);
};

func int lf (var int x, var int y) {
    return !gef (x,y);
};

//*****************************************
//  ������� ������, ������� Gottfried!
//*****************************************

func float castFromIntf(var int   f) { f; };
func int   castToIntf  (var float f) { return MEM_ReadInt(_@f(f)); };

func string toStringf(var int x) {
    var float f; f = castFromIntf(x);
    return FloatToString(f);
};

/* ��������� ���. ��������� ���� �������������. */
func void printf(var int x) {
    Print(toStringf(x));
};

