
instance DIA_Constantino_EXIT(DIA_Proto_End)
{
	npc = VLK_417_Constantino;
};

//==============================================================================

var int GiveMRs2Constantino_MR;		//����� ���� �����? -1 - ���
var int GiveMRs2Constantino_cnt;	//�������? -1 - ���
var int GiveMRs2Constantino_sum;	//������� ����� �����
var int GiveMRs2Constantino_XP;		//������� ����� �����
const int MR_ConstantinoCommentAlways = TRUE;

// �������� ��������� ����� �����������
// ���������� ���-��, ���� ����� ��������, ����� FALSE - � �� ��� ������ �����
func int _GiveMRs2Constantino_DoGive(var int MR_Index, var int itmInst)
{
	//��� ������ ���� �������?
	if ((GiveMRs2Constantino_MR < 0) || (GiveMRs2Constantino_MR == MR_Index))	{
		//�������?
		var int cnt;	cnt = GiveMRs2Constantino_cnt;
		if (cnt < 0)	{
			cnt = Npc_HasItems(other,itmInst);
		};
		//������, ���� ���� �����
		if (cnt > 0)	{
			B_GiveInvItems(other, self, itmInst, cnt);
			//���������, ������� ������
			MEM_WriteStatArr(MR_Counter, MR_Index, MEM_ReadStatArr(MR_Counter, MR_Index) + cnt); 	//MR_Counter[MR_Index] += cnt;
			GiveMRs2Constantino_sum += MEM_ReadStatArr(MR_Price, MR_Index) * cnt;	//GiveMRs2Constantino_sum += MR_Price[MR_Index] * cnt;
			return cnt;
		};
	};
	return FALSE;
};
// ������ � ������ � ���. ���� ��� ������ �����
func int _GiveMRs2Constantino_Log(var int MR_Index)
{
	//���� ��� �� ��������������
	if (!MEM_ReadStatArr(MR_ConstantinoCommentOnce, MR_Index))	{
		//���� �����
		var int price;	price = MEM_ReadStatArr(MR_Price, MR_Index);
		//������ ������ �� ����������� �����
		var string entry;
		entry = MEM_ReadStatStringArr(TOPIC_ConstantinoMushrooms_Comment, MR_Index * 2);
		if (price > 0)	{
			entry = ConcatStrings(entry, IntToString(price));
			entry = ConcatStrings(entry, MEM_ReadStatStringArr(TOPIC_ConstantinoMushrooms_Comment, MR_Index * 2 + 1));
		};
		//� ������
		B_LogEntry(TOPIC_ConstantinoMushrooms, entry);
		//����
		GiveMRs2Constantino_XP += price * XP_ConstantinoMushroom_Once;
		//���������, ��� ��������������
		MEM_WriteStatArr(MR_ConstantinoCommentOnce, MR_Index, TRUE);	//MR_ConstantinoCommentOnce[MR_Index] = TRUE;
		return TRUE;
	};
	return FALSE;
};
// ������ ������ � XP ����� ����, ��� ��� �����
func void _GiveMRs2Constantino_Reward()
{
	//������
	if (GiveMRs2Constantino_sum > 0)	{
		B_GiveGold(self,other, GiveMRs2Constantino_sum);
	};
	//����
	GiveMRs2Constantino_XP += GiveMRs2Constantino_sum;
	if (GiveMRs2Constantino_XP > 0)	{
		B_GivePlayerXP(GiveMRs2Constantino_XP);
	};
	//��������
	GiveMRs2Constantino_sum = 0;
	GiveMRs2Constantino_XP = 0;
};

