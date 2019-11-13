cd ~/Documents/BigDataLab/ships_pig

hdfs dfs -rm -r ships_pig/task4
hdfs dfs -mkdir -p ships_pig/task4/input
hdfs dfs -put classes* ships_pig/task4/input
hdfs dfs -put ships* ships_pig/task4/input

pig task4/script.pig

hdfs dfs -cat ships_pig/task4/output/part-r-00000
