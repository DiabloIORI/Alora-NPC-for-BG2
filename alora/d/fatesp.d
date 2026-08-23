// FATE SPIRIT

EXTEND_TOP FATESP %fatesp_state_alora% #%fatesp_transition_alora%
+ ~!Dead("%CMALORA%") !InMyArea("%CMALORA%") Global("AloraSummoned","GLOBAL",0)~ + @0 // ~Bring me Alora, the happy-go-lucky thief.~
 	DO ~CreateVisualEffect("SPPORTAL",[1891.1287])
	Wait(2)
	CreateCreature("ALORA25",[1891.1287],1)
	SetGlobal("AloraSummoned","GLOBAL",1)~ GOTO 8
END
