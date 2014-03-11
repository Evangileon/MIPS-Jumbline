
rearrange:     file format elf32-tradbigmips


Disassembly of section .interp:

00400154 <.interp>:
  400154:	2f6c6962 	sltiu	t4,k1,26978
  400158:	2f6c642e 	sltiu	t4,k1,25646
  40015c:	736f2e31 	0x736f2e31
	...

Disassembly of section .note.ABI-tag:

00400164 <.note.ABI-tag>:
  400164:	00000004 	sllv	zero,zero,zero
  400168:	00000010 	mfhi	zero
  40016c:	00000001 	movf	zero,zero,$fcc0
  400170:	474e5500 	c1	0x14e5500
  400174:	00000000 	nop
  400178:	00000002 	srl	zero,zero,0x0
  40017c:	00000006 	srlv	zero,zero,zero
  400180:	00000012 	mflo	zero

Disassembly of section .reginfo:

00400184 <.reginfo>:
  400184:	b20001f6 	0xb20001f6
	...
  400198:	004193b0 	tge	v0,at,0x24e

Disassembly of section .note.gnu.build-id:

0040019c <.note.gnu.build-id>:
  40019c:	00000004 	sllv	zero,zero,zero
  4001a0:	00000014 	0x14
  4001a4:	00000003 	sra	zero,zero,0x0
  4001a8:	474e5500 	c1	0x14e5500
  4001ac:	5eca9350 	0x5eca9350
  4001b0:	b17dc877 	0xb17dc877
  4001b4:	22546968 	addi	s4,s2,26984
  4001b8:	1674ba6a 	bne	s3,s4,3eeb64 <_DYNAMIC-0x1165c>
  4001bc:	e4a814db 	swc1	$f8,5339(a1)

Disassembly of section .dynamic:

004001c0 <_DYNAMIC>:
  4001c0:	00000001 	movf	zero,zero,$fcc0
  4001c4:	000000a9 	0xa9
  4001c8:	0000000c 	syscall
  4001cc:	00400614 	0x400614
  4001d0:	0000000d 	break
  4001d4:	00401190 	0x401190
  4001d8:	00000004 	sllv	zero,zero,zero
  4001dc:	00400298 	0x400298
  4001e0:	00000005 	0x5
  4001e4:	004004d8 	0x4004d8
  4001e8:	00000006 	srlv	zero,zero,zero
  4001ec:	00400348 	0x400348
  4001f0:	0000000a 	movz	zero,zero,zero
  4001f4:	000000e7 	0xe7
  4001f8:	0000000b 	movn	zero,zero,zero
  4001fc:	00000010 	mfhi	zero
  400200:	70000016 	0x70000016
  400204:	004113b0 	tge	v0,at,0x4e
  400208:	00000015 	0x15
  40020c:	00000000 	nop
  400210:	00000003 	sra	zero,zero,0x0
  400214:	004113c0 	0x4113c0
  400218:	70000001 	maddu	zero,zero
  40021c:	00000001 	movf	zero,zero,$fcc0
  400220:	70000005 	msubu	zero,zero
  400224:	00000002 	srl	zero,zero,0x0
  400228:	70000006 	0x70000006
  40022c:	00400000 	0x400000
  400230:	7000000a 	0x7000000a
  400234:	00000007 	srav	zero,zero,zero
  400238:	70000011 	0x70000011
  40023c:	00000019 	multu	zero,zero
  400240:	70000012 	0x70000012
  400244:	0000001d 	0x1d
  400248:	70000013 	0x70000013
  40024c:	00000004 	sllv	zero,zero,zero
  400250:	6ffffffe 	0x6ffffffe
  400254:	004005f4 	teq	v0,zero,0x17
  400258:	6fffffff 	0x6fffffff
  40025c:	00000001 	movf	zero,zero,$fcc0
  400260:	6ffffff0 	0x6ffffff0
  400264:	004005c0 	0x4005c0
	...

Disassembly of section .hash:

00400298 <.hash>:
  400298:	00000011 	mthi	zero
  40029c:	00000019 	multu	zero,zero
	...
  4002a8:	00000009 	jalr	zero,zero
  4002ac:	00000014 	0x14
  4002b0:	00000007 	srav	zero,zero,zero
  4002b4:	00000001 	movf	zero,zero,$fcc0
  4002b8:	00000013 	mtlo	zero
  4002bc:	00000010 	mfhi	zero
  4002c0:	00000000 	nop
  4002c4:	00000004 	sllv	zero,zero,zero
  4002c8:	00000005 	0x5
  4002cc:	00000008 	jr	zero
  4002d0:	00000017 	0x17
  4002d4:	00000006 	srlv	zero,zero,zero
  4002d8:	0000000a 	movz	zero,zero,zero
  4002dc:	00000015 	0x15
	...
  4002f0:	00000002 	srl	zero,zero,0x0
  4002f4:	00000000 	nop
  4002f8:	0000000b 	movn	zero,zero,zero
  4002fc:	00000003 	sra	zero,zero,0x0
  400300:	0000000e 	0xe
  400304:	0000000d 	break
  400308:	0000000f 	sync
  40030c:	00000011 	mthi	zero
  400310:	0000000c 	syscall
	...
  40031c:	00000016 	0x16
	...
  400328:	00000012 	mflo	zero
	...
  40033c:	00000018 	mult	zero,zero
	...

Disassembly of section .dynsym:

00400348 <.dynsym>:
	...
  400358:	000000b3 	tltu	zero,zero,0x2
  40035c:	00000001 	movf	zero,zero,$fcc0
  400360:	00000000 	nop
  400364:	1300fff1 	beqz	t8,40032c <_DYNAMIC+0x16c>
  400368:	000000ce 	0xce
  40036c:	004011dc 	0x4011dc
  400370:	00000004 	sllv	zero,zero,zero
  400374:	1100000f 	beqz	t0,4003b4 <_DYNAMIC+0x1f4>
  400378:	000000c4 	0xc4
  40037c:	004113b0 	tge	v0,at,0x4e
  400380:	00000000 	nop
  400384:	11000015 	beqz	t0,4003dc <_DYNAMIC+0x21c>
  400388:	0000000b 	movn	zero,zero,zero
  40038c:	00400614 	0x400614
  400390:	00000000 	nop
  400394:	1200000b 	beqz	s0,4003c4 <_DYNAMIC+0x204>
  400398:	0000002e 	0x2e
  40039c:	00400edc 	0x400edc
  4003a0:	000000b8 	0xb8
  4003a4:	1200000c 	beqz	s0,4003d8 <_DYNAMIC+0x218>
  4003a8:	00000086 	0x86
  4003ac:	00401170 	tge	v0,zero,0x45
  4003b0:	00000000 	nop
  4003b4:	12000000 	beqz	s0,4003b8 <_DYNAMIC+0x1f8>
  4003b8:	0000005e 	0x5e
  4003bc:	00401160 	0x401160
  4003c0:	00000000 	nop
  4003c4:	12000000 	beqz	s0,4003c8 <_DYNAMIC+0x208>
  4003c8:	00000056 	0x56
	...
  4003d4:	11000000 	beqz	t0,4003d8 <_DYNAMIC+0x218>
  4003d8:	0000006b 	0x6b
	...
  4003e4:	11000000 	beqz	t0,4003e8 <_DYNAMIC+0x228>
  4003e8:	00000077 	0x77
  4003ec:	00401150 	0x401150
  4003f0:	00000000 	nop
  4003f4:	12000000 	beqz	s0,4003f8 <_DYNAMIC+0x238>
  4003f8:	00000093 	0x93
  4003fc:	00401140 	0x401140
  400400:	00000000 	nop
  400404:	12000000 	beqz	s0,400408 <_DYNAMIC+0x248>
  400408:	00000078 	0x78
  40040c:	00401130 	tge	v0,zero,0x44
  400410:	00000000 	nop
  400414:	12000000 	beqz	s0,400418 <_DYNAMIC+0x258>
  400418:	00000001 	movf	zero,zero,$fcc0
  40041c:	00400fa8 	0x400fa8
  400420:	000000b0 	tge	zero,zero,0x2
  400424:	1200000c 	beqz	s0,400458 <_DYNAMIC+0x298>
  400428:	0000009a 	0x9a
  40042c:	00401120 	0x401120
  400430:	00000000 	nop
  400434:	12000000 	beqz	s0,400438 <_DYNAMIC+0x278>
  400438:	0000007f 	0x7f
	...
  400444:	11000000 	beqz	t0,400448 <_DYNAMIC+0x288>
  400448:	00000021 	move	zero,zero
  40044c:	00401110 	0x401110
  400450:	00000000 	nop
  400454:	12000000 	beqz	s0,400458 <_DYNAMIC+0x298>
  400458:	00000071 	tgeu	zero,zero,0x1
  40045c:	00401100 	0x401100
  400460:	00000000 	nop
  400464:	12000000 	beqz	s0,400468 <_DYNAMIC+0x2a8>
  400468:	0000008b 	0x8b
  40046c:	004010f0 	tge	v0,zero,0x43
  400470:	00000000 	nop
  400474:	12000000 	beqz	s0,400478 <_DYNAMIC+0x2b8>
  400478:	000000a1 	0xa1
  40047c:	004010e0 	0x4010e0
  400480:	00000000 	nop
  400484:	12000000 	beqz	s0,400488 <_DYNAMIC+0x2c8>
  400488:	00000042 	srl	zero,zero,0x1
	...
  400494:	20000000 	addi	zero,zero,0
  400498:	00000033 	tltu	zero,zero
	...
  4004a4:	22000000 	addi	zero,s0,0
  4004a8:	00000063 	0x63
  4004ac:	004010d0 	0x4010d0
  4004b0:	00000000 	nop
  4004b4:	12000000 	beqz	s0,4004b8 <_DYNAMIC+0x2f8>
  4004b8:	00000011 	mthi	zero
  4004bc:	00400fa0 	0x400fa0
  4004c0:	00000008 	jr	zero
  4004c4:	1200000c 	beqz	s0,4004f8 <_DYNAMIC+0x338>
  4004c8:	0000005d 	0x5d
  4004cc:	004010c0 	0x4010c0
  4004d0:	00000000 	nop
  4004d4:	12000000 	beqz	s0,4004d8 <_DYNAMIC+0x318>