//����� ������� ���� ������
func int B_GiveMRs2Constantino_MR01()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_01, ItPl_Mushroom_01))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_01] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_01_10_00");	//������ �����. �������. ��� ����� ��������! 10 ������� �� ������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_01))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_MR02()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_02, ItPl_Mushroom_02))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_02] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_02_10_00");	//���, ������ ����. �� ������� �����, �� � �� ����������. 15 ����� �� �����.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_02))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Piny()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Piny, ItMr_Piny))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Piny] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Piny_10_00");	//�������� ����. � ����� ��� ����������. 5 �������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Piny))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Stone()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Stone, ItMr_Stone))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Stone] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Stone_10_00");	//�, �������. �� 4 ������� - �����, ��� ����������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Stone))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Red()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Red, ItMr_Red))	{
		//������������
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Red))	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Red_10_00");	//������� ������ ����. ������, ������ �� ���������� �������� ��� �����������?
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Red_10_01");	//������ ��� �����, � ����� �� ���� ��������... ��������. 
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Red_10_02");	//�� ��� �� ��� ����. 2 �������, �� ������.
			}
			//����� - ����� ��� �� � ������ ���
			else if (MR_ConstantinoCommentAlways)	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Red_10_03");	//�� �������� ������� - 2 �������, �� ������.
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Red_10_04");	//�����, � ����� �� ���� ��������... ��������. 
			};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_BrownOiler()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_BrownOiler, ItMr_BrownOiler))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_BrownOiler] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_BrownOiler_10_00");	//������ ������. 8 �������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_BrownOiler))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Governor()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Governor, ItMr_Governor))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Governor] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Governor_10_00");	//���, �������������� ����, �������� � �����. 12 �������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Governor))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Sunrise()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Sunrise, ItMr_Sunrise))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Sunrise] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Sunrise_10_00");	//������ ������, �� ��� ��������� ������ ��� �������. 9 �������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Sunrise))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_LadysEar()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_LadysEar, ItMr_LadysEar))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_LadysEar] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_LadysEar_10_00");	//������� ���. �������� ����, �� �� ������� ������. 4 �������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_LadysEar))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Keil()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Keil, ItMr_KeilSmall)
		 || Npc_HasItems(other,ItMr_KeilBig) && ((GiveMRs2Constantino_MR < 0) || (GiveMRs2Constantino_MR == MR_Keil)))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Keil] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Keil_10_00");	//������� ����� ������, ������ ���� �������, �� ��� � ����� ������ 24 �������. �� ���������� ��� �� �����. 
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Keil))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Bottle()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Bottle, ItMr_Bottle))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Bottle] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Bottle_10_00");	//���������� ����� �����������. 12 ������� �� ������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Bottle))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Ivy()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Ivy, ItMr_Ivy))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Ivy] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Ivy_10_00");	//�, ��� ��������. ��� ����� ����� � � ������... �� �� ���-�� �����. 11 �������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Ivy))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Trident()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Trident, ItMr_Trident))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Trident] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Trident_10_00");	//���-������ ������ �� �������� �� ���� �� �������� �� �������. �� � ���� ���� ��������... 14 �������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Trident))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Branch()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Branch, ItMr_Branch))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Branch] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Branch_10_00");	//�������� � ��������� ����� ���������� ��� ����... 30 �������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Branch))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_DragonTears()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_DragonTears, ItMr_DragonTears))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_DragonTears] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_DragonTears_10_00");	//��������� �����! ����� ����, ������ ���������. 80 ������� �� ������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_DragonTears))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_NightSparkles()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_NightSparkles, ItMr_NightSparkles))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_NightSparkles] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_NightSparkles_10_00");	//������ �����. ���������, ����� �� ��� �� ����� ����! 60 ������� �� ������ - �����������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_NightSparkles))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Violet()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Violet, ItMr_Violet))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Violet] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Violet_10_00");	//��, ���������� �������, ���� �������! ����� ��������, ���������� �������.
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Violet_10_01");	//� ������� �� ���� 50 �������. 
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Violet_10_02");	//������ �� �����, � �� ��������� ������ ��������! �� ��� ����� ��� ������������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Violet))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Oyster()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Oyster, ItMr_Oyster))	{
		//������������
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Oyster))	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Oyster_10_00");	//�� ��������� ����. ��� ��� �� ����?
				if (hero.voice == 3)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_03_01");	//�� ���������� ����������. ������, �����? � ������ ����� �� �����. 
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_03_02");	//�� ����� ������� �� ����� ��� �� ���������?
				} else if (hero.voice == 7)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_07_01");	//� �� ����, ��� �� ����������, �� �� ������ �� �����. �� ������� �����.
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_07_02");	//������ ������� �� �����?
				} else if (hero.voice == 10)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_10_01");	//��� ����������. ��� ����� � �������� ������ �� ���������.
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_10_02");	//������� �� ������� �� �� �����?
				} else if (hero.voice == 14)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_14_01");	//��� ���������� - ������ ��� ����� �� ������� � ������ ����� �� �����. 
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_14_02");	//�� ������ �� �����, ������� ������ �� �����?
				} else	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_16_01");	//�� ����� �� �������, ������� ��� � ���������� - ����������. ������ ����� � ���� ��� �� �����.
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Oyster_16_02");	//�� ��� �����, ������� �� ������� �� �� �����?
				};
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Oyster_10_03");	//������� ��� �� ������ �������.
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Oyster_10_05");	//� ����� ��� �������� � ������... �����, ��� ������� ����� 100 �������.
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Oyster_10_06");	//�� �� ���� ����� � ������� �� 10 �������. � �� ����, ��������� ��� �������.
				GiveMRs2Constantino_sum += 100;
			}
			//����� �� � ������ ���
			else if (MR_ConstantinoCommentAlways)	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Oyster_10_07");	//10 ������� �� ����������. ���� � � �� ������, ��� ��� ������ ����.
			};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_GoldPlate()
{
	var int cnt;	cnt = _GiveMRs2Constantino_DoGive(MR_GoldPlate, ItMr_GoldPlate);
	//���� �������� ����
	if (cnt)	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_GoldPlate] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_GoldPlate_10_00");	//��� �� ������� ����!
			if (cnt > 1)	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_GoldPlate_10_01");	//�� �� ����.
			};
			AI_Output(self,other,"DIA_Constantino_GiveMRs_GoldPlate_10_02");	//����� ���� ����� ����� �������.
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_GoldPlate))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Heart()
{
	//���� �������� ����
	if (_GiveMRs2Constantino_DoGive(MR_Heart, ItMr_Heart))	{
		//������������
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Heart))	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Heart_10_00");	//� ��� ���?! ������?! ����-������?
				if (hero.voice == 3)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_03_01");	//� ���� ������ ������� ������ �� �����. �� ����-�� �� �����... �����, �� �������, ��� ���.
				} else if (hero.voice == 7)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_07_01");	//���, ���� �� �� ������, ��� ��� �� ����? ��� �� ����� ���� ��� �� ��� ����� ���������.
				} else if (hero.voice == 10)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_10_01");	//���� �������? � ������ ��� ���� ����� �����, �����, �� ������, ��� ��� �����.
				} else if (hero.voice == 14)	{
					AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_14_01");	//���, ���� �� ���� �� �����. � � ���� ����� ��������, ��� ��� �� �����.
				} else	{
					if (C_HeroIs_Elena())	{
						AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_16_01");	//���, ���� �� �� ������, ��� ��� �� ����? ��� �� ����� ���� ��� �� ��� ����� ���������.
					}
					else	{
						AI_Output(other,self,"DIA_Constantino_GiveMRs_Heart_16_01b");	//���� ���������? � ������ ��� ������� ����� �����, ������, �� ������, ��� ���.
					};
				};
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Heart_10_02");	//� ���������� ��������� � ��� ��������. � � ��� ����... 
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Heart_10_03");	//��, 250 �������! ���� ����� ������� ���, ������� �����������.
			}
			//����� - ����� �� � ������ ���
			else if (MR_ConstantinoCommentAlways) {
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Heart_10_04");	//��� ���� ����-������? ��� �����������, ����� 250 �������!
			};
		return TRUE;
	};
	return FALSE;
};
func int B_GiveMRs2Constantino_Foggy()
{
	//�������� �� ����� - ������ ��������� �������
	if (Npc_HasItems(other,ItMr_Foggy) && ((GiveMRs2Constantino_MR < 0) || (GiveMRs2Constantino_MR == MR_Foggy)))	{
		//������������
		if (!MR_ConstantinoCommentOnce[MR_Foggy] || MR_ConstantinoCommentAlways)	{
			AI_Output(self,other,"DIA_Constantino_GiveMRs_Foggy_10_00");	//� ����� ��� ��������?
			if (other.aivar[AIV_Gender] == MALE)	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Foggy_10_01");	//��� �� �������� ������� ��������. �������, �� ��� �� ��...
			}
			else	{
				AI_Output(self,other,"DIA_Constantino_GiveMRs_Foggy_10_02");	//��� � �� �������� ������� �� ��������? �������, �� ��� �� ���...
			};
			//���� ������ � ������?
			if (_GiveMRs2Constantino_Log(MR_Foggy))	{
				//��� ������ ��������
			};
		};
		return TRUE;
	};
	return FALSE;
};

