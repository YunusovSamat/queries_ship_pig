outcomes = LOAD '/user/samat/ships_pig/task1/input/outcomes*.txt' 
  USING PigStorage('!')
  AS (ship:chararray, battle:chararray, result:chararray);

filter_outcomes = FILTER outcomes BY 
  battle == 'North Atlantic' AND result == 'sunk';

filter_outcomes = FOREACH filter_outcomes GENERATE $0;

STORE filter_outcomes INTO '/user/samat/ships_pig/task1/output/';
