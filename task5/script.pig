classes = LOAD '/user/samat/ships_pig/task5/input/classes*' 
  USING PigStorage('|')
  AS (class:chararray, type:chararray, country:chararray, 
      numGuns:int, bore:float, displacement:int);
filter_classes = FOREACH classes GENERATE class;

outcomes = LOAD '/user/samat/ships_pig/task5/input/outcomes*'
  USING PigStorage('!')
  AS (name:chararray, battle:chararray, result:chararray);
filter_outcomes = FOREACH outcomes GENERATE name;

join_classes = JOIN filter_classes BY class, filter_outcomes BY name;
join_classes = FOREACH join_classes GENERATE class;

STORE join_classes INTO '/user/samat/ships_pig/task5/output/';
