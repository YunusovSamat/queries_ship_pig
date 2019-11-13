classes = LOAD '/user/samat/ships_pig/task2/input/classes*.txt' 
  USING PigStorage('|')
  AS (class:chararray, type:chararray, country:chararray, 
      numGuns:int, bore:float, displacement:int);

filter_classes = FILTER classes BY 
  bore >= 16;

filter_classes = FOREACH filter_classes GENERATE class, country;

STORE filter_classes INTO '/user/samat/ships_pig/task2/output/';
