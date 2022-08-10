Facultad de Cs. Exactas, Ingenieria Y Agrimensura

Tecnicatura Universitaria en Inteligencia Artifical

Trabajo Practico de Entornos de Programacion

Bash Scripting

DOCENTES

- Gustavo Bocchio
- Andrea León Cavallo
- Damían Marotte

ALUMNO: Juan Wagner

COMISION: 2

### Ejecucion

```bash
docker run --rm -it wgnr/edp
```

### Scripts
| #   | Command                                               | Descripcion                                                                                                                                                                                                                                                                                   |
| --- | ----------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | [`statsWords`](./scripts/statsWords.sh)               | Indicador estadístico de longitud de palabras (la más corta, la más larga y el promedio de longitud).                                                                                                                                                                                         |
| 2   | [`statsUsageWords`](./scripts/statsUsageWords.sh)     | Indicador estadístico de uso de palabras, deben ser de al menos 4(cuatro) letras. (mostrar un Top Ten de estas palabras ordenadas desde la que tiene más apariciones a la que tiene menos). Es decir, filtrar las palabras que tengan al menos 4 letras y de éstas, elegir las 10 más usadas. |
| 3   | [`findNames`](./scripts/findNames.sh)                 | Identificación de nombres propios (se identifican sólo si están en este formato Nnnnnnnnn), aunque la palabra no sea un nombre propio realmente. Ejemplos: Mateo, Estonoesunnombre, Ana.                                                                                                      |
| 4   | [`statsSentences`](./scripts/statsSentences.sh)       | Indicador estadístico de longitud de oraciones (la más corta, la más larga y el promedio de longitud).                                                                                                                                                                                        |
| 5   | [`blankLinesCounter`](./scripts/blankLinesCounter.sh) | Contador de líneas en blanco.                                                                                                                                                                                                                                                                 |
| 6   | [`caseConverter.sh`](./scripts/caseConverter.sh)      | Invertir minúsculas a mayúsculas, y viceversa, de todas las palabras.                                                                                                                                                                                                                         |
