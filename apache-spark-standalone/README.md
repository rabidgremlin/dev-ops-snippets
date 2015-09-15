# Apache Spark Standalone
This vagrant script will set up Apache Spark in standalone mode. Useful for experimentation or "little data" processing.

Execute
```
vagrant up
```

to start the VM, ```vagrant ssh``` into it and then try:

```
cd ~/spark-1.5.0-bin-hadoop2.6
./bin/pyspark
testFile = sc.textFile("README.md")
testFile.count()
```

Press ```CTRL+D``` to exit the pyspark shell

or

```
cd ~/spark-1.5.0-bin-hadoop2.6
./bin/spark-submit --master local /vagrant/simpleapp.py
```


