003cbb2c ffc305d1 sub sp,sp,#0x170
003cbb30 fd7b14a9 stp x29,x30,[sp, #0x140]
003cbb34 f65715a9 stp x22,x21,[sp, #0x150]
003cbb38 f44f16a9 stp x20,x19,[sp, #0x160]
003cbb3c 000444ad ldp q0,q1,[x0, #0x80]
003cbb40 35008052 mov w21,#0x1
003cbb44 094840f9 ldr x9,[x0, #0x90]
003cbb48 0a5040f9 ldr x10,[x0, #0xa0]
003cbb4c 763100f0 adrp x22,0x9fa000
003cbb50 ff6f00f9 str xzr,[sp, #0xd8]
003cbb54 f30300aa mov x19,x0
003cbb58 f40308aa mov x20,x8
003cbb5c 220d42ad ldp q2,q3,[x9, #0x40]
003cbb60 e00705ad stp q0,q1,[sp, #0xa0]
003cbb64 000442ad ldp q0,q1,[x0, #0x40]
003cbb68 09018052 mov w9,#0x8
003cbb6c ffa70ca9 stp xzr,x9,[sp, #0xc8]
003cbb70 290840f9 ldr x9,[x1, #0x10]
003cbb74 e20f00ad stp q2,q3,[sp]
003cbb78 e00703ad stp q0,q1,[sp, #0x60]
003cbb7c 000843ad ldp q0,q2,[x0, #0x60]
003cbb80 ea6300f9 str x10,[sp, #0xc0]
003cbb84 e98300f9 str x9,[sp, #0x100]
003cbb88 e00b04ad stp q0,q2,[sp, #0x80]
003cbb8c 010040ad ldp q1,q0,[x0]
003cbb90 e10301ad stp q1,q0,[sp, #0x20]
003cbb94 000841ad ldp q0,q2,[x0, #0x20]
003cbb98 2100c03d ldr q1,[x1]
003cbb9c 00058052 mov w0,#0x28
003cbba0 01018052 mov w1,#0x8
003cbba4 e00b02ad stp q0,q2,[sp, #0x40]
003cbba8 a00e084e dup v0.2D,x21
003cbbac d66645f9 ldr x22,[x22, #0xac8]
003cbbb0 e00707ad stp q0,q1,[sp, #0xe0]
003cbbb4 df024039 ldrb wzr,[x22]
003cbbb8 9c32fd97 bl 0x00318628
003cbbbc e00500b4 cbz x0,0x003cbc78
003cbbc0 e00747ad ldp q0,q1,[sp, #0xe0]
003cbbc4 01018052 mov w1,#0x8
003cbbc8 e88340f9 ldr x8,[sp, #0x100]
003cbbcc f5630279 strh w21,[sp, #0x130]
003cbbd0 f5cb0439 strb w21,[sp, #0x132]
003cbbd4 000400ad stp q0,q1,[x0]
003cbbd8 e20340ad ldp q2,q0,[sp]
003cbbdc a10e084e dup v1.2D,x21
003cbbe0 081000f9 str x8,[x0, #0x20]
003cbbe4 e86f40f9 ldr x8,[sp, #0xd8]
003cbbe8 e28308ad stp q2,q0,[sp, #0x110]
003cbbec e083cc3c ldur q0,[sp, #0xc8]
003cbbf0 e80310a9 stp x8,x0,[sp, #0x100]
003cbbf4 000b8052 mov w0,#0x58
003cbbf8 e10307ad stp q1,q0,[sp, #0xe0]
003cbbfc df024039 ldrb wzr,[x22]
003cbc00 8a32fd97 bl 0x00318628
003cbc04 200400b4 cbz x0,0x003cbc88
003cbc08 e00748ad ldp q0,q1,[sp, #0x100]
003cbc0c e24bc03d ldr q2,[sp, #0x120]
003cbc10 e89b40f9 ldr x8,[sp, #0x130]
003cbc14 f65755a9 ldp x22,x21,[sp, #0x150]
003cbc18 0210803d str q2,[x0, #0x40]
003cbc1c fd7b54a9 ldp x29,x30,[sp, #0x140]
003cbc20 000401ad stp q0,q1,[x0, #0x20]
003cbc24 e00747ad ldp q0,q1,[sp, #0xe0]
003cbc28 082800f9 str x8,[x0, #0x50]
003cbc2c 48300090 adrp x8,0x9d3000
003cbc30 08610191 add x8,x8,#0x58
003cbc34 802208a9 stp x0,x8,[x20, #0x80]
003cbc38 e86340f9 ldr x8,[sp, #0xc0]
003cbc3c 000400ad stp q0,q1,[x0]
003cbc40 620242ad ldp q2,q0,[x19, #0x40]
003cbc44 885a00f9 str x8,[x20, #0xb0]
003cbc48 820202ad stp q2,q0,[x20, #0x40]
003cbc4c 610243ad ldp q1,q0,[x19, #0x60]
003cbc50 810203ad stp q1,q0,[x20, #0x60]
003cbc54 620240ad ldp q2,q0,[x19]
003cbc58 820200ad stp q2,q0,[x20]
003cbc5c 610241ad ldp q1,q0,[x19, #0x20]
003cbc60 810201ad stp q1,q0,[x20, #0x20]
003cbc64 e00745ad ldp q0,q1,[sp, #0xa0]
003cbc68 808604ad stp q0,q1,[x20, #0x90]
003cbc6c f44f56a9 ldp x20,x19,[sp, #0x160]
003cbc70 ffc30591 add sp,sp,#0x170
003cbc74 c0035fd6 ret
003cbc78 00018052 mov w0,#0x8
003cbc7c 01058052 mov w1,#0x28
003cbc80 c715f797 bl 0x0019139c
003cbc84 05000014 b 0x003cbc98
003cbc88 00018052 mov w0,#0x8
003cbc8c 010b8052 mov w1,#0x58
003cbc90 f4830391 add x20,sp,#0xe0
003cbc94 c215f797 bl 0x0019139c
003cbc98 200020d4 brk #0x1
