/**********************************************************************************************************************					
Instituto Nacional de Estad�stica (INE) www.ine.es					
***********************************************************************************************************************					
					
DESCRIPCI�N:					
Este programa genera un fichero SAS con formatos, partiendo de un fichero sin ellos.					
					
Consta de las siguientes partes:					
	* 1. Definir la librer�a de trabajo --> Libname				
	* 2. Definici�n de formatos --> PROC FORMAT				
	* 3. Vincular formatos a la base de datos --> PASO data				
					
 Entrada:                                                           					
     - Fichero SAS sin formatos: 	 EPA_2021T1.sas7bdat				
 Salida:                                                           					
     - Fichero SAS con formatos: 	 EPA_2021T1_conFormato.sas7bdat				
					
Donde:					
	* Operaci�n: Encuesta de Poblaci�n Activa
	* Periodo: 2021T1		
					
************************************************************************************************************************/					
		
/* Directorio de trabajo para la operaci�n estad�stica */
*%let siglas_periodo = EPA_2021T1;
*%let conFormato = _conFormato;
					
/*1) Definir la librer�a de trabajo: introducir el directorio que desee como librer�a					
(se da como ejemplo 'C:\Mis resultados'), y copiar en ese directorio el fichero sas "EPA_2021T1.sas7bdat"*/					
					
*libname ROutput 'C:\Mis resultados';	

options fmtsearch = (ROutput ROutput.cat1);

* 2) DEFINICI�N DE FORMATOS;
PROC FORMAT LIBRARY=ROutput.cat1;

value $TNIVEL

"1"="Persona de 16 o m�s a�os"
"2"="Menor de 16 a�os"
;
value $T5EDAD

"00"="0 a 4 a�os"
"05"="5 a 9 a�os"
"10"="10 a 15 a�os"
"16"="16 a 19 a�os"
"20"="20 a 24 a�os"
"25"="25 a 29 a�os"
"30"="30 a 34 a�os"
"35"="35 a 39 a�os"
"40"="40 a 44 a�os"
"45"="45 a 49 a�os"
"50"="50 a 54 a�os"
"55"="55 a 59 a�os"
"60"="60 a 64 a�os"
"65"="65 o m�s a�os"
;
value $TRELPP

"1"="Persona de referencia (p.r.)"
"2"="C�nyuge o pareja de la p.r."
"3"="Hijo/a, hijastro/a (de la p.r o pareja del mismo)"
"4"="Yerno , nuera de la p.r. o de su pareja (o pareja del hijo/a, hijastro/a)"
"5"="Nieto/a, nieto/a de la p.r. o de su pareja (incluye nietastros/as e ambos)"
"6"="Padre, madre, suegro/a de la p.r o pareja de los mismos (padrastro, madrastra)"
"7"="Otro pariente de la p.r (o pareja del mismo)"
"8"="Persona del servicio dom�stico"
"9"="Sin parentesco con la p.r."
;
value $TSEXO

"1"="Hombre"
"6"="Mujer"
;
value $TECIV

"1"="Soltero"
"2"="Casado"
"3"="Viudo"
"4"="Separado o divorciado"
;
value $TNACIO

"1"="Espa�ola"
"2"="Espa�ola y doble nacionalidad"
"3"="Extranjera"
;
value $TNFORMA

"AN"="Analfabetos (c�digo 01 en CNED-2014), (c�digo 80 en CNED-2000)"
"P1"="Educaci�n primaria incompleta (c�digo 02 en CNED-2014), (c�digo 11 en CNED-2000)"
"P2"="Educaci�n primaria (c�digo 10 en CNED-2014), (c�digo 12 en CNED 2000)"
"S1"="Primera etapa de educaci�n secundaria (c�digos 21-24 en CNED-2014), (c�digos 21-23, 31, 36* en CNED-2000)"
"SG"="Segunda etapa de educaci�n secundaria. Orientaci�n general (c�digo 32 en CNED-2014), (c�digo 32 en CNED-2000)"
"SP"="Segunda etapa de educaci�n secundaria. Orientaci�n profesional (incluye educaci�n postsecundaria no superior) (c�digos 33-35, 38**, 41 en CNED-2014), (c�digos 33, 34, 41 en CNED-2000)"
"SU"="Educaci�n superior (c�digos 51, 52, 61-63, 71-75, 81 en CNED-2014), (c�digos 50-56, 59, 61 en CNED-2000)"
;
value $TCURSR