Disassembly of section .dynstr:

004004d8 <.dynstr>:
  4004d8:	005f5f6c 	0x5f5f6c
  4004dc:	6962635f 	0x6962635f
  4004e0:	6373755f 	0x6373755f
  4004e4:	696e6974 	0x696e6974
  4004e8:	005f5f6c 	0x5f5f6c
  4004ec:	6962635f 	0x6962635f
  4004f0:	6373755f 	0x6373755f
  4004f4:	66696e69 	0x66696e69
  4004f8:	005f5f6c 	0x5f5f6c
  4004fc:	6962635f 	0x6962635f
  400500:	73746172 	0x73746172
  400504:	745f6d61 	jalx	17db584 <_gp+0x13c21d4>
  400508:	696e005f 	0x696e005f
  40050c:	5f676d6f 	0x5f676d6f
  400510:	6e5f7374 	0x6e5f7374
  400514:	6172745f 	0x6172745f
  400518:	5f005f4a 	bgtzl	t8,418244 <_end+0x6de4>
  40051c:	765f5265 	jalx	97d4994 <_gp+0x93bb5e4>
  400520:	67697374 	0x67697374
  400524:	6572436c 	0x6572436c
  400528:	61737365 	0x61737365
  40052c:	73007374 	0x73007374
  400530:	646f7574 	0x646f7574
  400534:	00667075 	0x667075
  400538:	74730067 	jalx	1cc019c <_gp+0x18a6dec>
  40053c:	65746368 	0x65746368
  400540:	61720073 	0x61720073
  400544:	7464696e 	jalx	191a5b8 <_gp+0x1501208>
  400548:	00666765 	0x666765
  40054c:	74730066 	jalx	1cc0198 <_gp+0x18a6de8>
  400550:	7072696e 	0x7072696e
  400554:	74660073 	jalx	19801cc <_gp+0x1566e1c>
  400558:	74646572 	jalx	19195c8 <_gp+0x1500218>
  40055c:	72006578 	0x72006578
  400560:	69740070 	0x69740070
  400564:	75746368 	jalx	5d18da0 <_gp+0x58ff9f0>
  400568:	61720066 	0x61720066
  40056c:	77726974 	jalx	dc9a5d0 <_gp+0xd881220>
  400570:	65007374 	0x65007374
  400574:	726c656e 	0x726c656e
  400578:	00737472 	tlt	v1,s3,0x1d1
  40057c:	6e637079 	0x6e637079
  400580:	006c6962 	0x6c6962
  400584:	632e736f 	0x632e736f
  400588:	2e36005f 	sltiu	s6,s1,95
  40058c:	44594e41 	0x44594e41
  400590:	4d49435f 	0x4d49435f
  400594:	4c494e4b 	0x4c494e4b
  400598:	494e4700 	0x494e4700
  40059c:	5f5f524c 	0x5f5f524c
  4005a0:	445f4d41 	0x445f4d41
  4005a4:	50005f49 	beqzl	zero,4182cc <_end+0x6e6c>
  4005a8:	4f5f7374 	c3	0x15f7374
  4005ac:	64696e5f 	0x64696e5f
  4005b0:	75736564 	jalx	5cd9590 <_gp+0x58c01e0>
  4005b4:	00474c49 	0x474c49
  4005b8:	42435f32 	c0	0x435f32
  4005bc:	Address 0x00000000004005bc is out of bounds.


Disassembly of section .gnu.version:

004005c0 <.gnu.version>:
  4005c0:	00000001 	movf	zero,zero,$fcc0
  4005c4:	00010001 	movt	zero,zero,$fcc0
  4005c8:	00010001 	movt	zero,zero,$fcc0
  4005cc:	00020002 	srl	zero,v0,0x0
  4005d0:	00020002 	srl	zero,v0,0x0
  4005d4:	00020002 	srl	zero,v0,0x0
  4005d8:	00020001 	0x20001
  4005dc:	00020002 	srl	zero,v0,0x0
  4005e0:	00020002 	srl	zero,v0,0x0
  4005e4:	00020002 	srl	zero,v0,0x0
  4005e8:	00000000 	nop
  4005ec:	00020001 	0x20001
  4005f0:	Address 0x00000000004005f0 is out of bounds.


Disassembly of section .gnu.version_r:

004005f4 <.gnu.version_r>:
  4005f4:	00010001 	movt	zero,zero,$fcc0
  4005f8:	000000a9 	0xa9
  4005fc:	00000010 	mfhi	zero
  400600:	00000000 	nop
  400604:	0d696910 	jal	5a5a440 <_gp+0x5641090>
  400608:	00000002 	srl	zero,zero,0x0
  40060c:	000000dd 	0xdd
  400610:	00000000 	nop

Disassembly of section .init:

00400614 <_init>:
  400614:	3c1c0002 	lui	gp,0x2
  400618:	279c8d9c 	addiu	gp,gp,-29284
  40061c:	0399e021 	addu	gp,gp,t9
  400620:	27bdffe0 	addiu	sp,sp,-32
  400624:	afbf001c 	sw	ra,28(sp)
  400628:	afbc0010 	sw	gp,16(sp)
  40062c:	8f828070 	lw	v0,-32656(gp)
  400630:	00200825 	move	at,at
  400634:	10400005 	beqz	v0,40064c <_init+0x38>
  400638:	00200825 	move	at,at
  40063c:	8f998070 	lw	t9,-32656(gp)
  400640:	00200825 	move	at,at
  400644:	0320f809 	jalr	t9
  400648:	00200825 	move	at,at
  40064c:	04110001 	bal	400654 <_init+0x40>
  400650:	00200825 	move	at,at
  400654:	3c1c0042 	lui	gp,0x42
  400658:	279c93b0 	addiu	gp,gp,-27728
  40065c:	8f998018 	lw	t9,-32744(gp)
  400660:	00200825 	move	at,at
  400664:	273907b4 	addiu	t9,t9,1972
  400668:	04110052 	bal	4007b4 <frame_dummy>
  40066c:	00200825 	move	at,at
  400670:	04110001 	bal	400678 <_init+0x64>
  400674:	00200825 	move	at,at
  400678:	3c1c0042 	lui	gp,0x42
  40067c:	279c93b0 	addiu	gp,gp,-27728
  400680:	8f998018 	lw	t9,-32744(gp)
  400684:	00200825 	move	at,at
  400688:	27391060 	addiu	t9,t9,4192
  40068c:	04110274 	bal	401060 <__do_global_ctors_aux>
  400690:	00200825 	move	at,at
  400694:	8fbf001c 	lw	ra,28(sp)
  400698:	00200825 	move	at,at
  40069c:	03e00008 	jr	ra
  4006a0:	27bd0020 	addiu	sp,sp,32

Disassembly of section .text:

004006b0 <__start>:
  4006b0:	03e00021 	move	zero,ra
  4006b4:	04110001 	bal	4006bc <__start+0xc>
  4006b8:	00200825 	move	at,at
  4006bc:	3c1c0042 	lui	gp,0x42
  4006c0:	279c93b0 	addiu	gp,gp,-27728
  4006c4:	0000f821 	move	ra,zero
  4006c8:	8f848030 	lw	a0,-32720(gp)
  4006cc:	8fa50000 	lw	a1,0(sp)
  4006d0:	27a60004 	addiu	a2,sp,4
  4006d4:	2401fff8 	li	at,-8
  4006d8:	03a1e824 	and	sp,sp,at
  4006dc:	27bdffe0 	addiu	sp,sp,-32
  4006e0:	8f878050 	lw	a3,-32688(gp)
  4006e4:	8f888078 	lw	t0,-32648(gp)
  4006e8:	00200825 	move	at,at
  4006ec:	afa80010 	sw	t0,16(sp)
  4006f0:	afa20014 	sw	v0,20(sp)
  4006f4:	afbd0018 	sw	sp,24(sp)
  4006f8:	8f99805c 	lw	t9,-32676(gp)
  4006fc:	00200825 	move	at,at
  400700:	0320f809 	jalr	t9
  400704:	00200825 	move	at,at

