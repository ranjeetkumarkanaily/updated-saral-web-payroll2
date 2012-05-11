$(document).ready(function() {
    pan = document.getElementById('employee_statutory_pan').value
    enabledisable('employee_statutory_pan','pan_ed')
    enabledisable('employee_statutory_pf_number','pf_ed')
    enabledisable('employee_statutory_esi_number','esi_ed')
    document.getElementById('panoption').value = pan
    pan_style_change(pan)
});

function pan_style_change(pan) {
    if(pan == 'PAN Invalid' || pan == 'PAN Applied' || pan == 'PAN Not Avbl' || pan == '')
    {
        document.getElementById('employee_statutory_pan').style.display = 'none';
        document.getElementById('employee_statutory_pan').value = ''
        document.getElementById('pan_ed').value = ''
        enabledisable_pan('pan_ed',true)
    }
    else //if(pan == "ADD PAN" )
    {
        document.getElementById('employee_statutory_pan').style.display = ''
        enabledisable_pan('pan_ed',false)
    }
}
function enabledisable_pan(inputid,val){
    document.getElementById(inputid).disabled = val;
}

function enabledisable(inputvalue,inputid){
    if(document.getElementById(inputvalue).value == '')
    {
        document.getElementById(inputid).value = '';
        document.getElementById(inputid).disabled = true;
    }
    else
        document.getElementById(inputid).disabled = false;
}
