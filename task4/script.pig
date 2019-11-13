classes = LOAD '/user/samat/ships_pig/task4/input/classes*' 
  USING PigStorage('|')
  AS (class:chararray, type:chararray, country:chararray, 
      numGuns:int, bore:float, displacement:int);
filter_classes = FILTER classes BY 
  type == 'bb' AND displacement > 35000;
filter_classes = FOREACH filter_classes GENERATE class;

ships = LOAD '/user/samat/ships_pig/task4/input/ships*'
  USING PigStorage('&')
  AS (name:chararray, class:chararray, launched:int);
filter_ships = FILTER ships BY launched >= 1922;
filter_ships = FOREACH filter_ships GENERATE class, name;

join_ships = JOIN filter_classes BY class, filter_ships BY class;
join_ships = FOREACH join_ships GENERATE name;

STORE join_ships INTO '/user/samat/ships_pig/task4/output/';
