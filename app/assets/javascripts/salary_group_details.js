var monthYearCalendar = {
    selectedMonth: "",
    selectedYear: "",
    monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    onSelected: null,
    init: function(id, f) {
        monthYearCalendar.generateMonthYearBox(id);
        monthYearCalendar.generateMonthView();
        monthYearCalendar.addEvents();
        monthYearCalendar.setInitialValues();
        monthYearCalendar.setCurrentDate();

        monthYearCalendar.onSelected = f;
    },
    addEvents: function() {
        $("#containerMonth > div").click(monthYearCalendar.selectMonth);
        $("#pre").click(monthYearCalendar.preYear);
        $("#next").click(monthYearCalendar.nextYear);
        $("#calendarIcon").click(monthYearCalendar.toggle);
    },
    generateMonthYearBox: function(id) {
        var b = "";
        b += "<div id=\"calendarIcon\"></div><div id=\"containerMonthYear\"><div id=\"containerYear\"><div id=\"pre\"></div>";
        b += "<div id=\"currentYear\"></div><div id=\"next\"></div>";
        b += "</div>";
        b += "<div id=\"containerMonth\"></div>";
        b += "</div>";

        $("#" + id).html(b);
    },
    generateMonthView: function() {
        var m = "";
        for (var i = 0; i < monthYearCalendar.monthNames.length; i++) {
            m += "<div id=\"m" + (i + 1) + "\">" + monthYearCalendar.monthNames[i] + "</div>";
        }
        $("#containerMonth").html(m);
    },
    setInitialValues: function() {
        monthYearCalendar.selectedMonth = new Date().getMonth() + 1;
        monthYearCalendar.selectedYear = new Date().getFullYear();
        $("#currentYear").html(monthYearCalendar.selectedYear);
    },
    setCurrentDate: function() {
        $("#m" + (monthYearCalendar.selectedMonth)).addClass("selectedMonth");
    },
    preYear: function() {
        monthYearCalendar.selectedYear = parseInt($("#currentYear").html()) - 1;
        $("#currentYear").html(monthYearCalendar.selectedYear);

        monthYearCalendar.eventSelected();
        $("#containerMonthYear").css("display", "block")
    },
    nextYear: function() {
        monthYearCalendar.selectedYear = parseInt($("#currentYear").html()) + 1;
        $("#currentYear").html(monthYearCalendar.selectedYear);

        monthYearCalendar.eventSelected();
        $("#containerMonthYear").css("display", "block")
    },
    selectMonth: function() {
        monthYearCalendar.selectedMonth = $(this).attr("id").replace("m", "");
        $("#containerMonth > div").removeClass("selectedMonth");
        $(this).addClass("selectedMonth");

        monthYearCalendar.eventSelected();
    },
    toggle: function() {
        var cmy = $("#containerMonthYear");
        cmy.css("display") == "block" ? cmy.css("display", "none") : cmy.css("display", "block");
    },
    eventSelected: function() {
        if (monthYearCalendar.onSelected != null) {
            monthYearCalendar.onSelected();
        }
    }
}