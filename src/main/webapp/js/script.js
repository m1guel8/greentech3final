// Obtener referencias a los botones
const btnAnterior = document.getElementById("btn-anterior");
const btnSiguiente = document.getElementById("btn-siguiente");
const labelPeriodo = document.getElementById("semana-label");

// Función para generar datos según tipo
const generarDatos = (tipo, offset) => {
  if (tipo === "semanal") return Array.from({length: 7}, () => Math.floor(Math.random() * 20) + 5);
  if (tipo === "mensual") return Array.from({length: 4}, () => Math.floor(Math.random() * 120) + 50);
  return Array.from({length: 12}, () => Math.floor(Math.random() * 500) + 300);
};

// Labels por tipo
const labels = {
  semanal: ["Lun","Mar","Mié","Jue","Vie","Sáb","Dom"],
  mensual: ["Semana 1","Semana 2","Semana 3","Semana 4"],
  anual: ["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"]
};

// Inicializamos gráfico
const ctx = document.getElementById('chartBasura').getContext('2d');
let chart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: labels.semanal,
    datasets: [{
      label: 'Kilos de basura recolectados',
      data: generarDatos("semanal", 0),
      backgroundColor: 'rgba(46,139,87,0.7)',
      borderColor: 'rgba(46,139,87,1)',
      borderWidth: 1
    }]
  },
  options: {
    responsive: true,
    scales: {
      y: { beginAtZero: true, title: { display: true, text: 'Kilos' } },
      x: { title: { display: true, text: 'Tiempo' } }
    }
  }
});

// Variables de estado
let offset = 0;
let vistaActual = "semanal";

// Cambiar vista
function cambiarVista(tipo) {
  vistaActual = tipo;
  offset = 0;
  chart.data.labels = labels[tipo];
  chart.data.datasets[0].data = generarDatos(tipo, offset);
  chart.update();
  actualizarLabel();
  actualizarBotones();
}

// Funciones para rango
function getRangoSemana(offset) {
  const hoy = new Date();
  const dia = hoy.getDay();
  const diff = (dia === 0 ? -6 : 1) - dia;
  const lunes = new Date(hoy);
  lunes.setDate(hoy.getDate() + diff + offset * 7);
  const domingo = new Date(lunes);
  domingo.setDate(lunes.getDate() + 6);
  return { inicio: lunes.toLocaleDateString("es-AR"), fin: domingo.toLocaleDateString("es-AR") };
}

function getMes(offset) {
  const hoy = new Date();
  let mes = hoy.getMonth() + offset;
  let año = hoy.getFullYear();
  while (mes > 11) { mes -= 12; año++; }
  while (mes < 0) { mes += 12; año--; }
  const fecha = new Date(año, mes);
  const nombreMes = fecha.toLocaleString("es-ES", { month: "long" });
  return { mes: nombreMes, año: fecha.getFullYear() };
}

function getAnio(offset) {
  const hoy = new Date();
  return hoy.getFullYear() + offset;
}

// Actualizar label según vista
function actualizarLabel() {
  if (vistaActual === "semanal") {
    const rango = getRangoSemana(offset);
    labelPeriodo.textContent = `Semana: ${rango.inicio} - ${rango.fin}`;
  } else if (vistaActual === "mensual") {
    const fecha = getMes(offset);
    labelPeriodo.textContent = `Mes: ${fecha.mes} ${fecha.año}`;
  } else {
    const anio = getAnio(offset);
    labelPeriodo.textContent = `Año: ${anio}`;
  }
}

// Actualizar botones según vista
function actualizarBotones() {
  if (vistaActual === "semanal") {
    btnAnterior.textContent = "< Semana Anterior";
    btnSiguiente.textContent = "Semana Siguiente >";
  } else if (vistaActual === "mensual") {
    btnAnterior.textContent = "< Mes Anterior";
    btnSiguiente.textContent = "Mes Siguiente >";
  } else {
    btnAnterior.textContent = "< Año Anterior";
    btnSiguiente.textContent = "Año Siguiente >";
  }
}

// Cambiar período y actualizar gráfico
function cambiarPeriodo(direccion) {
  offset += direccion;
  chart.data.datasets[0].data = generarDatos(vistaActual, offset);
  chart.update();
  actualizarLabel();
}

// Asignar botones
btnAnterior.addEventListener("click", () => cambiarPeriodo(-1));
btnSiguiente.addEventListener("click", () => cambiarPeriodo(1));

// Inicialización
cambiarVista("semanal");
