# delusb
Este script diseñado en *bash*, sirve para borrar los dispositivos guardados anteriormente con addusb

## Despliegue 🔧
Lo primero que tendremos que hacer es **clonar el repositorio** a nuestra maquina

```bash 
linux@home/linux/:~$ git clone https://github.com/Alvar-Yoel/delusb
```

Cuando lo tengamos clonado **entraremos** en el repositorio ya clonado previamente

```bash
linux@home/linux/:~$ cd delusb
```

Ahora dentro de la carpeta le daremos permisos de **ejecucion** al script

```bash 
linux@home/linux/delusb:~$ chmod +x delusb.sh
```

## Uso🛠️
Ahora cuando le hayamos asignado los permisos de ejecucion lo **ejecutaremos**
```bash
linux@home/linux/delusb:~$ ./delusb
```

Ahora nos saldran 3 opciones
```bash
[+] ¿Quiere borrar seleccionar linea, TODO, Copias o Salir? [1/2/3/4]
1) Seleccionar linea
2) TODOS
3) Copias
4) Salir
#?
```
***Nota:*** las opciones van por numeros no podremos poner ~~Seleccionar linea, TODOS, Copias y Salir ~~

## Seleccionar linea✂️―
En esta opcion podremos _seleccionar una linea_ de nuestro archivo para borrar solo un dispositivo guardado anteriormente para entrar en ella le daremos al **1** y le daremos al **ENTER**
```bash
[+] ¿Quiere borrar seleccionar linea, TODO, Copias o Salir? [1/2/3/4]
1) Seleccionar linea
2) TODOS
3) Copias
4) Salir
#? 1
```

Ahora nos abrira los dispositivos guardados y pondremos el numero de linea a borrar

## TODOS❌
En esta opcion borraremos **TODOS** los dispositivos guardados anteriormente para seleccionarla pondremos **2** y le daremos al **ENTER**
```bash
[+] ¿Quiere borrar seleccionar linea, TODO, Copias o Salir? [1/2/3/4]
1) Seleccionar linea
2) TODOS
3) Copias
4) Salir
#? 2
```

Esperaremos unos segundos y ya tendremos los dispositivos borrados

## Copias📄
En esta opcion podremos crear una _copia de seguridad_ de nuestros dispositivos Guardos anteriormente para seleccionarla pondremos **3** y le daremos al **ENTER**
```bash
[+] ¿Quiere borrar seleccionar linea, TODO, Copias o Salir? [1/2/3/4]
1) Seleccionar linea
2) TODOS
3) Copias
4) Salir
#? 3
```

Ahora nos dara la opcion de _Hacer una copia de seguridad_ o _Restaurar una copia de seguridad_ 
```bash
[+] Acabas de entrar a Copias de Seguridad, me tienes que decir si quieres Hacer copia de seguridad o Volver a una copia del archivo /etc/udev/rules.d/99-usb-serial.rules
1) Hacer copia de seguridad
2) Restaurar copia de seguridad
3) Salir
#?
```

## Autores ✒️
- Alvar Yoel Ordoñez Gamez
