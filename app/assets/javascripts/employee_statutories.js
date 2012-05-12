$(document).ready(function() {
    check_vpf('employee_statutory_vol_pf')
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

function check_vpf(vpf){
    if(!document.getElementById(vpf).checked)
    {
        vpf_style_change('vpf_percent_lbl','none')
        vpf_style_change('chk_vol_pf_pertg','none')
        vpf_style_change('vol_pf_value','none')
    }
    else
    {
        vpf_style_change('vpf_percent_lbl','')
        vpf_style_change('chk_vol_pf_pertg','')
        vpf_style_change('vol_pf_value','')
    }
}

function vpf_style_change(inputid,val){
    document.getElementById(inputid).style.display = val;
}
//
//function check_percentage(val){
//
//}