00400708 <hlt>:
  400708:	1000ffff 	b	400708 <hlt>
  40070c:	00200825 	move	at,at

00400710 <__do_global_dtors_aux>:
  400710:	27bdffd0 	addiu	sp,sp,-48
  400714:	afb30028 	sw	s3,40(sp)
  400718:	3c130041 	lui	s3,0x41
  40071c:	92621440 	lbu	v0,5184(s3)
  400720:	afbf002c 	sw	ra,44(sp)
  400724:	afb20024 	sw	s2,36(sp)
  400728:	afb10020 	sw	s1,32(sp)
  40072c:	1440001a 	bnez	v0,400798 <__do_global_dtors_aux+0x88>
  400730:	afb0001c 	sw	s0,28(sp)
  400734:	3c120041 	lui	s2,0x41
  400738:	3c110041 	lui	s1,0x41
  40073c:	26521370 	addiu	s2,s2,4976
  400740:	26311374 	addiu	s1,s1,4980
  400744:	02328823 	subu	s1,s1,s2
  400748:	3c100041 	lui	s0,0x41
  40074c:	00118883 	sra	s1,s1,0x2
  400750:	8e021444 	lw	v0,5188(s0)
  400754:	2631ffff 	addiu	s1,s1,-1
  400758:	0051182b 	sltu	v1,v0,s1
  40075c:	1060000c 	beqz	v1,400790 <__do_global_dtors_aux+0x80>
  400760:	24420001 	addiu	v0,v0,1
  400764:	00021880 	sll	v1,v0,0x2
  400768:	02431821 	addu	v1,s2,v1
  40076c:	8c790000 	lw	t9,0(v1)
  400770:	00200825 	move	at,at
  400774:	0320f809 	jalr	t9
  400778:	ae021444 	sw	v0,5188(s0)
  40077c:	8e021444 	lw	v0,5188(s0)
  400780:	00200825 	move	at,at
  400784:	0051182b 	sltu	v1,v0,s1
  400788:	1460fff6 	bnez	v1,400764 <__do_global_dtors_aux+0x54>
  40078c:	24420001 	addiu	v0,v0,1
  400790:	24020001 	li	v0,1
  400794:	a2621440 	sb	v0,5184(s3)
  400798:	8fbf002c 	lw	ra,44(sp)
  40079c:	8fb30028 	lw	s3,40(sp)
  4007a0:	8fb20024 	lw	s2,36(sp)
  4007a4:	8fb10020 	lw	s1,32(sp)
  4007a8:	8fb0001c 	lw	s0,28(sp)
  4007ac:	03e00008 	jr	ra
  4007b0:	27bd0030 	addiu	sp,sp,48

004007b4 <frame_dummy>:
  4007b4:	3c040041 	lui	a0,0x41
  4007b8:	8c821378 	lw	v0,4984(a0)
  4007bc:	3c1c0042 	lui	gp,0x42
  4007c0:	10400007 	beqz	v0,4007e0 <frame_dummy+0x2c>
  4007c4:	279c93b0 	addiu	gp,gp,-27728
  4007c8:	8f99806c 	lw	t9,-32660(gp)
  4007cc:	00200825 	move	at,at
  4007d0:	13200003 	beqz	t9,4007e0 <frame_dummy+0x2c>
  4007d4:	00200825 	move	at,at
  4007d8:	03200008 	jr	t9
  4007dc:	24841378 	addiu	a0,a0,4984
  4007e0:	03e00008 	jr	ra
  4007e4:	00200825 	move	at,at
  4007e8:	00200825 	move	at,at
  4007ec:	00200825 	move	at,at

004007f0 <compare>:
  4007f0:	03e00008 	jr	ra
  4007f4:	24020001 	li	v0,1

004007f8 <clearInput>:
  4007f8:	2402ffff 	li	v0,-1
  4007fc:	03e00008 	jr	ra
  400800:	ac820000 	sw	v0,0(a0)

00400804 <exchange>:
  400804:	04800017 	bltz	a0,400864 <exchange+0x60>
  400808:	00001021 	move	v0,zero
  40080c:	04a00015 	bltz	a1,400864 <exchange+0x60>
  400810:	00200825 	move	at,at
  400814:	3c020041 	lui	v0,0x41
  400818:	8c421390 	lw	v0,5008(v0)
  40081c:	00200825 	move	at,at
  400820:	0082182a 	slt	v1,a0,v0
  400824:	1060000e 	beqz	v1,400860 <exchange+0x5c>
  400828:	00200825 	move	at,at
  40082c:	00a2102a 	slt	v0,a1,v0
  400830:	1040000b 	beqz	v0,400860 <exchange+0x5c>
  400834:	00200825 	move	at,at
  400838:	3c020041 	lui	v0,0x41
  40083c:	24421450 	addiu	v0,v0,5200
  400840:	00a22821 	addu	a1,a1,v0
  400844:	00822021 	addu	a0,a0,v0
  400848:	80830000 	lb	v1,0(a0)
  40084c:	90a60000 	lbu	a2,0(a1)
  400850:	24020001 	li	v0,1
  400854:	a0860000 	sb	a2,0(a0)
  400858:	03e00008 	jr	ra
  40085c:	a0a30000 	sb	v1,0(a1)
  400860:	00001021 	move	v0,zero
  400864:	03e00008 	jr	ra
  400868:	00200825 	move	at,at

0040086c <markInsert>:
  40086c:	8c820000 	lw	v0,0(a0)
  400870:	2403ffff 	li	v1,-1
  400874:	10430005 	beq	v0,v1,40088c <markInsert+0x20>
  400878:	24a6ffd0 	addiu	a2,a1,-48
  40087c:	14c20005 	bne	a2,v0,400894 <markInsert+0x28>
  400880:	0046402a 	slt	t0,v0,a2
  400884:	10000036 	b	400960 <markInsert+0xf4>
  400888:	ac830000 	sw	v1,0(a0)
  40088c:	10000034 	b	400960 <markInsert+0xf4>
  400890:	ac860000 	sw	a2,0(a0)
  400894:	3c030041 	lui	v1,0x41
  400898:	24631450 	addiu	v1,v1,5200
  40089c:	15000005 	bnez	t0,4008b4 <markInsert+0x48>
  4008a0:	3c070041 	lui	a3,0x41
  4008a4:	8ce71390 	lw	a3,5008(a3)
  4008a8:	00621821 	addu	v1,v1,v0
  4008ac:	10000027 	b	40094c <markInsert+0xe0>
  4008b0:	00402821 	move	a1,v0
  4008b4:	8ce71390 	lw	a3,5008(a3)
  4008b8:	00621821 	addu	v1,v1,v0
  4008bc:	24a5ffcf 	addiu	a1,a1,-49
  4008c0:	1000000f 	b	400900 <markInsert+0x94>
  4008c4:	00403021 	move	a2,v0
  4008c8:	04c0000b 	bltz	a2,4008f8 <markInsert+0x8c>
  4008cc:	24420001 	addiu	v0,v0,1
  4008d0:	04400009 	bltz	v0,4008f8 <markInsert+0x8c>
  4008d4:	00200825 	move	at,at
  4008d8:	11200007 	beqz	t1,4008f8 <markInsert+0x8c>
  4008dc:	0047402a 	slt	t0,v0,a3
  4008e0:	11000005 	beqz	t0,4008f8 <markInsert+0x8c>
  4008e4:	00200825 	move	at,at
  4008e8:	80690000 	lb	t1,0(v1)
  4008ec:	90680001 	lbu	t0,1(v1)
  4008f0:	a0690001 	sb	t1,1(v1)
  4008f4:	a0680000 	sb	t0,0(v1)
  4008f8:	24c60001 	addiu	a2,a2,1
  4008fc:	24630001 	addiu	v1,v1,1
  400900:	0045402a 	slt	t0,v0,a1
  400904:	1500fff0 	bnez	t0,4008c8 <markInsert+0x5c>
  400908:	00c7482a 	slt	t1,a2,a3
  40090c:	10000013 	b	40095c <markInsert+0xf0>
  400910:	2402ffff 	li	v0,-1
  400914:	04a0000b 	bltz	a1,400944 <markInsert+0xd8>
  400918:	2442ffff 	addiu	v0,v0,-1
  40091c:	04400009 	bltz	v0,400944 <markInsert+0xd8>
  400920:	00200825 	move	at,at
  400924:	11200007 	beqz	t1,400944 <markInsert+0xd8>
  400928:	0047402a 	slt	t0,v0,a3
  40092c:	11000005 	beqz	t0,400944 <markInsert+0xd8>
  400930:	00200825 	move	at,at
  400934:	80690000 	lb	t1,0(v1)
  400938:	9068ffff 	lbu	t0,-1(v1)
  40093c:	a069ffff 	sb	t1,-1(v1)
  400940:	a0680000 	sb	t0,0(v1)
  400944:	24a5ffff 	addiu	a1,a1,-1
  400948:	2463ffff 	addiu	v1,v1,-1
  40094c:	00c2402a 	slt	t0,a2,v0
  400950:	1500fff0 	bnez	t0,400914 <markInsert+0xa8>
  400954:	00a7482a 	slt	t1,a1,a3
  400958:	2402ffff 	li	v0,-1
  40095c:	ac820000 	sw	v0,0(a0)
  400960:	03e00008 	jr	ra
  400964:	00001021 	move	v0,zero

