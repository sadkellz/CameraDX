################################################################################
# Address: 0x8002af8c # Set FOV
################################################################################

# Original line
#lfs f1, 0x30(r4)

.set REG_DATA, 5
.set CURRENT_FOV_REG, 6
.set BUTTON_DATA, 7
.set REG_COBJ, 8
.set STICK_FLOAT_REG, 11


.set Menu_GetHeldButtons, 0x801a3680
.set STICK_FLOAT, 0x804c209c
.set EXPF, 0x8000ce50

b CODE_START

DATA_BLRL:
blrl
.set FOV, 0
.float 30.0
.set UP, FOV + 4
.float -0.026
.set DOWN, UP + 4
.float 0.026
.set STEP, DOWN + 4
.float 5.5
.set ONE, STEP + 4
.float 1.0
.set NEGATIVE, ONE + 4
.float -1.0

 
CODE_START:

bl DATA_BLRL
mflr REG_DATA

# Backup CObj
mr REG_COBJ, r3

# Setting our port and getting buttons from port
#li r3, 1
#branchl r12, Menu_GetHeldButtons
#mr BUTTON_DATA, r3

load STICK_FLOAT_REG, STICK_FLOAT

lfs f5, ONE(REG_DATA)
lfs f6, STEP(REG_DATA)
lfs f7, NEGATIVE(REG_DATA)


lfs f1, 0x40(REG_COBJ)
lfs f2, 0x0(STICK_FLOAT_REG)
lfs f3, DOWN(REG_DATA)
fcmpo cr0, f2, f3
blt BTN1_EXIT

# subtract current stick by 1
fsub f2, f2, f5
# multiply stick by 3.5
fmuls f2, f6, f2
# backup cobj
fmr f31, f1
# move stick to f1
fmr f1, f2
branchl r12, EXPF

# move stick back
fmr f2, f1
# move cobj back
fmr f1, f31
#fadds f1, f1, f2
fsub f1, f1, f2
stfs f1, 0x40(REG_COBJ)
b Exit
BTN1_EXIT:


lfs f1, 0x40(REG_COBJ)
lfs f2, 0x0(STICK_FLOAT_REG)
lfs f3, UP(REG_DATA)
fcmpo cr0, f2, f3
bgt BTN2_EXIT


fmuls f2, f2, f7
# subtract current stick by 1
fsub f2, f2, f5
# multiply stick by 3.5
fmuls f2, f6, f2
# backup cobj
fmr f31, f1
# move stick to f1
fmr f1, f2
branchl r12, EXPF

# move stick back
fmr f2, f1
# move cobj back
fmr f1, f31
fadds f1, f1, f2
#fsub f1, f1, f2
stfs f1, 0x40(REG_COBJ)
b Exit
BTN2_EXIT:


# Set base FOV
lfs f1, 0x40(REG_COBJ)

Exit:
mr r3, REG_COBJ
