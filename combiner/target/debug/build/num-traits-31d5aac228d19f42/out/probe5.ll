; ModuleID = 'probe5.3a1fbbbh-cgu.0'
source_filename = "probe5.3a1fbbbh-cgu.0"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"core::panic::Location" = type { [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }

@alloc0 = private unnamed_addr constant <{ [70 x i8] }> <{ [70 x i8] c"/rustc/49cae55760da0a43428eba73abcb659bb70cf2e4/src/libcore/num/mod.rs" }>, align 1
@alloc1 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [70 x i8] }>, <{ [70 x i8] }>* @alloc0, i32 0, i32 0, i32 0), [16 x i8] c"F\00\00\00\00\00\00\00t\0F\00\00\11\00\00\00" }>, align 8
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"

; core::num::<impl u32>::div_euclid
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hcf3195b138a75e21E"(i32 %self, i32 %rhs) unnamed_addr #0 {
start:
  %_5 = icmp eq i32 %rhs, 0
  %0 = call i1 @llvm.expect.i1(i1 %_5, i1 false)
  br i1 %0, label %panic, label %bb1

bb1:                                              ; preds = %start
  %1 = udiv i32 %self, %rhs
  ret i32 %1

panic:                                            ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h57854ec308e1f8abE([0 x i8]* noalias nonnull readonly align 1 bitcast ([25 x i8]* @str.0 to [0 x i8]*), i64 25, %"core::panic::Location"* noalias readonly align 8 dereferenceable(24) bitcast (<{ i8*, [16 x i8] }>* @alloc1 to %"core::panic::Location"*))
  unreachable
}

; probe5::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN6probe55probe17h9ba083aad1f74ab2E() unnamed_addr #1 {
start:
; call core::num::<impl u32>::div_euclid
  %_1 = call i32 @"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hcf3195b138a75e21E"(i32 1, i32 1)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; Function Attrs: nounwind readnone
declare i1 @llvm.expect.i1(i1, i1) #2

; core::panicking::panic
; Function Attrs: cold noinline noreturn nonlazybind uwtable
declare void @_ZN4core9panicking5panic17h57854ec308e1f8abE([0 x i8]* noalias nonnull readonly align 1, i64, %"core::panic::Location"* noalias readonly align 8 dereferenceable(24)) unnamed_addr #3

attributes #0 = { inlinehint nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #1 = { nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #2 = { nounwind readnone }
attributes #3 = { cold noinline noreturn nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
