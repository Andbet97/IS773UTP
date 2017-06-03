import serial
import numpy as np
import stl, math
from stl import mesh
import matplotlib.pyplot as plt
from scipy.spatial import ConvexHull

obj = mesh.Mesh.from_file('star.stl')

points = set()
for p in obj.points:
    if (p[2] and p[5] and p[8]) <= 0:
        points.add((p[0],p[1]))
        points.add((p[3],p[4]))
        points.add((p[6],p[7]))

points = [list(p) for p in points]
points.sort()

def distance(a,b):
	if a == b:
		return 1000
	return math.sqrt( (a[0] - b[0])**2 + (a[1] - b[1])**2)

Distancias = [[distance(p, q) for q in points] for p in points]

my_points = []
my_points.append(points[0])
for i in my_points:
	if len(points) == 1:
		break
	j = points.index(i)
	minimo = min(Distancias[j])
	index = Distancias[j].index(minimo)
	my_points.append(points[index])
	Distancias.remove(Distancias[j])
	for k in range(len(Distancias)):
		Distancias[k].remove(Distancias[k][j])
	points.remove(points[j])

my_points.append(points[0])
my_points.append(my_points[0])
my_points = np.array(my_points)


ser = serial.Serial(
    port='COM1',
    baudrate=9600,
    parity=serial.PARITY_ODD,
    stopbits=serial.STOPBITS_TWO,
    bytesize=serial.SEVENBITS
)

ser.isOpen()
x_min = min(my_points[:,0])
x_max = max(my_points[:,0])
scale = (abs(x_min)+abs(x_max))/240
prueba = []
index = 0
inp = 1
while 1 :
    j = 0
    if index < len(my_points):
        j = 1
        inp = str([int(my_points[index][0]*scale),  int(my_points[index][1]*scale)])
        prueba.append([int(my_points[index][0]*scale),  int(my_points[index][1]*scale)])
    if j == 0:
        ser.close()
        break
    else:
        inp += '\r\n'
        ser.write(inp.encode() )
        out = ''
        while ser.inWaiting() > 0:
            out += ser.read(1)
        index += 1
prueba = np.array(prueba)
plt.figure()
plt.plot(my_points[:,0], my_points[:,1], 'r-')
plt.show()