00400968 <markTwo>:
  400968:	3c1c0042 	lui	gp,0x42
  40096c:	27bdffe0 	addiu	sp,sp,-32
  400970:	279c93b0 	addiu	gp,gp,-27728
  400974:	afbf001c 	sw	ra,28(sp)
  400978:	afbc0010 	sw	gp,16(sp)
  40097c:	8c820000 	lw	v0,0(a0)
  400980:	2403ffff 	li	v1,-1
  400984:	10430005 	beq	v0,v1,40099c <markTwo+0x34>
  400988:	24a5ffd0 	addiu	a1,a1,-48
  40098c:	14a20005 	bne	a1,v0,4009a4 <markTwo+0x3c>
  400990:	00200825 	move	at,at
  400994:	10000021 	b	400a1c <markTwo+0xb4>
  400998:	ac830000 	sw	v1,0(a0)
  40099c:	1000001f 	b	400a1c <markTwo+0xb4>
  4009a0:	ac850000 	sw	a1,0(a0)
  4009a4:	04400014 	bltz	v0,4009f8 <markTwo+0x90>
  4009a8:	00001821 	move	v1,zero
  4009ac:	04a00011 	bltz	a1,4009f4 <markTwo+0x8c>
  4009b0:	3c030041 	lui	v1,0x41
  4009b4:	8c631390 	lw	v1,5008(v1)
  4009b8:	00200825 	move	at,at
  4009bc:	0043302a 	slt	a2,v0,v1
  4009c0:	10c0000c 	beqz	a2,4009f4 <markTwo+0x8c>
  4009c4:	00a3182a 	slt	v1,a1,v1
  4009c8:	1060000a 	beqz	v1,4009f4 <markTwo+0x8c>
  4009cc:	3c030041 	lui	v1,0x41
  4009d0:	24631450 	addiu	v1,v1,5200
  4009d4:	00a32821 	addu	a1,a1,v1
  4009d8:	00431021 	addu	v0,v0,v1
  4009dc:	80460000 	lb	a2,0(v0)
  4009e0:	90a70000 	lbu	a3,0(a1)
  4009e4:	24030001 	li	v1,1
  4009e8:	a0470000 	sb	a3,0(v0)
  4009ec:	10000002 	b	4009f8 <markTwo+0x90>
  4009f0:	a0a60000 	sb	a2,0(a1)
  4009f4:	00001821 	move	v1,zero
  4009f8:	2402ffff 	li	v0,-1
  4009fc:	14600007 	bnez	v1,400a1c <markTwo+0xb4>
  400a00:	ac820000 	sw	v0,0(a0)
  400a04:	8f82803c 	lw	v0,-32708(gp)
  400a08:	8f99807c 	lw	t9,-32644(gp)
  400a0c:	8c450000 	lw	a1,0(v0)
  400a10:	3c040040 	lui	a0,0x40
  400a14:	0320f809 	jalr	t9
  400a18:	248411e0 	addiu	a0,a0,4576
  400a1c:	8fbf001c 	lw	ra,28(sp)
  400a20:	00001021 	move	v0,zero
  400a24:	03e00008 	jr	ra
  400a28:	27bd0020 	addiu	sp,sp,32

00400a2c <clearStdinBuf>:
  400a2c:	3c1c0042 	lui	gp,0x42
  400a30:	27bdffd8 	addiu	sp,sp,-40
  400a34:	279c93b0 	addiu	gp,gp,-27728
  400a38:	afbf0024 	sw	ra,36(sp)
  400a3c:	afb10020 	sw	s1,32(sp)
  400a40:	afb0001c 	sw	s0,28(sp)
  400a44:	afbc0010 	sw	gp,16(sp)
  400a48:	2411000a 	li	s1,10
  400a4c:	2410ffff 	li	s0,-1
  400a50:	8f998074 	lw	t9,-32652(gp)
  400a54:	00200825 	move	at,at
  400a58:	0320f809 	jalr	t9
  400a5c:	00200825 	move	at,at
  400a60:	8fbc0010 	lw	gp,16(sp)
  400a64:	10510003 	beq	v0,s1,400a74 <clearStdinBuf+0x48>
  400a68:	00200825 	move	at,at
  400a6c:	1450fff8 	bne	v0,s0,400a50 <clearStdinBuf+0x24>
  400a70:	00200825 	move	at,at
  400a74:	8fbf0024 	lw	ra,36(sp)
  400a78:	8fb10020 	lw	s1,32(sp)
  400a7c:	8fb0001c 	lw	s0,28(sp)
  400a80:	03e00008 	jr	ra
  400a84:	27bd0028 	addiu	sp,sp,40

00400a88 <getInput>:
  400a88:	3c1c0042 	lui	gp,0x42
  400a8c:	27bdffd8 	addiu	sp,sp,-40
  400a90:	279c93b0 	addiu	gp,gp,-27728
  400a94:	afbf0024 	sw	ra,36(sp)
  400a98:	afbc0010 	sw	gp,16(sp)
  400a9c:	8f828040 	lw	v0,-32704(gp)
  400aa0:	8f998060 	lw	t9,-32672(gp)
  400aa4:	8c460000 	lw	a2,0(v0)
  400aa8:	27a40018 	addiu	a0,sp,24
  400aac:	0320f809 	jalr	t9
  400ab0:	24050002 	li	a1,2
  400ab4:	0c10028b 	jal	400a2c <clearStdinBuf>
  400ab8:	00200825 	move	at,at
  400abc:	83a20018 	lb	v0,24(sp)
  400ac0:	8fbc0010 	lw	gp,16(sp)
  400ac4:	14400008 	bnez	v0,400ae8 <getInput+0x60>
  400ac8:	00200825 	move	at,at
  400acc:	8f82803c 	lw	v0,-32708(gp)
  400ad0:	8f99807c 	lw	t9,-32644(gp)
  400ad4:	8c450000 	lw	a1,0(v0)
  400ad8:	3c040040 	lui	a0,0x40
  400adc:	0320f809 	jalr	t9
  400ae0:	24841200 	addiu	a0,a0,4608
  400ae4:	2402ffff 	li	v0,-1
  400ae8:	8fbf0024 	lw	ra,36(sp)
  400aec:	00200825 	move	at,at
  400af0:	03e00008 	jr	ra
  400af4:	27bd0028 	addiu	sp,sp,40

