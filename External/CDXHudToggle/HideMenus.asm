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

# Check if in-game
getMinorMajor r3
cmpwi r3, 0x010e
bne EXIT

# Get PLink array
lwz REG_CURRENT, PLINK_ARRAY_OFST(r13)
# Get UI array
lwz REG_CURRENT, PLINK_UI(REG_CURRENT)



li r3, 3 # port 3
branchl r12, DevelopModeInput_GetPressed
rlwinm.	r0, r3, 0, 29, 29 #(00000004) # check for dpad down
beq-    LOOP_INIT


load REG_VISFLAG, TOGGLE_VIS_FLAGS
lbz r23, 0(REG_VISFLAG)
cmpwi r23, 0x1
bne OFF

ON:
li r23, 0x2
stb r23, 0(REG_VISFLAG)
b LOOP_INIT

OFF:
li r23, 0x1
stb r23, 0(REG_VISFLAG)


LOOP_INIT:
    li REG_LOOP, 0
LOOP:
    # Print index and set first byte of flags to 00
    lwz REG_NEXT, NEXT(REG_CURRENT)
    # logf LOG_LEVEL_INFO, "idx: %d, ENBABLE: %08x", "mr r5, REG_LOOP", "mr r6, REG_NEXT"
    
    lwz r0, FLAGS(REG_CURRENT)

    # load timer
    load REG_TIMER, TIMER_GOBJ
    lwz r25, 0(REG_TIMER)
    lwz r22, FLAGS(r25)

    # CHECK VIS FLAG
    load REG_VISFLAG, TOGGLE_VIS_FLAGS
    lbz r23, 0(REG_VISFLAG)
    cmpwi r23, 0x1
    bne ENABLE

    # Disable gobj
    rlwinm r0, r0, 0, 0x7FFFFFFF
    rlwinm r22, r22, 0, 0x7FFFFFFF
    b ENABLE_END

    ENABLE:
    # Enable gobj
    oris r0, r0, 0x8000
    oris r22, r22, 0x8000
ENABLE_END:

    stw r0, FLAGS(REG_CURRENT)
    stw r22, FLAGS(r25)

    # Update current pointer
    mr REG_CURRENT, REG_NEXT
LOOP_INC:
    addi REG_LOOP, REG_LOOP, 1
LOOP_CHECK:
    cmpwi REG_NEXT, 0
    bne LOOP




MENU:

    li r3, 3 # port 2
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