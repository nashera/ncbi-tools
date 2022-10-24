# $Id: Makefile.blastn.app 626051 2021-02-23 17:00:06Z fongah2 $

WATCHERS = camacho madden fongah2

APP = blastn
SRC = blastn_node blastn_app
LIB_ = xformat xcleanup valid gbseq mlacli mla medlars pubmed submit xregexp $(PCRE_LIB) \
       $(BLAST_INPUT_LIBS) $(BLAST_LIBS) $(OBJMGR_LIBS) 
LIB = blast_app_util $(LIB_:%=%$(STATIC))

# De-universalize Mac builds to work around a PPC toolchain limitation
CFLAGS 	 = $(FAST_CXXFLAGS:ppc=i386) 
CXXFLAGS = $(FAST_CXXFLAGS:ppc=i386)
LDFLAGS  = $(FAST_LDFLAGS:ppc=i386) 

CPPFLAGS = -DNCBI_MODULE=BLAST $(ORIG_CPPFLAGS) $(BLAST_THIRD_PARTY_INCLUDE)
LIBS = $(GENBANK_THIRD_PARTY_LIBS) $(BLAST_THIRD_PARTY_LIBS) $(CMPRS_LIBS) $(DL_LIBS) $(NETWORK_LIBS) $(ORIG_LIBS)

REQUIRES = objects -Cygwin

PROJ_TAG = gbench