00400af8 <chooseExchangeMethod>:
  400af8:	3c1c0042 	lui	gp,0x42
  400afc:	27bdffd8 	addiu	sp,sp,-40
  400b00:	279c93b0 	addiu	gp,gp,-27728
  400b04:	afbf0024 	sw	ra,36(sp)
  400b08:	afb00020 	sw	s0,32(sp)
  400b0c:	afbc0010 	sw	gp,16(sp)
  400b10:	8f998038 	lw	t9,-32712(gp)
  400b14:	3c040040 	lui	a0,0x40
  400b18:	0320f809 	jalr	t9
  400b1c:	2484120c 	addiu	a0,a0,4620
  400b20:	8fbc0010 	lw	gp,16(sp)
  400b24:	3c040040 	lui	a0,0x40
  400b28:	8f998038 	lw	t9,-32712(gp)
  400b2c:	00200825 	move	at,at
  400b30:	0320f809 	jalr	t9
  400b34:	24841220 	addiu	a0,a0,4640
  400b38:	8fbc0010 	lw	gp,16(sp)
  400b3c:	3c040040 	lui	a0,0x40
  400b40:	8f998038 	lw	t9,-32712(gp)
  400b44:	00200825 	move	at,at
  400b48:	0320f809 	jalr	t9
  400b4c:	24841230 	addiu	a0,a0,4656
  400b50:	0c1002a2 	jal	400a88 <getInput>
  400b54:	00200825 	move	at,at
  400b58:	8fbc0010 	lw	gp,16(sp)
  400b5c:	00023600 	sll	a2,v0,0x18
  400b60:	00063603 	sra	a2,a2,0x18
  400b64:	8f99804c 	lw	t9,-32692(gp)
  400b68:	3c040040 	lui	a0,0x40
  400b6c:	00408021 	move	s0,v0
  400b70:	00c02821 	move	a1,a2
  400b74:	afa60018 	sw	a2,24(sp)
  400b78:	0320f809 	jalr	t9
  400b7c:	24841240 	addiu	a0,a0,4672
  400b80:	2602ffcf 	addiu	v0,s0,-49
  400b84:	2c420009 	sltiu	v0,v0,9
  400b88:	8fbc0010 	lw	gp,16(sp)
  400b8c:	8fa60018 	lw	a2,24(sp)
  400b90:	14400008 	bnez	v0,400bb4 <chooseExchangeMethod+0xbc>
  400b94:	3c050040 	lui	a1,0x40
  400b98:	8f82803c 	lw	v0,-32708(gp)
  400b9c:	8f998044 	lw	t9,-32700(gp)
  400ba0:	8c440000 	lw	a0,0(v0)
  400ba4:	0320f809 	jalr	t9
  400ba8:	24a5124c 	addiu	a1,a1,4684
  400bac:	10000014 	b	400c00 <chooseExchangeMethod+0x108>
  400bb0:	2402ffff 	li	v0,-1
  400bb4:	24020031 	li	v0,49
  400bb8:	12020006 	beq	s0,v0,400bd4 <chooseExchangeMethod+0xdc>
  400bbc:	3c030040 	lui	v1,0x40
  400bc0:	24030032 	li	v1,50
  400bc4:	1603000a 	bne	s0,v1,400bf0 <chooseExchangeMethod+0xf8>
  400bc8:	3c020041 	lui	v0,0x41
  400bcc:	10000004 	b	400be0 <chooseExchangeMethod+0xe8>
  400bd0:	3c030040 	lui	v1,0x40
  400bd4:	24630968 	addiu	v1,v1,2408
  400bd8:	10000002 	b	400be4 <chooseExchangeMethod+0xec>
  400bdc:	3c020041 	lui	v0,0x41
  400be0:	2463086c 	addiu	v1,v1,2156
  400be4:	ac4313a0 	sw	v1,5024(v0)
  400be8:	10000005 	b	400c00 <chooseExchangeMethod+0x108>
  400bec:	00001021 	move	v0,zero
  400bf0:	3c030040 	lui	v1,0x40
  400bf4:	24630968 	addiu	v1,v1,2408
  400bf8:	ac4313a0 	sw	v1,5024(v0)
  400bfc:	2402ffff 	li	v0,-1
  400c00:	8fbf0024 	lw	ra,36(sp)
  400c04:	8fb00020 	lw	s0,32(sp)
  400c08:	03e00008 	jr	ra
  400c0c:	27bd0028 	addiu	sp,sp,40

00400c10 <rearrange>:
  400c10:	3c1c0042 	lui	gp,0x42
  400c14:	27bdffb0 	addiu	sp,sp,-80
  400c18:	279c93b0 	addiu	gp,gp,-27728
  400c1c:	afbf004c 	sw	ra,76(sp)
  400c20:	afbe0048 	sw	s8,72(sp)
  400c24:	afb70044 	sw	s7,68(sp)
  400c28:	afb60040 	sw	s6,64(sp)
  400c2c:	afb5003c 	sw	s5,60(sp)
  400c30:	afb40038 	sw	s4,56(sp)
  400c34:	afb30034 	sw	s3,52(sp)
  400c38:	afb20030 	sw	s2,48(sp)
  400c3c:	afb1002c 	sw	s1,44(sp)
  400c40:	afb00028 	sw	s0,40(sp)
  400c44:	afbc0010 	sw	gp,16(sp)
  400c48:	24a2fffd 	addiu	v0,a1,-3
  400c4c:	2403ffff 	li	v1,-1
  400c50:	2c420005 	sltiu	v0,v0,5
  400c54:	00a08821 	move	s1,a1
  400c58:	1440000d 	bnez	v0,400c90 <rearrange+0x80>
  400c5c:	afa30018 	sw	v1,24(sp)
  400c60:	8f828058 	lw	v0,-32680(gp)
  400c64:	8f99807c 	lw	t9,-32644(gp)
  400c68:	8c450000 	lw	a1,0(v0)
  400c6c:	3c040040 	lui	a0,0x40
  400c70:	0320f809 	jalr	t9
  400c74:	2484125c 	addiu	a0,a0,4700
  400c78:	8fbc0010 	lw	gp,16(sp)
  400c7c:	00200825 	move	at,at
  400c80:	8f998034 	lw	t9,-32716(gp)
  400c84:	00200825 	move	at,at
  400c88:	0320f809 	jalr	t9
  400c8c:	2404ffff 	li	a0,-1
  400c90:	3c100041 	lui	s0,0x41
  400c94:	3c1e0040 	lui	s8,0x40
  400c98:	3c170040 	lui	s7,0x40
  400c9c:	3c160040 	lui	s6,0x40
  400ca0:	3c150040 	lui	s5,0x40
  400ca4:	3c140040 	lui	s4,0x40
  400ca8:	3c130040 	lui	s3,0x40
  400cac:	27a20018 	addiu	v0,sp,24
  400cb0:	26101450 	addiu	s0,s0,5200
  400cb4:	27de12bc 	addiu	s8,s8,4796
  400cb8:	26f712d4 	addiu	s7,s7,4820
  400cbc:	26d612f0 	addiu	s6,s6,4848
  400cc0:	26b51314 	addiu	s5,s5,4884
  400cc4:	2694131c 	addiu	s4,s4,4892
  400cc8:	26731330 	addiu	s3,s3,4912
  400ccc:	3c120041 	lui	s2,0x41
  400cd0:	afa20020 	sw	v0,32(sp)
  400cd4:	8fa30018 	lw	v1,24(sp)
  400cd8:	2402ffff 	li	v0,-1
  400cdc:	1462002d 	bne	v1,v0,400d94 <rearrange+0x184>
  400ce0:	00200825 	move	at,at
  400ce4:	8f998064 	lw	t9,-32668(gp)
  400ce8:	00200825 	move	at,at
  400cec:	0320f809 	jalr	t9
  400cf0:	2404000a 	li	a0,10
  400cf4:	8fbc0010 	lw	gp,16(sp)
  400cf8:	3c040040 	lui	a0,0x40
  400cfc:	8f998038 	lw	t9,-32712(gp)
  400d00:	00200825 	move	at,at
  400d04:	0320f809 	jalr	t9
  400d08:	24841274 	addiu	a0,a0,4724
  400d0c:	8fbc0010 	lw	gp,16(sp)
  400d10:	24050001 	li	a1,1
  400d14:	8f82803c 	lw	v0,-32708(gp)
  400d18:	8f998048 	lw	t9,-32696(gp)
  400d1c:	8c470000 	lw	a3,0(v0)
  400d20:	02203021 	move	a2,s1
  400d24:	0320f809 	jalr	t9
  400d28:	02002021 	move	a0,s0
  400d2c:	8fbc0010 	lw	gp,16(sp)
  400d30:	3c040040 	lui	a0,0x40
  400d34:	8f998038 	lw	t9,-32712(gp)
  400d38:	00200825 	move	at,at
  400d3c:	0320f809 	jalr	t9
  400d40:	248412a8 	addiu	a0,a0,4776
  400d44:	8fbc0010 	lw	gp,16(sp)
  400d48:	00200825 	move	at,at
  400d4c:	8f998038 	lw	t9,-32712(gp)
  400d50:	00200825 	move	at,at
  400d54:	0320f809 	jalr	t9
  400d58:	03c02021 	move	a0,s8
  400d5c:	8fbc0010 	lw	gp,16(sp)
  400d60:	00200825 	move	at,at
  400d64:	8f998038 	lw	t9,-32712(gp)
  400d68:	00200825 	move	at,at
  400d6c:	0320f809 	jalr	t9
  400d70:	02e02021 	move	a0,s7
  400d74:	8fbc0010 	lw	gp,16(sp)
  400d78:	00200825 	move	at,at
  400d7c:	8f998038 	lw	t9,-32712(gp)
  400d80:	00200825 	move	at,at
  400d84:	0320f809 	jalr	t9
  400d88:	02c02021 	move	a0,s6
  400d8c:	8fbc0010 	lw	gp,16(sp)
  400d90:	00200825 	move	at,at
  400d94:	8f998064 	lw	t9,-32668(gp)
  400d98:	00200825 	move	at,at
  400d9c:	0320f809 	jalr	t9
  400da0:	2404000a 	li	a0,10
  400da4:	8fbc0010 	lw	gp,16(sp)
  400da8:	02002821 	move	a1,s0
  400dac:	8f99804c 	lw	t9,-32692(gp)
  400db0:	00200825 	move	at,at
  400db4:	0320f809 	jalr	t9
  400db8:	02a02021 	move	a0,s5
  400dbc:	8fbc0010 	lw	gp,16(sp)
  400dc0:	00200825 	move	at,at
  400dc4:	8f998064 	lw	t9,-32668(gp)
  400dc8:	00200825 	move	at,at
  400dcc:	0320f809 	jalr	t9
  400dd0:	2404000a 	li	a0,10
  400dd4:	0c1002a2 	jal	400a88 <getInput>
  400dd8:	00200825 	move	at,at
  400ddc:	8fbc0010 	lw	gp,16(sp)
  400de0:	00022e00 	sll	a1,v0,0x18
  400de4:	8f99804c 	lw	t9,-32692(gp)
  400de8:	02802021 	move	a0,s4
  400dec:	00052e03 	sra	a1,a1,0x18
  400df0:	0320f809 	jalr	t9
  400df4:	afa20024 	sw	v0,36(sp)
  400df8:	8fa30024 	lw	v1,36(sp)
  400dfc:	8fbc0010 	lw	gp,16(sp)
  400e00:	2462ffd0 	addiu	v0,v1,-48
  400e04:	2c42000a 	sltiu	v0,v0,10
  400e08:	10400007 	beqz	v0,400e28 <rearrange+0x218>
  400e0c:	24020065 	li	v0,101
  400e10:	8e5913a0 	lw	t9,5024(s2)
  400e14:	8fa40020 	lw	a0,32(sp)
  400e18:	0320f809 	jalr	t9
  400e1c:	00602821 	move	a1,v1
  400e20:	1000001e 	b	400e9c <rearrange+0x28c>
  400e24:	00200825 	move	at,at
  400e28:	1062001f 	beq	v1,v0,400ea8 <rearrange+0x298>
  400e2c:	28620066 	slti	v0,v1,102
  400e30:	10400008 	beqz	v0,400e54 <rearrange+0x244>
  400e34:	2402006d 	li	v0,109
  400e38:	2402000a 	li	v0,10
  400e3c:	1062000b 	beq	v1,v0,400e6c <rearrange+0x25c>
  400e40:	24020063 	li	v0,99
  400e44:	14620011 	bne	v1,v0,400e8c <rearrange+0x27c>
  400e48:	00200825 	move	at,at
  400e4c:	1000ffa1 	b	400cd4 <rearrange+0xc4>
  400e50:	00200825 	move	at,at
  400e54:	10620009 	beq	v1,v0,400e7c <rearrange+0x26c>
  400e58:	24020078 	li	v0,120
  400e5c:	1462000b 	bne	v1,v0,400e8c <rearrange+0x27c>
  400e60:	00001021 	move	v0,zero
  400e64:	10000011 	b	400eac <rearrange+0x29c>
  400e68:	00200825 	move	at,at
  400e6c:	3c040040 	lui	a0,0x40
  400e70:	8f99804c 	lw	t9,-32692(gp)
  400e74:	10000007 	b	400e94 <rearrange+0x284>
  400e78:	24841328 	addiu	a0,a0,4904
  400e7c:	0c1002be 	jal	400af8 <chooseExchangeMethod>
  400e80:	00002021 	move	a0,zero
  400e84:	10000005 	b	400e9c <rearrange+0x28c>
  400e88:	00200825 	move	at,at
  400e8c:	8f998038 	lw	t9,-32712(gp)
  400e90:	02602021 	move	a0,s3
  400e94:	0320f809 	jalr	t9
  400e98:	00200825 	move	at,at
  400e9c:	8fbc0010 	lw	gp,16(sp)
  400ea0:	1000ff8c 	b	400cd4 <rearrange+0xc4>
  400ea4:	00200825 	move	at,at
  400ea8:	24020001 	li	v0,1
  400eac:	8fbf004c 	lw	ra,76(sp)
  400eb0:	8fbe0048 	lw	s8,72(sp)
  400eb4:	8fb70044 	lw	s7,68(sp)
  400eb8:	8fb60040 	lw	s6,64(sp)
  400ebc:	8fb5003c 	lw	s5,60(sp)
  400ec0:	8fb40038 	lw	s4,56(sp)
  400ec4:	8fb30034 	lw	s3,52(sp)
  400ec8:	8fb20030 	lw	s2,48(sp)
  400ecc:	8fb1002c 	lw	s1,44(sp)
  400ed0:	8fb00028 	lw	s0,40(sp)
  400ed4:	03e00008 	jr	ra
  400ed8:	27bd0050 	addiu	sp,sp,80

