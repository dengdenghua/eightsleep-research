#! /bin/sh

USB_GADGET_NET=/sys/kernel/config/usb_gadget/net1
USB_GADGET_FUNCTION="ecm"

start()
{
    # configfs mkdir under /sys/kernel/config/usb_gadget/ doesn't trigger
    # module autoload — without these the subsystem dir won't exist and
    # everything below fails with EPERM. /etc/modules-load.d/usbgadget.conf
    # should already have loaded them; this is belt-and-suspenders.
    modprobe libcomposite
    modprobe usb_f_ecm

    mkdir -p $USB_GADGET_NET
    cd $USB_GADGET_NET

    echo "0x1d6b" > idVendor
    echo "0x0104" > idProduct

    mkdir strings/0x409
    echo "0123456789" > strings/0x409/serialnumber
    echo "BayLibre / 8sleep" > strings/0x409/manufacturer
    echo "8sleep Pod 3" > strings/0x409/product

    mkdir configs/c.1/
    mkdir configs/c.1/strings/0x409
    echo "USB network" > configs/c.1/strings/0x409/configuration

    mkdir functions/$USB_GADGET_FUNCTION.usb0
    ln -s functions/$USB_GADGET_FUNCTION.usb0 configs/c.1

    echo $(ls /sys/class/udc) > UDC
    cd -
}

stop()
{
    cd $USB_GADGET_NET
    echo > UDC

    rm configs/c.1/$USB_GADGET_FUNCTION.usb0
    rmdir functions/$USB_GADGET_FUNCTION.usb0

    echo $(ls /sys/class/udc) > UDC
    cd -
}


if [ "$1" = "--start" ]; then
    start
elif [ "$1" = "--stop" ]; then
    stop
fi
