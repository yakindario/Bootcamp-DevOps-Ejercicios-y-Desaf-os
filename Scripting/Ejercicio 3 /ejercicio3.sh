#!/bin/bash - 

TASK_FILE="tasks.txt"

# Agregar_tarea: Esta función se utiliza para agregar una tarea al script.
Agregar_tarea(){
  echo -n "Ingresar una tarea: "
  read description 
  echo -n "Ingrese la fecha de vencimiento  (formato YYYY-MM-DD):"
  read fecha
  tarea_id=$(date +%s)
  echo "$tarea_id|$description|$fecha" >> "$TASK_FILE"
  echo "Tarea indetificado con exito, identificar de tarea: $tarea_id"
}

# Función para listar una tarea
Listar_tarea(){
  echo "Tareas pendientes: "
  while IFS="|" read -r id desc fecha; do
    echo "ID: $id | Descripcion: $desc | Fecha de vencimeinto $fecha"
  done < "$TASK_FILE"
}

# Marcar_tarea: Esta función se utiliza para marcar una tarea como completada.
Marcar_tarea(){
  echo -n "Ingresar el indetificador de la tarea a marcar como completada: "
  read tarea_id
  sed -i "/^$tarea_id/d" "$TASK_FILE"
  echo "tareas Marcar como completada"
}

# Eliminar_tarea: Esta función se utiliza para eliminar una tarea.
Eliminar_tarea(){
  echo -n "Ingrese el identificador de la tarea a eliminar: "
  read tarea_id
  sed -i "/^$tarea_id/d" "$TASK_FILE"
  echo "Tarea eliminada con exito" 
}

# Main
while true; do
  echo "**** sistema de gestion de tarea *** "
  echo "1. Agregar una tarea"
  echo "2. Listar tarea"
  echo "3. Marcar tarea como completada "
  echo "4. Eliminar tarea"
  echo "5. Salir"
  echo -n "seleccione una opcion: "
  read opcion

  case "$opcion" in 
    1) Agregar_tarea;;
    2) Listar_tarea;;
    3) Marcar_tarea;;
    4) Eliminar_tarea;;
    5) echo "Hasta Luego!!"; exit;;
    *) echo "Opcion invalida, Intente nuevamente.";;

  esac
done
