BEGIN ~CMALORAJ~


/* CHAIN IF WEIGHT #-1
~InParty("%CMALORA%")
See("%CMALORA%")
!StateCheck("%CMALORA%",CD_STATE_NOTVALID)
Global("AloraCousin","LOCALS",0)~ THEN CMALOCUS AloraQuest
@0 DO ~SetGlobal("AloraCousin","LOCALS",1) SetGlobal("AloraCousinQuest","GLOBAL",1)~
== CMALORAJ @1
== CMALOCUS @2
== CMALORAJ @3
== CMALOCUS @4
== CMALORAJ @5
== CMALOCUS @6
== CMALORAJ @7
EXIT
*/
