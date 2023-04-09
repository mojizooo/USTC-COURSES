#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int max(int a, int b){
	if(a >= b) return a;
	else return b;
}

struct Llist1{
	int *elem;
	int length = 0;
	int point_pos = -1;
	int div_pos;
	int frac_size = 0;
	int listsize = 0;
	double coe;
	int index = 0;
	int sign = 1;
} ;

void print(Llist1 l){
	printf("point_pos:%d\n",l.point_pos);
	printf("length:%d\n",l.length);
	printf("index:%d\n",l.index);
	printf("div_pos=%d\n",l.div_pos);
	printf("frac_size=%d\n",l.frac_size );
	printf("sign=%d\n",l.sign);
	for(int i = 0;i < l.length;i++){
		printf("%d_%d ",i,l.elem[i]);
	}
	putchar(10);
}

void Reverse(Llist1 &l){
	int temp;
	for(int i = 0;i < (l.length / 2);i++){
		temp = l.elem[i];
		l.elem[i] = l.elem[l.length - 1 - i];
		l.elem[l.length - 1 - i] = temp;
	}
}

void InitList1(Llist1 &l, int size){
	l.elem = (int *)malloc(size * sizeof(int));
	memset(l.elem,0,size);
	l.length = 0;
	l.listsize = size;
	l.point_pos = -1;
	l.frac_size = 0;
	l.listsize = 0;
	l.index = 0;
	l.sign = 1;
	l.div_pos = 0;
}

void ReceiveNum(Llist1 &l, char temp[]){
	int length = strlen(temp);
	for(int i = 0;i < length;i++){
		if(temp[i] == '.'){
			l.point_pos = i;
			continue;
		}
		l.elem[l.length++] = temp[i] - '0';
	}
	if(l.point_pos == -1) l.point_pos = l.length;
	l.frac_size = l.length - l.point_pos;
	return ;
}

Llist1 AddNum(Llist1 &l1, Llist1 &l2, int n, int k){
	Llist1 ans;
	InitList1(ans, 200);

	int maxsize = max(l1.frac_size, l2.frac_size);
	int temp1 = 0;
	int temp2 = 0;
	int i1 = l1.point_pos;
	int i2 = l2.point_pos;

	for(int i = 1;i <= maxsize;i++){
		if((l1.point_pos + maxsize - i) >= l1.length) temp1 = 0;
		else temp1 = l1.elem[l1.point_pos + maxsize - i];

		if((l2.point_pos + maxsize - i) >= l2.length) temp2 = 0;
		else temp2 = l2.elem[l2.point_pos + maxsize - i];

		ans.elem[ans.length++] = temp1 + temp2; 
		//printf("%d ", ans.elem[ans.length-1]);
	}

	if(i1 > i2){
		while(i2 > 0){
			ans.elem[ans.length++] = l1.elem[--i1] + l2.elem[--i2];
			//printf("%d ", ans.elem[ans.length-1]);
		}
		while(--i1 >= 0){
			ans.elem[ans.length++] = l1.elem[i1];
			//printf("%d ", ans.elem[ans.length-1]);
		}
	}
	else {
		while(i1 > 0){
			ans.elem[ans.length++] = l1.elem[--i1] + l2.elem[--i2];
			//printf("%d ", ans.elem[ans.length-1]);
		}
		while(--i2 >= 0){
			ans.elem[ans.length++] = l2.elem[i2];
			//printf("%d ", ans.elem[ans.length-1]);
		}
	}

	ans.elem[ans.length] = 0;

	for(int i = 0;i < ans.length;i++){
		if(ans.elem[i] >= k){
			ans.elem[i] -= k;
			ans.elem[i + 1]++; 
		}
		//printf("%d ", ans.elem[i]);
	}

	if(ans.elem[ans.length]) ans.length++;

	/*for(int i = ans.length - 1;i >= 0;i--){
		if(i + 1 == maxsize) putchar('.');
		printf("%d", ans.elem[i]);
	}
	if(maxsize == 0 && n != 0) putchar('.');
	for(int i = 0;i < (n - maxsize);i++){
		putchar('0');
	}*/

	Reverse(ans);

	ans.point_pos = ans.length - maxsize;

	ans.frac_size = ans.length - ans.point_pos;

	return ans;
}

