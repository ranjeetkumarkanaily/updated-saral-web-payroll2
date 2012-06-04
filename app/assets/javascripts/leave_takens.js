function set_to_date(){
    count = document.getElementById('leave_taken_count').value
    if(isNumber(count))
    {
        frm_date = Date.parse(document.getElementById('leave_from_date').value)
        count = Math.round(parseFloat(count))
        to_date = frm_date.add(count-1).days();
        document.getElementById('todate').value = to_date.toString('yyyy-MM-dd');
    }
    else
        document.getElementById('todate').value = 'N/A'
}

function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

