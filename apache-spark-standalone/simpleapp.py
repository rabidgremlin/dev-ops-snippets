"""simpleapp.py"""
from pyspark import SparkContext

logFile = "/home/vagrant/spark-1.5.0-bin-hadoop2.6/README.md"  
sc = SparkContext(appName="Simple App")
logData = sc.textFile(logFile).cache()

numAs = logData.filter(lambda s: 'a' in s).count()
numBs = logData.filter(lambda s: 'b' in s).count()

print("Lines with a: %i, lines with b: %i" % (numAs, numBs))