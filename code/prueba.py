from pyspark.sql import SparkSession

# Crear una sesión de Spark
spark = SparkSession.builder.appName("App").getOrCreate()

# Leer el archivo CSV en un DataFrame
df = spark.read.options(header='True', inferSchema='True').csv('tasas.csv')

# Mostrar el contenido del DataFrame
df.count()