func void B_GiveMRs2Constantino()
{
	GiveMRs2Constantino_sum = 0;
	GiveMRs2Constantino_XP = 0;
	var int MrsGiven;	MrsGiven = FALSE;
	
	// ����� �����
	if (B_GiveMRs2Constantino_MR01())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_MR02())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Piny())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Stone())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Red())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_BrownOiler())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Governor())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Sunrise())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Foggy())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_LadysEar())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Keil())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Bottle())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Ivy())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Trident())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Branch())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_DragonTears()){	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_NightSparkles()){	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_GoldPlate())	{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Oyster())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Heart())		{	MrsGiven = TRUE;	};
	if (B_GiveMRs2Constantino_Violet())		{	MrsGiven = TRUE;	};
	
	// ������ ��������� �������
	_GiveMRs2Constantino_Reward();
	
	// � �����-�� ����?
	if (MrsGiven > 0)	{
		if (GiveMRs2Constantino_MR < 0)	{ 
			AI_Output(self,other,"DIA_Constantino_GiveMRs_10_00");	//���? ������, �������, ���� ���-�� ��� �������.
		};
	}
	else	{
		AI_Output(self,other,"DIA_Constantino_GiveMRs_10_01");	//�� � ���� �� ������ ���!
	};	
	Info_ClearChoices(DIA_Constantino_GiveMrms);
};

func void B_GiveMRs2Constantino_Fast()
{
	MR_ConstantinoCommentAlways = FALSE;
	B_GiveMRs2Constantino();
	MR_ConstantinoCommentAlways = TRUE;
};

//=========================================
//������ ���� ��� ������� �����
func string DIA_Constantino_GiveMrms_MenuMRName(var int MR_Index)
{
	var string result;
	var string price_str;
	var string MR_name;	MR_name = MEM_ReadStatStringArr(MR_Names, MR_Index);
	if (MEM_ReadStatArr(MR_ConstantinoCommentOnce,MR_Index))	{//��� ������ ����� � ����� �� ����
		price_str = IntToString(MEM_ReadStatArr(MR_Price,MR_Index));
	}
	else	{
		price_str = "?";
	};
	result = ConcatStrings(MR_name," (");
	result = ConcatStrings(result, price_str);
	result = ConcatStrings(result, " ���.)");
	return result;
};
//���� ��� ������ ����� ��� �����
func void DIA_Constantino_GiveMrms_MenuMR()
{
	GiveMRs2Constantino_MR = -1;
	GiveMRs2Constantino_cnt = -1;	
	var string str;	str = "";
	Info_ClearChoices(DIA_Constantino_GiveMrms);
	Info_AddChoice(DIA_Constantino_GiveMrms,Dialog_Back,DIA_Constantino_GiveMrms_back);
	if (Npc_HasItems(other,ItMr_Violet))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Violet);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Violet);
	};
	if (Npc_HasItems(other,ItMr_Trident))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Trident);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Trident);
	};
	if (Npc_HasItems(other,ItMr_Sunrise))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Sunrise);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Sunrise);
	};
	if (Npc_HasItems(other,ItMr_Stone))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Stone);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Stone);
	};
	if (Npc_HasItems(other,ItMr_Red))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Red);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Red);
	};
	if (Npc_HasItems(other,ItMr_Piny))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Piny);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Piny);
	};
	if (Npc_HasItems(other,ItMr_Oyster))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Oyster);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Oyster);
	};
	if (Npc_HasItems(other,ItMr_NightSparkles))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_NightSparkles);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_NightSparkles);
	};
	if (Npc_HasItems(other,ItMr_LadysEar))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_LadysEar);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_LadysEar);
	};
	if (Npc_HasItems(other,ItMr_KeilSmall) || (Npc_HasItems(other,ItMr_KeilBig) && !MR_ConstantinoCommentOnce[MR_Keil]))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Keil);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Keil);
	};
	if (Npc_HasItems(other,ItMr_Ivy))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Ivy);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Ivy);
	};
	if (Npc_HasItems(other,ItMr_Heart))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Heart);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Heart);
	};
	if (Npc_HasItems(other,ItMr_Governor))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Governor);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Governor);
	};
	if (Npc_HasItems(other,ItMr_GoldPlate))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_GoldPlate);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_GoldPlate);
	};
	if (Npc_HasItems(other,ItMr_Foggy) && !MR_ConstantinoCommentOnce[MR_Foggy])	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Foggy);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Foggy);
	};
	if (Npc_HasItems(other,ItMr_DragonTears))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_DragonTears);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_DragonTears);
	};
	if (Npc_HasItems(other,ItMr_BrownOiler))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_BrownOiler);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_BrownOiler);
	};
	if (Npc_HasItems(other,ItMr_Branch))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Branch);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Branch);
	};
	if (Npc_HasItems(other,ItMr_Bottle))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_Bottle);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_Bottle);
	};
	if (Npc_HasItems(other,ItPl_Mushroom_02))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_02);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_MR02);
	};
	if (Npc_HasItems(other,ItPl_Mushroom_01))	{
		str = DIA_Constantino_GiveMrms_MenuMRName(MR_01);
		Info_AddChoice(DIA_Constantino_GiveMrms,str,DIA_Constantino_GiveMrms_MR01);
	};
	// ���� ���� ����� - ����� ���
	if (!Hlp_StrCmp(str,""))	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"��� ����� (������)",B_GiveMRs2Constantino_Fast);
		Info_AddChoice(DIA_Constantino_GiveMrms,"��� �����",B_GiveMRs2Constantino);
	};
};

