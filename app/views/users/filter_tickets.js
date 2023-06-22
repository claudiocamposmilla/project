function filterTickets(filter) {
    fetch(`/users/${document.querySelector('#filter-form').getAttribute('action').split('/')[2]}/my_comments?filter=${filter}`, {
      headers: {
        "Accept": "application/json"
      }
    })
    .then(response => response.json())
    .then(tickets => {
      const ticketsTable = document.querySelector('#tickets-table');
      ticketsTable.innerHTML = '';
      tickets.forEach(ticket => {
        ticketsTable.innerHTML += `
          <tr>
            <td>${ticket.id}</td>
            <td>${ticket.summary}</td>
            <td>${ticket.description}</td>
            <td>${ticket.priority}</td>
            <td>${ticket.status}</td>
          </tr>
        `;
      });
    });
  }
  