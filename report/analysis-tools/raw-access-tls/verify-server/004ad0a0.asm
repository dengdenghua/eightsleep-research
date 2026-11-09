004ad0a0 fd7bbda9 stp x29,x30,[sp, #-0x30]!
004ad0a4 f65701a9 stp x22,x21,[sp, #0x10]
004ad0a8 f44f02a9 stp x20,x19,[sp, #0x20]
004ad0ac ff4332d1 sub sp,sp,#0xc90
004ad0b0 ff0300f9 str xzr,[sp]
004ad0b4 f30308aa mov x19,x8
004ad0b8 28008052 mov w8,#0x1
004ad0bc a91700b0 adrp x9,0x7a2000
004ad0c0 29613c91 add x9,x9,#0xf18
004ad0c4 e8fb02f9 str x8,[sp, #0x5f0]
004ad0c8 e9ff02f9 str x9,[sp, #0x5f8]
004ad0cc 28a440a9 ldp x8,x9,[x1, #0x8]
004ad0d0 8000c03d ldr q0,[x4]
004ad0d4 f6c31791 add x22,sp,#0x5f0
004ad0d8 f50305aa mov x21,x5
004ad0dc f40300aa mov x20,x0
004ad0e0 e61303f9 str x6,[sp, #0x620]
004ad0e4 e81b03f9 str x8,[sp, #0x630]
004ad0e8 08018052 mov w8,#0x8
004ad0ec e91f03f9 str x9,[sp, #0x638]
004ad0f0 890840f9 ldr x9,[x4, #0x10]
004ad0f4 e80303f9 str x8,[sp, #0x600]
004ad0f8 e8431991 add x8,sp,#0x650
004ad0fc e71703f9 str x7,[sp, #0x628]
004ad100 e22303f9 str x2,[sp, #0x640]
004ad104 e32703f9 str x3,[sp, #0x648]
004ad108 c082813c stur q0,[x22, #0x18]
004ad10c e90f03f9 str x9,[sp, #0x618]
004ad110 74810194 bl 0x0050d6e0
004ad114 a8170090 adrp x8,0x7a1000
004ad118 00a9c23d ldr q0,[x8, #0xaa0]
004ad11c 08129a52 mov w8,#0xd090
004ad120 6800a072 movk w8,#0x3, LSL #16
004ad124 c0a2813d str q0,[x22, #0x680]
004ad128 e84306f9 str x8,[sp, #0xc80]
004ad12c e0c33091 add x0,sp,#0xc30
004ad130 e1c31791 add x1,sp,#0x5f0
004ad134 e2431991 add x2,sp,#0x650
004ad138 e7c33191 add x7,sp,#0xc70
004ad13c e30315aa mov x3,x21
004ad140 e4031faa mov x4,xzr
004ad144 e6031faa mov x6,xzr
004ad148 f5c33091 add x21,sp,#0xc30
004ad14c 02faff97 bl 0x004ab954
004ad150 e81b46f9 ldr x8,[sp, #0xc30]
004ad154 1f0900f1 cmp x8,#0x2
004ad158 61030054 b.ne 0x004ad1c4
004ad15c f51f46f9 ldr x21,[sp, #0xc38]
004ad160 e0230091 add x0,sp,#0x8
004ad164 e1431991 add x1,sp,#0x650
004ad168 02ba8052 mov w2,#0x5d0
004ad16c 1513f397 bl 0x00171dc0
004ad170 e80740f9 ldr x8,[sp, #0x8]
004ad174 e91746f9 ldr x9,[sp, #0xc28]
004ad178 ea0b41b2 orr x10,xzr,#-0x7ffffffffffffffd
004ad17c f4f302f9 str x20,[sp, #0x5e0]
004ad180 1f010aeb cmp x8,x10
004ad184 e9ef02f9 str x9,[sp, #0x5d8]
004ad188 f5f702f9 str x21,[sp, #0x5e8]
004ad18c 20030054 b.eq 0x004ad1f0
004ad190 490080d2 mov x9,#0x2
004ad194 ca028052 mov w10,#0x16
004ad198 0900f0f2 movk x9,#0x8000, LSL #48
004ad19c 6a020039 strb w10,[x19]
004ad1a0 1f0109eb cmp x8,x9
004ad1a4 60000054 b.eq 0x004ad1b0
004ad1a8 e0230091 add x0,sp,#0x8
004ad1ac 78f9ff97 bl 0x004ab78c
004ad1b0 ff433291 add sp,sp,#0xc90
004ad1b4 f44f42a9 ldp x20,x19,[sp, #0x20]
004ad1b8 f65741a9 ldp x22,x21,[sp, #0x10]
004ad1bc fd7bc3a8 ldp x29,x30,[sp], #0x30
004ad1c0 c0035fd6 ret
004ad1c4 a082c03c ldur q0,[x21, #0x8]
004ad1c8 a182c13c ldur q1,[x21, #0x18]
004ad1cc e90b41b2 orr x9,xzr,#-0x7ffffffffffffffd
004ad1d0 a282c23c ldur q2,[x21, #0x28]
004ad1d4 a88243f8 ldur x8,[x21, #0x38]
004ad1d8 e0431991 add x0,sp,#0x650
004ad1dc e08700ad stp q0,q1,[sp, #0x10]
004ad1e0 e203833c stur q2,[sp, #0x30]
004ad1e4 e82300f9 str x8,[sp, #0x40]
004ad1e8 e90700f9 str x9,[sp, #0x8]
004ad1ec 68f9ff97 bl 0x004ab78c
004ad1f0 e8230091 add x8,sp,#0x8
004ad1f4 00210091 add x0,x8,#0x8
004ad1f8 e80313aa mov x8,x19
004ad1fc 35300094 bl 0x004b92d0
004ad200 ff433291 add sp,sp,#0xc90
004ad204 f44f42a9 ldp x20,x19,[sp, #0x20]
004ad208 f65741a9 ldp x22,x21,[sp, #0x10]
004ad20c fd7bc3a8 ldp x29,x30,[sp], #0x30
004ad210 c0035fd6 ret