"1"="S�"
"2"="Estudiante en vacaciones"
"3"="No"
;
value $TNCURSR

"PR"="Educaci�n primaria (c�digos 11-13 en CNED-2014), (c�digos 11-13 en CNED-2000)"
"S1"="Primera etapa de educaci�n secundaria (c�digos 21-23 en CNED-2014), (c�digos 22, 23, 36** en CNED-2000)"
"SG"="Segunda etapa de educaci�n secundaria. Orientaci�n general (c�digos 31, 32 en CNED-2014), (c�digo 32 en CNED-2000)"
"SP"="Segunda etapa de educaci�n secundaria. Orientaci�n profesional (incluye educaci�n postsecundaria no superior (c�digos 33-35*, 36-37, 38***, 41 en CNED-2014), (c�digos 33, 34 en CNED-2000)"
"SU"="Educaci�n superior (c�digos 51, 52, 61-63, 71-75, 81 en CNED-2014), (c�digos 50-52, 54-56, 59, 61 en CNED-2000)"
;
value $TOBJNR

"1"="Proporcionar formaci�n relacionada con la ocupaci�n actual"
"2"="Proporcionar formaci�n relacionada con un posible empleo futuro"
"3"="Proporcionar formaci�n no relacionada con el trabajo (inter�s personal u otros motivos)"
;
value $TSINO

"1"="S�"
"6"="No"
;
value $TSINONS

"1"="S�"
"6"="No"
"0"="No sabe"
;
value $TRZNOTB

"01"="Vacaciones o dias de permiso"
"02"="Permiso por nacimiento de un hijo"
"03"="Excedencia por nacimiento de un hijo"
"04"="Enfermedad, accidente o incapacidad temporal del encuestado"
"05"="Jornada de verano, horario variable, flexible o similar"
"06"="Actividades de representaci�n sindical"
"07"="Nuevo empleo en el que a�n no hab�a empezado a trabajar"
"08"="Fijo discontinuo o trabajador estacional en la �poca de menor actividad"
"09"="Mal tiempo"
"10"="Paro parcial por razones t�cnicas o econ�micas"
"11"="Se encuentra en expediente de regulaci�n de empleo"
"12"="Huelga o conflicto laboral"
"13"="Haber recibido ense�anza o formaci�n relacionada con el trabajo"
"14"="Razones personales o responsabilidades familiares"
"15"="Otras razones"
"00"="No sabe"
;
value $TVINCUL

"01"="Vacaciones o d�a de permiso; Permiso por nacimiento de un hijo; Enfermedad, accidente o incapacidad temporal del encuestado; Jornada de verano, horario variable, flexible o similar; Haber recibido ense�anza o formaci�n relacionada con el trabajo"
"02"="Excedencia por cuidado de hijos con vinculaci�n fuerte con el empleo."
"04"="Fijo discontinuo o trabajador estacional en la �poca de menor actividad, que realiza regularmente alguna tarea relacionada con el empleo estacional"
"05"="Actividades de representaci�n sindical; Mal tiempo; Expediente de regulaci�n de empleo; Paro parcial por razones t�cnicas; Encontrarse en expediente de regulaci�n de empleo; Huelga o conflicto laboral; Razones personales o responsabilidades familiares, Otras razones; No sabe. En todos los casos, siempre que mantengan un v�nculo fuerte con el empleo."
"07"="Excedencia por cuidado de hijos, con vinculaci�n d�bil con el empleo"
"08"="Fijo discontinuo o trabajador estacional en la �poca de menor actividad, que ya no realiza regularmente ninguna tarea relacionada con el empleo estacional"
"09"="Actividades de representaci�n sindical; Mal tiempo; Expediente de regulaci�n de empleo; Paro parcial por razones t�cnicas; Encontrarse en expediente de regulaci�n de empleo; Huelga o conflicto laboral; Razones personales o responsabilidades familiares, Otras razones; No sabe. En todos los casos, siempre que su vinculaci�n con el empleo sea d�bil."
"11"="Nuevo empleo en el que a�n no hab�a empezado a trabajar"
;
value $TNUEVEM

"1"="S�, se incorporar� en un plazo inferior o igual a tres meses"
"2"="S�, se incorporar� en un plazo superior a tres meses"
"3"="No"
;
value $TOCUP

