; ModuleID = 'while.c'
source_filename = "while.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
	%1 = alloca i32 ; allocate memory space for a
	%2 = alloca i32 ; allocate memory space for i
	store i32 10, i32* %1 ; store '10' into space of a
	store i32 0, i32* %2 ; store '0' into space of i
	br label %3
3: ; while(i < 10)
	%4 = load i32, i32* %2 ; fetch value of i into register
	%5 = icmp slt i32 %4, 10 ; compare i with 10
	br i1 %5, label %6, label %10 ;
6: ; while(true)
	%7 = add i32 %4, 1 ; i = i + 1
	%8 = load i32, i32* %1 ; fetch value of a into register
	%9 = add i32 %7, %8 ; a = i + a
	store i32 %7, i32* %2 ; sw to i
	store i32 %9, i32* %1 ; sw to a
	br label %3 ; goto label of while
10: ; while(false)
	%11 = load i32, i32* %1 ; fetch a
	ret i32 %11
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 "}
