# Alora（阿洛拉）汉化说明

模组路径：`E:\GitHub\Alora-NPC-for-BG2\alora`

汉化范围：`lang\english\` 全部 6 个 `.tra`，共 **534 条**字符串

汉化产物：`lang\schinese\`（6 个同名 `.tra`，UTF-8 无 BOM，CRLF）



***

## 一、处理口径



| 项目                                              | 处理方式                                                                 |
| ----------------------------------------------- | -------------------------------------------------------------------- |
| `lang\english\`                                 | **完全未改动**（只读取）                                                       |
| `lang\german` / `french` / `russian` / `polish` | 未动                                                                   |
| `lang\schinese\`                                | 6 个文件全部中文，534 条，id 与英文一一对应                                           |
| `alora.tp2`                                     | **未改动**（语言分支 `Schinese` 原本就有）                                        |
| `d\` / `lib\` / `baf\` 脚本                       | **未改动**，不需要 `.bak`（原因见第三节）                                           |
| WeiDU 格式                                        | `@N = ~...~` 前缀、结尾 `~`、注释、空行、原有换行全部保留                                |
| 标点                                              | `~` 保持英文半角；`~` 内一律中文全角（含全角括号）                                        |
| 变量                                              | `<CHARNAME>`、`<PRO_HESHE>`、`<PRO_HIMHER>`、`<PRO_BROTHERSISTER>` 原样保留 |
| 编码                                              | UTF-8 无 BOM，与原文件同为 CRLF                                              |

## 二、条目清单



| 文件             | 条数  | 内容                                                                            |
| -------------- | --- | ----------------------------------------------------------------------------- |
| `bcmalor.tra`  | 332 | SoA 队友闲聊（含艾黎、阿诺门、瑟恩德、艾德温 / 艾德温娜、海尔达利、伊莫恩、贾希拉、詹、凯尔登、科根、玛兹、明斯克、娜莉亚、瓦里格、维康尼亚、义桑） |
| `alora25.tra`  | 99  | ToB 命运之魂召唤、萨拉杜什、以及 ToB 队友闲聊（含萨瑞沃克、海尔达利、艾黎怀孕、艾德温友情线）                           |
| `aloraint.tra` | 60  | 城内互动（里巴尔、玛拉等）、剧情插话、最终章表态                                                      |
| `cmalora.tra`  | 27  | 招募、遣散、归队                                                                      |
| `cmaloraj.tra` | 8   | 表弟埃利斯（明齐姑妈的项链）小任务                                                             |
| `setup.tra`    | 8   | 组件名、人物志、尾声                                                                    |

校验：6 个文件 `@N` 条目数与 id 序列与英文版**完全一致**，换行数逐条对齐，无残留英文段落。

## 三、`.bak` 与「代码内嵌文字」复查结论

对 `d\`、`lib\`、`baf\`、`.tp2` 做了三轮扫描（`~...~` 严格过滤 + `SAY ~...~` 字面量 + `REPLY` / `PRINT` / `FAIL`）：



* 全部对话脚本的正文都走 `SAY @N` / `THEN REPLY @N`，正文只在 6 个 `.tra` 里；

* **唯一一处**字面英文 `SAY ~Grumpy one aye? Wake up on the wrong side of the bed <CHARNAME>? ...~` 在 `d\bcmalor.d` 第 106 行，**位于&#x20;**`/* ... */`**&#x20;注释块内**，是作者弃用的旧稿，不参与编译、不进游戏；

* `lib\gw_dlg_functions.tpa` 里的 `PRINT ~...~` 是安装期调试输出，不是玩家可见文本；

* `.tp2` 的组件名与提示全部取自 `setup.tra`（已译）。

结论：**这个模组没有需要就地替换并生成&#x20;**`.bak`**&#x20;的代码内嵌正文**，脚本目录保持原样。

## 四、安装注意

语言分支已存在，安装时在语言列表选 **Schinese** 即可：



```
AUTO_TRA ~weidu_external/alora/lang/autotra/%LANGUAGE%~
LANGUAGE ~Schinese~ ~schinese~ ~alora/lang/schinese/setup.tra~
```

两点提醒：



1. `HANDLE_CHARSETS`**（**`alora.tp2`**&#x20;第 49 行）** —— 它用 `infer_charsets = 1`，把 `lang\<语言>` 转码后写进 `weidu_external/alora/lang/autotra\<语言>`。简中环境本身要 UTF-8，若它把我们的 UTF-8 误判成某个 ANSI 代码页，中文就会乱码或报 `No translation provided for @N`。按你以往的做法：**把这一行（以及那个&#x20;**`LAF ... END`**&#x20;整块）注释掉再装**即可，汉化文件本身已是 UTF-8，不需要转码。本次没有动 `tp2`。

2. **README**：`README ~alora/readme/alora-readme-%LANGUAGE%.html~ ~alora/readme/alora-readme.html~`，目录里只有英文 `alora-readme.html`，没有简中版，安装结束显示的是英文说明（不影响游戏内文本）。需要的话可以另做一份 `alora-readme-schinese.html`。

两个组件：



* 组件 0「阿洛拉 NPC（BG2 原始版本）」；

* 组件 1「阿洛拉 NPC 连续版」—— 需先装 `Cont``inuous_End` 模组，且必须在 **EET\_End 之前**安装。

## 五、统一译名（供后续校对）

阿洛拉 Alora｜埃利斯 Ellis（表弟）｜亨利・疾足二世 Henry Fleetfoot the Second（舅舅）｜明齐姑妈 Aunt Minzi｜詹斯特 Jamster

里巴尔 Ribald｜玛拉 Mara｜伊里亚博 Iriaebor｜博德之门 Baldur's Gate｜无冬城 Neverwinter｜安姆 Amn｜卡林珊 Calimshan｜卡拉图 Kara-Tur｜剑湾 Sword Coast｜萨拉杜什 Saradush｜奇迹之殿 Hall of Wonders｜铜冠酒馆 Copper Coronet｜沃杜尔酒馆 Voodur's Bar｜影贼 Shadow Thieves｜幽影监狱 Spellhold｜口袋位面 Pocket Plane

队友：艾黎 Aerie、阿诺门 Anomen、瑟恩德 Cernd、艾德温／艾德温娜 Edwin／Edwina、海尔达利 Haer'Dalis、伊莫恩 Imoen、贾希拉 Jaheira、詹 Jan、凯尔登 Keldorn、科根 Korgan、玛兹 Mazzy、明斯克 Minsc（布 Boo）、娜莉亚 Nalia、萨瑞沃克 Sarevok、瓦里格 Valygar、维康尼亚 Viconia、义桑 Yoshimo、艾瑞尼卡斯 Irenicus｜莎尔 Shar｜阿瓦瑞尔 Avariel

卓尔语原样保留：`Sakphul`

## 六、产物所在



```
E:\GitHub\Alora-NPC-for-BG2\alora\lang\schinese\
  alora25.tra  aloraint.tra  bcmalor.tra  cmalora.tra  cmaloraj.tra  setup.tra
```

直接安装即可，无需改动其它任何文件。