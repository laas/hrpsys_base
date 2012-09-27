all: hrpsys_base

VERSION     = 3.1.3
TARBALL     = build/hrpsys_base-$(VERSION).tar.bz2
TARBALL_URL= \
https://github.com/downloads/laas/hrpsys_base/hrpsys_base-$(VERSION).tar.bz2
SOURCE_DIR  = build/hrpsys_base-$(VERSION)
MD5SUM_FILE = hrpsys_base-$(VERSION).tar.bz2.md5sum

INSTALL_DIR = install

CMAKE_FLAGS = \
	-DCMAKE_INSTALL_PREFIX:STRING=`rospack find hrpsys_base`/$(INSTALL_DIR)/ \
	-DCMAKE_BUILD_TYPE:STRING=Release

include $(shell rospack find mk)/download_unpack_build.mk

hrpsys_base: $(INSTALL_DIR)/installed

$(INSTALL_DIR)/installed: $(SOURCE_DIR)/unpacked
	cd $(SOURCE_DIR)	  		\
	&& cmake . ${CMAKE_FLAGS}		\
	&& make			  		\
	&& make install
	touch $(INSTALL_DIR)/installed

clean:
	rm -rf $(SOURCE_DIR) $(INSTALL_DIR)

wipe: clean
	rm -rf build
