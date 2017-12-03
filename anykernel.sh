# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=PureKernel by Demon_sss
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=kate
device.name2=kenzo
device.name3=
device.name4=
device.name5=
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# add pure initialization script
insert_line init.rc "import /init.pure.rc" after "import /init.usb.rc" "import /init.pure.rc";

mount -o rw,remount -t auto /system;
chmod 777 /system/vendor/etc/init.qcom.post_boot.sh;
rm -rf /system/vendor/etc/init.qcom.post_boot.sh;
mount -o ro,remount -t auto /system;

# end ramdisk changes

write_boot;

## end install

