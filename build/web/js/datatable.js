$(document).ready(function () {
    $('#myTable').DataTable({
        "scrollX": true,
        pageLength: 5,
        "language": {
            "url": 'json/español.json'
        },
        dom: 'Bfrtip',
        buttons: [
            'copy','excel', 'pdf', 'print'         
//            'copy', 'csv', 'excel', 'pdf', 'print'         
                    
        ]
    });
});

