// zParserExtender class definitions for DLS implementation

/// Union zPraserExtender Trigger class
/// [C_Tringger on GMC](https://auronen.github.io/gmc/zengin/scripts/extenders/zParserExtender/c_trigger/)
class C_Trigger
{
    var int Delay; // defines the frequency (in miliseconds) at which the function will be called.
    var int Enabled; // determines if the trigger is active. If the value is equal to zero, the trigger is destroyed.
    var int AIVariables[16]; // user data, which can be set independently when creating trigger (yes, you can write there absolutely everything you want).

    // Hidden variable members
    /*
     - Func   - The function that the trigger will call.
     - Self   - The NPC that will be placed in `self` when the function is called.
     - Other  - An NPC that will be placed in `other` when the function is called.
     - Victim - The NPC that will be placed in `victim` when the function is called.
    */
};

/// RGBA Color class
class C_Color
{
    var int R; // red channel value
    var int G; // green channel value
    var int B; // blue channel value
    var int A; // alpha channel value
};

/// 3D position in the world
class C_Position
{
    var int X; // X coordinate
    var int Y; // Y coordinate
    var int Z; // Z coordinate
};

/// Universal VOB objects data
class C_VOB_DATA
{
    var string Name;              // object name
    var float VisualAlpha;        // object's transparency 0.0 - 1.0
    var int ShowVisual;           // display the mode
    var int DrawBBox3D;           // show objects bounding box
    var int VisualAlphaEnabled;   // enables objects transparency
    var int PhysicsEnabled;       // enables object's physics
    var int IgnoredByTraceRay;    // allow any object collisions
    var int CollDetectionStatic;  // allow collision with static world polygons
    var int CollDetectionDynamic; // allow collision with dynamic world objects
    var int CastDynShadow;        // display shadow of the object
    var int LightColorStatDirty;  // allow static liging of the object
    var int LightColorDynDirty;   // allow dynamic lighing of the object
    var int SleepingMode;         // sets object's activity mode (0 - inactive, 1 - active, 2 - AI only)
    var int DontWriteIntoArchive; // turns of the serialization of this object to the save file 
};

/// Represents light objects data
class C_LIGHT_DATA
{
    var int R;                // red light intensity
    var int G;                // green light intensity
    var int B;                // blue light intensity
    var int Range;            // radius
    var int RangeInv;         // 
    var int RangeBackup;      // 
    var int RangeAniActFrame; // current light animation frame for the radius
    var int RangeAniFPS;      // speed of light animation for the radius
    var int ColorAniActFrame; // current light animation frame for colour
    var int ColorAniFPS;      // speed of light animation for colour
    var int SpotConeAngleDeg; // angle of cone light source
    var int IsStatic;         // whether the source is static
    var int RangeAniSmooth;   // [UNUSED]
    var int RangeAniLoop;     // [UNUSED]
    var int ColorAniSmooth;   // allows soft transitions between colours
    var int ColorAniLoop;     // [UNUSED]
    var int IsTurnedOn;       // whether the light source is on
    var int LightQuality;     // source quality (when statically compiling light) (0 - high, 1 - medium, 2 - low)
    var int LightType;        // type of source (at static light compilation) (0 - point, 1 - cone)
};

// Represeents MOB objects data
class C_MOB_DATA
{
    var string VisibleName;     // name shown above the object
    var int Hitpoints;          // number of hitpoints
    var int Damage;             // damage the object can cause
    var int IsDestroyed;        // if the object is destroyed
    var int Moveable;           // whether the object can be moved
    var int Takeable;           // whether the object can be taken
    var int FocusOverride;      // if the object will redefine focus in combat mode
    var int SndMat;             // object's material (0 - wood, 1 - stone, 2 - metal, 3 - skin, 4 - clay, 5 - glass)
    var string VisualDestroyed; // model when the object is destroyed
    var string OwnerStr;        // name of the instance of the owner of the object
    var string OwnerGuildStr;   // name of the guild of the object
    var int Owner;              // instance of the owner
    var int OwnerGuild;         // guild instance
    var int FocusNameIndex;     // the script string of the displayed name
};

/// Represents MobInter objects data
class C_MOBINTER_DATA
{
    var string TriggerTarget;   // object name which will be triggered by OnTrigger
    var string UseWithItem;     // name of the object instance that is needed for interaction
    var string Sceme;           // name of the scene that corresponds to the object and character animations
    var string ConditionFunc;   // scripting condition under which the interaction can be performed
    var string OnStateFuncName; // the name pattern of the functions that will be called when the object changes the state
    var int State;              // the current state of the object
    var int State_num;          // number of object's states
    var int State_target;       // current state of the object
    var int Rewind;             // prohibits object updating
    var int MobStateAni;        // current animation of the object
    var int NpcStateAni;        // current character animation
};

/// Represents MobLockable objects data
class C_MOBLOCKABLE_DATA
{
    var int Locked;         // whether the object is locked
    var int AutoOpen;       // [UNUSED]
    var int PickLockNr;     // current rotation number 
    var string KeyInstance; // key instance name for the object
    var string PickLockStr; // combination to open the object ("LRRLR")
};