Llist1 MinusNum(Llist1 l1, Llist1 l2, int n, int k){
	Llist1 ans;
	InitList1(ans, 200);

	int maxsize = max(l1.frac_size, l2.frac_size);
	int temp1 = 0;
	int temp2 = 0;
	int i1 = l1.point_pos;
	int i2 = l2.point_pos;

	for(int i = 1;i <= maxsize;i++){
		if((l1.point_pos + maxsize - i) >= l1.length) temp1 = 0;
		else temp1 = l1.elem[l1.point_pos + maxsize - i];

		if((l2.point_pos + maxsize - i) >= l2.length) temp2 = 0;
		else temp2 = l2.elem[l2.point_pos + maxsize - i];

		ans.elem[ans.length++] = temp1 - temp2; 
		//printf("%d ", ans.elem[ans.length-1]);
	}

	if(i1 > i2){
		while(i2 > 0){
			ans.elem[ans.length++] = l1.elem[--i1] - l2.elem[--i2];
			//printf("%d_%d ", ans.length-1,ans.elem[ans.length-1]);
		}
		while(--i1 >= 0){
			ans.elem[ans.length++] = l1.elem[i1];
			//printf("%d_%d ", ans.length - 1,ans.elem[ans.length-1]);
		}
	}
	else {
		while(i1 > 0){
			ans.elem[ans.length++] = l1.elem[--i1] - l2.elem[--i2];
			//printf("%d_%d ", ans.length - 1,ans.elem[ans.length-1]);
		}
		while(--i2 >= 0){
			ans.elem[ans.length++] = - l2.elem[i2];
			//printf("%d_%d ", ans.length - 1,ans.elem[ans.length-1]);
		}
	}

	ans.elem[ans.length] = 0;

	int temp = 0;

	for(int i = ans.length - 1;i >= 0;i--){
		if(!ans.elem[i]) continue;
		else {
			temp = ans.elem[i];
			break;
		}
	}

	if(temp < 0){
		ans.sign = 0;
		for(int i = 0;i <= ans.length - 1;i++){
			if(ans.elem[i] < 0){
				ans.elem[i] = -ans.elem[i];
			}
			else if(ans.elem[i] > 0){
				ans.elem[i] = k - ans.elem[i];
				ans.elem[i + 1]++; 
			}
			//printf("%d_%d ",i, ans.elem[i]);
		}
		//if(ans.elem[ans.length - 1] == 0) putchar('-');
	}

	else {
		for(int i = 0;i < ans.length - 1;i++){
			if(ans.elem[i] < 0){
				ans.elem[i] += k;
				ans.elem[i + 1]--;
			}
			//printf("%d ", ans.elem[i]);
		}
	}



	/*for(int i = ans.length - 1;i >= 0;i--){
		if(i + 1 == maxsize) putchar('.');
		printf("%d", ans.elem[i]);
	}
	if(maxsize == 0 && n != 0) putchar('.');
	for(int i = 0;i < (n - maxsize);i++){
		putchar('0');
	}*/

	ans.point_pos = ans.length - maxsize;

	ans.frac_size = ans.length - ans.point_pos;

	Reverse(ans);

	return ans;
}

Llist1 MultiplyNum(Llist1 &l1, Llist1 &l2, int n, int k){
	Llist1 ans;
	InitList1(ans, 1000 );

	int maxsize = l1.frac_size + l2.frac_size;
	int i1 = l1.length;
	int i2 = l2.length;

	for(int i = 0;i < (i1 * i2);i++){
		ans.elem[i] = 0;
	}
	for(int i = i2 - 1;i >= 0;i--){
		for(int j = i1 - 1;j >= 0;j--){
			ans.elem[i + j] += (l1.elem[j]) * (l2.elem[i]);
		}
	}

	ans.length = i1 + i2 -1;

	for(int i = ans.length - 1;i > 0;i--){
		if(ans.elem[i] >= k){
			ans.elem[i - 1] += ans.elem[i] / k;
			ans.elem[i] %= k; 
		}
		//printf("%d_%d ", i, ans.elem[i]);
	}

	//printf("0_%d ",ans.elem[0]);

	/*for(int i = 0;i < ans.length;i++){
		if(!ans.elem[i] && (ans.length - i) > maxsize + 1) continue;
		if((ans.length - i) == maxsize) putchar('.');
		printf("%d", ans.elem[i]);
	}
	if(maxsize == 0 && n != 0) putchar('.');
	for(int i = 0;i < (n - maxsize);i++){
		putchar('0');
	}*/

	if(ans.elem[0] >= k){
		for(int i = ans.length;i>0;i--){
			ans.elem[i] = ans.elem[i - 1];
		}
		ans.elem[1] %= k;
		ans.elem[0] /= k;
		ans.length++;
	}

	ans.point_pos = ans.length - maxsize;

	ans.frac_size = ans.length - ans.point_pos;

	return ans;
}

