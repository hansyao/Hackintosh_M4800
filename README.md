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

*OpenCore - macOS Bigsur 11.2.3  tested* \
*Clover - macOS Catalina 10.15.6 tested*

# Highlights: 

macOS Monterey was released for Dell M4800, please move to [https://github.com/hansyao/Hackintosh_M4800](https://github.com/hansyao/Hackintosh_M4800)

## Functionality in OpenCore
click [here](https://github.com/badfellow/Hackintosh_M4800/tree/master/OpenCore) to view OpenCore EFI package \
Specifically designed the [SSDT-Dell-M4800.aml](https://github.com/badfellow/Hackintosh_M4800/raw/master/OpenCore/EFI/OC/ACPI/SSDT-Dell-M4800.aml) to fix ACPI for M4800. 

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
