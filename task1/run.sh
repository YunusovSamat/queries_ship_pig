cd ~/Documents/BigDataLab/ships_pig

hdfs dfs -rm -r /user/samat/ships_pig/task1
hdfs dfs -mkdir -p /user/samat/ships_pig/task1/input
hdfs dfs -put outcomes* /user/samat/ships_pig/task1/input

pig task1/script.pig

hdfs dfs -cat /user/samat/ships_pig/task1/output/part-m-00000
