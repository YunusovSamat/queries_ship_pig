cd ~/Documents/BigDataLab/ships_pig

hdfs dfs -rm -r ships_pig/task5
hdfs dfs -mkdir -p ships_pig/task5/input
hdfs dfs -put classes* ships_pig/task5/input
hdfs dfs -put outcomes* ships_pig/task5/input

pig task5/script.pig

hdfs dfs -cat ships_pig/task5/output/part-r-00000
