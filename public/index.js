$(document).ready(function () {
    $("#permutator_form").submit(function(e){
        e.preventDefault();
        $('#loading_modal').modal('show');

        var url = "/emails";

        $.ajax({
            type: "POST",
            url: url,
            data: $("#permutator_form").serialize(),
            success: function(data)
            {
                $('#loading_modal').modal('hide');

                console.log(data);

                if(data.emails !== undefined) {
                    $('#emails_textarea').val(data.emails);
                    setTimeout(function () {
                        $('#emails_modal').modal('show');
                    }, 1000)
                } else {
                    alert(data.error);
                }
            }
        });
    });
});