"0"="Ocupaciones militares (c�digos CNO-2011). Fuerzas armadas (c�digos CNO-1994)"
"1"="Directores y gerentes (c�digos CNO-2011). Direcci�n de las empresas y de las Administraciones P�blicas (c�digos CNO-1994)"
"2"="T�cnicos y Profesionales cient�ficos e intelectuales (c�digos CNO-2011)"
"3"="T�cnicos y Profesionales de apoyo (c�digos CNO-2011)"
"4"="Empleados contables, administrativos y otros empleados de oficina (c�digos CNO-2011). Empleados de tipo administrativo (c�digos CNO-1994)"
"5"="Trabajadores de servicios de restauraci�n, personales, protecci�n y vendedores de comercio (c�digos CNO-2011)"
"6"="Trabajadores cualificados en el sector agr�cola, ganadero, forestal y pesquero (c�digos CNO-2011).Trabajadores cualificados en la agricultura y en la pesca (c�digos CNO-1994)"
"7"="Artesanos y trabajadores cualificados de las industrias manufactureras y la construcci�n (excepto operadores de instalaciones y maquinaria (c�digos CNO-2011). Artesanos y trabajadores cualificados de las industrias manufactureras, la construcci�n, y la miner�a, excepto operadores de instalaciones y maquinaria (c�digos CNO-1994)"
"8"="Operadores de instalaciones y maquinaria, y montadores (c�digos CNO-2011)"
"9"="Ocupaciones elementales (c�digos CNO-2011). Trabajadores no cualificados (c�digos CNO-1994)"
;
value $TACTIV

"0"="Agricultura, ganader�a, silvicultura y pesca (c�digos CNAE-09: 01, 02 y 03), (c�digos CNAE-93: 01, 02 y 05)"
"1"="Industria de la alimentaci�n, textil, cuero, madera y papel (c�digos CNAE-09: del 10 al 18), (c�digos CNAE-93 del 15 al 22)"
"2"="Industrias extractivas, refino de petr�leo, industria qu�mica, farmaceutica, industria del caucho y materias pl�sticas, suministro energ�a el�ctrica, gas, vapor y aire acondicionado, suministro de agua, gesti�n de residuos. Metalurgia (c�digos CNAE-09: del 05 al 09, del 19 al 25, 35 y del 36 al 39), (c�digos CNAE-93: del 10 al 14, del 23 al 28, 40 y 41)"
"3"="Construcci�n de maquinaria, equipo el�ctrico y material de transporte. Instalaci�n y reparaci�n industrial (c�digos CNAE-09 del 26 al 33), (c�digos CNAE-93 del 29 al 37)"
"4"="Construcci�n(c�digos CNAE-09: del 41 al 43), (c�digo CNAE-93: 45)"
"5"="Comercio al por mayor y al por menor y sus instalaciones y reparaciones. Reparaci�n de autom�viles, hosteler�a (c�digos CNAE-09: del 45 al 47, 55 y 56), (c�digos CNAE-93: 50, 51, 52 y 55)"
"6"="Transporte y almacenamiento. Informaci�n y comunicaciones (c�digos CNAE-09 del 49 al 53 y del 58 al 63), (c�digos CNAE-93 del 60 al 64)"
"7"="Intermediaci�n financiera, seguros, actividades inmobiliarias, servicios profesionales, cient�ficos, administrativos y otros (c�digos CNAE-09: del 64 al 66, 68, del 69 al 75 y del 77 al 82), (c�digos CNAE-93 del 65 al 67 y del 70 al 74)"
"8"="Administraci�n P�blica, educaci�n y actividades sanitarias (c�digos CNAE-09: 84, 85 y del 86 al 88), (c�digos CNAE-93: 75, 80 y 85)"
"9"="Otros servicios(c�digos CNAE-09: del 90 al 93, del 94 al 96, 97y 99), (c�digos CNAE-93: del 90 al 93, 95 y 99)"
;
value $TSITUAC

"01"="Empresario con asalariados"
"03"="Trabajador independiente o empresario sin asalariados"
"05"="Miembro de una cooperativa"
"06"="Ayuda en la empresa o negocio familiar"
"07"="Asalariado sector p�blico"
"08"="Asalariado sector privado"
"09"="Otra situaci�n"
;
value $TADMTB

