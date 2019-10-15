print("1 Area triangulo")
print("2 Area rectangulo")
print("3 Area cuadrado")
print("4 Area circulo")
print("5 losango")
print("6  area trapezio")
x = int(input(""))

if  (x == 1):
    b = float(input("ingrese base del triangulo"))
    a = float(input("Ingrese alto del triangulo"))
    area = (b*a)/2
    print("El resultado es: ", area)

elif x == 2:
    print("Area del rectangulo")
    b = float(input("digite la base"))
    h = float(input("digite la altura"))
    op = b*h
    print("El area del rectangulo es: ",op)

elif x == 3:
    print("Area del cuadrado")
    l = int(input("Digite el lado del cuadrado"))
    op = (l**2)
    print("El area de su cuadrado es: ",op)

elif x == 4:
    print("Area del circulo")
    pi = 3.14
    r = float((input("digite el radio ")))
    op= pi*r**2
    print("El area del circulo es: ",op)

elif x == 5:
    print("Area del losango")
    dm= float(input("DIgite el diagonal mayor"))
    dme= float(input("digite el diagonal menor "))
    op= dm*dme/2
    print("El area del losango es: ", op)
    
elif x == 6:
    print("Area del trapezio")
    bm= float(input("digite la base mayor"))
    bme= float(input("digite la base menor"))
    h = float(input("digite la altura"))
    op = (bm+bme)*h/2
    print("El area es: ",op)