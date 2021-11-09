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

## Seleccionar linea✂️
En esta opcion podremos seleccionar una linea de nuestro archivo para borrar solo un dispositivo guardado anteriormente para entrar en ella le daremos al **1** y le daremos al **ENTER**
```bash
[+] ¿Quiere borrar seleccionar linea, TODO, Copias o Salir? [1/2/3/4]
1) Seleccionar linea
2) TODOS
3) Copias
4) Salir
#? 1
```

## TODOS
En esta opcion borraremos **TODOS** los dispositivos guardados anteriormente

## Copias📄
En esta opcion podremos crear una copia de seguridad de nuestros dispositivos Guardos anteriormente

## Autores ✒️
- Alvar Yoel Ordoñez Gamez