func void DIA_Constantino_GiveMrms_back()
{
	Info_ClearChoices(DIA_Constantino_GiveMrms);
};
// � ������� ������ ���������� ���� ������?
func void DIA_Constantino_GiveMrms_MenuCnt()
{
	Info_ClearChoices(DIA_Constantino_GiveMrms);
	Info_AddChoice(DIA_Constantino_GiveMrms,Dialog_Back,DIA_Constantino_GiveMrms_MenuMR);
	Info_AddChoice(DIA_Constantino_GiveMrms,"1 ��.",DIA_Constantino_GiveMrms_1);
	if (GiveMRs2Constantino_cnt >= 5)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"5 ��.",DIA_Constantino_GiveMrms_5);
	};
	if (GiveMRs2Constantino_cnt >= 10)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"10 ��.",DIA_Constantino_GiveMrms_10);
	};
	if (GiveMRs2Constantino_cnt > 1)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,CS3("��� (",IntToString(GiveMRs2Constantino_cnt)," ��.)"),DIA_Constantino_GiveMrms_All);
	};
};
//������� ������ ��� ����� ������ �����
func void DIA_Constantino_GiveMrms_MenuCntSpecial()
{
	Info_ClearChoices(DIA_Constantino_GiveMrms);
	Info_AddChoice(DIA_Constantino_GiveMrms,Dialog_Back,DIA_Constantino_GiveMrms_MenuMR);
	Info_AddChoice(DIA_Constantino_GiveMrms,"1 ��.",DIA_Constantino_GiveMrms_1);
	if (GiveMRs2Constantino_cnt >= 2)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"2 ��.",DIA_Constantino_GiveMrms_2);
	};
	if (GiveMRs2Constantino_cnt >= 3)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"3 ��.",DIA_Constantino_GiveMrms_3);
	};
	if (GiveMRs2Constantino_cnt >= 4)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,"4 ��.",DIA_Constantino_GiveMrms_4);
	};
	if (GiveMRs2Constantino_cnt > 4)	{
		Info_AddChoice(DIA_Constantino_GiveMrms,CS3("��� (",IntToString(GiveMRs2Constantino_cnt)," ��.)"),DIA_Constantino_GiveMrms_All);
	};
};

func void DIA_Constantino_GiveMrms_MR01()
{
	GiveMRs2Constantino_MR = MR_01;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItPl_Mushroom_01);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_MR02()
{
	GiveMRs2Constantino_MR = MR_02;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItPl_Mushroom_02);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Bottle()
{
	GiveMRs2Constantino_MR = MR_Bottle;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Bottle);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Branch()
{
	GiveMRs2Constantino_MR = MR_Branch;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Branch);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_BrownOiler()
{
	GiveMRs2Constantino_MR = MR_BrownOiler;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_BrownOiler);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_DragonTears()
{
	GiveMRs2Constantino_MR = MR_DragonTears;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_DragonTears);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Foggy()
{
	GiveMRs2Constantino_MR = MR_Foggy;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Foggy);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Governor()
{
	GiveMRs2Constantino_MR = MR_Governor;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Governor);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Ivy()
{
	GiveMRs2Constantino_MR = MR_Ivy;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Ivy);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Keil()
{
	GiveMRs2Constantino_MR = MR_Keil;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_KeilSmall);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_LadysEar()
{
	GiveMRs2Constantino_MR = MR_LadysEar;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_LadysEar);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_NightSparkles()
{
	GiveMRs2Constantino_MR = MR_NightSparkles;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_NightSparkles);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Oyster()
{
	GiveMRs2Constantino_MR = MR_Oyster;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Oyster);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Piny()
{
	GiveMRs2Constantino_MR = MR_Piny;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Piny);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Red()
{
	GiveMRs2Constantino_MR = MR_Red;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Red);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Stone()
{
	GiveMRs2Constantino_MR = MR_Stone;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Stone);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Sunrise()
{
	GiveMRs2Constantino_MR = MR_Sunrise;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Sunrise);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Trident()
{
	GiveMRs2Constantino_MR = MR_Trident;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Trident);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_Violet()
{
	GiveMRs2Constantino_MR = MR_Violet;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Violet);	
	DIA_Constantino_GiveMrms_MenuCnt();
};
func void DIA_Constantino_GiveMrms_GoldPlate()
{
	GiveMRs2Constantino_MR = MR_GoldPlate;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_GoldPlate);	
	DIA_Constantino_GiveMrms_MenuCntSpecial();
};
func void DIA_Constantino_GiveMrms_Heart()
{
	GiveMRs2Constantino_MR = MR_Heart;
	GiveMRs2Constantino_cnt = Npc_HasItems(other,ItMr_Heart);	
	DIA_Constantino_GiveMrms_MenuCntSpecial();
};

