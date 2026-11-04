document.addEventListener("DOMContentLoaded", function() {

    const searchInput =
        document.getElementById("taskSearch");

    const statusFilter =
        document.getElementById("statusFilter");

    const priorityFilter =
        document.getElementById("priorityFilter");

    const rows =
        document.querySelectorAll(
            "#taskTableBody tr[data-status]"
        );


    function filterTasks() {

        const search =
            searchInput
                ? searchInput.value.toLowerCase()
                : "";


        const status =
            statusFilter
                ? statusFilter.value
                : "ALL";


        const priority =
            priorityFilter
                ? priorityFilter.value
                : "ALL";


        rows.forEach(function(row) {

            const text =
                row.innerText.toLowerCase();


            const rowStatus =
                row.dataset.status;


            const rowPriority =
                row.dataset.priority;


            const matchesSearch =
                text.includes(search);


            const matchesStatus =
                status === "ALL"
                || rowStatus === status;


            const matchesPriority =
                priority === "ALL"
                || rowPriority === priority;


            if (
                matchesSearch
                && matchesStatus
                && matchesPriority
            ) {

                row.style.display = "";

            } else {

                row.style.display = "none";
            }

        });
    }


    if (searchInput) {

        searchInput.addEventListener(
            "input",
            filterTasks
        );
    }


    if (statusFilter) {

        statusFilter.addEventListener(
            "change",
            filterTasks
        );
    }


    if (priorityFilter) {

        priorityFilter.addEventListener(
            "change",
            filterTasks
        );
    }

});