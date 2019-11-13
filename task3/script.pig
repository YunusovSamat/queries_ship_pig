classes = LOAD '/user/samat/ships_pig/task3/input/classes*' 
  USING PigStorage('|')
  AS (class:chararray, type:chararray, country:chararray, 
      numGuns:int, bore:float, displacement:int);
filter_classes = FILTER classes BY 
  numGuns >= 10;
filter_classes = FOREACH filter_classes GENERATE class, country;

ships = LOAD '/user/samat/ships_pig/task3/input/ships*'
  USING PigStorage('&')
  AS (name:chararray, class:chararray, launched:int);
filter_ships = FOREACH ships GENERATE class, name;

join_ships = JOIN filter_classes BY class, filter_ships BY class;
join_ships = FOREACH join_ships GENERATE $0, name, country;

STORE join_ships INTO '/user/samat/ships_pig/task3/output/';
