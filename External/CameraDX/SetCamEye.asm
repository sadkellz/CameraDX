################################################################################
# Address: 0x8002b0b8 # Set Eye
################################################################################

.include "Common/Common.s"
.set GetButtons, 0x804c1ff0
.set CURRENT_STAGE_ID, 0x8049e750
.set HSD_PadStatus, 0x804c2078
.set MENU_GOBJ, 0x80002fac
.set DevelopModeInput_GetButtons, 0x8022558c
.set DevelopModeInput_GetPressed, 0x802255a4
.set BUTTON_DATA2, 9
.set BUTTON_DATA, 5
.set COBJ_REG, 6
.set COORDS, 7
.set REG_STAGE_ID, 8
.set WOBJ_REG, 10
.set PAD_REG, 11
.set REG_GOBJ, 18
.set CURRENT_STAGE_OFFSET, 19
.set CURRENT_CAM_REG, 20
.set CURRENT_STAGE_REG, 21
.set MENU_VIS, 23

.set CSTICK_X, 0x28
.set CSTICK_Y, 0x2C
.set HIDE_MENU, 0x00000000





#og line
addi r4, r1, 0x14

b CODE_START

DATA_BLRL:
blrl
.set EYE_POS, 0 
.float 0.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# DEFAULT CAM
.set STADIUM_0, EYE_POS + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 200.0 # Depth
# LEFT SIDE CAM
.set STADIUM_1, STADIUM_0 + 12
.float -200.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# RIGHT SIDE CAM
.set STADIUM_2, STADIUM_1 + 12
.float 200.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# TOP VIEW CAM
.set STADIUM_3, STADIUM_2 + 12
.float 0.0  # Left / Right
.float 60.0 # Up / Down
.float 120.0 # Depth
# GROUND VIEW CAM
.set STADIUM_4, STADIUM_3 + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 50.0 # Depth
# LEFT LEDGE CAM
.set STADIUM_5, STADIUM_4 + 12
.float -150.0  # Left / Right
.float -50.0 # Up / Down
.float 30.0 # Depth
# RIGHT LEDGE CAM
.set STADIUM_6, STADIUM_5 + 12
.float 150.0  # Left / Right
.float -50.0 # Up / Down
.float 30.0 # Depth

# DEFAULT CAM
.set BATTLEFIELD_0, STADIUM_6 + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 200.0 # Depth
# LEFT SIDE CAM
.set BATTLEFIELD_1, BATTLEFIELD_0 + 12
.float -150.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# RIGHT SIDE CAM
.set BATTLEFIELD_2, BATTLEFIELD_1 + 12
.float 150.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# TOP VIEW CAM
.set BATTLEFIELD_3, BATTLEFIELD_2 + 12
.float 0.0  # Left / Right
.float 100.0 # Up / Down
.float 120.0 # Depth
# GROUND VIEW CAM
.set BATTLEFIELD_4, BATTLEFIELD_3 + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 40.0 # Depth
# LEFT LEDGE CAM
.set BATTLEFIELD_5, BATTLEFIELD_4 + 12
.float -150.0  # Left / Right
.float -40.0 # Up / Down
.float 30.0 # Depth
# RIGHT LEDGE CAM
.set BATTLEFIELD_6, BATTLEFIELD_5 + 12
.float 150.0  # Left / Right
.float -40.0 # Up / Down
.float 30.0 # Depth

# DEFAULT CAM
.set FINALDESTINATION_0, BATTLEFIELD_6 + 12
.float 0.0  # Left / Right
.float 20.0 # Up / Down
.float 200.0 # Depth
# LEFT SIDE CAM
.set FINALDESTINATION_1, FINALDESTINATION_0 + 12
.float -200.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# RIGHT SIDE CAM
.set FINALDESTINATION_2, FINALDESTINATION_1 + 12
.float 200.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# TOP VIEW CAM
.set FINALDESTINATION_3, FINALDESTINATION_2 + 12
.float 0.0  # Left / Right
.float 80.0 # Up / Down
.float 120.0 # Depth
# GROUND VIEW CAM
.set FINALDESTINATION_4, FINALDESTINATION_3 + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 50.0 # Depth
# LEFT LEDGE CAM
.set FINALDESTINATION_5, FINALDESTINATION_4 + 12
.float -200.0  # Left / Right
.float -50.0 # Up / Down
.float 30.0 # Depth
# RIGHT LEDGE CAM
.set FINALDESTINATION_6, FINALDESTINATION_5 + 12
.float 200.0  # Left / Right
.float -50.0 # Up / Down
.float 30.0 # Depth

