; ModuleID = 'probe3.3a1fbbbh-cgu.0'
source_filename = "probe3.3a1fbbbh-cgu.0"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; core::num::<impl u32>::reverse_bits
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @"_ZN4core3num21_$LT$impl$u20$u32$GT$12reverse_bits17hdd338cb99af1944cE"(i32 %self) unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  %1 = call i32 @llvm.bitreverse.i32(i32 %self)
  store i32 %1, i32* %0, align 4
  %2 = load i32, i32* %0, align 4
  br label %bb1

bb1:                                              ; preds = %start
  ret i32 %2
}

; probe3::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN6probe35probe17hb3a8df3a445c2852E() unnamed_addr #1 {
start:
; call core::num::<impl u32>::reverse_bits
  %_1 = call i32 @"_ZN4core3num21_$LT$impl$u20$u32$GT$12reverse_bits17hdd338cb99af1944cE"(i32 1)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.bitreverse.i32(i32) #2

attributes #0 = { inlinehint nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #1 = { nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #2 = { nounwind readnone speculatable }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
