$(document).ready(function() {
    check_vpf('employee_statutory_vol_pf')
    pan = document.getElementById('employee_statutory_pan').value
    enabledisable('employee_statutory_pan','pan_ed')
    enabledisable('employee_statutory_pf_number','pf_ed')
    enabledisable('employee_statutory_esi_number','esi_ed')
    document.getElementById('panoption').value = pan
    check_based_on('chk_vol_pf_pertg')
    pan_style_change(pan)
    document.getElementById('based_on_'+document.getElementById('employee_statutory_based_on').value).checked = true
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
        style_change('vpf_percent_lbl','none')
        style_change('chk_vol_pf_pertg','none')
        style_change('vol_pf_value','none')
    }
    else
    {
        style_change('vpf_percent_lbl','')
        style_change('chk_vol_pf_pertg','')
        style_change('vol_pf_value','')
    }
}

function style_change(inputid,val){
    document.getElementById(inputid).style.display = val;
}

function check_based_on(val){
    chnage_baased_on_style(val)
    if(!document.getElementById(val).checked)
    {
        document.getElementById('based_on_basedon_gross').checked = false
        document.getElementById('based_on_basedon_pf').checked = false
    }
    else
    {
        document.getElementById('based_on_basedon_gross').checked = true

    }

}

function chnage_baased_on_style(val){
    if(!document.getElementById(val).checked)
    {
        style_change('based_on_grs_lbl','none')
        style_change('based_on_basedon_gross','none')
        style_change('based_on_pf_lbl','none')
        style_change('based_on_basedon_pf','none')
    }
    else
    {
        style_change('based_on_grs_lbl','')
        style_change('based_on_basedon_gross','')
        style_change('based_on_pf_lbl','')
        style_change('based_on_basedon_pf','')
    }

}
//
//function check_percentage(val){
//
//}