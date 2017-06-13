import time
import serial
import numpy as np
import stl, math
from stl import mesh
import matplotlib.pyplot as plt
from scipy.spatial import ConvexHull

print('Formato de salida: ')
print('signo, pasos en X, factor de X, signo, pasos en Y, factor de Y')
com = input('Ingrese el Puerto Serial: ')
nombre = input('Ingrese el nombre sel archivo: ')

def escalado(puntos):
	escalados = []
	# escalado a centimetros 21cmX29cm
	A4X = 21 - 2 
	A4Y = 29 - 2
	MaximoX = max(puntos[:,0])
	MinimoX = min(puntos[:,0])
	MaximoY = max(puntos[:,1])
	MinimoY = min(puntos[:,1]) 
	factorX = (abs(MaximoX) + abs(MinimoX))/A4X
	factorY = (abs(MaximoY) + abs(MinimoY))/A4Y
	deltaX = A4X - (MaximoX/factorX)
	deltaY = A4Y - (MaximoY/factorY)
	for i in puntos:
		x = i[0]
		y = i[1]
		x = int((x/factorX) + deltaX + 1)
		y = int((y/factorY) + deltaY + 1)
		if [x, y] not in escalados:
			escalados.append([x, y])
	return np.array(escalados)

def distance(a,b):
	if a == b:
		return 100000000
	return math.sqrt( (a[0] - b[0])**2 + (a[1] - b[1])**2)

def generar(escalados):
	mueva = []
	x = 0
	y = 0
	for punto in escalados:
		my_x = punto[0] - x
		my_y = punto[1] - y
		x = punto[0]
		y = punto[1]
		mueva.append([my_x, my_y])
	return mueva

def factor(punto):
	x = abs(punto[0])
	y = abs(punto[1])
	if x == 0:
		return 0, y
	if y == 0:
		return x, 0
	if x > y:
		r = int(round(x/y))
		return r, 1
	if x == y:
		return 1, 1
	r = int(round(y/x))
	return 1, r

obj = mesh.Mesh.from_file(nombre)

points = set()
for p in obj.points:
    if (p[2] and p[5] and p[8]) <= 0:
        points.add((p[0],p[1]))
        points.add((p[3],p[4]))
        points.add((p[6],p[7]))

points = [list(p) for p in points]
points.sort()
print('Puntos de la base:', len(points))

my_points = []
my_points.append(points[0])
for punto in my_points: 
	origen = punto
	dist = 999999999999999999
	respuesta = -1

	for j in points:
		if(j not in my_points):
			destino = j
			d = distance(origen,destino)
			if d < dist:
				dist = d
				respuesta = j

	if respuesta == -1:
		break

	my_points.append(respuesta)

#my_points.append(points[0])
my_points = np.array(my_points)
my_points = escalado(my_points)
enviar = generar(my_points)
print("Datos a enviar:", len(enviar))

ser = serial.Serial(
    port=com,
    baudrate=9600,
    parity=serial.PARITY_ODD,
    stopbits=serial.STOPBITS_TWO,
    bytesize=serial.EIGHTBITS,
    timeout=10
)

#ser.open()
ser.isOpen()
index = 0
inpx = 1
inpy = 1
print('Inicia transmicion')
while 1 :
    # get keyboard input
    #input = raw_input(">> ")
    # Python 3 users
    j = 0
    if index < len(enviar):
    	j = 1
    	mi_factX, mi_factY = factor(enviar[index])
    	enviarx = [0 if enviar[index][0] >= 0 else 1, abs(enviar[index][0]), mi_factX]
    	enviary = [0 if enviar[index][1] >= 0 else 1, abs(enviar[index][1]), mi_factY]
    	inpx = bytes(enviarx)
    	inpy = bytes(enviary)
    if j == 0:
        ser.close()
        print('Finaliza transmicion')
        break
    else:
    	'''while ser.inWaiting() > 0:
            print(ser.read())
    	time.sleep(1)
    	print("hasta aca")'''
    	ser.write(inpx)
    	time.sleep(0.25)
    	ser.write(inpy)
    	time.sleep(0.25)
    	index += 1

plt.figure()
plt.title('Resultado')
plt.plot(my_points[:,0], my_points[:,1], 'r-')
plt.show()
print('... cerrando SW')