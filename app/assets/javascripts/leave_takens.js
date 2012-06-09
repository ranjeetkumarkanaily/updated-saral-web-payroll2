$(document).ready(function() {

});
function leave_date(val){

    from_date_id = 'leave_takens_'+val.value+'_leave_from_date'
    to_date_id = 'leave_takens_'+val.value+'_leave_to_date'
    enable_disable_input(from_date_id,to_date_id,val.checked)
}

function lop_date(val){

    from_date_id = 'leave_takens_'+val.value+'_lop_from_date'
    to_date_id = 'leave_takens_'+val.value+'_lop_to_date'
    enable_disable_input(from_date_id,to_date_id,val.checked)
}

function enable_disable_input(from_input_id,to_input_id,val){
    if(val)
        enable_disable = false
    else
        enable_disable = true

    document.getElementById(from_input_id).disabled = enable_disable
    document.getElementById(to_input_id).disabled = enable_disable
}

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

