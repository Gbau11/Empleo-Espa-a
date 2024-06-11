# %%
from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql.types import *
from pyspark.sql import functions as F
import pandas as pd

# %%
spark = SparkSession.builder.appName("App").getOrCreate()

# %%
df = spark.read.options(header='true', inferSchema='true', delimiter=';').csv('../data/ocupados_sexo_actividad.csv')

# %%
df.show(40)

# %%
df.printSchema()

# %%
df = df.withColumnRenamed('Rama de actividad CNAE 2009', 'Cnae').withColumnRenamed('Periodo', 'Fecha')
df.printSchema()

# %%
df.select('Cnae').distinct().collect()

# %%
df.orderBy('Total').show()

# %%
df.where(df['Total'].isNull()).count(), df.count()

# %%
df.filter(df['Total'] == '..').count()

# %%
df = df.replace(['..','.'],['',''],'Total')

# %%
df.where(df['Total'].isNull()).count(), df.count()

# %%
df = df.withColumn('Total', F.regexp_replace('Total', '\\.', ''))
df = df.withColumn('Total', F.regexp_replace('Total', ',', '.'))

# %%
df.where(df['Total'].isNull()).count(), df.count()

# %%
df.select('Total').distinct().collect()

# %%
df.orderBy('Total').show()

# %%
df.show()

# %%
df = df.withColumn('Total', df['Total'].cast('Double'))

# %%
df.printSchema()

# %%
df.where(df['Total'].isNull()).count(), df.count()

# %%
df.select('Total').distinct().collect()

# %%
df.filter(df['Total'].isNull()).count()

# %%
df.select(mean('Total')).collect()[0][0]

# %%
df.filter(df['Total'] > 188).orderBy('Total').show()

# %%
df.select('Cnae').distinct().collect()

# %%
lst = []
for i in df.select('Cnae').distinct().collect():
    lst.append(i[0])
lst

# %%
df.filter(col('Fecha').contains('2022')).show(2)

# %%
df.filter(col('Cnae').endswith('s')).show(2)

# %%
df.filter(col('Cnae').startswith('I')).show(2)

# %%
dic = {}
lst2 = ['A', 'M', 'H']
lst3 = []
for i in df.select('Sexo').distinct().collect():
    lst3.append(i[0])
for i in range(3):
    dic[lst3[i]]=lst2[i]
dic

# %%
cond = [F.when(F.col('Sexo') == k, v) for k, v in dic.items()]

df = df.withColumn('Sexo', F.coalesce(*cond, F.col('Sexo')))

# %%
df.show()

# %%
#df = df.withColumn('Total', F.when(F.col('Total').isNull(), df.select(mean('Total')).collect()[0][0]).otherwise(F.col('Total')))

# %%
df = df.withColumn('Cnae', lower(df['Cnae']))

# %%
df = df.withColumn('Total_2', df['Total'] * 10)

# %%
df.show()

# %%
df = df.withColumn('Año', F.substring(F.col('Fecha'), 1, 4))

# %%
df = df.withColumn('Trimestre', 
                   F.when(F.substring(F.col('Fecha'), 5, 2).isin('T1'), 1)
                    .when(F.substring(F.col('Fecha'), 5, 2).isin('T2'), 2)
                    .when(F.substring(F.col('Fecha'), 5, 2).isin('T3'), 3)
                    .when(F.substring(F.col('Fecha'), 5, 2).isin('T4'), 4)
                    .otherwise(None))
#df = df.withColumn('Total', F.when(F.col('Total').isNull(), df.select(mean('Total')).collect()[0][0]).otherwise(F.col('Total')))

# %%
df.filter(df['Unidad']=='Porcentaje').show(2)

# %%
df.filter(df['Total']>20000).show(20)

# %%
df.filter(df['Unidad']=='Valor absoluto').sort(asc('Trimestre')).show()

# %%
gp = df.filter((df['Unidad']=='Porcentaje')&(df['Sexo']=='A')&(df['Año']==2023)&(df['Trimestre']==4)&(df['Cnae']!='total'))

# %%
gp.sort(asc('Total')).show()

# %%
gp.agg({'Total':'sum'}).collect()

# %%
gp.groupBy('Cnae')['Total'].agg('mean')

# %%
df.count()

# %%
df = df.drop('Fecha')

# %%
df.select('Cnae').show()

# %%
#df = df.withColumn('Total', F.when(F.col('Total').isNull(), df.select(mean('Total')).collect()[0][0]).otherwise(F.col('Total')))
df.show()

gp.to_csv('../prue.csv', index=False)