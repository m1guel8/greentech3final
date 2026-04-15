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
  "Jardin Fatima": L.marker([-34.65858983147939, -58.44706171190579]).addTo(map).bindPopup("Parque de la ciudad - Robot activo"),
  "Primaria Fatima": L.marker([-34.658276684249586, -58.44663533205027]).addTo(map).bindPopup("Lago Soldati - Robot activo"),
  "Secundaria Fatima": L.marker([-34.65929417210582, -58.448045950996615]).addTo(map).bindPopup("Parque Rivadavia - Robot activo"),
  "Terciario Fatima": L.marker([-34.6596806197795, -58.44866396033214]).addTo(map).bindPopup("Jardin Botanico  - Robot activo"),
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