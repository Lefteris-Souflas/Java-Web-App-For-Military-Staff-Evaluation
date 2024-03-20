$(document).ready(function(){
    $("#epilogi").change(function(){
        $("#detail").show();
        var x = $(this).children("option:selected").val();
        $("#detail").val('');
        $("#detail > option[sub!='" + x + "']").hide();
        $("#detail > option[sub='" + x + "']").show();
    });
});