00400edc <main>:
  400edc:	3c1c0042 	lui	gp,0x42
  400ee0:	27bdffd8 	addiu	sp,sp,-40
  400ee4:	279c93b0 	addiu	gp,gp,-27728
  400ee8:	afbf0024 	sw	ra,36(sp)
  400eec:	afb10020 	sw	s1,32(sp)
  400ef0:	afb0001c 	sw	s0,28(sp)
  400ef4:	afbc0010 	sw	gp,16(sp)
  400ef8:	28840002 	slti	a0,a0,2
  400efc:	1080000d 	beqz	a0,400f34 <main+0x58>
  400f00:	00200825 	move	at,at
  400f04:	8f828058 	lw	v0,-32680(gp)
  400f08:	8f99807c 	lw	t9,-32644(gp)
  400f0c:	8c450000 	lw	a1,0(v0)
  400f10:	3c040040 	lui	a0,0x40
  400f14:	0320f809 	jalr	t9
  400f18:	24841340 	addiu	a0,a0,4928
  400f1c:	8fbc0010 	lw	gp,16(sp)
  400f20:	00200825 	move	at,at
  400f24:	8f998034 	lw	t9,-32716(gp)
  400f28:	00200825 	move	at,at
  400f2c:	0320f809 	jalr	t9
  400f30:	2404ffff 	li	a0,-1
  400f34:	8cb10004 	lw	s1,4(a1)
  400f38:	8f998054 	lw	t9,-32684(gp)
  400f3c:	00200825 	move	at,at
  400f40:	0320f809 	jalr	t9
  400f44:	02202021 	move	a0,s1
  400f48:	8fbc0010 	lw	gp,16(sp)
  400f4c:	00408021 	move	s0,v0
  400f50:	8f998068 	lw	t9,-32664(gp)
  400f54:	3c020041 	lui	v0,0x41
  400f58:	3c040041 	lui	a0,0x41
  400f5c:	02003021 	move	a2,s0
  400f60:	02202821 	move	a1,s1
  400f64:	ac501390 	sw	s0,5008(v0)
  400f68:	0320f809 	jalr	t9
  400f6c:	24841450 	addiu	a0,a0,5200
  400f70:	02202021 	move	a0,s1
  400f74:	0c100304 	jal	400c10 <rearrange>
  400f78:	02002821 	move	a1,s0
  400f7c:	8fbf0024 	lw	ra,36(sp)
  400f80:	00001021 	move	v0,zero
  400f84:	8fb10020 	lw	s1,32(sp)
  400f88:	8fb0001c 	lw	s0,28(sp)
  400f8c:	03e00008 	jr	ra
  400f90:	27bd0028 	addiu	sp,sp,40
  400f94:	00200825 	move	at,at
  400f98:	00200825 	move	at,at
  400f9c:	00200825 	move	at,at

00400fa0 <__libc_csu_fini>:
  400fa0:	03e00008 	jr	ra
  400fa4:	00200825 	move	at,at

