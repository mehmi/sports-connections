if($('#contactUsForm').length)
{
    $("#contactUsForm").validate({
        rules: {
            email: {
                email: true,
                required: true,
                pattern: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
            },
        },
        messages: {
            email: {
                required: "Please Enter Your Email.",
                email: "Please Enter a Valid Email Address.",
                pattern:"Please Enter a Valid Email Address.",
            }
        },
    });

    $('body').on('submit', '#contactUsForm', function (e) 
    {
        e.preventDefault()
        that = $(this);
        data = that.serialize();
        url  = that.attr('action');

        that.find("button[type='submit']").prop("disabled", true);
        that.find("button[type='submit']").html(`<div class="spinner-border spinner-border-sm" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>`);

        $.ajax({
            url: url,
            type: 'post',
            data: data,
            success: function(resp)
            {
                $('#contactUsForm')[0].reset();
                if(resp.status == 'success')
                {
                    $.toaster({
                        priority : 'success',
                        message : resp.message
                    });
                }

                if(resp.status == 'error')
                {
                    $.toaster({
                        priority : 'danger',
                        message : resp.message
                    });
                }
            },
            complete: function()
            {   
                that.find("button[type='submit']").prop("disabled", false);
                that.find("button[type='submit']").html('Submit');
            }
        });   
    });
}