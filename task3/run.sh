cd ~/Documents/BigDataLab/ships_pig

hdfs dfs -rm -r ships_pig/task3
hdfs dfs -mkdir -p ships_pig/task3/input
hdfs dfs -put classes* ships_pig/task3/input
hdfs dfs -put ships* ships_pig/task3/input

pig task3/script.pig

hdfs dfs -cat ships_pig/task3/output/part-r-00000
