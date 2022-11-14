include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=qmi-wwan-q
PKG_RELEASE:=1
PKG_VERSION:=1.2.2

include $(INCLUDE_DIR)/package.mk

define KernelPackage/qmi-wwan-q
  SUBMENU:=Network
  TITLE:=Quectel Driver for qmi wwan
  DEPENDS:= \
  	+kmod-usb-net \
  	+kmod-usb-net-qmi-wwan  		
  FILES:=$(PKG_BUILD_DIR)/qmi-wwan-q.ko
  AUTOLOAD:=$(call AutoLoad,30,qmi-wwan-q,1)
  KCONFIG:=
endef

define KernelPackage/qmi-wwan-q/description
 Driver from Quectel for qmi-wwan
endef

MAKE_OPTS:= \
	$(KERNEL_MAKE_FLAGS) \
	M="$(PKG_BUILD_DIR)"

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

$(eval $(call KernelPackage,qmi-wwan-q))