func void DIA_Constantino_GiveMrms_All()
{
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_1()
{
	GiveMRs2Constantino_cnt = 1;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_2()
{
	GiveMRs2Constantino_cnt = 2;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_3()
{
	GiveMRs2Constantino_cnt = 3;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_4()
{
	GiveMRs2Constantino_cnt = 4;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_5()
{
	GiveMRs2Constantino_cnt = 5;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};
func void DIA_Constantino_GiveMrms_10()
{
	GiveMRs2Constantino_cnt = 10;	
	B_GiveMRs2Constantino();
	DIA_Constantino_GiveMrms_MenuMR();
};


//������ ����� =========================================

instance DIA_Constantino_GiveMrms(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 2;
	condition = DIA_Constantino_GiveMrms_cond;
	information = DIA_Constantino_GiveMrms_info;
	description = "(������ �����)";
	permanent = TRUE;
};

func int DIA_Constantino_GiveMrms_cond()
{
	if ((Wld_GetDay() < Competition_LastDay) && Npc_KnowsInfo(other, DIA_Constantino_Competition))	{
		return TRUE;
	};
};

func void DIA_Constantino_GiveMrms_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_GiveMrms_03_00");	//� ������ ���� �����.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_GiveMrms_07_00");	//� ������ ���� �����.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_GiveMrms_10_00");	//� ������ ���� �����.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_GiveMrms_14_00");	//� ������ ���� �����.
	} else	{
		AI_Output(other,self,"DIA_Constantino_GiveMrms_16_00");	//� �������� ���� �����.
	};
	AI_Output(self,other,"DIA_Constantino_GiveMrms_10_01");	//������. ���������, ��� � ���� ����.
	DIA_Constantino_GiveMrms_MenuMR();
};

//=========================================

instance DIA_Constantino_Competition(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_Constantino_Competition_info;
	description = "�� ������ ������� ������� �������?";
};

func void DIA_Constantino_Competition_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_Competition_03_01");	//�� ������ ������� ������� �������?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_Competition_07_01");	//�� ������ ������� ������� �������?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_Competition_10_01");	//�� ������ ������� ������� �������?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_Competition_14_01");	//�� ������ ������� ������� �������?
	} else	{
		AI_Output(other,self,"DIA_Constantino_Competition_16_01");	//�� ������ ������� ������� �������?
	};
	if ((Wld_GetDay() < Competition_LastDay))	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Constantino_Competition_10_02m");	//��, ��. � �� ��� �������, ��� �������� ������� �������.
		}
		else	{
			AI_Output(self,other,"DIA_Constantino_Competition_10_02f");	//��, ��. � �� ��� �������, ��� �������� ������� �������.
		};
		AI_Output(self,other,"DIA_Constantino_Competition_10_03");	//������ �� ����� �� ��������� �����, � ���� �������� ������ ���� ����� - ���� ���� ������ ����.
		AI_Output(self,other,"DIA_Constantino_Competition_10_04");	//� ���� ��������� ���������� � ���� ������, ������� �� ��� ��������� � ����� �� ��� ������.
		AI_Output(self,other,"DIA_Constantino_Competition_10_05");	//� ���� ���� ���-������?
		if (!C_NpcHasMushrooms(other))	{
			if (hero.voice == 3)	{
				AI_Output(other,self,"DIA_Constantino_Competition_03_06");	//���� ���.
			} else if (hero.voice == 7)	{
				AI_Output(other,self,"DIA_Constantino_Competition_07_06");	//���� ���.
			} else if (hero.voice == 10)	{
				AI_Output(other,self,"DIA_Constantino_Competition_10_06");	//���� ���.
			} else if (hero.voice == 14)	{
				AI_Output(other,self,"DIA_Constantino_Competition_14_06");	//���� ���.
			} else	{
				AI_Output(other,self,"DIA_Constantino_Competition_16_06");	//���� ���.
			};
			AI_Output(self,other,"DIA_Constantino_Competition_10_07");	//����� �� �������� ����.
			//������������ � ����� �����
			AI_StopProcessInfos(self);
		}
		else	{
			if (hero.voice == 3)	{
				AI_Output(other,self,"DIA_Constantino_Competition_03_08");	//��, � ���� ���� ���-����� �����.
			} else if (hero.voice == 7)	{
				AI_Output(other,self,"DIA_Constantino_Competition_07_08");	//��, � ���� ���� ���-����� �����.
			} else if (hero.voice == 10)	{
				AI_Output(other,self,"DIA_Constantino_Competition_10_08");	//��, � ���� ���� ���-����� �����.
			} else if (hero.voice == 14)	{
				AI_Output(other,self,"DIA_Constantino_Competition_14_08");	//��, � ���� ���� ���-����� �����.
			} else	{
				AI_Output(other,self,"DIA_Constantino_Competition_16_08");	//��, � ���� ���� ���-����� �����.
			};
			AI_Output(self,other,"DIA_Constantino_Competition_10_09");	//������, ������, ��� � ���� ����.
		};
	}
	else {
		AI_Output(self,other,"DIA_Constantino_CompetitionEnded_10_01");	//��, �� �� ��� ����������.
		AI_Output(self,other,"DIA_Constantino_CompetitionEnded_10_02");	//���� � ���� ���� �����, � ����� �� �� ������� ����.
		if (other.aivar[AIV_Gender] == MALE)	{
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_FAILED, TOPIC_ConstantinoMushrooms_Late_M);
		}
		else	{
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_FAILED, TOPIC_ConstantinoMushrooms_Late_F);
		};
	};
};

//���� ������ =========================================

instance DIA_Constantino_ScoreList(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 2;
	condition = DIA_Constantino_ScoreList_cond;
	information = DIA_Constantino_ScoreList_info;
	description = "����� � ���� ����� �� ������?";
	permanent = TRUE;
};

func int DIA_Constantino_ScoreList_cond()
{
	if ((Wld_GetDay() < Competition_LastDay) && Npc_KnowsInfo(other, DIA_Constantino_Competition))	{
		return TRUE;
	};
};

func void DIA_Constantino_ScoreList_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_ScoreList_03_00");	//����� � ���� ����� �� ������?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_ScoreList_07_00");	//����� � ���� ����� �� ������?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_ScoreList_10_00");	//����� � ���� ����� �� ������?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_ScoreList_14_00");	//����� � ���� ����� �� ������?
	} else	{
		AI_Output(other,self,"DIA_Constantino_ScoreList_16_00");	//����� � ���� ����� �� ������?
	};
	if (C_GetHeroScore() == 0)	{
		AI_Output(self,other,"DIA_Constantino_ScoreList_10_01");	//���� �� ��������� ��� ����� - �������.
	}
	else	{
		AI_Output(self,other,"DIA_Constantino_ScoreList_10_02");	//���� ���������� ����� �� ����� ����� �����. ������, � ���� ��� ��������.
	};
};

