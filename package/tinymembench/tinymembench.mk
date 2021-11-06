################################################################################
#
# tinymembench
#
################################################################################

TINYMEMBENCH_VERSION = 3a2a6eea02423620c3fca7a405b57e0c95d4c10d
TINYMEMBENCH_SITE = $(call github,nuumio,tinymembench,$(TINYMEMBENCH_VERSION))
TINYMEMBENCH_LICENSE = MIT
TINYMEMBENCH_LICENSE_FILES = LICENSE

define TINYMEMBENCH_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) \
	MINREPEATS=$(BR2_TINYMEMBENCH_MINREPEATS) \
	MAXREPEATS=$(BR2_TINYMEMBENCH_MAXREPEATS) \
	LATBENCH_COUNT=$(BR2_TINYMEMBENCH_LATBENCH_COUNT) \
	$(MAKE) -C $(@D)
endef

define TINYMEMBENCH_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/tinymembench \
		$(TARGET_DIR)/usr/bin/tinymembench
endef

$(eval $(generic-package))
