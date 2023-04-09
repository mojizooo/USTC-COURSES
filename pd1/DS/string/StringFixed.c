#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 100
typedef struct
{
	char elem[SIZE];
	int length;
	int next[SIZE];
	int nextval[SIZE];
} String;

void print_String(String s)
{
	for(int i = 0;i < s.length;i++){
		printf("%c", s.elem[i]);
	}
	putchar(10);
}

int init_String(String &s)
{
	s.length = 0;
	memset(s.elem, '/0', SIZE*sizeof(char));
	memset(s.nextval, 0, SIZE*sizeof(int));
	memset(s.next, 0, SIZE*sizeof(int));
}

void receive_String(String &s)
{
	scanf("%s", s.elem);
	s.length = strlen(s.elem);
}

void clear_String(String &s)
{
	memset(s.elem, '\0', SIZE*sizeof(char));
	s.length = 0;
	memset(s.next, 0, SIZE*sizeof(int));
	memset(s.nextval, 0, SIZE*sizeof(int));
}

void destroy_String(String &s)
{
	clear_String(s);
	free(&s);
}

int Stringlen(String s)
{
	return s.length;
}

void print(String &s)
{
	puts(s.elem);
	for (int i = 0; i < s.length; i++)
	{
		printf("%d  ", s.next[i]);
	}
	putchar(10);
	for (int i = 0; i < s.length; i++)
	{
		printf("%d  ", s.nextval[i]);
	}
}

void init_next(String &s)
{
	int j = 0, k = -1;
	s.next[0] = -1;
	while (j < s.length - 1)
	{
		if (k == -1 || s.elem[k] == s.elem[j])
		{
			s.next[++j] = ++k;
		}
		else
		{
			k = s.next[k];
		}
	}
}

void init_nextval(String &s)
{
	int j = 0, k = -1;
	s.nextval[0] = -1;
	while (j < s.length - 1)
	{
		if (k == -1 || s.elem[k] == s.elem[j])
		{
			j++;
			k++;
			if (s.elem[j] != s.elem[k])
			{
				s.nextval[j] = k;
			}
			else
				s.nextval[j] = s.nextval[k];
		}
		else
		{
			k = s.nextval[k];
		}
	}
}

int match_KMP(String s, String t, int begin)
{
	if (s.length < t.length)
		return -1;
	init_nextval(t);
	int i = begin, j = 0;
	while (i < s.length && j < t.length)
	{
		if (s.elem[i] == t.elem[j])
		{
			i++;
			j++;
		}
		else if (t.nextval[j] == -1)
			i++, j = 0;
		else
			j = t.nextval[j];
	}
	if (j == t.length)
		return i - j;
	else
		return -1;
}

String Get_SubString(String s, int begin, int len)
{
	String sub;
	init_String(sub);
	if (begin < 0 || begin + len > s.length || len < 0)
	{
		printf("illegal\n");
		return sub;
	}
	int i = 0, j = begin;
	for (; i < len; i++, j++)
	{
		sub.elem[i] = s.elem[j];
	}
	sub.length = len;
	return sub;
}

void String_Insert(String &s, String t, int begin)
{
	char *m;
	m = (char *)malloc(SIZE * sizeof(char));
	memset(m, '\0', SIZE * sizeof(char));
	for (int i = 0; i < begin; i++)
	{
		m[i] = s.elem[i];
	}
	for (int i = 0; i < t.length; i++)
	{
		m[begin + i] = t.elem[i];
	}
	for (int i = begin; i < s.length; i++)
	{
		m[i + t.length] = s.elem[i];
	}
	int j = strlen(m);
	clear_String(s);
	for(int i = 0;i < j;i++){
		s.elem[i] = m[i];
	}
	s.length = strlen(m);
	s.elem[s.length] = '\0';
	free(m);
}

void String_Del(String &s, String t, int begin)
{
	char *m;
	m = (char *)malloc(SIZE * sizeof(char));
	memset(m, '\0', SIZE * sizeof(char));
	for (int i = 0; i < begin; i++)
	{
		m[i] = s.elem[i];
	}
	for (int i = begin + t.length; i < s.length; i++)
	{
		m[i - t.length] = s.elem[i];
	}
	int j = strlen(m);
	clear_String(s);
	for(int i = 0;i < j;i++){
		s.elem[i] = m[i];
	}
	s.length = strlen(m);
	s.elem[s.length] = '\0';
	free(m);
}

void Replace_String(String &s, String t, String v)
{
	int i = 0;
	while (i + t.length <= s.length)
	{
		i = match_KMP(s, t, i);
		if (i == -1)
		{
			puts("can't find");
			return;
		}
		else
		{
			String_Del(s, t, i);
			String_Insert(s, v, i);
			i += v.length;
			continue;
		}
	}
}

void Concat_Str(String &s, String t)
{
	for (int i = 0; i < t.length; i++)
	{
		s.elem[i + s.length] = t.elem[i];
	}
	s.length += t.length;
}

void reverse(String &s)
{
	char temp;
	for (int i = 0; i < s.length / 2; i++)
	{
		temp = s.elem[i];
		s.elem[i] = s.elem[s.length - i - 1];
		s.elem[s.length - 1 - i] = temp;
	}
}

int compare(String s, String t)
{
	if (s.length && t.length)
	{
		int i;
		for (i = 0; (s.elem[i] != t.elem[i]) && (i < s.length) && (i < t.length); i++)
			;
		return s.elem[i] - t.elem[i];
	}
	if (!s.length && t.length)
	{
		return t.elem[0];
	}
	if (!t.length && s.length)
	{
		return s.elem[0];
	}
	return 0;
}

int main(int argc, char const *argv[])
{
	String s;
	int a;
	init_String(s);
	puts("your main string:");
	receive_String(s);
	init_next(s);
	init_nextval(s);
	print_String(s);
	while (1)
	{
		printf("1 - Strlength\n2 - KMP\n3 - SubString\n4 - Replace\n5 - print\n6 - Concat\n7 - Clear\n8 - Destroy\n9 - exit\n");
		scanf("%d", &a);
		int res, begin, len;
		String sub, t, v;
		switch (a)
		{
		case 1:
			printf("current length is %d\n", Stringlen(s));
			break;
		case 2:
			puts("please input the target string:");
			init_String(t);
			receive_String(t);
			res = match_KMP(s, t, 0);
			if (res < 0)
				puts("can't be found");
			else
				printf("the pos begins at %d\n", res);
			break;
		case 3:
			puts("your begin pos:");
			scanf("%d", &begin);
			puts("your target length:");
			scanf("%d", &len);
			sub = Get_SubString(s, begin, len);
			print_String(sub);
			break;
		case 4:
			init_String(t);
			init_String(v);
			puts("your substring:");
			receive_String(v);
			puts("string you want to replace:");
			receive_String(t);
			Replace_String(s, t, v);
			print_String(s);
			puts("");
			break;
		case 5:
			print(s);
			puts("");
			break;
		case 6:
			init_String(v);
			puts("string you want to concat:");
			receive_String(v);
			Concat_Str(s, v);
			print_String(s);
			puts("");
			break;
		case 7:
			clear_String(s);
			break;
		case 8:
			destroy_String(s);
			break;
		case 9:
			exit(0);
		default:
			break;
		}
	}
	return 0;
}