"1"="Administraci�n central"
"2"="Administraci�n de la Seguridad Social"
"3"="Administraci�n de Comunidad Aut�noma"
"4"="Administraci�n local"
"5"="Empresas p�blicas e Instituciones financieras p�blicas"
"6"="Otro tipo"
"0"="No sabe"
;
value $T1DUCON

"1"="Indefinido"
"6"="Temporal"
;
value $T2DUCON

"1"="Permanente"
"6"="Discontinuo"
;
value $T3DUCON

"01"="Eventual por circunstancias de la producci�n"
"02"="De formaci�n o aprendizaje"
"03"="Estacional o de temporada"
"04"="Cubre un per�odo de prueba"
"05"="Cubre la ausencia total o parcial de otro trabajador"
"06"="Para obra o servicio determinado"
"07"="Verbal no incluido en las opciones anteriores"
"08"="Otro tipo"
"09"="De pr�cticas (becarios, per�odos de pr�cticas, asistentes de investigaci�n, etc.)"
"00"="No sabe"
;
value $T1PARCO

"1"="Completa"
"6"="Parcial"
;
value $T2PARCO

"01"="Seguir cursos de ense�anza o formaci�n"
"02"="Enfermedad o incapacidad propia"
"03"="Responsabilidades de cuidado de hijos u otros familiares"
"04"="Otras razones familiares o personales"
"05"="No haber podido encontrar un trabajo de jornada completa"
"06"="No querer un trabajo de jornada completa"
"07"="Otras razones"
"00"="Desconoce el motivo"
;
value $TMASHOR

"1"="S�"
"2"="No, desear�a trabajar menos horas con reducci�n proporcional de salario"
"3"="No"
;
value $TRZNDIS

"1"="Tener que completar estudios o formaci�n"
"2"="Responsabilidades de cuidado de hijos u otros familiares"
"3"="Por enfermedad o incapacidad propia"
"4"="Por otras razones"
;
value $TRZNDSH

"01"="Tener que completar estudios o formaci�n"
"02"="Responsabilidades de cuidado de hijos u otros familiares"
"03"="Enfermedad o incapacidad propia"
"04"="Otras razones"
"05"="Por no poder dejar su empleo actual debido al periodo de preaviso"
;
value $TFOBACT

"1"="M�todos activos de b�squeda de empleo"
"6"="M�todos no activos de b�squeda de empleo"
;
value $TNBUSCA

"01"="No hay empleo adecuado disponible"
"02"="Est� afectado por una regulaci�n de empleo"
"03"="Por enfermedad o incapacidad propia"
"04"="Responsabilidades de cuidado de hijos u otros familiares"
"05"="Tiene otras responsabilidades familiares o personales"
"06"="Est� cursando estudios o recibiendo formaci�n"
"07"="Est� jubilado"
"08"="Otras razones"
"00"="No sabe"
;
value $TRZULT

"01"="Despido o supresi�n del puesto(incluye regulaci�n de empleo)"
"02"="Fin del contrato(incluye los fijos-discontinuos y los trabajos estacionales) s"
"03"="Enfermedad o incapacidad propia"
"04"="Realizar estudios o recibir formaci�n"
"05"="Responsabilidades de cuidado de hijos u otros familiares"
"06"="Otras razones familiares o personales"
"07"="Jubilaci�n anticipada"
"08"="Jubilaci�n normal"
"09"="Otras razones(incluye el cese en una actividad propia y por voluntad propia)"
"00"="No sabe"
;
value $TITBU

"01"="Menos de 1 mes"
"02"="De 1 a < 3 meses"
"03"="De 3 a < 6 meses"
"04"="De 6 meses a < 1 a�o"
"05"="De 1 a�o a < 1 a�o y medio"
"06"="De 1 a�o y medio a < 2 a�os"
"07"="De 2 a < 4 a�os"
"08"="4 a�os o m�s"
;
value $TOFEMP

"1"="Estaba inscrito como demandante y recib�a alg�n tipo de prestaci�n"
"2"="Estaba inscrito como demandante sin recibir subsidio o prestaci�n por desempleo"
"3"="No estaba inscrito como demandante"
"4"="No contesta / No sabe"
;
value $TSID

