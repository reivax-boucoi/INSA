#indef LOAD_H
#define LOAD_H

#define DAC_addr 0x60 // A0

/*‘1100000’ ( 2 ) A0
‘1100001’ ( 2 ) A1
‘1100010’ ( 2 ) A2
‘1100011’ ( 2 ) A3
*/

#define REG_DAC        0x00
#define REG_PD         0x09
#define REG_GainStatus 0x0A
#define REG_Wiper      0x0B
#define REG_NVDAC      0x10
#define REG_Vref       0x18
#define REG_NVPD       0x19
#define REG_NVGain     0x1A

//page 33 :
/*
00h Volatile DAC0 Register
01h Volatile DAC1 Register

09h Power-Down Register — 19h Nonvolatile Power-Down Register
0Ah Gain and Status Register
0Bh WiperLock Technology Status Register

10h Nonvolatile DAC0 
11h Nonvolatile DAC1
18h Nonvolatile VREF Select Register
19h Nonvolatile Power Down Configuration Register
1Ah Nonvolatile Gain and I 2 C Slave Address
*/

/*page 37 : vfref conf : 01
    38 : PD conf : 01 to load with 1k; 00 to not power down
    39 : gain control : b(8)=1 pour gain x2
*/

void Dac_init(void);
void Dac_send(int val);


#endif
