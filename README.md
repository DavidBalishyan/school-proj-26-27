Հայերեն տարբերակը տես [այստեղ](#AM)

# Mini Tank Robot V2.1 (KS0605)

Single Arduino Uno project for the keyestudio Mini Tank Robot V2.1, taken from lesson 15 of `KS0605.pdf`. The tank drives over Bluetooth (HM-10) and shows the matching pattern on the 8x16 LED panel.

Hardware assembly guide: <https://docs.keyestudio.com/projects/KS0605/en/latest/docs/2.%20Product%20installation/Product%20installation.html>

## Linux / Arduino CLI quick start

```sh
make setup     # once: install the arduino:avr core
make ports     # find the board's serial port
make build     # compile MiniTankRobotV2/MiniTankRobotV2.ino
make upload    # compile + upload
make monitor   # optional: serial output at 9600 baud
```

`sketch.yaml` pins the board to `arduino:avr:uno`. `make` uses the first connected Uno port automatically; override with `make upload PORT=/dev/ttyACM0`. Other overrides: `BAUD`, `PROFILE`, `BUILD_DIR`.

Before uploading, unplug the Bluetooth module (it shares the hardware serial port); reconnect it after the upload. Power the motors through the L298P shield (7-12 V) and set the DIP switch to the right.

## Wiring

| Module | Connections |
| --- | --- |
| 8x16 LED panel | GND -> -GND, VCC -> +VCC, SDA -> A4, SCL -> A5 |
| Bluetooth module | RXD -> TX, TXD -> RX, VCC -> +VCC, GND -> -GND |
| Left motor | direction D13, PWM D11 |
| Right motor | direction D12, PWM D3 |

Motor terminal block: right rear motor red -> 1, black -> 2; left front motor red -> 3, black -> 4.

Bluetooth app commands: `F` forward, `B` back, `L` rotate left, `R` rotate right, `S` stop.

# AM

Arduino Uno-ի վրա հիմնված նախագիծ՝ նախատեսված keyestudio Mini Tank Robot V2.1 ռոբոտի համար։ Նախագիծը հիմնված է `KS0605.pdf` ձեռնարկի 15-րդ դասի վրա։ Ռոբոտը կառավարվում է Bluetooth-ի (HM-10) միջոցով և 8x16 LED էկրանին ցուցադրում է համապատասխան պատկերանշանը։

Սարքավորման հավաքման ուղեցույց՝ https://docs.keyestudio.com/projects/KS0605/en/latest/docs/2.%20Product%20installation/Product%20installation.html

## Linux / Arduino CLI․ արագ մեկնարկ

```sh
make setup     # մեկ անգամ՝ տեղադրել arduino:avr միջուկը
make ports     # գտնել սերիական պորտը, որին միացված է Arduino-ն
make build     # կոմպիլացնել MiniTankRobotV2/MiniTankRobotV2.ino ֆայլը
make upload    # կոմպիլացնել և վերբեռնել ծրագիրը
make monitor   # ըստ ցանկության՝ դիտել սերիական ելքը 9600 baud արագությամբ
```

`sketch.yaml` ֆայլում Arduino-ի տախտակը սահմանված է որպես `arduino:avr:uno`։ `make` հրամանն ավտոմատ կերպով օգտագործում է առաջին միացված Uno-ի պորտը։ Այն կարող եք փոխարինել՝ օգտագործելով `make upload PORT=/dev/ttyACM0` հրամանը։ Այլ կարգավորվող պարամետրերն են՝ `BAUD`, `PROFILE`, `BUILD_DIR`։

Ծրագիրը վերբեռնելուց առաջ անջատեք Bluetooth մոդուլը (այն օգտագործում է նույն ներկառուցված սերիական պորտը)։ Վերբեռնումն ավարտելուց հետո կրկին միացրեք այն։ Շարժիչները սնուցեք L298P ընդլայնման մոդուլի միջոցով (7-12 V) և DIP անջատիչը դրեք աջ դիրքում։

## Միացումներ

| Մոդուլ | Միացումներ |
| --- | --- |
| 8x16 LED էկրան | GND -> -GND, VCC -> +VCC, SDA -> A4, SCL -> A5 |
| Bluetooth մոդուլ | RXD -> TX, TXD -> RX, VCC -> +VCC, GND -> -GND |
| Ձախ շարժիչ | ուղղության կառավարում՝ D13, PWM՝ D11 |
| Աջ շարժիչ | ուղղության կառավարում՝ D12, PWM՝ D3 |

Շարժիչների միացման տերմինալային բլոկ՝ աջ հետևի շարժիչի կարմիր լար -> 1, սև լար -> 2, ձախ առջևի շարժիչի կարմիր լար -> 3, սև լար -> 4։

Bluetooth հավելվածի հրամանները՝ `F`՝ առաջ շարժվել, `B`՝ հետ շարժվել, `L`՝ պտտվել ձախ, `R`՝ պտտվել աջ, `S`՝ կանգ առնել։
