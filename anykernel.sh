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
do.powerhal=0
do.goodixlib=1
do.rmpostboot=1
device.name1=kenzo
device.name2=Kenzo
device.name3=kate
device.name4=Kate
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

# begin ramdisk changes

insert_line init.qcom.rc "import init.pure.rc" after "import init.qcom.usb.rc" "import init.pure.rc";

# end ramdisk changes

write_boot;

## end install

