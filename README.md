# Hackintosh_M4800
Hackintosh for Dell Precision M4800

* Intel Core i7 4810MQ
* Intel HD Graphics 4600
* NVIDIA Quadro K1100M
* LCD LP156WF (eDP - 1920x1080)
* Audio Realtek ALC292
* O2 Micro SDCard Reader
* BCM4352 802.11ac Wireless Network Adapter
* Broadcom BCM20702A0 Bluetooth (integrated with BCM4352)

*OpenCore* - macOS **Bigsur** 11.2.3  tested \
*Clover* - macOS **Catalina** 10.15.6 tested \
*OpenCore* - macOS **Monterey** 12.3 was released for Dell M4800, please move to [https://github.com/hansyao/Hackintosh_Monterey_M4800](https://github.com/hansyao/Hackintosh_Monterey_M4800)

# Highlights:

* ```AppleALC.kext```, ```VoodooPS2Controller.kext``` were customized for M4800. You could find the repo here: [AppleALC](https://github.com/hansyao/AppleALC_Dell_M4800) and [OS-X-ALPS-DRIVER](https://github.com/hansyao/OS-X-ALPS-DRIVER).
* You can also find the user guide which how I fixed the keyboard and sound card driver here. [How to fix AppleALC for Dell Precision M4800](https://blog.oneplus-solution.com/Dell_Precision_M4800_AppleALC_fix) and [how to fix keyboard/touchpad drive for Dell Precision M4800](https://blog.oneplus-solution.com/Dell_M4800_keyboard_fix) (both in Chinese).
* AppleALC for Dell Precision M4800 support(layout-id 59) has been merged to [acidanthera/AppleALC](https://github.com/acidanthera/AppleALC/pull/773) from release version [1.7.1](https://github.com/acidanthera/AppleALC/releases/tag/1.7.1). You would be able to update the driver from [acidanthera/AppleALC](https://github.com/acidanthera/AppleALC) going forward.
* [ssdt](../../blob/master/OpenCore/SSDT-Dell-M4800.dsl) was customzied based upon my hardware list. Probably you need to recompile based upon your own hardware configurations. 


## Functionality in OpenCore
click [here](https://github.com/hansyao/Hackintosh_M4800/tree/master/OpenCore) to view OpenCore EFI package \
Specifically designed the [SSDT-Dell-M4800.aml](https://github.com/hansyao/Hackintosh_M4800/raw/master/OpenCore/EFI/OC/ACPI/SSDT-Dell-M4800.aml) to fix ACPI for M4800. 

**what works:**
***all hardware support***
* Power management
* Sleep/idle
* dual GPU
* SDCard Reader
* Dell Keyboard /Fn keys
* USB2.0/3.0
* Dell Dock
* Audio
* SMBus
* LPC
* X86 CPU
* IMEI
* Ethernet
* WIFI
* Bluetooth
* HDMI Audio
* Dual-boot with Windows/Linux
* Facetime
* Bootcamp
* etc.

**what not work:**
* None

**Bugs:**
* sometimes touchpad broken when reboot - you can hit <kbd>Win</kbd>+<kbd>Alt</kbd> until login screen show up to solve this issue when boot up. 