# DEFAULT CAM
.set FOD_0, FINALDESTINATION_6 + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 200.0 # Depth
# LEFT SIDE CAM
.set FOD_1, FOD_0 + 12
.float -120.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# RIGHT SIDE CAM
.set FOD_2, FOD_1 + 12
.float 120.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# TOP VIEW CAM
.set FOD_3, FOD_2 + 12
.float 0.0  # Left / Right
.float 80.0 # Up / Down
.float 120.0 # Depth
# GROUND VIEW CAM
.set FOD_4, FOD_3 + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 50.0 # Depth
# LEFT LEDGE CAM
.set FOD_5, FOD_4 + 12
.float -150.0  # Left / Right
.float -50.0 # Up / Down
.float 50.0 # Depth
# RIGHT LEDGE CAM
.set FOD_6, FOD_5 + 12
.float 150.0  # Left / Right
.float -50.0 # Up / Down
.float 50.0 # Depth

# DEFAULT CAM
.set DREAMLAND_0, FOD_6 + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 200.0 # Depth
# LEFT SIDE CAM
.set DREAMLAND_1, DREAMLAND_0 + 12
.float -200.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# RIGHT SIDE CAM
.set DREAMLAND_2, DREAMLAND_1 + 12
.float 200.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# TOP VIEW CAM
.set DREAMLAND_3, DREAMLAND_2 + 12
.float 0.0  # Left / Right
.float 120.0 # Up / Down
.float 120.0 # Depth
# GROUND VIEW CAM
.set DREAMLAND_4, DREAMLAND_3 + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 50.0 # Depth
# LEFT LEDGE CAM
.set DREAMLAND_5, DREAMLAND_4 + 12
.float -150.0  # Left / Right
.float -50.0 # Up / Down
.float 30.0 # Depth
# RIGHT LEDGE CAM
.set DREAMLAND_6, DREAMLAND_5 + 12
.float 150.0  # Left / Right
.float -50.0 # Up / Down
.float 30.0 # Depth

# DEFAULT CAM
.set YOSHIS_0, DREAMLAND_6 + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 200.0 # Depth
# LEFT SIDE CAM
.set YOSHIS_1, YOSHIS_0 + 12
.float -200.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# RIGHT SIDE CAM
.set YOSHIS_2, YOSHIS_1 + 12
.float 200.0  # Left / Right
.float 30.0 # Up / Down
.float 200.0 # Depth
# TOP VIEW CAM
.set YOSHIS_3, YOSHIS_2 + 12
.float 0.0  # Left / Right
.float 60.0 # Up / Down
.float 120.0 # Depth
# GROUND VIEW CAM
.set YOSHIS_4, YOSHIS_3 + 12
.float 0.0  # Left / Right
.float 10.0 # Up / Down
.float 50.0 # Depth
# LEFT LEDGE CAM
.set YOSHIS_5, YOSHIS_4 + 12
.float -150.0  # Left / Right
.float -50.0 # Up / Down
.float 30.0 # Depth
# RIGHT LEDGE CAM
.set YOSHIS_6, YOSHIS_5 + 12
.float 150.0  # Left / Right
.float -50.0 # Up / Down
.float 30.0 # Depth

# Translation
.set LEFT, YOSHIS_6 + 12
.float -0.026
.set RIGHT, LEFT + 4
.float 0.026
.set FORWARD, RIGHT + 4
.float 0.026
.set BACK, FORWARD + 4
.float -0.026

CODE_START:


# Backup CObj
mr COBJ_REG, r3


# Load floats
bl DATA_BLRL
mflr r4
mr COORDS, r4

# Get pointer to current stage id
load REG_STAGE_ID, CURRENT_STAGE_ID
# Get stage id
lwz REG_STAGE_ID, 0x0(REG_STAGE_ID)


# Comparing Stages
# STADIUM
cmpwi REG_STAGE_ID, 0x10
bne STG1_EXIT
# Setting stage in reg
li CURRENT_STAGE_REG, 0
STG1_EXIT:

