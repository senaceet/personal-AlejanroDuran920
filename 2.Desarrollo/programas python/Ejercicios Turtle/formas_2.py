import turtle

windown = turtle.Screen()
windown.bgcolor('black')
#Cuadrado
t=turtle.Turtle()
t.fillcolor('blue')
t.shape('turtle')
t.begin_fill()
t.color('blue')
for i in range (4):
    t.forward(100)
    t.right(90)
t.end_fill()

t.up()
t.right(180)
t.forward(200)
t.down()

#Rectangulo
t.begin_fill()
t.color('red')
t.pensize('12')
t.right(90)
t.forward(50)
t.right(90)
t.forward(100)
t.right(90)
t.forward(50)
t.right(90)
t.forward(100)
t.end_fill()

t.up()
t.right(120)
t.forward(100)
t.right(60)
t.forward(150)
t.down()

#Pentagono
t.begin_fill()
t.color('green')
t.pensize('10')
t.forward(100)
t.left(72)
t.forward(100)
t.left(72)
t.forward(100)
t.left(72)
t.forward(100)
t.left(72)
t.forward(100)
t.end_fill()

t.up()
t.left(72)
t.forward(300)
t.right(90)
t.forward(80)
t.right(90)
t.forward(50)
t.down()
#Rombo
t.begin_fill()
t.color('yellow')
t.pensize('10')
t.right(300)
t.forward(100)
t.left(240)
t.forward(100)
t.right(60)
t.forward(100)
t.right(120)
t.forward(100)
t.end_fill()


turtle.mainloop()


