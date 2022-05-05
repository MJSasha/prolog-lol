/*								�����
������ ������� ������ �� �����, ������ �� ����� ������. ��� ��������� �� ���� � 
������ ��������. ���������, ��� � ������ ���� ����� ���� ���� � ����� 
�� �������� �� ����� �������. ����� ������� �� �������� - ��� ��������, ���������
�� ����� ������ ������, ����� ���� �������, ������ ������, ��� �������, ���� ������
���� �������� � ��� ���������. ��� � ��� �������?	*/

DOMAINS
  	������� = symbol
  	���_������� = symbol
  	���_����� = symbol

% ��������� ��� ������������� ����, ����� ������� ��������� �������� ����
% �� �����������
  	���������_������� = �������(���_�������, �������)
  	���������_����� = �����(���_�����, �������)
  
  	������� = �������*
  	������� = ���������_�������*
  	����� = ���������_�����*

% ���������� ������
  	������� = �������(���_�������, �������); �����(���_�����, �������)
  
  	���������_�������� = ����(���������_�������, ���������_�����)
  	�������� = ���������_��������*
  
CONSTANTS
% ������ ����������� �������
  	���_������� = [�������(����, �������), �������(���, �������), �������(����, �������), �������(���, ���������)]
% ������ ����������� ������
  	���_����� = [�����(���, ���������), �����(������, �������), �����(������, �������), �����(����, �������)]
PREDICATES
  	nondeterm ������_�(���������_��������, ��������)
  	nondeterm ������_�(�������, �������)
  	nondeterm ������_�(���������_�������, �������)
  	nondeterm ������_�(���������_�����, �����)
  
  	nondeterm ���_��������(�������)
  	nondeterm ���_��������(�������)
  	nondeterm ���_��������(�����)
  
  	nondeterm ���������_��������(��������)
  	nondeterm ����_����(�������, �������)
  	nondeterm ����(�������, �������)
  	nondeterm ����_�������_����_�����(��������)
  
  	nondeterm ��������_��������(��������)
CLAUSES
    ������_�(Name, [Name|_]). 
    ������_�(Name, [_|�����]):- 
       	������_�(Name, �����).
       
/*
	���� ����� ������ � ���������� ��� ���� ������:
	https://studassistent.ru/prolog/obedinenie-dvuh-spiskov-bez-povtoreniy-prolog
*/	

% ��� ������� ������� ��� � ���, ��� � ������ ������ ��� ��������
    ���_��������([]).
% ��� ������� �������� ������ ������� � ���������, ������ �� ��� � �����.
% ���� ���, �� ����� ������������ ���������� ��� ��������� ��������� (�����)
% ���� ����, �� �������
    ���_��������([Name|�����]):-
      	NOT(������_�(Name, �����)),
      	���_��������(�����).

% ��������� ��������
    	���������_��������(��������):-
      		������_�(������������, ���_�����), 
      		������_�(������������, ���_�����), 
      		������_�(��������������, ���_�����), 
      		������_�(������������, ���_�����), 
      
      	���_��������([������������, ������������, ��������������, ������������]),
      
% ����� �� �������� �� ����� �������. 
      	NOT(������������ = �����(_, �������)),
      	NOT(������������ = �����(_, �������)),
      	NOT(�������������� = �����(_, ���������)),
      	NOT(������������ = �����(_, �������)),
      
      	�������� = 
      	[
		% ��� ��������� ���� ��� ������ �������
        	����(�������(���, �������),  ������������),
        	����(�������(����, �������),  ������������),
        	����(�������(���, ���������),  ��������������),
        	����(�������(����, �������),  ������������)
       	].
    
% ������� �� ����� �� ������� ������
% �������� "����" ��� ����, ����� ���������� �� ��� ����� �� ������
% � �������� �� ������� "����"
    ����_����(�����(������, �������), �����(���, ���������)).
    ����_����(�������(����, �������), �����(������, �������)).
    ����_����(�����(������, �������), �������(����, �������)).
    ����_����(�������(���, �������), �����(������, �������)).
    ����_����(�����(����, �������), �������(���, �������)).
    ����_����(�������(����, �������), �����(����, �������)).
    ����_����(�������(���, ���������), �������(����, �������)).
    
% �������� �� ����� ��� ������ ��������
% ����� ��� ����� ����������� ������ ��������� ����� "���",
% �� ��� ������� ���������
  	����(����, ����):-
    	����_����(����, ����);
    	����_����(��������, ����), 
    	����(����, ��������).
    
% ���������� true, ���� � ������ ��� ���� ����, ��� ������� ���� �����
  	����_�������_����_�����(��������):-
    	������_�(����(�������(����������, ��������������), �����(��������, ������������)), 
      		��������), 
    	����(�����(��������, ������������), �������(����������, ��������������)).
    
    
% �������� ��������
 	��������_��������(��������):-
   		NOT(����_�������_����_�����(��������)).
GOAL
  	���������_��������(��������),
  	��������_��������(��������).