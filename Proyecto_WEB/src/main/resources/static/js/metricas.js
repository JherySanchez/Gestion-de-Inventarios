document.addEventListener('DOMContentLoaded', async () => {
  async function fetchData(url) {
    const res = await fetch(url);
    return await res.json();
  }

  // Productos más vendidos
  const productos = await fetchData('/metricas/productos-vendidos');
  new Chart(document.getElementById("barChart"), {
    type: "bar",
    data: {
      labels: Object.keys(productos),
      datasets: [{
        label: "Unidades vendidas",
        data: Object.values(productos),
        backgroundColor: "rgba(54, 162, 235, 0.7)",
      }]
    }
  });

  // Ventas mensuales
  const ventas = await fetchData('/metricas/ventas-mensuales');
  new Chart(document.getElementById("lineChart"), {
    type: "line",
    data: {
      labels: Object.keys(ventas),
      datasets: [{
        label: "Ventas (S/.)",
        data: Object.values(ventas),
        borderColor: "rgba(255, 99, 132, 1)",
        fill: true,
        tension: 0.4
      }]
    }
  });

  // Estado del stock
  const stock = await fetchData('/metricas/stock');
  new Chart(document.getElementById("pieChart"), {
    type: "pie",
    data: {
      labels: Object.keys(stock),
      datasets: [{
        data: Object.values(stock),
        backgroundColor: [
          "rgba(75, 192, 192, 0.7)",
          "rgba(255, 206, 86, 0.7)",
          "rgba(255, 99, 132, 0.7)"
        ]
      }]
    }
  });

  // Ventas mensuales por producto
  const ventasMensuales = await fetchData('/metricas/ventas-mensuales-por-producto');

  const meses = Object.keys(ventasMensuales);
  const productosSet = new Set();

  Object.values(ventasMensuales).forEach(mesData => {
    Object.keys(mesData).forEach(p => productosSet.add(p));
  });
  const productosUnicos = Array.from(productosSet);

  const datasets = productosUnicos.map(prod => ({
    label: prod,
    data: meses.map(m => ventasMensuales[m][prod] || 0),
    backgroundColor: `rgba(${Math.floor(Math.random()*255)}, ${Math.floor(Math.random()*255)}, ${Math.floor(Math.random()*255)}, 0.7)`
  }));

  new Chart(document.getElementById("ventasMensualesChart"), {
    type: "bar",
    data: {
      labels: meses,
      datasets: datasets
    },
    options: {
      responsive: true,
      plugins: {
        title: {
          display: true,
          text: "Ventas mensuales por producto (2025)"
        },
        legend: {
          position: "bottom"
        }
      },
      scales: {
        x: { stacked: true },
        y: { stacked: true, beginAtZero: true }
      }
    }
  });
});
