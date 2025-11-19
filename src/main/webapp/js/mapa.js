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
  "Parque Central": L.marker([-34.6037, -58.3816]).addTo(map).bindPopup("Parque Central - Robot activo"),
  "Parque Norte": L.marker([-34.6090, -58.3775]).addTo(map).bindPopup("Parque Norte - Robot activo"),
  "Plaza Verde": L.marker([-34.6150, -58.3850]).addTo(map).bindPopup("Plaza Verde - Robot activo"),
  "Reserva Sur": L.marker([-34.6200, -58.3900]).addTo(map).bindPopup("Reserva Sur - Robot activo"),
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