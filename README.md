# Trabajo Práctico de Entornos de Programación

#### Universidad Nacional de Rosario

### Facultad de Cs. Exactas, Ingeniería Y Agrimensura

## Tecnicatura Universitaria en Inteligencia Artifical

DOCENTES:

- Gustavo Bocchio
- Andrea León Cavallo
- Damían Marotte

ALUMNO: Juan Wagner

COMISIÓN: 2

# Bash Scripting

El enunciado completo del trabajo práctico puede encontrarse en el archivo [2022-EntornoProgramacion-TP_FINAL.pdf](./2022-EntornoProgramacion-TP_FINAL.pdf) includo en el repositorio.

Se solicita pueda mostrarse dentro de un contenedor un menú de opciones con el cuál se puedan aplicar ciertas manipulaciones a un texto de entrada mediante scripts.

Para probar estos [scripts](#scripts), se dispone de un texto ficticio [lorem_ipsum.txt](./lorem_ipsum.txt) en el punto de entrada del contenedor y es utilizado por defecto en caso de no especificarse.

### Ejecución

Simplemente ejecutar el siguiente comando:

```bash
docker run --rm -it wgnr/edp
```

Docker tomará la imágen del repositorio de imágenes Docker Hub y correra el comando por defecto `bash /app/main.sh`.

Se mostrará en terminal el siguiente menú de opciones donde ingresaremos el número del script a ejecutar o `0` para salir.

```text
Scripts disponibles:
1) blankLinesCounter.sh  4) statsSentences.sh     7) substringReplace.sh
2) caseConverter.sh      5) statsUsageWords.sh
3) findNames.sh          6) statsWords.sh
Seleccione el script a ejecutar (0 Salir) [1-7]>
```

Seleccionamos alguna opcion disponible y a continuación se nos solicitará que especifiquemos el archivo a procesar. De no ingresar nada se utilizará el archivo [lorem_ipsum.txt](./lorem_ipsum.txt) por defecto.

```text
Ingrese el archivo a procesar [./lorem_ipsum.txt]:
```

Por último, el nombre del script seleccionado es mostrado, junto a su descripcion y el resultado del mismo.

Ejemplo script _4) statsSentences.sh_

```text
Seleccione el script a ejecutar (0 Salir) [1-7]> 4
Ingrese el archivo a procesar [./lorem_ipsum.txt]:
statsSentences.sh

 Indicador estadístico de longitud de oraciones (la más corta, la más larga y el
 promedio de longitud).

La linea 3 es la mas larga con 752 caracteres
La linea 9 es la mas corta (no vacia) con 477 caracteres
En promedio cada linea tiene una longitud de 616.2 caractes (incluye lineas en blanco)
```

#### Otros casos de uso

**Procesar otros archivos de texto**

En caso de querer probar los [scripts](#scripts) con un archivo de texto en particular, este puede ser pasado al contenedor ejecutando el siguiente comando.
Todo archivo de extension `txt` ubicado en el directorio donde se ejecutó el comando estará disponible en la ruta `/tmp` del contenedor.

```bash
# ⚠️ CUIDADO!! CUALQUIER MODIFICACIÓN A ESTOS ARCHIVOS SERÁ PERSISTIDA EN SU SISTEMA ⚠️
docker run --rm -v "$PWD/*.txt":"/tmp" -it wgnr/edp
```

Luego cuando el prompt solicite el archivo ingresaremos la ruta al mismo.

```text
Ingrese el archivo a procesar [./lorem_ipsum.txt]: /tmp/mi_archivo.txt
```

**Ejecutar los scripts sin el menú**

Para correr un script en forma manual en lugar de utilizar el menú, se puede acceder usando `bash`.

```bash
# $
docker run --rm -it wgnr/edp bash
# root@contenedor bash-5.1#
./scripts/blankLinesCounter.sh lorem_ipsum.txt
```

### Scripts

Los mismos pueden encontrarse dentro de la carpeta [`scripts`](./scripts).

Todos éstos toman como primer argumento el _archivo de texto_ a procesar.

| #   | Command                                                | Descripcion                                                                                                                                                                                                                                                                                                                                |
| --- | ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1   | [`statsWords`](./scripts/statsWords.sh)                | Indicador estadístico de longitud de palabras (la más corta, la más larga y el promedio de longitud).                                                                                                                                                                                                                                      |
| 2   | [`statsUsageWords`](./scripts/statsUsageWords.sh)      | Indicador estadístico de uso de palabras, deben ser de al menos 4(cuatro) letras. (mostrar un Top Ten de estas palabras ordenadas desde la que tiene más apariciones a la que tiene menos). Es decir, filtrar las palabras que tengan al menos 4 letras y de éstas, elegir las 10 más usadas.                                              |
| 3   | [`findNames`](./scripts/findNames.sh)                  | Identificación de nombres propios (se identifican sólo si están en este formato Nnnnnnnnn), aunque la palabra no sea un nombre propio realmente.<br/>Ejemplos:<br/>Mateo, Estonoesunnombre, Ana.                                                                                                                                           |
| 4   | [`statsSentences`](./scripts/statsSentences.sh)        | Indicador estadístico de longitud de oraciones (la más corta, la más larga y el promedio de longitud).                                                                                                                                                                                                                                     |
| 5   | [`blankLinesCounter`](./scripts/blankLinesCounter.sh)  | Contador de líneas en blanco.                                                                                                                                                                                                                                                                                                              |
| 6   | [`caseConverter.sh`](./scripts/caseConverter.sh)       | Invertir minúsculas a mayúsculas, y viceversa, de todas las palabras.                                                                                                                                                                                                                                                                      |
| 7   | [`substringReplace.sh`](./scripts/substringReplace.sh) | Reemplazo de subcadenas, que considere diferencias entre minúsculas y mayúsculas, pero ignore acentos.<br/>Recibe dos cadenas, y cada aparición de cadena1 debe reemplazarse por la cadena2.<br/>Ejemplo:<br/>cadena1: tre cadena2: TRE<br/>las palabras: enTrepiso, entretenido, intrépido<br/>pasan a: enTrepiso, enTREtenido, inTREpido |
