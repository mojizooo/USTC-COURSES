/*
	输入：
	1 
	ABCD EFGH even 
	ABCI EFJK up 
	ABIJ EFGH even 
	输出：
	K is the counterfeit coin and it is light. 
*/

bool isHeavy(char x)
{ //判断硬币x是否为重的代码
  int i;
  for(i=0; i<3; i++)   // 判断是否与三次称量结果矛盾
     switch( result[i][0] ) {
       case 'u': if( ! inLeft(i,x) )  return false;
                      break;
       case 'e': if(inRight(i,x) || inLeft(i,x))  return false;
                      break;
       case 'd': if(! inRight(i,x))  return false;
                      break;
      }
   return true;
}

bool inLeft(int i, char x){ 
// 判断硬币x 是否在第i次称量左侧
	 return strchr( left[i],x);
}

bool inRight(int i, char x){
// 判断硬币x 是否在第i次称量右侧
	return strchr(right[i],x);
}