# BATTLEFIELD
cmpwi REG_STAGE_ID, 0x0A
bne STG2_EXIT
# CAM 1
li CURRENT_STAGE_REG, 1
STG2_EXIT:

# FINALDESTINATION
cmpwi REG_STAGE_ID, 0x25
bne STG3_EXIT
# Setting stage in reg
li CURRENT_STAGE_REG, 2
STG3_EXIT:

# FoD
cmpwi REG_STAGE_ID, 0x0C
bne STG4_EXIT
# Setting stage in reg
li CURRENT_STAGE_REG, 3
STG4_EXIT:

# DREAMLAND
cmpwi REG_STAGE_ID, 0x1C
bne STG5_EXIT
# Setting stage in reg
li CURRENT_STAGE_REG, 4
STG5_EXIT:

# backup r4
mr r15, r4

load PAD_REG, HSD_PadStatus

# load wobj and cstick x
lwz WOBJ_REG, 0x24(COBJ_REG)
lfs f0, 0x0C(WOBJ_REG)          # wobj x
lfs f2, 0x14(WOBJ_REG)          # wobj z (depth)
lfs f1, CSTICK_X(PAD_REG)


lfs f3, LEFT(COORDS)
fcmpo cr0, f3, f1   # compare against threshold of the left side
blt LEFT_EXIT       # break if stick is below threshold
fadds f0, f0, f1


LEFT_EXIT:

lfs f3, RIGHT(COORDS)
fcmpo cr0, f3, f1   # compare against threshold of the right side
bgt RIGHT_EXIT      # break if stick is below threshold
fadds f0, f0, f1


RIGHT_EXIT:


lfs f4, CSTICK_Y(PAD_REG)   # load cstick y

lfs f3, FORWARD(COORDS)     
fcmpo cr0, f3, f4           # compare against threshold of forward
bgt FORWARD_EXIT
fsubs f2, f2, f4

FORWARD_EXIT:

lfs f3, BACK(COORDS)     
fcmpo cr0, f3, f4           # compare against threshold of backwards
blt BACK_EXIT
fsubs f2, f2, f4

BACK_EXIT:


TRANSLATE_EXIT:
# store x and y
stfs f0, 0x0(COORDS)
stfs f2, 0x8(COORDS)
li CURRENT_CAM_REG, 7

# Getting buttons
# Setting our port
li r3, 3
#branchl r12, DevelopModeInput_GetPressed
#branchl r12, DevelopModeInput_GetButtons
#branchl r12, Menu_GetHeldButtons
#mr BUTTON_DATA, r4

#load BUTTON_DATA, GetButtons
#load BUTTON_DATA2, DevelopModeInput_GetPressed
load BUTTON_DATA, HSD_PadStatus
lwz BUTTON_DATA, 0(BUTTON_DATA)

# restore r4
mr r4, r15


# Comparing Buttons and setting them.
# Check if A button was pressed
cmpwi BUTTON_DATA, 0x00000100
bne BTN1_EXIT
# CAM 0
li CURRENT_CAM_REG, 0
BTN1_EXIT:

# Check if B
cmpwi BUTTON_DATA, 0x00000200
bne BTN2_EXIT
# CAM 1
li CURRENT_CAM_REG, 1
BTN2_EXIT:

# Check if X
cmpwi BUTTON_DATA, 0x00000400
bne BTN3_EXIT
# CAM 2
li CURRENT_CAM_REG, 2
BTN3_EXIT:

# Check if Y
cmpwi BUTTON_DATA, 0x00000800
bne BTN4_EXIT
# CAM 3
li CURRENT_CAM_REG, 3
BTN4_EXIT:

# Check if Z
cmpwi BUTTON_DATA, 0x00000010
bne BTN5_EXIT
# CAM 4
li CURRENT_CAM_REG, 4
BTN5_EXIT:

# Only digital!!!
# Check if Left Trigger
cmpwi BUTTON_DATA, 0x00000040
bne BTN6_EXIT
# CAM 4
li CURRENT_CAM_REG, 5
BTN6_EXIT:

# Check if Right Trigger
cmpwi BUTTON_DATA, 0x00000020
bne BTN7_EXIT
# CAM 4
li CURRENT_CAM_REG, 6
BTN7_EXIT:




