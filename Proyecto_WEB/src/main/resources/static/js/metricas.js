document.addEventListener('DOMContentLoaded', async () => {

  async function fetchData(url) {
    const res = await fetch(url);
    return await res.json();
  }

  // ------------------------------------------
  // 1. Ventas totales por mes (LINE CHART)
  // ------------------------------------------
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

  // ------------------------------------------
  // 2. VENTAS POR VENDEDOR (BARRAS)
  // ------------------------------------------
  const datos = await fetchData('/metricas/ventas-mensuales-vendedor');

  const meses = Object.keys(datos);
  const vendedores = new Set();
  meses.forEach(m => Object.keys(datos[m]).forEach(v => vendedores.add(v)));
  const vendedoresUnicos = [...vendedores];

  const totalesPorVendedor = vendedoresUnicos.map(vendedor =>
    meses.reduce((acc, mes) => acc + (datos[mes][vendedor] || 0), 0)
  );

  new Chart(document.getElementById("ventasVendedorChart"), {
    type: "bar",
    data: {
      labels: vendedoresUnicos,
      datasets: [
        {
          data: totalesPorVendedor,
          backgroundColor: "#4a90e2",
          borderWidth: 1
        }
      ]
    },
    options: {
      responsive: true,
      plugins: {
        legend: { display: false },
        tooltip: {
          callbacks: {
            label: context => `Unidades vendidas: ${context.raw}`
          }
        }
      },
      scales: {
        x: {
          ticks: { display: true },
          grid: { display: false }
        },
        y: {
          title: {
            display: true,
            text: "Unidades vendidas"
          }
        }
      }
    }
  });

  // ------------------------------------------
  // 3. Ingresos al inventario mensuales (LINE)
  // ------------------------------------------
  const ingresos = await fetchData('/metricas/ingresos-mensuales');

  new Chart(document.getElementById("ingresosChart"), {
    type: "line",
    data: {
      labels: Object.keys(ingresos),
      datasets: [{
        label: "Ingresos al inventario",
        data: Object.values(ingresos),
        borderColor: "rgba(54, 162, 235, 1)",
        fill: true,
        tension: 0.4
      }]
    }
  });

  // ------------------------------------------
  // 4. UNIDADES VENDIDAS MENSUALES (BARRAS)
  // ------------------------------------------
  const unidades = await fetchData('/metricas/unidades-vendidas-mensuales');

  new Chart(document.getElementById("unidadesChart"), {
    type: "bar",
    data: {
      labels: Object.keys(unidades),           // Meses (Enero, Febrero…)
      datasets: [{
        label: "Unidades vendidas",
        data: Object.values(unidades),         // Cantidades
        backgroundColor: "rgba(255, 159, 64, 0.7)",
        borderColor: "rgba(255, 159, 64, 1)",
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,
      plugins: {
        tooltip: {
          callbacks: {
            label: ctx => `Unidades: ${ctx.raw}`
          }
        }
      },
      scales: {
        y: {
          beginAtZero: true,
          title: {
            display: true,
            text: "Unidades vendidas"
          }
        }
      }
    }
  });

});