//����� �������� =========================================

instance DIA_Constantino_Final_Lost(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 10;
	condition = DIA_Constantino_Final_Lost_cond;
	information = DIA_Constantino_Final_Lost_info;
	important = TRUE;
};

func int DIA_Constantino_Final_Lost_cond()
{
	if ((Wld_GetDay() >= Competition_LastDay) && Npc_KnowsInfo(other, DIA_Constantino_Competition) && (C_CountResults() == Competition_Result_LOST))	{
		return TRUE;
	};
};

func void DIA_Constantino_Final_Lost_info()
{
	AI_Output(self,other,"DIA_Constantino_Final_Lost_10_00");	//� ��� � ��. ��� ����� ����, �� ���� �� ������� �������� � ��������.
	if (Competition_Bonus > 0)	{
		AI_Output(self,other,"DIA_Constantino_Final_Lost_10_01");	//� ����������� ���������� �� �������� ����� �����, �� ��� ������ ����� ������������.
	};
	AI_Output(self,other,"DIA_Constantino_Final_Lost_10_02");	//����� � ������ ���� �������� �� ������� ����.
	Competition_Result = Competition_Result_LOST;
	B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_FAILED,TOPIC_ConstantinoMushrooms_Lost);
	B_LogNote(TOPIC_FreeTime,TOPIC_FreeTime_Start);
};

//=========================================

instance DIA_Constantino_Final_Won(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 11;
	condition = DIA_Constantino_Final_Won_cond;
	information = DIA_Constantino_Final_Won_info;
	important = TRUE;
};

func int DIA_Constantino_Final_Won_cond()
{
	if ((Wld_GetDay() >= Competition_LastDay) && Npc_KnowsInfo(other, DIA_Constantino_Competition) && (C_CountResults() == Competition_Result_WON))	{
		return TRUE;
	};
};

func void DIA_Constantino_Final_Won_info()
{
	if (Wld_GetDay() == Competition_LastDay)	{
		AI_Output(self,other,"DIA_Constantino_Final_Won_10_00");	//�� ��� ��� �������!
		if (other.aivar[AIV_Gender] == MALE)	{
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_SUCCESS,TOPIC_ConstantinoMushrooms_Won_M);
		}
		else	{
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_SUCCESS,TOPIC_ConstantinoMushrooms_Won_F);
		};
	}
	else	{
		if (other.aivar[AIV_Gender] == MALE)	{
			AI_Output(self,other,"DIA_Constantino_Final_Won_10_01m");	//��� �� �� ���? � �� �����, �� �� �������.
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_SUCCESS,TOPIC_ConstantinoMushrooms_Won_M);
		}
		else	{
			AI_Output(self,other,"DIA_Constantino_Final_Won_10_01f");	//��� �� �� ����? � �� �����, �� �� �������.
			B_LogEntry_Status(TOPIC_ConstantinoMushrooms,LOG_SUCCESS,TOPIC_ConstantinoMushrooms_Won_F);
		};
	};
	AI_Output(self,other,"DIA_Constantino_Final_Won_10_02");	//����������! ������ �� ����� ����������� ����!
	AI_Output(self,other,"DIA_Constantino_Final_Won_10_03");	//����� ������ �� ���� ������� ������� ������.
	if (Competition_Bonus > 0)	{
		AI_Output(self,other,"DIA_Constantino_Final_Won_10_04");	//����� ����, ���� ������� ����� �����, ����������� ����� �����.
		AI_Output(self,other,"DIA_Constantino_Final_Won_10_05");	//��� ���� �� ���� ����������� ��������� ������.
	};
	AI_Output(self,other,"DIA_Constantino_Final_Won_10_06");	//������� ������� ���� ���� - ����� � ������ ��������, ������� � ��������� ����� ���.
	B_GiveInvItems(self,other,ItWr_MushroomBook,1);
	AI_Output(self,other,"DIA_Constantino_Final_Won_10_07");	//��� ���������� ��������� ���������, ����� �� ����� ������ �� �������. � �������� �� ��� ����.
	AI_Output(self,other,"DIA_Constantino_Final_Won_10_08");	//���� � ���� ���� ��� �����, � ����� ������ ��, �� ��� �� ������� ����.
	Competition_Result = Competition_Result_WON;
	B_LogNote(TOPIC_FreeTime,TOPIC_FreeTime_Start);
};

// ���������� ������ =====================================

instance DIA_Constantino_AboutLadysEar(C_INFO)
{
	nr = 20;
	npc = VLK_417_Constantino;
	condition = DIA_Constantino_AboutLadysEar_cond;
	information = DIA_Constantino_AboutLadysEar_info;
	description = "�� �� ��� �� ���������� ��� ��� ���� ����?";
};
func int DIA_Constantino_AboutLadysEar_cond()
{
	if (MIS_Cookery == LOG_Running)	{
		return TRUE;
	};
};

