cd ~/Documents/BigDataLab/ships_pig

hdfs dfs -rm -r ships_pig/task2
hdfs dfs -mkdir -p ships_pig/task2/input
hdfs dfs -put classes* ships_pig/task2/input

pig task2/script.pig

hdfs dfs -cat ships_pig/task2/output/part-m-00000