Llist1 trans_to_N(Llist1 &l, int N, int n){
	Llist1 ans;
	InitList1(ans, 100);

	int int_num = 0;

	for(int i = 0;i < l.point_pos;i++){
		int_num += l.elem[i] * pow(10, l.point_pos - 1 - i);
	}

	while(int_num > (N - 1)){
		ans.elem[ans.length++] = int_num % N;
		int_num /= N;
	}

	ans.elem[ans.length++] = int_num;
	ans.point_pos = ans.length;

	if(l.point_pos >= l.length){
		return ans;
	}

	Llist1 temp;
	InitList1(temp, 100);
	temp.elem[0] = 0;
	temp.point_pos = 1;
	temp.length = 1;
	
	for(int i = l.point_pos;i < l.length;i++){
		temp.elem[temp.length++] = l.elem[i];
		//printf("%d ",temp.elem[temp.length - 1]);
	}

	temp.frac_size = temp.length - temp.point_pos;

	Llist1 temp_N;
	InitList1(temp_N, 3);
	temp_N.elem[0] = N;
	temp_N.point_pos = 1;
	temp_N.length = 1;
	temp_N.frac_size = 0;

	temp = MultiplyNum(temp, temp_N, n, 10);

	int i = 0;

	while(1){
		if(temp.elem[0]){
			ans.elem[ans.length++] = temp.elem[0];
			temp.elem[0] = 0;
			if(ans.length - ans.point_pos == n) break;
			for(int i = 1;temp.elem[i];i++);
			if(i == temp.length - 1) break;
		}
		else {
			ans.elem[ans.length++] = 0;
			if(ans.length - ans.point_pos == n) break;
		}
		temp = MultiplyNum(temp, temp_N, n, 10);
	}

	for(int i = ans.point_pos - 1;i >= 0;i--){
		printf("%d", ans.elem[i]);
	}

	putchar('.');

	for(int i = ans.point_pos;i < ans.length;i++){
		printf("%d", ans.elem[i]);
	}

	return ans;
}

void ReceivePoly(Llist1 *l){
	char temp[1010] = "";
	char _coe[100] = "";
	scanf("%s",temp);
	int j = 0;
	double coe_num1;
	double coe_num2;
	InitList1(l[0], 100);
	for(int i = 0;temp[i];i++){
		InitList1(l[j+1],100);
		if(temp[i] == 'x'){
			//print(l[j]);
			if(temp[i+1]!='^') l[j].index = 1;
			if(l[j].length) continue;
			else {
				_coe[0] = '1';
				ReceiveNum(l[j], _coe);
				//print(l[j]);
				continue;
			}
		}

		if(temp[i] == '*'){
			//print(l[j]);
			if(l[j].div_pos > 0){
				for(int i = 0;i < l[j].div_pos;i++){
					coe_num1 += l[j].elem[i] * pow(10, l[j].div_pos - 1 - i);
				}
				for(int i = l[j].div_pos;i < l[j].length;i++){
					coe_num2 += l[j].elem[i] * pow(10, l[j].length - 1 - i);
					printf("%lf\n",coe_num2);
				}
				printf("coe1=%lf,coe2=%lf\n",coe_num1,coe_num2);
				sprintf(_coe, "%lf", coe_num1 / coe_num2);
				puts(_coe);
				l[j].length = 0;
				ReceiveNum(l[j], _coe);
				coe_num2 = 0;
				coe_num1 = 0;
				continue;
			}
			else if(l[j].point_pos > 0){
				for(int i = 0;i < l[j].point_pos;i++){
					l[j].coe += l[j].elem[i] * pow(10, l[j].point_pos - 1 - i);
					//printf("%lf\n",l[j].coe);
				}
				for(int i = l[j].point_pos;i < l[j].length;i++){
					l[j].coe += l[j].elem[i] / pow(10, i - l[j].point_pos + 1);
					//printf("%d 	%lf\n",l[j].elem[i],l[j].coe);
				}
				//printf("%lf\n",l[j].coe);
				sprintf(_coe, "%lf", l[j].coe);
				l[j].length = 0;
				ReceiveNum(l[j], _coe);
				continue;
			}
			else {
				l[j].point_pos = l[j].length;
				continue;
			}
		}
		if(temp[i] == '/'){
			l[j].div_pos = l[j].length;
			continue;
		}
		if(temp[i] == '.'){
			l[j].point_pos = l[j].length;
			continue;
		}
		if(temp[i] == '^'){
			l[j].index = 0;
			int i_ = i + 1;
			while((temp[i_]!='+')&&(temp[i_]!='-')&&temp[i_]){
				i_++;
			}
			for(int m = i + 1;m < i_;m++){
				l[j].index += (temp[m] - '0') * pow(10, i_ - m - 1);
			}
			i = i_ - 1;
			//print(l[j]);
			continue;
		}
		if(temp[i] == '-'){
			//if(l[j].point_pos < 0) l[j].point_pos = l[j].length;
			if(!i){
				l[j].sign = 0;
				continue;
			}
			j++;
			InitList1(l[j], 100);
			l[j].sign = 0;
			continue;
		}
		if(temp[i] == '+'){
			if(l[j].point_pos < 0) l[j].point_pos = l[j].length;
			j++;
			InitList1(l[j], 100);
			//print(l[j]);
			continue;
		}
		l[j].elem[l[j].length++] = temp[i] - '0';
		//print(l[j]);
	}
	if(l[j].point_pos < 0) l[j].point_pos = l[j].length;
	l[j].frac_size = l[j].length - l[j].point_pos;
}

