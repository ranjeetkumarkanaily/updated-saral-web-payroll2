$(document).ready(function() {
    make_invisible()
});

function make_invisible(){
    employee_count = document.getElementById("employee_count").value
    for(i=0;i<employee_count;i++)
    {
        from_date_id_lev = 'leave_takens_'+i+'_leave_from_date'
        to_date_id_lev = 'leave_takens_'+i+'_leave_to_date'
        from_date_id_lop = 'leave_takens_'+i+'_lop_from_date'
        to_date_id_lop = 'leave_takens_'+i+'_lop_to_date'
        invisible(from_date_id_lev,'none')
        invisible(to_date_id_lev,'none')
        invisible(from_date_id_lop,'none')
        invisible(to_date_id_lop,'none')
    }
}

function invisible(input_id,val){
    document.getElementById(input_id).style.display = val;
}
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
        enable_disable = ''
    else
        enable_disable = 'none'

    document.getElementById(from_input_id).style.display = enable_disable
    document.getElementById(to_input_id).style.display = enable_disable
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

function ValidateForm(){
    var month_year=document.forms["new_leave_taken"]["leave_taken_leave_detail_date"].value;
    if (month_year==null || month_year=="")
    {
        alert("Please Select Pay Month");
        return false;
    }
}

