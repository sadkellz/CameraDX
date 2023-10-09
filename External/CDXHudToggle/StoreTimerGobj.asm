################################################################################
# Address: 0x802f4604 # HUD_Timer_Initialize #### storing timer gobj
################################################################################

.include "Common/Common.s"

.set GOBJ_ADDR, 0x80002FB4
.set REG_GOBJ, 28


# Original line
lwz	r5, 0x0040(r31)

backup

load REG_GOBJ, GOBJ_ADDR
stw r3, 0(REG_GOBJ)


Exit:
restore