Llist1 ComputePoly(Llist1 *l, int n, char x[], int k){
	Llist1 ans_x;
	InitList1(ans_x, 100);
	Llist1 res = l[0];
	//print(res);
	Llist1 temp;
	InitList1(temp, 100);
	ReceiveNum(ans_x, x);
	print(ans_x);
	for(int i = 0;l[i].length;i++){
		print(l[i]);
		if(!l[i].index) temp = l[i];
		else {
			temp = ans_x;
			for(int j = 1;j < l[i].index;j++){
				temp = MultiplyNum(temp, ans_x, n, k);
				//print(temp);
			}
			temp = MultiplyNum(l[i], temp, n, k);
			temp.sign = l[i].sign;
			print(temp);
		}
		if(!i){
			temp.sign = res.sign;
			res = temp;
			continue;
		}
		if(temp.sign == res.sign){
			res = AddNum(res, temp, n, k);
			res.sign = temp.sign;
			puts("res:");
			print(res);
		}
		else{
			if(!temp.sign){
				res = MinusNum(res, temp, n, k); 
			}
			else res = MinusNum(temp, res, n, k);
		}
	}
	return res;
}

int main(int argc, char const *argv[])
{
	Llist1 Res;
	char a[1000] = "";
	int system;
	int precision;
	puts("input the system");
	scanf("%d", &system);
	puts("input the precision");
	scanf("%d", &precision);
	//scanf("%s",a);
	//ReceiveNum(l1, a);
	//scanf("%s",a);
	//ReceiveNum(l2, a);
	//MultiplyNum(l1,l2,5,10);
	//putchar(10);
	//trans_to_N(l1,2,5);
	Llist1 *l;
	l = (Llist1 *)malloc(100 * sizeof(Llist1));
	puts("input the poly:");
	ReceivePoly(l);
	puts("input the x:");
	scanf("%s",a);
	Res = ComputePoly(l, precision, a, system);
	if(!Res.sign) putchar('-');
	int pos_0 = 0;
	for(int i = 0;!Res.elem[i] && i < Res.point_pos - 1;i++) pos_0 = i;
	for(int i = pos_0;i < Res.length;i++){
		if(i == Res.point_pos) putchar('.');
		printf("%d", Res.elem[i]);
	}
	if(Res.frac_size == 0) putchar('.');
	for(int i = 0;i < (precision - Res.frac_size);i++){
		putchar('0');
	}
	puts("\ntrans to N_system:");
	scanf("%d",&system);
	Res = trans_to_N(Res, system,precision);
	putchar(10);
	print(Res);
	return 0;
}