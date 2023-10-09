################################################################################
# Address: 0x802254bc # DevelopMode_Initialize
################################################################################

.include "Common/Common.s"
.include "Online/Core/EXIFileLoad/TransferFile.asm"

# Original line
lis r3, 0x804A

backup

.set REG_DATA, 30
.set REG_ARCHIVE, 29
.set REG_GOBJ, 28
.set REG_GOBJ_ADDR, 27

.set HSD_ArchiveLoad, 0x80016be0
.set HSD_ArchiveGetPublicAddress, 0x80380358
.set GObj_Create, 0x803901f0
.set GObj_InitKind, 0x80390a70
.set GObj_SetupGXLink, 0x8039069c
.set GObj_GXProcJoint, 0x80391070
.set JObj_LoadDesc, 0x80370e44

.set GOBJ_KIND_JOBJ, 0x804d7849
.set GOBJ_CLASS_UI, 0xE
.set GOBJ_PLINK_PLYR, 0xF
.set GOBJ_GXLINK_HUD, 0xB

.set GOBJ_ADDR, 0x80002fac
.set TIMER_GOBJ, 0x80002FB4


b CODE_START

DATA_BLRL:
blrl
# File-related strings
.string "cdx_hud.usd"
.set IFVSCAM_FILENAME, 0x0
.string "IfCameraInfo_Top_model_set"
.set IFVSCAM_SYMBOLNAME, IFVSCAM_FILENAME + 12
.align 2

CODE_START:

bl DATA_BLRL
mflr REG_DATA

# Load pointer to file name into r3
mr r3, REG_DATA
branchl r12, HSD_ArchiveLoad

# Load pointer to symbol name into r4
addi r4, REG_DATA, IFVSCAM_SYMBOLNAME
branchl r12, HSD_ArchiveGetPublicAddress

# Backup archive
mr REG_ARCHIVE, r3

li r3, GOBJ_CLASS_UI
li r4, 0x10
#li r4, GOBJ_PLINK_PLYR
li r5, 0
# Create GObj
branchl r12, GObj_Create

# Backup GObj
load REG_GOBJ_ADDR, GOBJ_ADDR
stw r3, 0(REG_GOBJ_ADDR)
mr REG_GOBJ, r3

# Get pointer to Archive
lwz r3, 0x0(REG_ARCHIVE)
branchl r12, JObj_LoadDesc

mr r5, r3
mr r3, REG_GOBJ
load r4, GOBJ_KIND_JOBJ
branchl r12, GObj_InitKind

mr r3, REG_GOBJ
load r4, GObj_GXProcJoint
li r5, GOBJ_GXLINK_HUD
li r6, 3
branchl r12, GObj_SetupGXLink

restore