00400fa8 <__libc_csu_init>:
  400fa8:	3c1c0002 	lui	gp,0x2
  400fac:	279c8408 	addiu	gp,gp,-31736
  400fb0:	0399e021 	addu	gp,gp,t9
  400fb4:	27bdffc8 	addiu	sp,sp,-56
  400fb8:	afbf0034 	sw	ra,52(sp)
  400fbc:	afb50030 	sw	s5,48(sp)
  400fc0:	afb4002c 	sw	s4,44(sp)
  400fc4:	afb30028 	sw	s3,40(sp)
  400fc8:	afb20024 	sw	s2,36(sp)
  400fcc:	afb10020 	sw	s1,32(sp)
  400fd0:	afb0001c 	sw	s0,28(sp)
  400fd4:	afbc0010 	sw	gp,16(sp)
  400fd8:	8f99802c 	lw	t9,-32724(gp)
  400fdc:	00809821 	move	s3,a0
  400fe0:	00a0a021 	move	s4,a1
  400fe4:	0320f809 	jalr	t9
  400fe8:	00c0a821 	move	s5,a2
  400fec:	8fbc0010 	lw	gp,16(sp)
  400ff0:	00200825 	move	at,at
  400ff4:	8f91801c 	lw	s1,-32740(gp)
  400ff8:	8f92801c 	lw	s2,-32740(gp)
  400ffc:	00200825 	move	at,at
  401000:	02519023 	subu	s2,s2,s1
  401004:	00129083 	sra	s2,s2,0x2
  401008:	1240000a 	beqz	s2,401034 <__libc_csu_init+0x8c>
  40100c:	00008021 	move	s0,zero
  401010:	8e390000 	lw	t9,0(s1)
  401014:	26100001 	addiu	s0,s0,1
  401018:	02602021 	move	a0,s3
  40101c:	02802821 	move	a1,s4
  401020:	0320f809 	jalr	t9
  401024:	02a03021 	move	a2,s5
  401028:	0212102b 	sltu	v0,s0,s2
  40102c:	1440fff8 	bnez	v0,401010 <__libc_csu_init+0x68>
  401030:	26310004 	addiu	s1,s1,4
  401034:	8fbf0034 	lw	ra,52(sp)
  401038:	8fb50030 	lw	s5,48(sp)
  40103c:	8fb4002c 	lw	s4,44(sp)
  401040:	8fb30028 	lw	s3,40(sp)
  401044:	8fb20024 	lw	s2,36(sp)
  401048:	8fb10020 	lw	s1,32(sp)
  40104c:	8fb0001c 	lw	s0,28(sp)
  401050:	03e00008 	jr	ra
  401054:	27bd0038 	addiu	sp,sp,56
  401058:	00200825 	move	at,at
  40105c:	00200825 	move	at,at

00401060 <__do_global_ctors_aux>:
  401060:	3c020041 	lui	v0,0x41
  401064:	8c591368 	lw	t9,4968(v0)
  401068:	27bdffd8 	addiu	sp,sp,-40
  40106c:	2402ffff 	li	v0,-1
  401070:	afbf0024 	sw	ra,36(sp)
  401074:	afb10020 	sw	s1,32(sp)
  401078:	1322000a 	beq	t9,v0,4010a4 <__do_global_ctors_aux+0x44>
  40107c:	afb0001c 	sw	s0,28(sp)
  401080:	3c100041 	lui	s0,0x41
  401084:	26101368 	addiu	s0,s0,4968
  401088:	2411ffff 	li	s1,-1
  40108c:	0320f809 	jalr	t9
  401090:	2610fffc 	addiu	s0,s0,-4
  401094:	8e190000 	lw	t9,0(s0)
  401098:	00200825 	move	at,at
  40109c:	1731fffb 	bne	t9,s1,40108c <__do_global_ctors_aux+0x2c>
  4010a0:	00200825 	move	at,at
  4010a4:	8fbf0024 	lw	ra,36(sp)
  4010a8:	8fb10020 	lw	s1,32(sp)
  4010ac:	8fb0001c 	lw	s0,28(sp)
  4010b0:	03e00008 	jr	ra
  4010b4:	27bd0028 	addiu	sp,sp,40
  4010b8:	00200825 	move	at,at
  4010bc:	00200825 	move	at,at

Disassembly of section .MIPS.stubs:

004010c0 <.MIPS.stubs>:
  4010c0:	8f998010 	lw	t9,-32752(gp)
  4010c4:	03e07821 	move	t7,ra
  4010c8:	0320f809 	jalr	t9
  4010cc:	24180018 	li	t8,24
  4010d0:	8f998010 	lw	t9,-32752(gp)
  4010d4:	03e07821 	move	t7,ra
  4010d8:	0320f809 	jalr	t9
  4010dc:	24180016 	li	t8,22
  4010e0:	8f998010 	lw	t9,-32752(gp)
  4010e4:	03e07821 	move	t7,ra
  4010e8:	0320f809 	jalr	t9
  4010ec:	24180013 	li	t8,19
  4010f0:	8f998010 	lw	t9,-32752(gp)
  4010f4:	03e07821 	move	t7,ra
  4010f8:	0320f809 	jalr	t9
  4010fc:	24180012 	li	t8,18
  401100:	8f998010 	lw	t9,-32752(gp)
  401104:	03e07821 	move	t7,ra
  401108:	0320f809 	jalr	t9
  40110c:	24180011 	li	t8,17
  401110:	8f998010 	lw	t9,-32752(gp)
  401114:	03e07821 	move	t7,ra
  401118:	0320f809 	jalr	t9
  40111c:	24180010 	li	t8,16
  401120:	8f998010 	lw	t9,-32752(gp)
  401124:	03e07821 	move	t7,ra
  401128:	0320f809 	jalr	t9
  40112c:	2418000e 	li	t8,14
  401130:	8f998010 	lw	t9,-32752(gp)
  401134:	03e07821 	move	t7,ra
  401138:	0320f809 	jalr	t9
  40113c:	2418000c 	li	t8,12
  401140:	8f998010 	lw	t9,-32752(gp)
  401144:	03e07821 	move	t7,ra
  401148:	0320f809 	jalr	t9
  40114c:	2418000b 	li	t8,11
  401150:	8f998010 	lw	t9,-32752(gp)
  401154:	03e07821 	move	t7,ra
  401158:	0320f809 	jalr	t9
  40115c:	2418000a 	li	t8,10
  401160:	8f998010 	lw	t9,-32752(gp)
  401164:	03e07821 	move	t7,ra
  401168:	0320f809 	jalr	t9
  40116c:	24180007 	li	t8,7
  401170:	8f998010 	lw	t9,-32752(gp)
  401174:	03e07821 	move	t7,ra
  401178:	0320f809 	jalr	t9
  40117c:	24180006 	li	t8,6
	...

Disassembly of section .fini:

00401190 <_fini>:
  401190:	3c1c0002 	lui	gp,0x2
  401194:	279c8220 	addiu	gp,gp,-32224
  401198:	0399e021 	addu	gp,gp,t9
  40119c:	27bdffe0 	addiu	sp,sp,-32
  4011a0:	afbf001c 	sw	ra,28(sp)
  4011a4:	afbc0010 	sw	gp,16(sp)
  4011a8:	04110001 	bal	4011b0 <_fini+0x20>
  4011ac:	00200825 	move	at,at
  4011b0:	3c1c0042 	lui	gp,0x42
  4011b4:	279c93b0 	addiu	gp,gp,-27728
  4011b8:	8f998018 	lw	t9,-32744(gp)
  4011bc:	00200825 	move	at,at
  4011c0:	27390710 	addiu	t9,t9,1808
  4011c4:	0411fd52 	bal	400710 <__do_global_dtors_aux>
  4011c8:	00200825 	move	at,at
  4011cc:	8fbf001c 	lw	ra,28(sp)
  4011d0:	00200825 	move	at,at
  4011d4:	03e00008 	jr	ra
  4011d8:	27bd0020 	addiu	sp,sp,32

Disassembly of section .rodata:

