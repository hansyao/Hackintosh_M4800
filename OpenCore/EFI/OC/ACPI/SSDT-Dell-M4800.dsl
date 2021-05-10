//  this ACPI patch only tested in Dell Precision M4800 with below hardware configurations. please read carefully before apply to your own laptop.

// what works: All hardware work perfectly. it's approximately 100% approach to Macbook Pro.
// what not work: NONE

/* keyboard/trackpad driver: please make sure you are use VoodooPSController.kext which been modified and recompiled by myself. 
    (specifically fixed num lock, Ctrl+Alt+Del, etc. for Dell M4800)
*/

/* Audio Driver: please make sure you are use AppleALC.kext which been modified and recompiled by myself. 
    (specifically fixed ALC292 for Dell M4800,  which new layout-id 59 was injected in this patch. no alcid injection in boot-args any longer)
*/

/*  Detail hardware configurations

    CPU: intel i7 the 4th generation 4810MQ
    iGPU: Intel HD4600
    eGPU: NVIDIA Quadro K1100M
    Mainboard: la-9772p (eDP 40pin Video Connector)
    Buil-in Screen: Dell PN 3874Y LCD Screen FHD (1920x1080) with 30 pin video connector
    harddisk: 
    SATA ST1000LM035  1T
    SATA/SSD ORICO PM200-512G
    DVD-RAM: Matshita UJ8E2 DVD Rewriter
    Built-in SDXC Reader: O2 Micro SD Card Reader
    Built-in Camera: UVC Camera VendorID_3141 ProductID_25808
    Bluetooth/WIFI adapter: Broadcom BCM4352 802.11ac Wireless

    More PCI configurations list as below:

    00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor DRAM Controller [8086:0c04] (rev 06)
    00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller [8086:0c01] (rev 06)
    00:02.0 VGA compatible controller [0300]: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller [8086:0416] (rev 06)
    00:03.0 Audio device [0403]: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor HD Audio Controller [8086:0c0c] (rev 06)
    00:14.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset Family USB xHCI [8086:8c31] (rev 04)
    00:16.0 Communication controller [0780]: Intel Corporation 8 Series/C220 Series Chipset Family MEI Controller #1 [8086:8c3a] (rev 04)
    00:19.0 Ethernet controller [0200]: Intel Corporation Ethernet Connection I217-LM [8086:153a] (rev 04)
    00:1a.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset Family USB EHCI #2 [8086:8c2d] (rev 04)
    00:1b.0 Audio device [0403]: Intel Corporation 8 Series/C220 Series Chipset High Definition Audio Controller [8086:8c20] (rev 04)
    00:1c.0 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #1 [8086:8c10] (rev d4)
    00:1c.2 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #3 [8086:8c14] (rev d4)
    00:1c.3 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #4 [8086:8c16] (rev d4)
    00:1c.4 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #5 [8086:8c18] (rev d4)
    00:1c.6 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #7 [8086:8c1c] (rev d4)
    00:1c.7 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #8 [8086:8c1e] (rev d4)
    00:1d.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset Family USB EHCI #1 [8086:8c26] (rev 04)
    00:1f.0 ISA bridge [0601]: Intel Corporation QM87 Express LPC Controller [8086:8c4f] (rev 04)
    00:1f.2 SATA controller [0106]: Intel Corporation 8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode] [8086:8c03] (rev 04)
    00:1f.3 SMBus [0c05]: Intel Corporation 8 Series/C220 Series Chipset Family SMBus Controller [8086:8c22] (rev 04)
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107GLM [Quadro K1100M] [10de:0ff6] (rev a1)
    01:00.1 Audio device [0403]: NVIDIA Corporation GK107 HDMI Audio Controller [10de:0e1b] (rev a1)
    03:00.0 Network controller [0280]: Broadcom Inc. and subsidiaries BCM4352 802.11ac Wireless Network Adapter [14e4:43b1] (rev 03)
    11:00.0 SD Host controller [0805]: O2 Micro, Inc. SD/MMC Card Reader Controller [1217:8520] (rev 01)

*/

/* ACPI Rename need - it's a must if you intend to use this patch */
/* this patch support Dual-boot in Linux or Windows */

// Overriding OSID to XSID
// In config ACPI, OSID to XSID
// Find:     4F534944
// Replace:  58534944

// In config ACPI, _OSI to XOSI
// Find:     5F4F5349
// Replace:  584F5349

// In config ACPI, EV5 to EVZ(fix FN+Up/down arrow)
// Find:     4556355F 025C
// Replace:  45565A5F 025C

// In config ACPI, _PTS to ZPTS(1,N)
// Find:     5F505453 01
// Replace:  5A505453 01

// In config ACPI, _WAK to ZWAK(1,S)
// Find:     5F57414B 09
// Replace:  5A57414B 09

// In config ACPI, BTNV to XTNV
// Find:     42544E56 02
// Replace:  58544E56 02

