################################################################################
# Address: 0x8034ea34 # VIRetrace
################################################################################

.include "Common/Common.s"

.set DevelopModeInput_GetButtons, 0x8022558c
.set DevelopModeInput_GetPressed, 0x802255a4

.set TOGGLE_VIS_FLAGS, 0x80002FBC
.set TIMER_GOBJ, 0x80002FB4
.set MENU_GOBJ, 0x80002fac

.set PLINK_ARRAY_OFST, -0x3e74
#.set GXLINK_ARRAY_OFST, -0x3e7C
.set PLINK_UI, 0x3c # Stocks & Percents

#.set PLINK_MENU_CAM, 0x48 # EVERYTHING
#.set PLINK_MENU_LIGHTS, 0xc # lights
#.set PLINK_MENU_STAGE, 0x14 # stage
#.set PLINK_MENU_PLAYERS, 0x20 # players
#.set PLINK_MENU_GFX, 0x2c # GFX
#.set PLINK_MENU_SCENE, 0xc #


.set NEXT, 0x8
.set FLAGS, 0x1c

.set REG_CURRENT, 31
.set REG_LOOP, 30
.set REG_NEXT, 29
.set REG_PLINK, 28
.set REG_VISFLAG, 27
.set REG_TIMER, 26
.set REG_MENU, 24

# Original line
#li r4, 0
#mr	r31, r3
cmplwi	r12, 0

backup

# Get PLink array
lwz REG_CURRENT, PLINK_ARRAY_OFST(r13)
# Get UI array
lwz REG_CURRENT, PLINK_UI(REG_CURRENT)


li r3, 1 # port 2
branchl r12, DevelopModeInput_GetPressed
rlwinm.	r0, r3, 0, 29, 29 #(00000004) # check for dpad down
beq-    MENU


load REG_VISFLAG, TOGGLE_VIS_FLAGS
lbz r23, 0(REG_VISFLAG)
cmpwi r23, 0x1
bge LOOP_EXIT



LOOP_INIT:
    li REG_LOOP, 0
LOOP:
    # Print index and set first byte of flags to 00
    lwz REG_NEXT, NEXT(REG_CURRENT)
    logf LOG_LEVEL_INFO, "idx: %d, DISABLE: %08x", "mr r5, REG_LOOP", "mr r6, REG_NEXT"

    # Disable gobj
    lwz r0, FLAGS(REG_CURRENT)
    rlwinm r0, r0, 0, 0x7FFFFFFF
    stw r0, FLAGS(REG_CURRENT)

        DIS_TIMER:
        load REG_TIMER, TIMER_GOBJ
        lwz r25, 0(REG_TIMER)
        lwz r0, FLAGS(r25)
        rlwinm r0, r0, 0, 0x7FFFFFFF
        stw r0, FLAGS(r25)

    # Update current pointer
    mr REG_CURRENT, REG_NEXT
LOOP_INC:
    addi REG_LOOP, REG_LOOP, 1
LOOP_CHECK:
    cmpwi REG_NEXT, 0
    bne LOOP
    addi r23, r23, 0x1
    stb r23, 0(REG_VISFLAG)
    cmpwi r23, 0x1
    beq EXIT



LOOP_EXIT:

lbz r23, 0(REG_VISFLAG)
cmpwi r23, 0x1
bne- EXIT

DIS_LOOP_INIT:
    li REG_LOOP, 0
DIS_LOOP:
    # Print index and set first byte of flags to 00
    lwz REG_NEXT, NEXT(REG_CURRENT)
    #logf LOG_LEVEL_INFO, "idx: %d, ENABLE: %08x", "mr r5, REG_LOOP", "mr r6, REG_NEXT"

    # Disable gobj
    lwz r0, FLAGS(REG_CURRENT)
    oris r0, r0, 0x8000
    stw r0, FLAGS(REG_CURRENT)

        ENB_TIMER:
        load REG_TIMER, TIMER_GOBJ
        lwz r25, 0(REG_TIMER)
        lwz r0, FLAGS(r25)
        oris r0, r0, 0x8000
        stw r0, FLAGS(r25)

    # Update current pointer
    mr REG_CURRENT, REG_NEXT
DIS_LOOP_INC:
    addi REG_LOOP, REG_LOOP, 1
DIS_LOOP_CHECK:
    cmpwi REG_NEXT, 0
    bne DIS_LOOP
    subi r23, r23, 0x1
    stb r23, 0(REG_VISFLAG)
    b EXIT


MENU:

    li r3, 1 # port 2
    branchl r12, DevelopModeInput_GetPressed
    rlwinm.	r0, r3, 0, 28, 28 #(00000008) # check for dpad up
    beq-    EXIT

    load REG_VISFLAG, TOGGLE_VIS_FLAGS
    lbz r23, NEXT(REG_VISFLAG)
    cmpwi r23, 0x0
    beq     MENU_DISABLE


MENU_ENABLE:
    load REG_MENU, MENU_GOBJ
    lwz r25, 0(REG_MENU)
    lwz r0, FLAGS(r25)
    oris r0, r0, 0x8000
    stw r0, FLAGS(r25)
    subi r23, r23, 0x1
    stb r23, NEXT(REG_VISFLAG)
    b EXIT


MENU_DISABLE:
    load REG_MENU, MENU_GOBJ
    lwz r25, 0(REG_MENU)
    lwz r0, FLAGS(r25)
    rlwinm r0, r0, 0, 0x7FFFFFFF
    stw r0, FLAGS(r25)
    addi r23, r23, 0x1
    stb r23, NEXT(REG_VISFLAG)
    b EXIT


EXIT:


restore