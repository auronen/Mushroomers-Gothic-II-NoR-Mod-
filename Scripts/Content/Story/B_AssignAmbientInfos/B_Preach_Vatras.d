

func void B_Preach_Vatras(var int satz)
{
	if(satz == 0)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_00");	//������� ����� ������� ������ ������. �� ���� ����� ���� � ���������, ��� �������� ���� ������ ������� ��.
	}
	else if(satz == 1)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_01");	//����� ����� ������� ����, � �� ����� ���������� ����, ��� ������ �� ����� ����.
	}
	else if(satz == 2)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_02");	//� ����� ���� ���� ����� ��� � ������� �� ����, � ����� ��� ��������� �� �����.
	}
	else if(satz == 3)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_03");	//� ��� �� ���� ������ ������. � � ����� �������� �� ������ ���� � ���������.
	}
	else if(satz == 4)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_04");	//�� ����� ������������, ��� ����� �� �����. 
	}
	else if(satz == 5)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_05");	//� ����� ������ ������ ����, � ������ ������, � ��� ������ ������ ����.
	}
	else if(satz == 6)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_06");	//�� ������ �� ���� ������� �����, � ���� ��� ����������.
	}
	else if(satz == 7)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_07");	//����� ����� ������� � ����� ������ ����� ���, � ������ ����, � ��������� ����.
	}
	else if(satz == 8)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_08");	//� � ��� ������ ����� ���������� �� ����, � �������� ��, � ���� ������������.
	}
	else if(satz == 9)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_09");	//� �� ������ ������: '���� ����������� ���� � ����, � � ����� ������ ��� ����� � �����. � ������� �� ������ �� �� ����� ������'.
	}
	else if(satz == 10)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_10");	//� ����� ����� ������ ����� ������ ���, ������ ������� ��� ������ ������.
	}
	else if(satz == 11)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_11");	//� ��� ��������� ������, � ��� ��� ��������� ������, � �� ����� ��������� �����.
	}
	else if(satz == 12)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_12");	//� �� ���� ���� ����� ������. � � ����� �������� �� ������ ������ � ������.
	}
	else if(satz == 13)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_13");	//� �� ������� ���� ������� ����� � �������, � ������������� ����� ������. � ������ �������� �����, � ����, � ������ ���� ��������.
	}
	else if(satz == 14)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_14");	//� ��� �������� �����, � ��������� �������, � �����, � �����, � ����, � �������� ����, � ������ �����. � ��� ������ ������ �������.
	}
	else if(satz == 15)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_15");	//� ������ ������� �������� ���� � ������������, ����� ��� ������ ���� ����� � ���� ������� �� �� �������.
	}
	else if(satz == 16)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_16");	//� �����, ���� ���, ����� ������������, ��� ����� �� �� ������ �����, �� � �������������.
	}
	else if(satz == 17)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_17");	//� �� ������ �������� ������� ���� � �������, � ��� ��� ���� ������� ������.
	}
	else if(satz == 18)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_18");	//������� ������ ������� ���� ������ � ����������� ����� �������. �� ����� �� ���� � �� ���� ���� �������, �������� ��� �����.
	}
	else if(satz == 19)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_19");	//����� ������ ������� ���� ����� � ����� � �������� ����, � ������ ������ �����.
	}
	else if(satz == 20)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_20");	//�� ������� ��� �� ������ � ���� ������ ������ ������� ���� �� �����.
	}
	else if(satz == 21)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_21");	//����� ���� ������� �������, � �� ������: '���� �� ������� �� ������� ����, �� ������� �������'.
	}
	else if(satz == 22)	{
		AI_Output(self,self,"DIA_Vatras_PREACH_MR_05_22");	//� ������ ���� ��������, � ������ ��� ���� � ��������� �������. � ��� �� ����� ��������� ������.
	}
	else if(satz == 23)	{
	}
	else	{
		self.aivar[AIV_TAPOSITION] = -1;
	};
	self.aivar[AIV_TAPOSITION] += 1;
};


/*


	if(satz == 0)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_00");	//�� ���� ��� ������ ��� �������. � ���, ��� ������ �����, ���� �������� ����������.
	};
	if(satz == 1)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_01");	//�� ������ �����, ��� ��� �� ����� ������������ ������. �� ����� � �� ����.
	};
	if(satz == 2)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_02");	//� �� ����� ������ ����� ����� ��������, ����� �������� ���� ��������. �� � ���� ������ �� �����.
	};
	if(satz == 3)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_03");	//�� ���, ��� ����� ������, ���������� �����, ��� �� � ������, �� � ������� �� ���� ����.
	};
	if(satz == 4)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_04");	//� ���� ����� ������� � ���� ���� �����. � ��� ���� ������� ����.
	};
	if(satz == 5)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_05");	//� ��� ���� ���������� �����. � ��������� ��������� ��������. ������� � ��������. ����� � ����. �, �������, �������� �������.
	};
	if(satz == 6)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_06");	//� ������ ��� ������������ ���, ��� �����. �� ��� ������� ����� ���������� � ������ �������.
	};
	if(satz == 7)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_07");	//�� ��� ����� ��� ���� �������, ��� �� ����� �� ����� � ������ �����. � ������ ��������� � ���. � ��� ����� ���� ��� ���������.
	};
	if(satz == 8)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_08");	//� ������ ��� ��� ����� ����� ������������ ����, ����� ����� ��������� �����.
	};
	if(satz == 9)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_09");	//�� ����� �����, ��� ������ ������. � �� ���� ��������� �� ����� � ������ ��������. � ����� ��������� � ���. � ������� ���� ��� ���������.
	};
	if(satz == 10)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_10");	//� ����� ��� ��� ����� ����� ������������ ����, ����� ��� ��� ������������� ������� �������.
	};
	if(satz == 11)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_11");	//� ������ ��������� ��� � ����� ���������. �� ������ ������ ������, � ��� �������� ���� ����� � ���� �����.
	};
	if(satz == 12)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_12");	//�� ������ � ��� ���� ����� � �������, � ��������. � �������� ������ �������� �������.
	};
	if(satz == 13)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_13");	//� ��������� ������ �� ������ ��������: '������� ������ �� ������ �� ������� �� ��� �����. ��� ��������. �� ����� ���.'
	};
	if(satz == 14)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_14");	//�� ������� � ����� ������ ����� �� ����� �������. � ���� ����� ��� � ����.
	};
	if(satz == 15)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_15");	//� ������� ���� ����� � ����� � ������� �������.
	};
	if(satz == 16)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_16");	//�� ������ ������, ��� ������� � ���� ������ �������, � ��������� ������ ������ �������� ������������ ����.
	};
	if(satz == 17)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_17");	//� �����, �������� �����, ������ ���.
	};
	if(satz == 18)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_18");	//�� ������ ������, ��� �������� ����, ����� ����� �������� �� �����.
	};
	if(satz == 19)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_19");	//� �� �������� ������ �������� ����� ����� ���� � ��� ����, ����� �� ��� ������� �� ��������, ���� ����� ��������.
	};
	if(satz == 20)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_20");	//� �����, �������� �����, ������ ���.
	};
*/

