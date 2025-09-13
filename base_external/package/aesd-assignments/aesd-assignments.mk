
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '189c58023fc49bf1f32eb9dba5c84a8c0a2978fd'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-diferrans1.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES
# $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
define AESD_ASSIGNMENTS_BUILD_CMDS
	@echo "Building finder-app in $(@D)/finder-app for target $(TARGET_ARCH)"
	$(MAKE) -C $(@D)/finder-app \
	    CC="$(TARGET_CC)" \
	    LD="$(TARGET_LD)" \
	    CFLAGS="$(TARGET_CFLAGS)" \
	    LDFLAGS="$(TARGET_LDFLAGS)" \
	    all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	# ADD writer
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/bin
	# Full finder-test.sh
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/bin
endef

$(eval $(generic-package))
