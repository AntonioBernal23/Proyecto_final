let materiaSeleccionada = null;
let filaSeleccionada = null;

function seleccionarFila(fila, id, nombre, codigo, descripcion, dia, hora) {
    // Quitar la selección de la fila anterior
    if (filaSeleccionada) {
        filaSeleccionada.classList.remove("seleccionada");
    }

    // Asignar la nueva fila seleccionada
    filaSeleccionada = fila;
    filaSeleccionada.classList.add("seleccionada");

    // Guardar los datos de la materia seleccionada
    materiaSeleccionada = { id, nombre, codigo, descripcion, dia, hora };

    // Mostrar botones
    document.getElementById("btnActualizar").style.display = "block";
    document.getElementById("btnCancelar").style.display = "block";
}

function agregarMateria() {
    let url = "/vista/formularios/agregarMateria.jsp";
    
    // Abre una nueva ventana con el formulario de agregar materia
    window.open(url, "_blank", "width=600,height=400,resizable=yes,scrollbars=yes");
}

function actualizarMateria() {
    if (materiaSeleccionada) {
        let url = "/vista/formularios/actualizarMateria.jsp?id=" + materiaSeleccionada.id +
                "&nombre=" + encodeURIComponent(materiaSeleccionada.nombre) +
                "&codigo=" + encodeURIComponent(materiaSeleccionada.codigo) +
                "&descripcion=" + encodeURIComponent(materiaSeleccionada.descripcion) +
                "&dia=" + encodeURIComponent(materiaSeleccionada.dia) +
                "&hora=" + encodeURIComponent(materiaSeleccionada.hora);

        window.open(url, "_blank", "width=600,height=400,resizable=yes,scrollbars=yes");
    }
}

function cancelarSeleccion() {
    // Ocultar botones
    document.getElementById("btnActualizar").style.display = "none";
    document.getElementById("btnCancelar").style.display = "none";

    // Remover la selección de la fila
    if (filaSeleccionada) {
        filaSeleccionada.classList.remove("seleccionada");
    }

    // Resetear variables
    materiaSeleccionada = null;
    filaSeleccionada = null;
}