func void DIA_Constantino_AboutLadysEar_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_03_00");	//�� �� ��� �� ���������� ��� ��� ���� ����?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_07_00");	//�� �� ��� �� ���������� ��� ��� ���� ����?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_10_00");	//�� �� ��� �� ���������� ��� ��� ���� ����?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_14_00");	//�� �� ��� �� ���������� ��� ��� ���� ����?
	} else	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_16_00");	//�� �� ��� �� ���������� ��� ��� ���� ����?
	};
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_01");	//�����?
	if (MR_ConstantinoCommentOnce[MR_LadysEar])	{
		if (hero.voice == 3)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_03_02");	//�� ������, �� ���������� ������� ���.
		} else if (hero.voice == 7)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_07_02");	//�� ������, �� ���������� ������� ���.
		} else if (hero.voice == 10)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_10_02");	//�� ������, �� ���������� ������� ���.
		} else if (hero.voice == 14)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_14_02");	//�� �������, ��� �� ���������� ������� ���.
		} else	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_16_02");	//�� ������, �� ���������� ������� ���.
		};
	}
	else	{
		if (hero.voice == 3)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_03_03");	//�� �������, �� ���� ������.
		} else if (hero.voice == 7)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_07_03");	//�� �������, �� ���� ������.
		} else if (hero.voice == 10)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_10_03");	//�� �������, �� ���� ������.
		} else if (hero.voice == 14)	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_14_03");	//�� ������� � �� ���� ������.
		} else	{
			AI_Output(other,self,"DIA_Constantino_AboutLadysEar_16_03");	//����� �������, �� ������� ������.
		};
		AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_04");	//�, ������� ���.
	};
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_05");	//� ����� ���� ��� ���� ������������. �� ����������, �������, �� ������������ ����� �� ������.
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_06");	//���� �� ���� ����� �������� ������� ��������...
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_03_07");	//� ���� �����-�� ������ �������������? �������� ��� �������� ���...
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_07_07");	//� ���� �����-�� ������ �������������? �������� ��� �������� ���...
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_10_07");	//� ���� �����-�� ������ �������������? �������� ��� �������� ���...
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_14_07");	//� ���� �����-�� ������ �������������? �������� ��� �������� ���...
	} else	{
		AI_Output(other,self,"DIA_Constantino_AboutLadysEar_16_07");	//� ���� �����-�� ������ �������������? �������� ��� �������� ���...
	};
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_08");	//� �������, � �� �������!
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_09");	//�� ���� �������� ����� � �������� ���� �� ��� ���� �� ��� ����, ������� �������� ��������. ��� � ��������.
	AI_Output(self,other,"DIA_Constantino_AboutLadysEar_10_10");	//������ ������ ������ � ����, ��� ������.
	MIS_Cookery_ConstantinoAsked = TRUE;
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_Constantino);
};
// ---------------------------------------------------
instance DIA_Constantino_AboutRecipe(C_INFO)
{
	nr = 21;
	npc = VLK_417_Constantino;
	condition = DIA_Constantino_AboutRecipe_cond;
	information = DIA_Constantino_AboutRecipe_info;
	description = "� ����� ������ ���� ������ �������� �� ������� ����?";
};
func int DIA_Constantino_AboutRecipe_cond()
{
	if ((MIS_Cookery == LOG_Running)	
		 && Npc_KnowsInfo(other,DIA_Constantino_AboutLadysEar)){
		return TRUE;
	};
};

func void DIA_Constantino_AboutRecipe_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_03_00");	//� ����� ������ ���� ������ �������� �� ������� ����?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_07_00");	//� ����� ������ ���� ������ �������� �� ������� ����?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_10_00");	//� ����� ������ ���� ������ �������� �� ������� ����?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_14_00");	//� ����� ������ ���� ������ �������� �� ������� ����?
	} else	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_16_00");	//� ����� ������ ���� ������ �������� �� ������� ����?
	};
	AI_Output(self,other,"DIA_Constantino_AboutRecipe_10_01");	//��, ������, ��� �� ���������� � ���� ��������, � ������ ���� ������.
	AI_Output(self,other,"DIA_Constantino_AboutRecipe_10_02");	//500 �������.
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_03_03");	//�������?!
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_07_03");	//�������?!
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_10_03");	//�������?!
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_14_03");	//�������?!
	} else	{
		AI_Output(other,self,"DIA_Constantino_AboutRecipe_16_03");	//�������?!
	};
	AI_Output(self,other,"DIA_Constantino_AboutRecipe_10_04");	//��� ���������! ��� ��������� ���� ��� �������������! �� ����, ����� ��������.
	if (other.aivar[AIV_Gender] == MALE)	{
		AI_Output(self,other,"DIA_Constantino_AboutRecipe_10_05m");	//���� ����������, ��� � ������ ���������� �������� ���.
	}
	else	{
		AI_Output(self,other,"DIA_Constantino_AboutRecipe_10_05f");	//���� ����������, ��� � ������ ���������� �������� ���.
	};
	B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_ConstantinoRecipePrice);
};
// ---------------------------------------------------
instance DIA_Constantino_BuyRecipe(C_INFO)
{
	nr = 23;
	npc = VLK_417_Constantino;
	condition = DIA_Constantino_BuyRecipe_cond;
	information = DIA_Constantino_BuyRecipe_info;
	description = "� ���� ������ ������ ��������. (500 ���.)";
	permanent = TRUE;
};
func int DIA_Constantino_BuyRecipe_cond()
{
	if ((MIS_Cookery == LOG_Running)
		 && Npc_KnowsInfo(other,DIA_Constantino_AboutRecipe) && !MIS_Cookery_ConstantinoSold)	{
		return TRUE;
	};
};

func void DIA_Constantino_BuyRecipe_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_BuyRecipe_03_00");	//� ���� ������ ������ ��������.
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_BuyRecipe_07_00");	//� ���� ������ ������ ��������.
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_BuyRecipe_10_00");	//� ���� ������ ������ ��������.
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_BuyRecipe_14_00");	//� ���� ������ ������ ��������.
	} else	{
		AI_Output(other,self,"DIA_Constantino_BuyRecipe_16_00");	//� ���� ������ ������ ��������.
	};
	if (B_GiveGold(other,self, 500))	{
		AI_Output(self,other,"DIA_Constantino_BuyRecipe_10_01");	//������, �����. ������ ����� ��� �����, ��� ��� ��������!
		B_GiveInvItems(self,other,ItWr_EarRecipe_Constantino,1);
		MIS_Cookery_ConstantinoSold = TRUE;
		B_LogEntry(TOPIC_Cookery,TOPIC_Cookery_ConstantinoGot);
	}
	else	{
		AI_Output(self,other,"DIA_Constantino_BuyRecipe_10_02");	//����� ����� 500 �������.
		AI_Output(self,other,"DIA_Constantino_BuyRecipe_10_03");	//��� ������� ��� ������, � ������ �� ��� �����.
	};
};


