/**
 * 
 */const toggleBtn = document.getElementById("toggle-theme");
const body = document.body;

toggleBtn.addEventListener("click", () => {
  body.classList.toggle("dark-mode");

  // Cambiar icono
  if (body.classList.contains("dark-mode")) {
    toggleBtn.textContent = "☀️";
  } else {
    toggleBtn.textContent = "🌙";
  }
});
// Inicializar mapa
var map = L.map('mapa').setView([-34.6037, -58.3816], 12);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  maxZoom: 19,
}).addTo(map);

// Marcadores iniciales
var markers = {
  "Parque Central": L.marker([-34.6723227253168, -58.45065990431022]).addTo(map).bindPopup("Parque de la ciudad - Robot activo"),
  "Parque Norte": L.marker([-34.66256625077189, -58.46001307103311]).addTo(map).bindPopup("Lago Soldati - Robot activo"),
  "Plaza Verde": L.marker([-34.6173562514377, -58.433078193753445]).addTo(map).bindPopup("Parque Rivadavia - Robot activo"),
  "Reserva Sur": L.marker([-34.582313751154864, -58.418489942034554]).addTo(map).bindPopup("Jardin Botanico  - Robot activo"),
}; 

// Evento: clic en la lista de parques
document.querySelectorAll("#parques li").forEach(li => {
  li.addEventListener("click", () => {
    let lat = parseFloat(li.getAttribute("data-lat"));
    let lng = parseFloat(li.getAttribute("data-lng"));
    map.setView([lat, lng], 15);
    markers[li.innerText].openPopup();
  });
});

// Gráfico de ejemplo
var ctx = document.getElementById('grafico').getContext('2d');
var grafico = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'],
    datasets: [{
      label: 'Kg Recogidos',
      data: [12, 19, 3, 5, 2, 3, 9],
      backgroundColor: '#66bb6a'
    }]
  },
  options: {
    responsive: true,
    plugins: {
      legend: { display: false }
    }
  }
});