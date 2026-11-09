004bb4ac ff8307d1 sub sp,sp,#0x1e0
004bb4b0 fd7b18a9 stp x29,x30,[sp, #0x180]
004bb4b4 fc6f19a9 stp x28,x27,[sp, #0x190]
004bb4b8 fa671aa9 stp x26,x25,[sp, #0x1a0]
004bb4bc f85f1ba9 stp x24,x23,[sp, #0x1b0]
004bb4c0 f6571ca9 stp x22,x21,[sp, #0x1c0]
004bb4c4 f44f1da9 stp x20,x19,[sp, #0x1d0]
004bb4c8 f80300aa mov x24,x0
004bb4cc f70302aa mov x23,x2
004bb4d0 f60301aa mov x22,x1
004bb4d4 f30300aa mov x19,x0
004bb4d8 f50308aa mov x21,x8
004bb4dc e10b04a9 stp x1,x2,[sp, #0x40]
004bb4e0 080f4af8 ldr x8,[x24, #0xa0]!
004bb4e4 00410091 add x0,x8,#0x10
004bb4e8 f80b00f9 str x24,[sp, #0x10]
004bb4ec 346fff97 bl 0x004971bc
004bb4f0 1c0340f9 ldr x28,[x24]
004bb4f4 f903002a mov w25,w0
004bb4f8 08018052 mov w8,#0x8
004bb4fc ffa305a9 stp xzr,x8,[sp, #0x58]
004bb500 fc2b00f9 str x28,[sp, #0x50]
004bb504 ff3700f9 str xzr,[sp, #0x68]
004bb508 e8c30291 add x8,sp,#0xb0
004bb50c 00048052 mov w0,#0x20
004bb510 c7130094 bl 0x004c042c
004bb514 e10347ad ldp q1,q0,[sp, #0xe0]
004bb518 e9c30291 add x9,sp,#0xb0
004bb51c e88340f9 ldr x8,[sp, #0x100]
004bb520 f42900f0 adrp x20,0x9fa000
004bb524 000e8052 mov w0,#0x70
004bb528 01018052 mov w1,#0x8
004bb52c 20318b3c stur q0,[x9, #0xb3]
004bb530 e00b46ad ldp q0,q2,[sp, #0xc0]
004bb534 21318a3c stur q1,[x9, #0xa3]
004bb538 e12fc03d ldr q1,[sp, #0xb0]
004bb53c 28310cf8 stur x8,[x9, #0xc3]
004bb540 28008052 mov w8,#0x1
004bb544 2231893c stur q2,[x9, #0x93]
004bb548 030d084e dup v3.2D,x8
004bb54c 2031883c stur q0,[x9, #0x83]
004bb550 2131873c stur q1,[x9, #0x73]
004bb554 e10349ad ldp q1,q0,[sp, #0x120]
004bb558 ffc300b9 str wzr,[sp, #0xc0]
004bb55c ff130339 strb wzr,[sp, #0xc4]
004bb560 2151813c stur q1,[x9, #0x15]
004bb564 e2874aad ldp q2,q1,[sp, #0x150]
004bb568 2051823c stur q0,[x9, #0x25]
004bb56c 20b1cb3c ldur q0,[x9, #0xbb]
004bb570 e047803d str q0,[sp, #0x110]
004bb574 e053c03d ldr q0,[sp, #0x140]
004bb578 2151853c stur q1,[x9, #0x55]
004bb57c 2251843c stur q2,[x9, #0x45]
004bb580 946645f9 ldr x20,[x20, #0xac8]
004bb584 2051833c stur q0,[x9, #0x35]
004bb588 e32f803d str q3,[sp, #0xb0]
004bb58c 9f024039 ldrb wzr,[x20]
004bb590 2674f997 bl 0x00318628
004bb594 200e00b4 cbz x0,0x004bb758
004bb598 e08747ad ldp q0,q1,[sp, #0xf0]
004bb59c 282900f0 adrp x8,0x9e2000
004bb5a0 08a11f91 add x8,x8,#0x7e8
004bb5a4 e247c03d ldr q2,[sp, #0x110]
004bb5a8 f65f07a9 stp x22,x23,[sp, #0x70]
004bb5ac 7d6e48a9 ldp x29,x27,[x19, #0x80]
004bb5b0 01018052 mov w1,#0x8
004bb5b4 000402ad stp q0,q1,[x0, #0x40]
004bb5b8 e08745ad ldp q0,q1,[sp, #0xb0]
004bb5bc 0218803d str q2,[x0, #0x60]
004bb5c0 e02312a9 stp x0,x8,[sp, #0x120]
004bb5c4 48008052 mov w8,#0x2
004bb5c8 000400ad stp q0,q1,[x0]
004bb5cc e08b46ad ldp q0,q2,[sp, #0xd0]
004bb5d0 e8c30439 strb w8,[sp, #0x130]
004bb5d4 fd6f08a9 stp x29,x27,[sp, #0x80]
004bb5d8 000801ad stp q0,q2,[x0, #0x20]
004bb5dc 6026c03d ldr q0,[x19, #0x90]
004bb5e0 00028052 mov w0,#0x10
004bb5e4 e00f803d str q0,[sp, #0x30]
004bb5e8 9f024039 ldrb wzr,[x20]
004bb5ec 0f74f997 bl 0x00318628
004bb5f0 1f0000f1 cmp x0,#0x0
004bb5f4 e8179f1a cset w8,eq
004bb5f8 e81f00b9 str w8,[sp, #0x1c]
004bb5fc 600b00b4 cbz x0,0x004bb768
004bb600 28008052 mov w8,#0x1
004bb604 f92f00b9 str w25,[sp, #0x2c]
004bb608 fa0300aa mov x26,x0
004bb60c 000d084e dup v0.2D,x8
004bb610 79e24aa9 ldp x25,x24,[x19, #0xa8]
004bb614 282900f0 adrp x8,0x9e2000
004bb618 08e11d91 add x8,x8,#0x778
004bb61c fc1300f9 str x28,[sp, #0x20]
004bb620 e02309a9 stp x0,x8,[sp, #0x90]
004bb624 01018052 mov w1,#0x8
004bb628 0000803d str q0,[x0]
004bb62c 00048052 mov w0,#0x20
004bb630 f9630aa9 stp x25,x24,[sp, #0xa0]
004bb634 9f024039 ldrb wzr,[x20]
004bb638 fc73f997 bl 0x00318628
004bb63c e00900b4 cbz x0,0x004bb778
004bb640 3c008052 mov w28,#0x1
004bb644 481600b0 adrp x8,0x784000
004bb648 ffff0ea9 stp xzr,xzr,[sp, #0xe8]
004bb64c 800f084e dup v0.2D,x28
004bb650 0161c23d ldr q1,[x8, #0x980]
004bb654 88008052 mov w8,#0x4
004bb658 ffd300b9 str wzr,[sp, #0xd0]
004bb65c 01018052 mov w1,#0x8
004bb660 ff530339 strb wzr,[sp, #0xd4]
004bb664 e08705ad stp q0,q1,[sp, #0xb0]
004bb668 e8830da9 stp x8,x0,[sp, #0xd8]
004bb66c 00098052 mov w0,#0x48
004bb670 9f024039 ldrb wzr,[x20]
004bb674 ed73f997 bl 0x00318628
004bb678 c00800b4 cbz x0,0x004bb790
004bb67c e08746ad ldp q0,q1,[sp, #0xd0]
004bb680 e87b40f9 ldr x8,[sp, #0xf0]
004bb684 bc420539 strb w28,[x21, #0x150]
004bb688 082000f9 str x8,[x0, #0x40]
004bb68c e89b40f9 ldr x8,[sp, #0x130]
004bb690 000401ad stp q0,q1,[x0, #0x20]
004bb694 e28345ad ldp q2,q0,[sp, #0xb0]
004bb698 a8da0ea9 stp x8,x22,[x21, #0xe8]
004bb69c e82f40b9 ldr w8,[sp, #0x2c]
004bb6a0 bf0200f9 str xzr,[x21]
004bb6a4 020000ad stp q2,q0,[x0]
004bb6a8 610242ad ldp q1,q0,[x19, #0x40]
004bb6ac a8520539 strb w8,[x21, #0x154]
004bb6b0 282900f0 adrp x8,0x9e2000
004bb6b4 08e11d91 add x8,x8,#0x778
004bb6b8 a8e610a9 stp x8,x25,[x21, #0x108]
004bb6bc e81340f9 ldr x8,[sp, #0x20]
004bb6c0 a182893c stur q1,[x21, #0x98]
004bb6c4 a0828a3c stur q0,[x21, #0xa8]
004bb6c8 610243ad ldp q1,q0,[x19, #0x60]
004bb6cc b8a211a9 stp x24,x8,[x21, #0x118]
004bb6d0 e83740f9 ldr x8,[sp, #0x68]
004bb6d4 bc460539 strb w28,[x21, #0x151]
004bb6d8 a1828b3c stur q1,[x21, #0xb8]
004bb6dc a0828c3c stur q0,[x21, #0xc8]
004bb6e0 610240ad ldp q1,q0,[x19]
004bb6e4 a87e02a9 stp x8,xzr,[x21, #0x20]
004bb6e8 08018052 mov w8,#0x8
004bb6ec b7ea0fa9 stp x23,x26,[x21, #0xf8]
004bb6f0 f85f5ba9 ldp x24,x23,[sp, #0x1b0]
004bb6f4 a182853c stur q1,[x21, #0x58]
004bb6f8 fa675aa9 ldp x26,x25,[sp, #0x1a0]
004bb6fc a082863c stur q0,[x21, #0x68]
004bb700 610241ad ldp q1,q0,[x19, #0x20]
004bb704 bfa60279 strh wzr,[x21, #0x152]
004bb708 f44f5da9 ldp x20,x19,[sp, #0x1d0]
004bb70c bdee12a9 stp x29,x27,[x21, #0x128]
004bb710 fc6f59a9 ldp x28,x27,[sp, #0x190]
004bb714 a082883c stur q0,[x21, #0x88]
004bb718 e083c53c ldur q0,[sp, #0x58]
004bb71c a182873c stur q1,[x21, #0x78]
004bb720 fd7b58a9 ldp x29,x30,[sp, #0x180]
004bb724 a006803d str q0,[x21, #0x10]
004bb728 e04bc03d ldr q0,[sp, #0x120]
004bb72c a87e03a9 stp x8,xzr,[x21, #0x30]
004bb730 a0828d3c stur q0,[x21, #0xd8]
004bb734 e00fc03d ldr q0,[sp, #0x30]
004bb738 bf2204a9 stp xzr,x8,[x21, #0x40]
004bb73c a052803d str q0,[x21, #0x140]
004bb740 bf2a00f9 str xzr,[x21, #0x50]
004bb744 a09e00f9 str x0,[x21, #0x138]
004bb748 bf560539 strb wzr,[x21, #0x155]
004bb74c f6575ca9 ldp x22,x21,[sp, #0x1c0]
004bb750 ff830791 add sp,sp,#0x1e0
004bb754 c0035fd6 ret
004bb758 00018052 mov w0,#0x8
004bb75c 010e8052 mov w1,#0x70
004bb760 0f57f397 bl 0x0019139c
004bb764 0e000014 b 0x004bb79c
004bb768 00018052 mov w0,#0x8
004bb76c 01028052 mov w1,#0x10
004bb770 0b57f397 bl 0x0019139c
004bb774 0a000014 b 0x004bb79c
004bb778 62290090 adrp x2,0x9e7000
004bb77c 42401b91 add x2,x2,#0x6d0
004bb780 00018052 mov w0,#0x8
004bb784 01048052 mov w1,#0x20
004bb788 ff56f397 bl 0x00191384
004bb78c 04000014 b 0x004bb79c
004bb790 00018052 mov w0,#0x8
004bb794 01098052 mov w1,#0x48
004bb798 0157f397 bl 0x0019139c
004bb79c 200020d4 brk #0x1