// In config ACPI, _LID to XLID
// Find:     5F4C4944 00
// Replace:  584C4944 00

// In config ACPI, GPRW to XPRW
// Find:     47505257 02
// Replace:  58505257 02

// In config ACPI, UPRW to ZPRW
// Find:     55505257 0070
// Replace:  5A505257 0070


DefinitionBlock ("", "SSDT", 1, "DELL", "M4800", 0)
{
    External (_SB.PCI0.B0D3, DeviceObj)
    External (_SB.PCI0.GLAN, DeviceObj)
    External (_SB.PCI0.HDEF, DeviceObj)
    // External (_SB.PCI0.HDEF._ADR, IntObj)
    External (_SB.PCI0.RP04, DeviceObj)
    External (XPRW, MethodObj)
    External (_SB.PCI0.ZPRW, MethodObj)
    External (_SB.PCI0.RP04.VDID, FieldUnitObj)
    External (_SB.PCI0.SAT0, DeviceObj)
    External (_SB.PCI0.RP03, DeviceObj)        //Bluetooth PCI
    External (_SB.PCI0.RP03.PXSX, DeviceObj)
    External (_SB.PCI0.RP08.PXSX, DeviceObj)   //Sdcard PCI
    External (_SB.ACOS, IntObj)                 
    External (_SB.ACSE, IntObj)
    External (VDP1, MethodObj) 
    External (_SB.XSID, MethodObj)                 
    External (_SB_.PCI0, DeviceObj)
    External (_SB.PCI0.UPRW, MethodObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB.PCI0.LPCB, DeviceObj)
    External (_SB.PCI0.LPCB.RTC, DeviceObj)
    External (_SB.PCI0.LPCB.TIMR, DeviceObj)
    External (_SB.PCI0.LPCB.IPIC, DeviceObj)
    External (_PR.CPU0, ProcessorObj)
    External (HPAE, FieldUnitObj)
    External (_SB_.PCI0.B0D3._ADR, IntObj)
    External (_SB_.PCI0.GFX0._ADR, IntObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0.LCD_, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP.LCD_, DeviceObj)
    External (_SB_.PCI0.GFX0.BRT6, MethodObj)
    External (_SB.PCI0.PEG0.PEGP.BRT6, MethodObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP._ADR, IntObj)
    External (_SB.PCI0.XHC.RHUB, DeviceObj)
    External (_SB.PCI0.EHC1, DeviceObj)
    External (_SB.PCI0.EHC2, DeviceObj)
    External (_SB.PCI0.XHC, DeviceObj)
    External (OSYS, FieldUnitObj)

    External(ZPTS, MethodObj)
    External(ZWAK, MethodObj)
    External (_SB_.PCI0.XHC_.PMEE, FieldUnitObj)
    External(_SB.XTNV, MethodObj)
    External(_SB.LID0, DeviceObj)
    External(_SB.LID0.XLID, MethodObj)
    

    //OS Patch - enable function for USB3.0, power key, etc. 
    Method (XOSI, 1, NotSerialized)
    {
        Store (Package() {
                "Windows 2001", 
                "Windows 2001.1", 
                "Windows 2001 SP1", 
                "Windows 2001 SP2", 
                "Windows 2001 SP3", 
                "Windows 2006", 
                "Windows 2006 SP1", 
                "Windows 2009", 
                "Windows 2012", 
                "Windows 2013", 
                "Windows 2015",
                "Windows 2017",
                "Windows 2017.2",
                "Windows 2018",
                "Windows 2019",
                "Windows 2020",
                "Windows 2021",
                "Microsoft Windows NT", 
                "Microsoft Windows", 
                "Microsoft WindowsME: Millennium Edition"
            }, Local0)
        If (_OSI ("Darwin"))
        {
            // Return (Zero)
            Return ((Ones != Match (Local0, MEQ, Arg0, MTR, Zero, Zero)))
        }
     
        Else
        {
            Return (_OSI (Arg0))
        }
    }


    // add Method EV5 - enable Dell brightness FN key (fn + up/down arrow for Dell M4800)
    // Consistant with Method BRT6
    Method (EV5, 2, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI0.IGPU.BRT6 (Arg0, Arg1)
            \_SB.PCI0.PEG0.GFX0.BRT6 (Arg0, Arg1)
        }
        Else
        {
            \_SB.PCI0.GFX0.BRT6 (Arg0, Arg1)
            \_SB.PCI0.PEG0.PEGP.BRT6 (Arg0, Arg1)            
        }
    }

    //fix GLAN + HDEF power status (fn+F1 wake support for Dell M4800)
    Method (GPRW, 2, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If ((0x6D == Arg0))
            {
                Return (Package ()
                {
                    0x6D, 
                    Zero
                })
            }

            If ((0x0D == Arg0))
            {
                Return (Package ()
                {
                    0x0D, 
                    Zero
                })
            }
        }
        Return (XPRW (Arg0, Arg1))
    }

    //fix EHC1, EHC2 & XHC (USB) power status (fn+F1 wake support for Dell M4800)
    Scope (_SB.PCI0)
    {
        Method (UPRW, 0, NotSerialized)
        {
            If (_OSI("Darwin"))
            {
                Local0 = Zero
            }
            Else
            {
                Local0 = ZPRW()
            }
            
            Return (Local0)
        }
    }

    //fix wake
    Scope (_SB)
    {
        //inject device for wake status
        Device (PCI9)
        {
            Name (_ADR, Zero)
            Name (FNOK, Zero)
            Name (MODE, Zero)
            //
            Name (TPTS, Zero)
            Name (TWAK, Zero)
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    //Wake Status by WAKE mode
    Method (_PTS, 1, NotSerialized) //Method (_PTS, 1, Serialized)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI9.TPTS = Arg0
            
            if(\_SB.PCI9.FNOK ==1)
            {
                Arg0 = 3
            }
             If (CondRefOf(EXT1))
            {
                EXT1(Arg0)
            }           
        }

        ZPTS(Arg0)
    }

    //WAKE MODE
    Method (_WAK, 1, NotSerialized) //Method (_WAK, 1, Serialized)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI9.TWAK = Arg0
            
            if(\_SB.PCI9.FNOK ==1)
            {
                \_SB.PCI9.FNOK =0
                Arg0 = 3
            }
            If (Arg0 < 1 || Arg0 > 5)
            { Arg0 = 3 }
            
        }

        Local0 = ZWAK(Arg0)
        Return (Local0)
    }

    //fix XHC power status
    Method (EXT1, 1, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If ((5 == Arg0) && CondRefOf (\_SB.PCI0.XHC.PMEE))
            {
                \_SB.PCI0.XHC.PMEE = 0
            }
        }
    }

    
    //fix dell+fn+F1 (M4800)
    Scope (_SB)
    {
        Method (BTNV, 2, NotSerialized)
        {
            If (_OSI ("Darwin") && (Arg0 == 2))
            {
            //    Notify (\_SB.PCI0.LPCB.PS2K, 0x045f)
                If (\_SB.PCI9.MODE == 1) //PNP0C0E
                {
                    \_SB.PCI9.FNOK =1
                    \_SB.XTNV(Arg0, Arg1)
                }
                Else //PNP0C0D
                {
                    If (\_SB.PCI9.FNOK!=1)
                    {
                        \_SB.PCI9.FNOK =1
                    }
                    Else
                    {
                        \_SB.PCI9.FNOK =0
                    }
                    \_SB.XTNV(0x03, Arg1)
                }
            }
            Else
            {
                \_SB.XTNV(Arg0, Arg1)
            }
        }
    }
    
    //screen off status
    Scope (_SB.LID0)
    {
        Method (_LID, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                if(\_SB.PCI9.FNOK==1)
                {
                    Return (0)
                }
                Else
                {
                    Return (\_SB.LID0.XLID())
                }
            }
            Else
            {
                Return (\_SB.LID0.XLID())
            }
        }
    }   

    If (_OSI("Darwin"))
    
    {
        // add Method DTGP
        Method (DTGP, 5, NotSerialized)
        {
            If (LEqual (Arg0, Buffer (0x10)
            {
                /* 0000 */    0xC6, 0xB7, 0xB5, 0xA0, 0x18, 0x13, 0x1C, 0x44,
                /* 0008 */    0xB0, 0xC9, 0xFE, 0x69, 0x5E, 0xAF, 0x94, 0x9B
            }))
            {
                If (LEqual (Arg1, One))
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Store (Buffer (One)
                        {
                            0x03
                        }, Arg4)
                        Return (One)
                    }
                    If (LEqual (Arg2, One))
                    {
                        Return (One)
                    }
                }
            }
            Store (Buffer (One)
            {
                0x00
            }, Arg4)
            Return (Zero)
        }

        //OCWork - Dell
        \_SB.ACOS = 0x80
        \_SB.ACSE = 0 //ACSE=0:win7;;ACSE=1:win8
        
        //disable HPET
        HPAE = 0
        

        // CPU-X86 Plug fix - enable CPU power management
        Scope (_PR.CPU0)
        {
            Method (_DSM, 4, NotSerialized)
            {
                Local0 = Package (0x02)
                    {
                        "plugin-type", 
                        One
                    }
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }
        
        // DRAM Controller
        Scope (_SB.PCI0)
        {
            SCOPE (B0D3)
            {
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package () 
                    {
                        "AAPL,slot-name", "Built In",
                        "name", "DRAM Controller",
                        "model", Buffer () {"Xeon E3-1200 v3 4th Gen Core Processor DRAM Controller"},
                        // "device_type", Buffer () {"Host bridge"},
                        "built-in", Buffer (One) {0x01},
                        "pci-aspm-default",0x03
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }         

            SCOPE (GLAN)
            {
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package () 
                    {
                        "AAPL,slot-name", "Built In",
                        "name", "Ethernet",
                        "model", Buffer () {"Ethernet Connection I217-LM"},
                        // "device_type", Buffer () {"Network controller"},
                        "built-in", Buffer (One) {0x01},
                        "pci-aspm-default",0x03
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }   

            Device (IMEI)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package () 
                    {
                        "AAPL,slot-name", "Built In",
                        "name", "Communication Controller",
                        "model", Buffer () {"Intel 8 Series/C220 Series Chipset Family MEI Controller #1"},
                        // "device_type", Buffer () {"Communication controller"},
                        "built-in", Buffer (One) {0x01},
                        "pci-aspm-default",0x03
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            SCOPE (HDEF)
            {
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package () 
                    {
                        "AAPL,slot-name", "Built In",
                        "name", "Intel HD Audio",
                        "model", Buffer () {"Intel 8 Series/C220 Series Chipset High Definition Audio Controller"},
                        // "device_type", Buffer () {"Audio device"},
                        "built-in", Buffer (One) {0x01},
                        // "layout-id", Buffer ()
                        //     {
                        //         0x07, 0x00, 0x00, 0x00
                        //     },
                        "alc-layout-id", Buffer ()
                            {
                                0x3b, 0x00, 0x00, 0x00
                            },
                        "pci-aspm-default",0x03
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }             

            SCOPE (SAT0)
            {
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package () 
                    {
                        "AAPL,slot-name", "Built In",
                        "name", "SATA Controller",
                        "model", Buffer () {"Intel 8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode]"},
                        // "device_type", Buffer () {"Mass storage controller"},
                        "built-in", Buffer (One) {0x01},
                        "pci-aspm-default",0x03
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            SCOPE (RP04)
            {
                VDID == 0xFFFFFFFF                      //disable RP04
            }  

            Scope (LPCB)
            {
                
                // compatibale intel 8c4b devices to be fully compatible with QM87 Express LPC Controller
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package () {
                        "AAPL,slot-name", "Built In",
                        "name", "LPC Controller",
                        "model", Buffer () {"QM87 Express LPC Controller"},
                        // "device_type", Buffer () {"ISA bridge"},
                        "built-in", Buffer (One) {0x01},
                        "compatible", "pci8086,8c4b",
                        "pci-aspm-default",0x03
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }                
                
                //disable RTC
                Scope (RTC)
                {
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0)
                    }
                }
            
                //disable TIMR
                Scope (TIMR)
                {
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0)
                    }
                }
                
                
                //disable IPIC
                Scope (IPIC)
                {
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0)
                    }
                }        

                //Fake HPE0
                Device (HPE0)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (_UID, Zero)
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags() { 0, 8, 11 }
                        Memory32Fixed (ReadWrite,
                            0xFED00000,
                            0x00000400,
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                    Method (_CRS, 0, Serialized)
                    {
                        Return (BUF0)
                    }
                }

                //Fake RTC0
                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070, 
                            0x0070, 
                            0x01, 
                            0x08,
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }
            
                //Fake TIM0
                Device (TIM0)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,
                            0x0040,
                            0x01,
                            0x04,
                            )
                        IO (Decode16,
                            0x0050,
                            0x0050,
                            0x10,
                            0x04,
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }
                
                
                //fake IPIC
                
                Device (IPI0)
                    {
                        Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            IO (Decode16,
                                0x0020,             // Range Minimum
                                0x0020,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x0024,             // Range Minimum
                                0x0024,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x0028,             // Range Minimum
                                0x0028,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x002C,             // Range Minimum
                                0x002C,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x0030,             // Range Minimum
                                0x0030,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x0034,             // Range Minimum
                                0x0034,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x0038,             // Range Minimum
                                0x0038,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x003C,             // Range Minimum
                                0x003C,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x00A0,             // Range Minimum
                                0x00A0,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x00A4,             // Range Minimum
                                0x00A4,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x00A8,             // Range Minimum
                                0x00A8,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x00AC,             // Range Minimum
                                0x00AC,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x00B0,             // Range Minimum
                                0x00B0,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x00B4,             // Range Minimum
                                0x00B4,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x00B8,             // Range Minimum
                                0x00B8,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x00BC,             // Range Minimum
                                0x00BC,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x04D0,             // Range Minimum
                                0x04D0,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                        })
                    
                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x0F)
                        }                
                    }


                //fake EC controller
                Device (EC)
                {
                    Name (_HID, "ACID0001")  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }

                //Dell touchpad & keyboard mapping
                Scope (PS2K)
                {
                    
                    // VoodooPSController default defines
                    Name(RMCF, Package()
                    {
                        "Keyboard", Package()
                        {
                            "NumLockOnAtBoot", ">y",
                            "NumLockSupport", ">y",
                        },
                        
                        "Mouse", Package()
                        {
                            "ActLikeTrackpad", ">y",
                        },
                        
                        "Breakless PS2", package()
                        {
                            package(){},
                            "e01e",    //Touchpad fn+f3 is breakless
                            "e008",    // wifi swith is breakless
                            "e006e",    // Video Mirror is breakless
                            "e005f",    // sleep is breakless
                        },
                        
                        "Custom ADB Map", Package()
                        {
                            Package(){},
                            "e005=6b",    // e005 brightness down, 6b is F14
                            "e006=71",    // e006 brightness up, 71 is F15
                            "e45=4f",     // fin+insert(pause) to F18
                            "e021=50",    //Calc to F19
                            "46=83",      //Dell fn+F3 to Launchpad
                            "e37=69",     //Dell SysRq/PrinScrn<fn+Home/End> mapping to F13
                        },
                                                
                    })

                    // Dell Keyboard mapping to ApplePS2Keyboard.kext
                    Method(_DSM, 4)
                    {
                        If (!Arg2) { Return (Buffer() { 0x03 } ) }
                        Return (Package()
                        {
                            "RM,oem-id", "DELL",
                            "RM,oem-table-id", "M4800",
                        })
                    }
                }

            }            
            
            
            //Inject MCHC
            Device (MCHC)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
            }
            
            
            //HD4600 EDID & Brightness injection
            Name (GFX0._STA, Zero)
            Device (IGPU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address       
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    \_SB.PCI0.GFX0._ADR = Zero
                }
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package()
                    {
                        "device-id", Buffer() { 0x12, 0x04, 0x00, 0x00 },
                        "pci-aspm-default",0x03,
                        "AAPL,ig-platform-id", Buffer() { 0x06, 0x00, 0x26, 0x0a },
                        "framebuffer-patch-enable", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                        "framebuffer-cursormem", Buffer() { 0x00, 0x00, 0x90, 0x00 },
                        "framebuffer-unifiedmem", Buffer() { 0x00, 0x00, 0x00, 0x80 },
                        "framebuffer-fbmem", Buffer() { 0x00, 0x00, 0x90, 0x00 },
                        "hda-gfx", Buffer() { "onboard-1" },
                        "AAPL00,override-no-connect", Buffer (0x80)
                        {
                            0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x30, 0xe4, 0x6f, 0x04,
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x01, 0x04, 0x95, 0x22, 0x13, 0x78,
                            0xea, 0xdc, 0x95, 0xa3, 0x58, 0x55, 0xa0, 0x26, 0x0d, 0x50, 0x54, 0x00,
                            0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                            0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x2e, 0x36, 0x80, 0xa0, 0x70, 0x38,
                            0x1f, 0x40, 0x30, 0x64, 0x35, 0x00, 0x58, 0xc2, 0x10, 0x00, 0x00, 0x1a,
                            0x52, 0x2b, 0x80, 0xa0, 0x70, 0x38, 0x1f, 0x40, 0x30, 0x20, 0x35, 0x00,
                            0x58, 0xc2, 0x10, 0x00, 0x00, 0x1a, 0x00, 0x00, 0x00, 0xfe, 0x00, 0x33,
                            0x38, 0x37, 0x34, 0x59, 0x80, 0x31, 0x35, 0x36, 0x57, 0x46, 0x36, 0x0a,
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x41, 0x31, 0x9e, 0x00, 0x10, 0x00,
                            0x00, 0x0a, 0x01, 0x0a, 0x20, 0x20, 0x00, 0x4e
                        },
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, Refof (Local0))
                    Return (Local0)
                }

                
                // brightness enable

                Device (PNLF)
                {
                    // Name (_ADR, Zero)  // _ADR: Address
                    Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                    Name (_CID, "backlight")  // _CID: Compatible ID
                    Name (_UID, 0x13)  // _UID: Unique ID
                    Name (_STA, 0x0B)  // _STA: Status
                } 
                
                
                // brightness keys enable for M4800
                
                Method (BRT6, 2, NotSerialized)
                {
                    If ((Arg0 == One))
                    {
                        Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
                        Notify (\_SB_.PCI0.GFX0.LCD_, 0x86) // Device-Specific
                    }

                    If ((Arg0 & 0x02))
                    {
                        Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
                        Notify (\_SB_.PCI0.GFX0.LCD_, 0x87) // Device-Specific
                    }
                }         
                                                            
            }
                   
            
            //HDAU -- Intel HDMI Audio; IGPU: built-in screen; PNLF: brightness fix
            Device (HDAU)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    \_SB.PCI0.B0D3._ADR = Zero
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                            0x03                                             // .
                        })
                    }

                    Store (Package ()
                    {
                        "AAPL,slot-name", "Built In",
                        "name", "Intel HDMI Audio",
                        "model", Buffer () {"Xeon E3-1200 v3/4th Gen Core Processor HD Audio Controller"},
                        // "device_type", Buffer () {"Audio device"},
                        "built-in", Buffer (One) {0x01},
                        "pci-aspm-default",
                            Buffer (0x04)
                            {
                                0x03, 0x00, 0x00, 0x00
                            },                          
                        // "layout-id", Buffer ()
                        //     {
                        //         0x07, 0x00, 0x00, 0x00
                        //     },
                        "alc-layout-id", Buffer ()
                            {
                                0x3b, 0x00, 0x00, 0x00
                            },
                        "hda-gfx", 
                            Buffer ()
                            {
                                "onboard-1"
                            }, 
                        "layout-id", 
                            Buffer (0x04)
                            {
                                0x07, 0x00, 0x00, 0x00                           // ....
                            }                        
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))

                    Return (Local0)
                }
            }
            
            //EHC1 - USB2.0 device power injection
            SCOPE (EHC1)
            {
                       
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package () {
                        "AAPL,clock-id", Buffer (One) { 0x02 },
                        "AAPL,slot-name", "Built In",
                        "pci-aspm-default",0x03,
                        "name", "Intel EHCI Controller",
                        "model", Buffer() {"Intel 8 Series/C220 Series Chipset Family USB EHCI #1"},
                        // "device_type", Buffer (0x0E) {"USB Controller"},
                        "AAPL,current-available", 0x0834,
                        "AAPL,current-extra", 0x0A8C,
                        "AAPL,current-in-sleep", 0x03E8,
                        "AAPL,current-extra-in-sleep", 0x0834,
                        "AAPL,max-port-current-in-sleep", 0x0A8C,
                        "AAPL,device-internal", 0x02,
                        Buffer (One) {0x00}
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    
                    Return (Local0)
                }                
                
            }
        
            
            //EHC2 - USB2.0 device power injection
            SCOPE (EHC2)
            {            
                
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package () {
                        "AAPL,clock-id", Buffer (One) { 0x02 },
                        "AAPL,slot-name", "Built In",
                        "pci-aspm-default",0x03,
                        "name", "Intel EHCI Controller",
                        "model", Buffer() {"Intel 8 Series/C220 Series Chipset Family USB EHCI #2"},
                        // "device_type", Buffer (0x0E) {"USB Controller"},
                        "AAPL,current-available", 0x0834,
                        "AAPL,current-extra", 0x0A8C,
                        "AAPL,current-in-sleep", 0x03E8,
                        "AAPL,current-extra-in-sleep", 0x0834,
                        "AAPL,max-port-current-in-sleep", 0x0A8C,
                        "AAPL,device-internal", 0x02,
                        Buffer (One) {0x00}
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    
                    Return (Local0)
                }            
            }
            
            
            //XHC - USB3.0 device power injection
            SCOPE (XHC)
            {

                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package () {
                        "AAPL,clock-id", Buffer (One) { 0x02 },
                        "AAPL,slot-name", "Built In",
                        "pci-aspm-default",0x03,
                        "name", "Intel XHCI Controller",
                        "model", Buffer () {"Intel 8 Series/C220 Series Chipset Family USB xHCI"},
                        // "device_type", Buffer (0x0E) {"USB Controller"},
                        "AAPL,current-available", 0x0834,
                        "AAPL,current-extra", 0x0A8C,
                        "AAPL,current-in-sleep", 0x03E8,
                        "AAPL,current-extra-in-sleep", 0x0834,
                        "AAPL,max-port-current-in-sleep", 0x0A8C,
                        "AAPL,device-internal", 0x02,
                        Buffer (One) {0x00}
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    
                    Return (Local0)
                }
                        
                //RhubOff to fix USB 3.0
                SCOPE (RHUB)
                {
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (Zero) // This disables the device only in macOS
                    }
                }                             
            }
            
            
            // fix SMBUS
            SCOPE (SBUS)
            {
                Device(BUS0)
                {  
                Name (_CID, "smbus")
                Name (_ADR, Zero)
                    Device (DVL0)
                    {
                        Name (_ADR, 0x57)
                        Name (_CID, "diagsvault")
                        Method (_DSM, 4, NotSerialized)
                        {
                            Store (Package () {
                                "address", 0x57,
                                "pci-aspm-default",
                                    Buffer ()
                                    {
                                        0x03, 0x01, 0x00, 0x00
                                    }                                			                 
                                }, Local0)
                            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                            Return (Local0)
                        }
                    }
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }  
                }
                Method (_DSM, 4, NotSerialized)
                {      
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Store (Package () {
                        "AAPL,slot-name", "Built In",
                        "name", "SMBus",
                        "model", Buffer () {"Intel 8 Series/C220 Series Chipset Family SMBus Controller"},
                        // "device_type", Buffer () {"SMBus Controller"},
                        "built-in", Buffer (One) {0x01},                        
                        "pci-aspm-default",
                            Buffer ()
                            {
                                0x03, 0x00, 0x00, 0x00
                            }                                			                 
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }                 
            }            
        
            // Nvidia HDMI / External GPU
            Scope (PEG0)
            {
                Device (GFX0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    // Name (_SUN, One)  // _SUN: Slot User Number
                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        \_SB.PCI0.PEG0.PEGP._ADR = 0x0F
                    }
                    
                    Name (EVD4, Buffer (One){})
                    CreateByteField (EVD4, Zero, EVD5)
                    Name (SSBU, Buffer (0x04){})
                    CreateDWordField (SSBU, Zero, SSDS)
                    Name (NOPE, Zero)
                    Name (HPEV, Zero)
                    OperationRegion (PCS, PCI_Config, Zero, 0x40)
                    Field (PCS, AnyAcc, NoLock, WriteAsZeros)
                    {
                        VVID,   16, 
                        VDID,   16, 
                        Offset (0x0A), 
                        DCLS,   16
                    }

                    OperationRegion (PCS2, PCI_Config, 0x40, 0x40)
                    Field (PCS2, AnyAcc, NoLock, Preserve)
                    {
                        SSID,   32
                    }

                    Method (VINI, 2, NotSerialized)
                    {
                        If ((Arg0 == 0x02))
                        {
                            EVD5 = Zero
                            // Local1 = DCLS /* \_SB_.PCI0.PEG0.GFX0.DCLS */
                            If ((DCLS == 0x0300))
                            {
                                // Local1 = VVID /* \_SB_.PCI0.PEG0.GFX0.VVID */
                                EVD5 = One
                                If ((VVID == 0x10DE))
                                {
                                    // If ((XSID () != 0x80))    /* Dell hacked as 0x80 <Win7>*/
                                    // {
                                    //     VDP1 (0x07, Zero)
                                    // }

                                    NOPE = VDP1 (0x08, Zero)
                                    SSDS = SSID /* \_SB_.PCI0.PEG0.GFX0.SSID */
                                }
                            }
                        }
                    }
                                                    
                    //brightness Control keys for external GPU
                    
                    Method (BRT6, 2, NotSerialized)
                    {
                        If ((EVD5 == One))
                        {
                            If ((Arg0 == One))
                            {
                            //    \RMDT.P1 ("DEBUG_HANS_SB.PCI0.PEG0.GFX0.BRT6.0x86")
                                Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
                                Notify (\_SB_.PCI0.PEG0.PEGP.LCD_, 0x86) // Device-Specific
                            }
        
                        If ((Arg0 & 0x02))
                            {
                            //    \RMDT.P1 ("DEBUG_HANS_SB.PCI0.PEG0.GFX0.BRT6.0x87")
                                Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
                                Notify (\_SB_.PCI0.PEG0.PEGP.LCD_, 0x87) // Device-Specific
                            }
                        }
                    }  
                                    
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        
                    
                        If ((Arg2 == Zero))
                        {
                            Return (package ()
                            {
                                Buffer (One)
                                {
                                    0x03                                             // .
                                }
                            })
                        }

                        Store (Package (0x0E)
                        {
                            "@0,connector-type", 
                            Buffer (0x04)
                            {
                                0x00, 0x08, 0x00, 0x00                           // ....
                            }, 

                            "@1,connector-type", 
                            Buffer (0x04)
                            {
                                0x00, 0x08, 0x00, 0x00                           // ....
                            }, 

                            "@2,connector-type", 
                            Buffer (0x04)
                            {
                                0x00, 0x08, 0x00, 0x00                           // ....
                            }, 

                            "@3,connector-type", 
                            Buffer (0x04)
                            {
                                0x00, 0x08, 0x00, 0x00                           // ....
                            }, 

                            "@4,connector-type", 
                            Buffer (0x04)
                            {
                                0x00, 0x08, 0x00, 0x00                           // ....
                            }, 

                            "@5,connector-type", 
                            Buffer (0x04)
                            {
                                0x00, 0x08, 0x00, 0x00                           // ....
                            }, 

                            "hda-gfx", 
                            Buffer (0x0A)
                            {
                                "onboard-2"
                            }
                        }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)             
                    }
                }  
                    
                //Nvidia HDMI Audio
                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                0x03                                             // .
                            })
                        }

                        Store (Package ()
                        {
                            "AAPL,slot-name", "Slot-1",
                            "name", "Nvidia HDMI Audio",
                            "model", Buffer () {"GK107 HDMI Audio Controller"},
                            // "device_type", Buffer () {"Audio device"},
                            "built-in", Buffer (One) {0x0},                                
                            "layout-id", Buffer ()
                                {
                                    0x01, 0x00, 0x00, 0x00
                                },
                            // "alc-layout-id", Buffer ()
                            //     {
                            //         0x3b, 0x00, 0x00, 0x00
                            //     },
                            "hda-gfx", 
                            Buffer (0x0A)
                            {
                                "onboard-2"
                            },
                            "pci-aspm-default", 
                            Buffer ()
                            {
                                0x03, 0x01, 0x00, 0x00
                            }
                        }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)                        
                    }
                }
            }        
        }

        
         // bluetooth BCM4352 injection       
        Scope (_SB.PCI0.RP03)
        {
            Scope (PXSX)
            {
                Name (_STA, Zero)
            }

            Device (ARPT)
            {    
                Name (_ADR, Zero)
                Name (_PRW, Package (0x02) {0x09,0x04})
                Name (_SUN, One)
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x0C) {
                        "AAPL,slot-name", "AirPort",
                        "name", "AirPort Extreme",
                        "model", Buffer () {"Broadcom BCM4352 802.11ac Wireless Network Adapter"},
                        "device_type", Buffer () {"AirPort"},
                        "compatible", "pci14e4,43a0",
                        "built-in", Buffer (One) {0x01}
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }

            }
        }

        // SDcard Injection - O2 Micro SDCARD
        Scope (_SB.PCI0.RP08.PXSX)
        {
            //Name (_ADR, Zero)
            //Name (_PRW, Package (0x02) {0x09,0x04})
            //Name (_SUN, One)
            Method (_DSM, 4, NotSerialized)
            {
                If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                Store (Package () 
                {
                    "AAPL,slot-name", "Built In",
                    "name", "SD/MMC Card Reader",
                    "model", Buffer () {"O2 Micro SD Card Reader"},
                    "device_type", Buffer () {"SD Host controller"},
                    "built-in", Buffer (One) {0x01},
                    "compatible", "pci14e4,16bc"
                }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }

        //ACPI debug
        Device (RMDT)
        {
            Name (_HID, "RMD0000")  // _HID: Hardware ID
            Name (RING, Package (0x0100){})
            Mutex (RTMX, 0x00)
            Name (HEAD, Zero)
            Name (TAIL, Zero)
            Method (PUSH, 1, NotSerialized)
            {
                Acquire (RTMX, 0xFFFF)
                Local0 = (HEAD + One)
                If ((Local0 >= SizeOf (RING)))
                {
                    Local0 = Zero
                }

                If ((Local0 != TAIL))
                {
                    RING [HEAD] = Arg0
                    HEAD = Local0
                }

                Release (RTMX)
                Notify (RMDT, 0x80) // Status Change
            }

            Method (FTCH, 0, NotSerialized)
            {
                Acquire (RTMX, 0xFFFF)
                Local0 = Zero
                If ((HEAD != TAIL))
                {
                    Local0 = DerefOf (RING [TAIL])
                    TAIL++
                    If ((TAIL >= SizeOf (RING)))
                    {
                        TAIL = Zero
                    }
                }

                Release (RTMX)
                Return (Local0)
            }

            Method (COUN, 0, NotSerialized)
            {
                Acquire (RTMX, 0xFFFF)
                Local0 = (HEAD - TAIL) /* \RMDT.TAIL */
                If ((Local0 < Zero))
                {
                    Local0 += SizeOf (RING)
                }

                Release (RTMX)
                Return (Local0)
            }

            Method (P1, 1, NotSerialized)
            {
                PUSH (Arg0)
            }

            Method (P2, 2, NotSerialized)
            {
                Local0 = Package (0x02){}
                Local0 [Zero] = Arg0
                Local0 [One] = Arg1
                PUSH (Local0)
            }

            Method (P3, 3, NotSerialized)
            {
                Local0 = Package (0x03){}
                Local0 [Zero] = Arg0
                Local0 [One] = Arg1
                Local0 [0x02] = Arg2
                PUSH (Local0)
            }

            Method (P4, 4, NotSerialized)
            {
                Local0 = Package (0x04){}
                Local0 [Zero] = Arg0
                Local0 [One] = Arg1
                Local0 [0x02] = Arg2
                Local0 [0x03] = Arg3
                PUSH (Local0)
            }

            Method (P5, 5, NotSerialized)
            {
                Local0 = Package (0x05){}
                Local0 [Zero] = Arg0
                Local0 [One] = Arg1
                Local0 [0x02] = Arg2
                Local0 [0x03] = Arg3
                Local0 [0x04] = Arg4
                PUSH (Local0)
            }

            Method (P6, 6, NotSerialized)
            {
                Local0 = Package (0x06){}
                Local0 [Zero] = Arg0
                Local0 [One] = Arg1
                Local0 [0x02] = Arg2
                Local0 [0x03] = Arg3
                Local0 [0x04] = Arg4
                Local0 [0x05] = Arg5
                PUSH (Local0)
            }

            Method (P7, 7, NotSerialized)
            {
                Local0 = Package (0x07){}
                Local0 [Zero] = Arg0
                Local0 [One] = Arg1
                Local0 [0x02] = Arg2
                Local0 [0x03] = Arg3
                Local0 [0x04] = Arg4
                Local0 [0x05] = Arg5
                Local0 [0x06] = Arg6
                PUSH (Local0)
            }
        }
      }                  
        
}