print("bienvenido")
print("ingrese su numero a convertir ")
a=int(input(""))
print("didite 1 si quiere metros")
print("digite 2 si quiere kilometros")
print("digite 3 si quiere milimetros")
opcion=int(input(""))
if opcion == 1:
    print("metros")
    c=a*1/100
    print("los metros son: ",c)
elif opcion == 2:
    print("kilometros")
    k=(a*1/100)*(1/1000)
    print("lo kilometros son: ",k)
elif opcion == 3:
    print("milimetros")
    m=a*10/1
    print("los milimetros son: ",m)
    
    