004011dc <_IO_stdin_used>:
  4011dc:	00020001 	0x20001
  4011e0:	496e7661 	0x496e7661
  4011e4:	6c696420 	0x6c696420
  4011e8:	696e7075 	0x696e7075
  4011ec:	7420666f 	jalx	8199bc <_gp+0x40060c>
  4011f0:	72206578 	0x72206578
  4011f4:	6368616e 	0x6368616e
  4011f8:	67696e67 	0x67696e67
  4011fc:	0a000000 	j	8000000 <_gp+0x7be6c50>
  401200:	4e6f2069 	c3	0x6f2069
  401204:	6e707574 	0x6e707574
  401208:	0a000000 	j	8000000 <_gp+0x7be6c50>
  40120c:	53656c65 	beql	k1,a1,41c3a4 <_gp+0x2ff4>
  401210:	63742074 	0x63742074
  401214:	6865206d 	0x6865206d
  401218:	6574686f 	0x6574686f
  40121c:	643a0000 	0x643a0000
  401220:	3120746f 	andi	zero,t1,0x746f
  401224:	206d6172 	addi	t5,v1,24946
  401228:	6b54776f 	0x6b54776f
  40122c:	00000000 	nop
  401230:	3220746f 	andi	zero,s1,0x746f
  401234:	206d6172 	addi	t5,v1,24946
  401238:	6b496e73 	0x6b496e73
  40123c:	65727400 	0x65727400
  401240:	43686f6f 	c0	0x1686f6f
  401244:	73652025 	0x73652025
  401248:	630a0000 	0x630a0000
  40124c:	25632075 	addiu	v1,t3,8309
  401250:	6e737570 	0x6e737570
  401254:	706f7274 	0x706f7274
  401258:	65640a00 	0x65640a00
  40125c:	496e7661 	0x496e7661
  401260:	6c696420 	0x6c696420
  401264:	73747269 	0x73747269
  401268:	6e67206c 	0x6e67206c
  40126c:	656e6774 	0x656e6774
  401270:	680a0000 	0x680a0000
  401274:	496e7075 	0x496e7075
  401278:	74207468 	jalx	81d1a0 <_gp+0x403df0>
  40127c:	6520696e 	0x6520696e
  401280:	64657820 	0x64657820
  401284:	6f662074 	0x6f662074
  401288:	68652063 	0x68652063
  40128c:	68617220 	0x68617220
  401290:	796f7520 	0x796f7520
  401294:	77616e74 	jalx	d85b9d0 <_gp+0xd442620>
  401298:	20746f20 	addi	s4,v1,28448
  40129c:	65786368 	0x65786368
  4012a0:	616e6765 	0x616e6765
  4012a4:	00000000 	nop
  4012a8:	0a4f7220 	j	93dc880 <_gp+0x8fc34d0>
  4012ac:	63686f6f 	0x63686f6f
  4012b0:	7365206f 	0x7365206f
  4012b4:	7074696f 	0x7074696f
  4012b8:	6e3a0000 	0x6e3a0000
  4012bc:	7820746f 	0x7820746f
  4012c0:	20657869 	addi	a1,v1,30825
  4012c4:	74207468 	jalx	81d1a0 <_gp+0x403df0>
  4012c8:	65207072 	0x65207072
  4012cc:	6f677261 	0x6f677261
  4012d0:	6d000000 	0x6d000000
  4012d4:	6d20746f 	0x6d20746f
  4012d8:	2063686f 	addi	v1,v1,26735
  4012dc:	6f736520 	0x6f736520
  4012e0:	65786368 	0x65786368
  4012e4:	616e6765 	0x616e6765
  4012e8:	206d6574 	addi	t5,v1,25972
  4012ec:	686f6400 	0x686f6400
  4012f0:	6320746f 	0x6320746f
  4012f4:	20636f6d 	addi	v1,v1,28525
  4012f8:	70617265 	0x70617265
  4012fc:	20746865 	addi	s4,v1,26725
  401300:	20737472 	addi	s3,v1,29810
  401304:	696e6720 	0x696e6720
  401308:	77697468 	jalx	da5d1a0 <_gp+0xd643df0>
  40130c:	206c6973 	addi	t4,v1,26995
  401310:	74000000 	jalx	0 <_DYNAMIC-0x4001c0>
  401314:	09092573 	j	42495cc <_gp+0x3e3021c>
  401318:	0a000000 	j	8000000 <_gp+0x7be6c50>
  40131c:	496e7075 	0x496e7075
  401320:	743a2025 	jalx	e88094 <_gp+0xa6ece4>
  401324:	630a0000 	0x630a0000
  401328:	6e65776c 	0x6e65776c
  40132c:	696e6500 	0x696e6500
  401330:	496e7661 	0x496e7661
  401334:	6c696420 	0x6c696420
  401338:	696e7075 	0x696e7075
  40133c:	74000000 	jalx	0 <_DYNAMIC-0x4001c0>
  401340:	496e7075 	0x496e7075
  401344:	7420666f 	jalx	8199bc <_gp+0x40060c>
  401348:	726d6174 	0x726d6174
  40134c:	3a202e2f 	xori	zero,s1,0x2e2f
  401350:	72656172 	0x72656172
  401354:	72616e67 	0x72616e67
  401358:	65207b57 	0x65207b57
  40135c:	4f52447d 	c3	0x152447d
  401360:	0a000000 	j	8000000 <_gp+0x7be6c50>

Disassembly of section .eh_frame:

00401364 <__FRAME_END__>:
  401364:	00000000 	nop

Disassembly of section .ctors:

00411368 <__CTOR_LIST__>:
  411368:	ffffffff 	sdc3	$31,-1(ra)

0041136c <__CTOR_END__>:
  41136c:	00000000 	nop

Disassembly of section .dtors:

00411370 <__DTOR_LIST__>:
  411370:	ffffffff 	sdc3	$31,-1(ra)

00411374 <__DTOR_END__>:
  411374:	00000000 	nop

Disassembly of section .jcr:

00411378 <__JCR_END__>:
  411378:	00000000 	nop

Disassembly of section .data:

00411380 <__data_start>:
	...

00411390 <numChars>:
  411390:	00000007 	srav	zero,zero,zero
	...

004113a0 <exchangeFunc>:
  4113a0:	00400968 	0x400968
	...

Disassembly of section .rld_map:

004113b0 <__RLD_MAP>:
  4113b0:	00000000 	nop

Disassembly of section .got:

004113c0 <_GLOBAL_OFFSET_TABLE_>:
  4113c0:	00000000 	nop
  4113c4:	80000000 	lb	zero,0(zero)
  4113c8:	00400000 	0x400000
  4113cc:	00411368 	0x411368
	...
  4113dc:	00400614 	0x400614
  4113e0:	00400edc 	0x400edc
  4113e4:	00401170 	tge	v0,zero,0x45
  4113e8:	00401160 	0x401160
	...
  4113f4:	00401150 	0x401150
  4113f8:	00401140 	0x401140
  4113fc:	00401130 	tge	v0,zero,0x44
  411400:	00400fa8 	0x400fa8
  411404:	00401120 	0x401120
  411408:	00000000 	nop
  41140c:	00401110 	0x401110
  411410:	00401100 	0x401100
  411414:	004010f0 	tge	v0,zero,0x43
  411418:	004010e0 	0x4010e0
	...
  411424:	004010d0 	0x4010d0
  411428:	00400fa0 	0x400fa0
  41142c:	004010c0 	0x4010c0

Disassembly of section .sdata:

00411430 <__dso_handle>:
  411430:	00000000 	nop

Disassembly of section .bss:

00411440 <completed.5789>:
  411440:	00000000 	nop

00411444 <dtor_idx.5791>:
	...

00411450 <buffer>:
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	004007f0 	tge	v0,zero,0x1f
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	004007f8 	0x4007f8
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	00400804 	sllv	at,zero,v0
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	0040086c 	0x40086c
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	00400968 	0x400968
  84:	80000000 	lb	zero,0(zero)
  88:	fffffffc 	sdc3	$31,-4(ra)
	...
  94:	00000020 	add	zero,zero,zero
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	00400a2c 	0x400a2c
  a4:	80030000 	lb	v1,0(zero)
  a8:	fffffffc 	sdc3	$31,-4(ra)
	...
  b4:	00000028 	0x28
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f
  c0:	00400a88 	0x400a88
  c4:	80000000 	lb	zero,0(zero)
  c8:	fffffffc 	sdc3	$31,-4(ra)
	...
  d4:	00000028 	0x28
  d8:	0000001d 	0x1d
  dc:	0000001f 	0x1f
  e0:	00400af8 	0x400af8
  e4:	80010000 	lb	at,0(zero)
  e8:	fffffffc 	sdc3	$31,-4(ra)
	...
  f4:	00000028 	0x28
  f8:	0000001d 	0x1d
  fc:	0000001f 	0x1f
 100:	00400c10 	0x400c10
 104:	c0ff0000 	ll	ra,0(a3)
 108:	fffffffc 	sdc3	$31,-4(ra)
	...
 114:	00000050 	0x50
 118:	0000001d 	0x1d
 11c:	0000001f 	0x1f
 120:	00400edc 	0x400edc
 124:	80030000 	lb	v1,0(zero)
 128:	fffffffc 	sdc3	$31,-4(ra)
	...
 134:	00000028 	0x28
 138:	0000001d 	0x1d
 13c:	0000001f 	0x1f
 140:	00400fa0 	0x400fa0
	...
 158:	0000001d 	0x1d
 15c:	0000001f 	0x1f
 160:	00400fa8 	0x400fa8
 164:	803f0000 	lb	ra,0(at)
 168:	fffffffc 	sdc3	$31,-4(ra)
	...
 174:	00000038 	0x38
 178:	0000001d 	0x1d
 17c:	0000001f 	0x1f

Disassembly of section .comment:

00000000 <.comment>:
   0:	4743433a 	c1	0x143433a
   4:	20284465 	addi	t0,at,17509
   8:	6269616e 	0x6269616e
   c:	20342e34 	addi	s4,at,11828
  10:	2e352d38 	sltiu	s5,s1,11576
  14:	2920342e 	slti	zero,t1,13358
  18:	342e3500 	ori	t6,at,0x3500
  1c:	4743433a 	c1	0x143433a
  20:	20284465 	addi	t0,at,17509
  24:	6269616e 	0x6269616e
  28:	20342e34 	addi	s4,at,11828
  2c:	2e352d31 	sltiu	s5,s1,11569
  30:	30292034 	andi	t1,at,0x2034
  34:	2e342e35 	sltiu	s4,s1,11829
	...

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	41000000 	bc0f	4 <_DYNAMIC-0x4001bc>
   4:	0f676e75 	jal	d9db9d4 <_gp+0xd5c2624>
   8:	00010000 	sll	zero,at,0x0
   c:	00070401 	0x70401
