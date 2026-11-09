004bb998 202900f0 adrp x0,0x9e2000
004bb99c 00601a91 add x0,x0,#0x698
004bb9a0 41008052 mov w1,#0x2
004bb9a4 01000014 b 0x004bb9a8
004bb9a8 ff8304d1 sub sp,sp,#0x120
004bb9ac fd7b0fa9 stp x29,x30,[sp, #0xf0]
004bb9b0 f65710a9 stp x22,x21,[sp, #0x100]
004bb9b4 f44f11a9 stp x20,x19,[sp, #0x110]
004bb9b8 f40301aa mov x20,x1
004bb9bc f50300aa mov x21,x0
004bb9c0 f30308aa mov x19,x8
004bb9c4 9a6dff97 bl 0x0049702c
004bb9c8 010040f9 ldr x1,[x0]
004bb9cc f60300aa mov x22,x0
004bb9d0 20008052 mov w0,#0x1
004bb9d4 bf030b94 bl 0x0077c8d0
004bb9d8 4008f8b7 tbnz x0,#0x3f,0x004bbae0
004bb9dc d60240f9 ldr x22,[x22]
004bb9e0 e82900f0 adrp x8,0x9fa000
004bb9e4 00028052 mov w0,#0x10
004bb9e8 086545f9 ldr x8,[x8, #0xac8]
004bb9ec 01018052 mov w1,#0x8
004bb9f0 f60700f9 str x22,[sp, #0x8]
004bb9f4 1f014039 ldrb wzr,[x8]
004bb9f8 0c73f997 bl 0x00318628
004bb9fc e00400b4 cbz x0,0x004bba98
004bba00 28008052 mov w8,#0x1
004bba04 f6030ba9 stp x22,x0,[sp, #0xb0]
004bba08 e1c30291 add x1,sp,#0xb0
004bba0c 000d084e dup v0.2D,x8
004bba10 282900f0 adrp x8,0x9e2000
004bba14 08011f91 add x8,x8,#0x7c0
004bba18 e20315aa mov x2,x21
004bba1c e30314aa mov x3,x20
004bba20 e86300f9 str x8,[sp, #0xc0]
004bba24 0000803d str q0,[x0]
004bba28 e0230091 add x0,sp,#0x8
004bba2c 46fcff97 bl 0x004bab44
004bba30 e80740f9 ldr x8,[sp, #0x8]
004bba34 e90b41b2 orr x9,xzr,#-0x7ffffffffffffffd
004bba38 1f0109eb cmp x8,x9
004bba3c 60030054 b.eq 0x004bbaa8
004bba40 e083c83c ldur q0,[sp, #0x88]
004bba44 e183c93c ldur q1,[sp, #0x98]
004bba48 e283c73c ldur q2,[sp, #0x78]
004bba4c e85740f9 ldr x8,[sp, #0xa8]
004bba50 f65750a9 ldp x22,x21,[sp, #0x100]
004bba54 600604ad stp q0,q1,[x19, #0x80]
004bba58 e083c43c ldur q0,[sp, #0x48]
004bba5c e183c53c ldur q1,[sp, #0x58]
004bba60 685200f9 str x8,[x19, #0xa0]
004bba64 fd7b4fa9 ldp x29,x30,[sp, #0xf0]
004bba68 600602ad stp q0,q1,[x19, #0x40]
004bba6c e083c63c ldur q0,[sp, #0x68]
004bba70 e183c03c ldur q1,[sp, #0x8]
004bba74 600a03ad stp q0,q2,[x19, #0x60]
004bba78 e083c13c ldur q0,[sp, #0x18]
004bba7c e283c33c ldur q2,[sp, #0x38]
004bba80 610200ad stp q1,q0,[x19]
004bba84 e083c23c ldur q0,[sp, #0x28]
004bba88 600a01ad stp q0,q2,[x19, #0x20]
004bba8c f44f51a9 ldp x20,x19,[sp, #0x110]
004bba90 ff830491 add sp,sp,#0x120
004bba94 c0035fd6 ret
004bba98 00018052 mov w0,#0x8
004bba9c 01028052 mov w1,#0x10
004bbaa0 3f56f397 bl 0x0019139c
004bbaa4 0f000014 b 0x004bbae0
004bbaa8 e08740ad ldp q0,q1,[sp, #0x10]
004bbaac e8c30291 add x8,sp,#0xb0
004bbab0 000500ad stp q0,q1,[x8]
004bbab4 e28341ad ldp q2,q0,[sp, #0x30]
004bbab8 020101ad stp q2,q0,[x8, #0x20]
004bbabc 401700d0 adrp x0,0x7a5000
004bbac0 00a42691 add x0,x0,#0x9a9
004bbac4 232900f0 adrp x3,0x9e2000
004bbac8 63c01591 add x3,x3,#0x570
004bbacc 242900f0 adrp x4,0x9e2000
004bbad0 84a01e91 add x4,x4,#0x7a8
004bbad4 e2c30291 add x2,sp,#0xb0
004bbad8 61058052 mov w1,#0x2b
004bbadc 6657f397 bl 0x00191874
004bbae0 200020d4 brk #0x1
