#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<conio.h>
#include<string.h>
#define M struct member
M*h;
int six,five,four,three,i,j,x,source=60000,SIX=0,FIVE=0,FOUR=0,THREE=0;
float p1=0.02,times=0,r=0;
int tenth(M*h);
int single(M *f);
void clear(); 
void pre();
void check();
void checkp();
void change();
M* in(M*h,M*x); 
M* begin(FILE *f); 
void count(M*h);
void end(M*h,FILE *f);
struct member{
	char name[20];
	int star;
	struct member*next;
};
main( ) {
	int menu;
	time_t t;
	srand((unsigned) time(&t));
	FILE *f;
    for(;;) {
	    printf("\n         ************   抽卡模拟器  ************\n\n");
        printf("           0 -- 退出                   1 -- 清屏\n");
        printf("           2 -- 开始                   3 -- 十连\n");
        printf("           4 -- 单抽                   5 -- 查看当前出率\n") ;
        printf("           6 -- 调整干员出率           7 -- 加入新干员\n") ;
        printf("           8 -- 查看当前合成玉数量     9 -- 清零\n") ;
        printf("           10 -- 查看当前干员数量      11 -- 统计\n") ;
        printf("\n         ***************************************\n\n");
        printf("          选择主菜单：");
        scanf("%d",&menu);
        switch(menu) {
	    case 0: 
	       end(h,f);
           return 0;   //结束 
        case 1:
	       system("cls");  //stdlib.h中的库函数，可以直接调用实现清屏
           break;
        case 9: 
           clear();break;
        case 3:
	       tenth(h);break;
        case 4:
	       single(h);break;
		case 5:
	        checkp();break;
	    case 6:
	    	change();break;
	    case 7:{
	    	int xd=1;
	    	while(xd!=0){
	    	M*x;
			x=(M*)malloc(sizeof(M)); 
	    	puts("请输入新干员的名字和星级：");
	        scanf("%s %d",x->name,&x->star);
	    	h=in(h,x);
	    	printf("是否继续输入？"); 
	    	scanf("%d",&xd);
			}
			break;
		}
	    case 8:
		    pre();break;
		case 2:
		    h=begin(f);break; 
		case 10:
		    count(h);
		    printf("           六星有：%d,五星有: %d,四星有：%d,三星有：%d\n",six,five,four,three);break;
        case 11:
        	check();break;
		default: break;
		}  //end switch
	} //end for
    return 0; 
} //end main
int tenth(M *h){
	if(source<6000){
		putchar(10); 
		printf("在？没玉了还搁这十连呢？\n");
		return 0;
	}
	M*p=h;
	for(j=0;j<10;j++) single(p);
	return 0;

}
int single(M *f){
	if(source<600){
		putchar(10); 
		printf("在？没玉了还搁这抽卡呢？\n");
		return 0; 
	}
	int t,n,flag=0;
	M *p=f; 
	count(h);
	t=rand() % 10000;
	if(t<10000*p1){
		SIX++;
		flag=1;r=times+1;
		i=0;
		n=rand() % six;
		while(p!=NULL){
		if(p->star==6) break;
		p=p->next; 	
		}
		while(p!=NULL&&i<n){
			p=p->next;
			i++;
		}
		putchar(10);
		printf("   %s\n",p->name);
		printf("   -------------\n");
		printf("   ★★★★★★");
		getch();
	}
	else if(t<10000*(0.92*p1+0.08)){
		FIVE++;
		i=0;
		p=f;
		n=rand() % five;
		while(p!=NULL){
		if(p->star==5) break;
		p=p->next; 	
		}
		while(p!=NULL&&i<n){
			p=p->next;
			i++;
		}
		putchar(10);
		printf("   %s\n",p->name);
		printf("   -----------\n");
		printf("   ★★★★★\n");
		getch();
	}
	else if(t<10000*(0.92*p1+0.48)){
		FOUR++;
		i=0;
		p=f;
		n=rand() % four;
		while(p!=NULL){
		if(p->star==4) break;
		p=p->next; 	
		}
		while(p!=NULL&&i<n){
			p=p->next;
			i++;
		}
		putchar(10);
		printf("   %s\n",p->name);
		printf("   ---------\n");
		printf("   ★★★★\n");
		getch();
	} 
	else{
		THREE++;
		i=0;
		p=f;
		n=rand() % three;
		while(p!=NULL){
		if(p->star==3) break;
		p=p->next; 	
		}
		while(p!=NULL&&i<n){
			p=p->next;
			i++;
		}
		putchar(10);
		printf("   %s\n",p->name);
		printf("   ---------\n");
		printf("   ★★★\n");
		getch();
	}
	putchar(10);
	++times;
	if((times-r)>=50&&flag==0) p1=0.02+0.02*(times-50-r); 
	if(flag==1) p1=0.02;
	source=60000-times*600;
	return 0;
}
void clear(){
	times=SIX=FIVE=FOUR=THREE=0;
	source=60000;
}
void pre(){
	putchar(10);
	printf("           您当前还有  %d  合成玉",source);
	putchar(10);
} 
M *in(M *h,M*x){
	M*t,*q;
	if(h==NULL){
		h=x;return h;
	}
	if(h->star>=x->star){
		x->next=h;
		h=x;
		return h;
	}
	t=q=h;
    while(t!=NULL&&t->star<=x->star){
		q=t;t=t->next; 
	}
	q->next=x;
	x->next=t;
	return h;	
} 
M *begin(FILE *f){
	f=fopen("membership","r+");
	M*h,*p,*q,*t;
	h=NULL;
	while(!feof(f)){
		p=(M*)malloc(sizeof(M));
		if(fread(p,sizeof(M),1,f)!=1) break;
		if(h==NULL) h=p;
		else q->next=p;
		q=p;
	} 
	q->next=NULL;
	fclose(f);
	return h;
}
void count(M*h){
	M*p=h;
	six=five=four=three=0;
	while(p!=NULL){
		if(p->star==6) six++;
		if(p->star==5) five++;
		if(p->star==4) four++;
		if(p->star==3) three++;
		p=p->next;
	}
}
void check(){
	putchar(10);
	printf("您当前已抽：%d发，已出六星：%d，五星：%d，四星：%d，三星：%d\n",(int)times,SIX,FIVE,FOUR,THREE);
}
void checkp(){
	printf("当前六星出率：%f",p1);
}
void change(){
	exit(0);
}
void end(M*h,FILE *f){
	M*p=h;
	f=fopen("membership","r+");
	while(p!=NULL){
		fwrite(p,sizeof(M),1,f);
		p=p->next;
	}
	fclose(f);
} 