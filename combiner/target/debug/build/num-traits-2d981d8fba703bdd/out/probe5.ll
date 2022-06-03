; ModuleID = 'probe5.3a1fbbbh-cgu.0'
source_filename = "probe5.3a1fbbbh-cgu.0"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"core::panic::Location" = type { [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }

@alloc4 = private unnamed_addr constant <{ [72 x i8] }> <{ [72 x i8] c"/rustc/49cae55760da0a43428eba73abcb659bb70cf2e4/src/libcore/ops/arith.rs" }>, align 1
@alloc5 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [72 x i8] }>, <{ [72 x i8] }>* @alloc4, i32 0, i32 0, i32 0), [16 x i8] c"H\00\00\00\00\00\00\00\AE\02\00\003\00\00\00" }>, align 8
@str.0 = internal constant [28 x i8] c"attempt to add with overflow"
@alloc1 = private unnamed_addr constant <{ [4 x i8] }> <{ [4 x i8] c"\02\00\00\00" }>, align 4
@0 = private unnamed_addr constant <{ i8*, [0 x i8] }> <{ i8* getelementptr inbounds (<{ [4 x i8] }>, <{ [4 x i8] }>* @alloc1, i32 0, i32 0, i32 0), [0 x i8] zeroinitializer }>, align 8

; <i32 as core::ops::arith::AddAssign>::add_assign
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @"_ZN51_$LT$i32$u20$as$u20$core..ops..arith..AddAssign$GT$10add_assign17h96fd1cfba1c278cdE"(i32* align 4 dereferenceable(4) %self, i32 %other) unnamed_addr #0 {
start:
  %0 = load i32, i32* %self, align 4
  %1 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %0, i32 %other)
  %_4.0 = extractvalue { i32, i1 } %1, 0
  %_4.1 = extractvalue { i32, i1 } %1, 1
  %2 = call i1 @llvm.expect.i1(i1 %_4.1, i1 false)
  br i1 %2, label %panic, label %bb1

bb1:                                              ; preds = %start
  store i32 %_4.0, i32* %self, align 4
  ret void

panic:                                            ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h57854ec308e1f8abE([0 x i8]* noalias nonnull readonly align 1 bitcast ([28 x i8]* @str.0 to [0 x i8]*), i64 28, %"core::panic::Location"* noalias readonly align 8 dereferenceable(24) bitcast (<{ i8*, [16 x i8] }>* @alloc5 to %"core::panic::Location"*))
  unreachable
}

; <i32 as core::ops::arith::AddAssign<&i32>>::add_assign
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @"_ZN66_$LT$i32$u20$as$u20$core..ops..arith..AddAssign$LT$$RF$i32$GT$$GT$10add_assign17h3fa5a4be742dd4abE"(i32* align 4 dereferenceable(4) %self, i32* noalias readonly align 4 dereferenceable(4) %other) unnamed_addr #0 {
start:
  %_5 = load i32, i32* %other, align 4
; call <i32 as core::ops::arith::AddAssign>::add_assign
  call void @"_ZN51_$LT$i32$u20$as$u20$core..ops..arith..AddAssign$GT$10add_assign17h96fd1cfba1c278cdE"(i32* align 4 dereferenceable(4) %self, i32 %_5)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; probe5::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN6probe55probe17h9ba083aad1f74ab2E() unnamed_addr #1 {
start:
  %x = alloca i32, align 4
  store i32 1, i32* %x, align 4
  %_5 = load i32*, i32** bitcast (<{ i8*, [0 x i8] }>* @0 to i32**), align 8, !nonnull !2
; call <i32 as core::ops::arith::AddAssign<&i32>>::add_assign
  call void @"_ZN66_$LT$i32$u20$as$u20$core..ops..arith..AddAssign$LT$$RF$i32$GT$$GT$10add_assign17h3fa5a4be742dd4abE"(i32* align 4 dereferenceable(4) %x, i32* noalias readonly align 4 dereferenceable(4) %_5)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #2

; Function Attrs: nounwind readnone
declare i1 @llvm.expect.i1(i1, i1) #3

; core::panicking::panic
; Function Attrs: cold noinline noreturn nonlazybind uwtable
declare void @_ZN4core9panicking5panic17h57854ec308e1f8abE([0 x i8]* noalias nonnull readonly align 1, i64, %"core::panic::Location"* noalias readonly align 8 dereferenceable(24)) unnamed_addr #4

attributes #0 = { inlinehint nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #1 = { nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { nounwind readnone }
attributes #4 = { cold noinline noreturn nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{}
