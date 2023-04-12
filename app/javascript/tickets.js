$(document).ready(function() {
    $('#print-column-button').click(function() {
      var columnName = $(this).data('columnName');
      $.ajax({
        url: '/tickets/column/' + columnName,
        type: 'GET',
        dataType: 'json',
        success: function(response) {
          var columnData = response.data;
          var tableBody = $('#ticket-table tbody');
          tableBody.empty();
          $.each(columnData, function(index, value) {
            tableBody.append('<tr><td>' + value + '</td></tr>');
          });
        }
      });
    });
  });
  