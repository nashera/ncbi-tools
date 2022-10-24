# $Id: Makefile.blastdiag_unit_test.app 634439 2021-07-12 14:42:44Z ucko $

APP = blastdiag_unit_test
SRC = blastdiag_unit_test 

CPPFLAGS = -DNCBI_MODULE=BLAST $(ORIG_CPPFLAGS) $(BOOST_INCLUDE)
LIB = blast_unit_test_util test_boost \
    $(BLAST_LIBS) xobjsimple $(OBJMGR_LIBS:ncbi_x%=ncbi_x%$(DLL))
LIBS = $(NETWORK_LIBS) $(CMPRS_LIBS) $(DL_LIBS) $(BLAST_THIRD_PARTY_LIBS) $(ORIG_LIBS)
LDFLAGS = $(FAST_LDFLAGS)

#CHECK_REQUIRES = MT in-house-resources
CHECK_CMD = blastdiag_unit_test
CHECK_COPY = blastdiag_unit_test.ini

WATCHERS = boratyng madden camacho fongah2
