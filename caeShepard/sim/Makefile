# Makefile $Header: /home/ktown/caeSobel/sim/RCS/Makefile,v 1.1 2012/02/20 03:47:20 ktown Exp ktown $

# To compile additional verilog modules for simulation:
# CNY_PDK_TB_USER_VLOG += tb_user.v

# To fix the seed for simulation:
# CNY_PDK_SIM_SEED = 11223344

# MC_XBAR variable is set in ../Makefile.include
USER_SWMODEL_CFLAGS += -DMC_XBAR=$(MC_XBAR)
$(CNY_PDK_SWMODEL_EXE): ../Makefile.include

####################################################################
# Include Convey Makefile Template
####################################################################
include ../Makefile.include

#USER_SIM_OPTIONS=-i