"01"="Estudiante (aunque est� de vacaciones)"
"02"="Percib�a una pensi�n de jubilaci�n o unos ingresos de prejubilaci�n"
"03"="Dedicado a las labores del hogar"
"04"="Incapacitado permanente"
"05"="Percibiendo una pensi�n distinta a la de jubilaci�n (o prejubilaci�n)"
"06"="Realizando sin remuneraci�n trabajos sociales, actividades ben�ficas�"
"07"="Otras situaciones"
"00"="No sabe / No refiere estado de inactividad"
;
value $TSIDAC

"1"="Trabajando"
"2"="Buscando empleo"
;
value $TAOI

"03"="Ocupados subempleados por insuficiencia de horas"
"04"="Resto de ocupados"
"05"="Parados que buscan primer empleo"
"06"="Parados que han trabajado antes"
"07"="Inactivos 1(desanimados)"
"08"="Inactivos 2(junto con los desanimados forman los activos potenciales)"
"09"="Inactivos 3(resto de inactivos)"
;

value $TCCAA

"01"="Andaluc�a"
"02"="Arag�n"
"03"="Asturias, Principado de"
"04"="Balears, Illes"
"05"="Canarias"
"06"="Cantabria"
"07"="Castilla y Le�n"
"08"="Castilla-La Mancha"
"09"="Catalu�a"
"10"="Comunitat Valenciana"
"11"="Extremadura"
"12"="Galicia"
"13"="Madrid, Comunidad de"
"14"="Murcia, Regi�n de"
"15"="Navarra, Comunidad Foral de"
"16"="Pa�s Vasco"
"17"="Rioja, La"
"51"="Ceuta"
"52"="Melilla"
;
value $TPROV

"01"="Araba/�lava"
"02"="Albacete"
"03"="Alicante/Alacant"
"04"="Almer�a"
"05"="�vila"
"06"="Badajoz"
"07"="Balears, Illes"
"08"="Barcelona"
"09"="Burgos"
"10"="C�ceres"
"11"="C�diz"
"12"="Castell�n /Castell�"
"13"="Ciudad Real"
"14"="C�rdoba"
"15"="Coru�a, A"
"16"="Cuenca"
"17"="Girona"
"18"="Granada"
"19"="Guadalajara"
"20"="Gipuzkoa"
"21"="Huelva"
"22"="Huesca"
"23"="Ja�n"
"24"="Le�n"
"25"="Lleida"
"26"="Rioja, La"
"27"="Lugo"
"28"="Madrid"
"29"="M�laga"
"30"="Murcia"
"31"="Navarra"
"32"="Ourense"
"33"="Asturias"
"34"="Palencia"
"35"="Palmas, Las"
"36"="Pontevedra"
"37"="Salamanca"
"38"="Santa Cruz de Tenerife"
"39"="Cantabria"
"40"="Segovia"
"41"="Sevilla"
"42"="Soria"
"43"="Tarragona"
"44"="Teruel"
"45"="Toledo"
"46"="Valencia/Val�ncia"
"47"="Valladolid"
"48"="Bizkaia"
"49"="Zamora"
"50"="Zaragoza"
"51"="Ceuta"
"52"="Melilla"
;
value $TREGNAP

"115"="UE- 15"
"125"="UE- 25 (no UE-15)"
"128"="UE- 28 (no UE-27)"
"100"="Resto de Europa"
"200"="�frica"
"300"="Am�rica del Norte"
"310"="Centroam�rica y Caribe"
"350"="Sudam�rica"
"400"="Asia Oriental (Lejano Oriente)"
"410"="Asia Occidental (Oriente Pr�ximo)"
"420"="Asia del Sur y Sudoeste"
"500"="Ocean�a"
"999"="Ap�tridas"
;
value $TREGNA

"115"="UE- 15"
"125"="UE- 25 (no UE-15)"
"128"="UE- 28 (no UE-27)"
"100"="Resto de Europa"
"200"="�frica"
"300"="Am�rica del Norte"
"310"="Centroam�rica y Caribe"
"350"="Sudam�rica"
"400"="Asia Oriental (Lejano Oriente)"
"410"="Asia Occidental (Oriente Pr�ximo)"
"420"="Asia del Sur y Sudoeste"
"500"="Ocean�a"
;
value $TREGEST