/////////////////////////////// ���� //////////////////////////////////

instance DIA_Constantino_Sarah_AskSmokingCure(C_INFO)
{
	npc = VLK_417_Constantino;			nr = 31;
	condition = DIA_Constantino_Sarah_AskSmokingCure_cond;
	information = DIA_Constantino_Sarah_AskSmokingCure_info;
	description = "� ��� �����, ������� ����� �������� �� �������.";
};
func int DIA_Constantino_Sarah_AskSmokingCure_cond()
{
	if (C_HeroIs_Sarah()
		 && (MIS_Sarah_BadHabit == LOG_Running) && MIS_Sarah_BadHabit_SearchPotion)	{
		return TRUE;
	};
};
func void DIA_Constantino_Sarah_AskSmokingCure_info()
{
		AI_Output(other,self,"DIA_Constantino_Sarah_AskSmokingCure_16_00");	//� ��� �����, ������� ����� �������� �� �������. �� ������ ����������� �����?
	AI_Output(self,other,"DIA_Constantino_Sarah_AskSmokingCure_10_01");	//���, ������ ����� � �� ����.
};

// ����������� ��� �������� =====================================

instance DIA_Constantino_JokeSong(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 40;
	condition = DIA_Constantino_JokeSong_cond;
	information = DIA_Constantino_JokeSong_info;
	important = TRUE;
};
func int DIA_Constantino_JokeSong_cond()
{
	if (Rupert_LiedSong && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};

func void DIA_Constantino_JokeSong_info()
{
	AI_Output(self,other,"DIA_Constantino_JokeSong_10_01");	//�� �� ������, ������ �� ��� �������� �������� ���� � �������� ����� ������� � ������?
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Constantino_JokeSong_03_02");	//������� �� ����.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Constantino_JokeSong_07_02");	//������� �� ����.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Constantino_JokeSong_10_02");	//������� �� ����.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Constantino_JokeSong_14_02");	//������� �� ����.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Constantino_JokeSong_16_02");	//������� �� ����.
	};
};
//-------------------------------------------------------
instance DIA_Constantino_JokeGold(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 41;
	condition = DIA_Constantino_JokeGold_cond;
	information = DIA_Constantino_JokeGold_info;
	description = "���-�� ���������?";
};
func int DIA_Constantino_JokeGold_cond()
{
	if (Rupert_LiedGold && DIA_WhenAsked_cond())	{
		return TRUE;
	};
};

func void DIA_Constantino_JokeGold_info()
{
	if (hero.voice == 3)	{			//���
		AI_Output(other,self,"DIA_Constantino_JokeSong_03_00");	//���-�� ���������? � ���� ������������� ���.
	} else if (hero.voice == 7)	{		//������
		AI_Output(other,self,"DIA_Constantino_JokeSong_07_00");	//���-�� ���������? � ���� ������������� ���.
	} else if (hero.voice == 10)	{	//����
		AI_Output(other,self,"DIA_Constantino_JokeSong_10_00");	//���-�� ���������? � ���� ������������� ���.
	} else if (hero.voice == 14)	{	//����
		AI_Output(other,self,"DIA_Constantino_JokeSong_14_00");	//���-�� ���������? � ���� ������������� ���.
	} else	{							//�����/����
		AI_Output(other,self,"DIA_Constantino_JokeSong_16_00");	//���-�� ���������? � ���� ������������� ���.
	};
	AI_Output(self,other,"DIA_Constantino_JokeGold_10_01");	//���� ��������! ������ ��� ���������� ����� � ��������� ��������� ���������!
	AI_Output(self,other,"DIA_Constantino_JokeGold_10_02");	//� ����� ������ ������� �� ��������.
};

// �������� ==============================================

instance DIA_Constantino_preTrade(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 50;
	condition = DIA_Constantino_preTrade_cond;
	information = DIA_Constantino_preTrade_info;
	description = "����� ������ � ���� �����?";
	trade = TRUE;
};

func int DIA_Constantino_preTrade_cond()
{
	return TRUE;
};

func void DIA_Constantino_preTrade_info()
{
	if (hero.voice == 3)	{
		AI_Output(other,self,"DIA_Constantino_preTrade_03_00");	//����� ������ � ���� �����?
	} else if (hero.voice == 7)	{
		AI_Output(other,self,"DIA_Constantino_preTrade_07_00");	//����� ������ � ���� �����?
	} else if (hero.voice == 10)	{
		AI_Output(other,self,"DIA_Constantino_preTrade_10_00");	//����� ������ � ���� �����?
	} else if (hero.voice == 14)	{
		AI_Output(other,self,"DIA_Constantino_preTrade_14_00");	//����� ������ � ���� �����?
	} else	{
		AI_Output(other,self,"DIA_Constantino_preTrade_16_00");	//����� ������ � ���� �����?
	};
	AI_Output(self,other,"DIA_Constantino_preTrade_10_01");	//�������.
	B_LogNote(TOPIC_Trader,TOPIC_Trader_Constantino);
	B_GiveTradeInv_Constantino(self);
};
//-----------------------------------------
instance DIA_Constantino_Trade(C_INFO)
{
	npc = VLK_417_Constantino;		nr = 51;
	condition = DIA_Constantino_Trade_cond;
	information = DIA_Constantino_Trade_info;
	description = "(���������)";
	trade = TRUE;
	permanent = TRUE;
};

func int DIA_Constantino_Trade_cond()
{
	if (Npc_KnowsInfo(other,DIA_Constantino_preTrade))	{
		return TRUE;
	};
};

func void DIA_Constantino_Trade_info()
{
	B_GiveTradeInv_Constantino(self);
};


