function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}
function cal_prob_complt_date(val) {
    if(isNumber(val))
    {
        doj = Date.parse(document.getElementById('doj').value)
        val = parseInt(val,10)
        prob_complete_date = doj.add(val).months();
        document.getElementById('probtn_date').value = prob_complete_date.toString('yyyy-MM-dd');
    }
    else
        document.getElementById('probtn_date').value = 'N/A'
}