"115"="UE- 15 (Excepto Francia y Portugal)"
"125"="UE- 25 (no UE-15)"
"128"="UE- 28 (no UE-27)"
"100"="Resto de Europa (Excepto Andorra)"
"200"="�frica (Excepto Marruecos)"
"300"="Am�rica del Norte"
"310"="Centroam�rica y Caribe"
"350"="Sudam�rica"
"400"="Asia Oriental (Lejano Oriente)"
"410"="Asia Occidental (Oriente Pr�ximo)"
"420"="Asia del Sur y Sudoeste"
"500"="Ocean�a"
"600"="Portugal"
"610"="Francia"
"620"="Andorra"
"630"="Marruecos"
;
value N_EDEST

00="No sabe la fecha en la que alcanz� el m�ximo nivel de estudios"
;
value $T_ORDEN

"00"="No tiene o no reside en la vivienda"
;
value N_ANORE

00="Menos de un a�o en Espa�a"
;
value $T_2HORA

"99"="No puede precisar /No recuerda"
;
value $T_CONTM

"96"="96 meses o m�s"
"00"="Desconoce la respuesta pero es al menos un mes"
;
value $T_CONTD

"99"="No sabe"
"00"="Desconoce la respuesta pero es menos de un mes"
;
value $THORAS

"9999"="No puede precisar /No sabe"
;
value $THORASE

"9999"="No puede precisar /No sabe"
"0000"="No trabaj� durante la semana de referencia"
;
value $TEXTRAO

"9999"="No puede precisar /No sabe"
"0000"="No hizo horas extra durante la semana de referencia"
;
value N_2DIAS

99="No sabe d�as de ausencia"
;
value $T_CICLO

"194"="2021T1"
"195"="2021T2"
"196"="2021T3"
"197"="2021T4"
"198"="2022T1"
"199"="2022T2"
"200"="2022T3"
"201"="2022T4"
"202"="2023T1"
"203"="2023T2"
"204"="2023T3"
"205"="2023T4"
"206"="2024T1"
"207"="2024T2"
"208"="2024T3"
"209"="2024T4"
"210"="2025T1"
"211"="2025T2"
"212"="2025T3"
"213"="2025T4"
"214"="2026T1"
"215"="2026T2"
"216"="2026T3"
"217"="2026T4"
"218"="2027T1"
"219"="2027T2"
"220"="2027T3"
"221"="2027T4"
"222"="2028T1"
"223"="2028T2"
"224"="2028T3"
"225"="2028T4"
"226"="2029T1"
"227"="2029T2"
"228"="2029T3"
"229"="2029T4"
"230"="2030T1"
"231"="2030T2"
"232"="2030T3"
"233"="2030T4"
"234"="2031T1"
"235"="2031T2"
"236"="2031T3"
"237"="2031T4"
"238"="2032T1"
"239"="2032T2"
"240"="2032T3"
"241"="2032T4"
"242"="2033T1"
"243"="2033T2"
"244"="2033T3"
"245"="2033T4"
"246"="2034T1"
"247"="2034T2"
"248"="2034T3"
"249"="2034T4"
"250"="2035T1"
"251"="2035T2"
"252"="2035T3"
"253"="2035T4"
"254"="2036T1"
"255"="2036T2"
"256"="2036T3"
"257"="2036T4"
"258"="2037T1"
"259"="2037T2"
"260"="2037T3"
"261"="2037T4"
"262"="2038T1"
"263"="2038T2"
"264"="2038T3"
"265"="2038T4"
"266"="2039T1"
"267"="2039T2"
"268"="2039T3"
"269"="2039T4"
"270"="2040T1"
"271"="2040T2"
"272"="2040T3"
"273"="2040T4"
"274"="2041T1"
"275"="2041T2"
"276"="2041T3"
"277"="2041T4"
"278"="2042T1"
"279"="2042T2"
"280"="2042T3"
"281"="2042T4"
"282"="2043T1"
"283"="2043T2"
"284"="2043T3"
"285"="2043T4"
"286"="2044T1"
"287"="2044T2"
"288"="2044T3"
"289"="2044T4"
"290"="2045T1"
"291"="2045T2"
"292"="2045T3"
"293"="2045T4"
"294"="2046T1"
"295"="2046T2"
"296"="2046T3"
"297"="2046T4"
"298"="2047T1"
"299"="2047T2"
"300"="2047T3"
"301"="2047T4"
"302"="2048T1"
"303"="2048T2"
"304"="2048T3"
"305"="2048T4"
"306"="2049T1"
"307"="2049T2"
"308"="2049T3"
"309"="2049T4"
"310"="2050T1"
"311"="2050T2"
"312"="2050T3"
"313"="2050T4"
;





