$(document).ready(function () {
    $('#myTable').DataTable({
        "language": {
            "url": 'json/español.json'
        },
        dom: 'Bfrtip',
        buttons: [
            'copy', 'pdf'
                    /**'copy', 'csv', 'excel', 'pdf', 'print'**/
        ]
    });
});