# load 0 into current stage offset
li CURRENT_STAGE_OFFSET, 0
# amount of entries per cam
mulli CURRENT_STAGE_OFFSET, CURRENT_STAGE_REG, 7
# amount of bytes per entry
mulli CURRENT_STAGE_OFFSET, CURRENT_STAGE_OFFSET, 12
addi CURRENT_STAGE_OFFSET, CURRENT_STAGE_OFFSET, 12
add CURRENT_STAGE_OFFSET, COORDS, CURRENT_STAGE_OFFSET

# Check if CAM 0
cmpwi CURRENT_CAM_REG, 0
bne CAM_0_EXIT
# Store X Pos
lfs f0, 0(CURRENT_STAGE_OFFSET)
stfs f0, 0x0(COORDS)
# Store Y Pos
lfs f4, 4(CURRENT_STAGE_OFFSET)
stfs f4, 0x4(COORDS)
# Store Z Pos
lfs f2, 8(CURRENT_STAGE_OFFSET)
stfs f2, 0x8(COORDS)
b Exit
CAM_0_EXIT:

# Check if CAM 1
cmpwi CURRENT_CAM_REG, 1
bne CAM_1_EXIT
# Store X Pos
lfs f0, 12(CURRENT_STAGE_OFFSET)
stfs f0, 0x0(COORDS)
# Store Y Pos
lfs f4, 16(CURRENT_STAGE_OFFSET)
stfs f4, 0x4(COORDS)
# Store Z Pos
lfs f2, 20(CURRENT_STAGE_OFFSET)
stfs f2, 0x8(COORDS)
b Exit
CAM_1_EXIT:

# Check if CAM 2
cmpwi CURRENT_CAM_REG, 2
bne CAM_2_EXIT
# Store X Pos
lfs f0, 24(CURRENT_STAGE_OFFSET)
stfs f0, 0x0(COORDS)
# Store Y Pos
lfs f4, 28(CURRENT_STAGE_OFFSET)
stfs f4, 0x4(COORDS)
# Store Z Pos
lfs f2, 32(CURRENT_STAGE_OFFSET)
stfs f2, 0x8(COORDS)
b Exit
CAM_2_EXIT:

# Check if CAM 3
cmpwi CURRENT_CAM_REG, 3
bne CAM_3_EXIT
# Store X Pos
lfs f0, 36(CURRENT_STAGE_OFFSET)
stfs f0, 0x0(COORDS)
# Store Y Pos
lfs f4, 40(CURRENT_STAGE_OFFSET)
stfs f4, 0x4(COORDS)
# Store Z Pos
lfs f2, 44(CURRENT_STAGE_OFFSET)
stfs f2, 0x8(COORDS)
b Exit
CAM_3_EXIT:

# Check if CAM 4
cmpwi CURRENT_CAM_REG, 4
bne CAM_4_EXIT
# Store X Pos
lfs f0, 48(CURRENT_STAGE_OFFSET)
stfs f0, 0x0(COORDS)
# Store Y Pos
lfs f4, 52(CURRENT_STAGE_OFFSET)
stfs f4, 0x4(COORDS)
# Store Z Pos
lfs f2, 56(CURRENT_STAGE_OFFSET)
stfs f2, 0x8(COORDS)
b Exit
CAM_4_EXIT:

# Check if CAM 5
cmpwi CURRENT_CAM_REG, 5
bne CAM_5_EXIT
# Store X Pos
lfs f0, 60(CURRENT_STAGE_OFFSET)
stfs f0, 0x0(COORDS)
# Store Y Pos
lfs f4, 64(CURRENT_STAGE_OFFSET)
stfs f4, 0x4(COORDS)
# Store Z Pos
lfs f2, 68(CURRENT_STAGE_OFFSET)
stfs f2, 0x8(COORDS)
b Exit
CAM_5_EXIT:

# Check if CAM 6
cmpwi CURRENT_CAM_REG, 6
bne CAM_6_EXIT
# Store X Pos
lfs f0, 72(CURRENT_STAGE_OFFSET)
stfs f0, 0x0(COORDS)
# Store Y Pos
lfs f4, 76(CURRENT_STAGE_OFFSET)
stfs f4, 0x4(COORDS)
# Store Z Pos
lfs f2, 80(CURRENT_STAGE_OFFSET)
stfs f2, 0x8(COORDS)
b Exit
CAM_6_EXIT:


Exit:
#logf LOG_LEVEL_INFO, "Current Cam: %d", "mr  r5, r20"
mr r3, COBJ_REG