* 3) VINCULAR FORMATOS A LA BASE DE DATOS;

	DATA ROutput.&siglas_periodo.&conFormato;
		set ROutput.&siglas_periodo;

FORMAT CICLO $T_CICLO.;
FORMAT CCAA $TCCAA.;
FORMAT PROV $TPROV.;
FORMAT NIVEL $TNIVEL.;
FORMAT EDAD1 $T5EDAD.;
FORMAT RELPP1 $TRELPP.;
FORMAT SEXO1 $TSEXO.;
FORMAT NCONY $T_ORDEN.;
FORMAT NPADRE $T_ORDEN.;
FORMAT NMADRE $T_ORDEN.;
FORMAT ECIV1 $TECIV.;
FORMAT PRONA1 $TPROV.;
FORMAT REGNA1 $TREGNA.;
FORMAT NAC1 $TNACIO.;
FORMAT EXREGNA1 $TREGNAP.;
FORMAT ANORE1 N_ANORE.;
FORMAT NFORMA $TNFORMA.;
FORMAT EDADEST N_EDEST.;
FORMAT CURSR $TCURSR.;
FORMAT NCURSR $TNCURSR.;
FORMAT CURSNR $TCURSR.;
FORMAT OBJFORM $TOBJNR.;
FORMAT TRAREM $TSINO.;
FORMAT AYUDFA $TSINO.;
FORMAT AUSENT $TSINO.;
FORMAT RZNOTB $TRZNOTB.;
FORMAT VINCUL $TVINCUL.;
FORMAT NUEVEM $TNUEVEM.;
FORMAT OCUP1 $TOCUP.;
FORMAT ACT1 $TACTIV.;
FORMAT SITU $TSITUAC.;
FORMAT SP $TADMTB.;
FORMAT DUCON1 $T1DUCON.;
FORMAT DUCON2 $T2DUCON.;
FORMAT DUCON3 $T3DUCON.;
FORMAT TCONTM $T_CONTM.;
FORMAT TCONTD $T_CONTD.;
FORMAT PROEST $TPROV.;
FORMAT REGEST $TREGEST.;
FORMAT PARCO1 $T1PARCO.;
FORMAT PARCO2 $T2PARCO.;
FORMAT HORASP $THORAS.;
FORMAT HORASH $THORAS.;
FORMAT HORASE $THORASE.;
FORMAT EXTRA $TSINO.;
FORMAT EXTPAG $TEXTRAO.;
FORMAT EXTNPG $TEXTRAO.;
FORMAT TRAPLU $TSINO.;
FORMAT OCUPLU1 $TOCUP.;
FORMAT ACTPLU1 $TACTIV.;
FORMAT SITPLU $TSITUAC.;
FORMAT HORPLU $THORASE.;
FORMAT MASHOR $TMASHOR.;
FORMAT DISMAS $TSINO.;
FORMAT RZNDISH $TRZNDSH.;
FORMAT HORDES $T_2HORA.;
FORMAT BUSOTR $TSINO.;
FORMAT BUSCA $TSINO.;
FORMAT DESEA $TSINO.;
FORMAT FOBACT $TFOBACT.;
FORMAT NBUSCA $TNBUSCA.;
FORMAT RZULT $TRZULT.;
FORMAT ITBU $TITBU.;
FORMAT DISP $TSINO.;
FORMAT RZNDIS $TRZNDIS.;
FORMAT EMPANT $TSINO.;
FORMAT OCUPA $TOCUP.;
FORMAT ACTA $TACTIV.;
FORMAT SITUA $TSITUAC.;
FORMAT OFEMP $TOFEMP.;
FORMAT SIDI1 $TSID.;
FORMAT SIDI2 $TSID.;
FORMAT SIDI3 $TSID.;
FORMAT SIDAC1 $TSIDAC.;
FORMAT SIDAC2 $TSIDAC.;
FORMAT DAUSVAC N_2DIAS.;
FORMAT DAUSENF N_2DIAS.;
FORMAT DAUSOTR N_2DIAS.;
FORMAT TRAANT $TSINONS.;
FORMAT AOI $TAOI.;


RUN;
/* FIN PROGRAMA: Microdatos en SAS: siglas_periodo.sas*/
